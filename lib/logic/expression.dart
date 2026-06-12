// Port of src/eval.rs.
// Two responsibilities:
//   1. Token-pipeline functions (with_implicit_muls, build_rat_expr,
//      build_meval_string, resolve_custom_operators, format_*_result) —
//      structurally 1:1 with Rust.
//   2. An in-house f64 expression evaluator that replaces the `meval` crate.
//      Lexer + recursive-descent parser + interpreter; operator precedence
//      mirrors the rational track (see rat_parser.dart).
//
// `calculate_result` (the orchestrating method on DozenalCalcApp) is not
// ported here — it lives with the state class in step 9.

import 'dart:math' as math;

import '../tokens.dart';
import 'dozenal_converter.dart';
import 'dozenal_digit.dart';
import 'rat_parser.dart';
import 'rational.dart';

/// Maximum number of period digits rendered with an overline. Periods longer
/// than this are truncated and signalled with the State-C raised-dots suffix.
/// Set so an exact periodic fraction shows at least as much detail as the f64
/// fallback (see [kF64SigDigits]) — short periods (e.g. 1/7's period of six)
/// render in full rather than being clipped.
const int maxPeriodDisplay = 10;

/// Target number of significant dozenal digits for an f64 fallback result.
/// [formatF64Result] spends the budget as `kF64SigDigits − integerDigits`
/// fractional places, so the shown precision tracks the value's magnitude and
/// stays within the double's ~14 trustworthy dozenal digits (no noise tail):
/// `π` → `3.184809493B`, `0.5878…` → eleven places, `12345.…` → seven.
const int kF64SigDigits = 12;

/// Upper bound on the number of tokens [formatRationalResult] emits. The exact
/// rational track (BigInt) can produce results with millions of digits (e.g.
/// a large `^`), but the result line only ever shows a width-clipped slice and
/// lays out every token each frame — so the buffer is capped here to keep
/// rendering bounded. The full exact value stays in `lastAns` for STO / Ans /
/// copy; truncation is signalled with the State-C "…".
const int maxResultDigits = 240;

// ---------------------------------------------------------------------------
// build_rat_expr — token stream → RatExpr atoms (rational track).
// ---------------------------------------------------------------------------

/// Returns null as soon as a non-rational token is encountered.
/// [base] selects how Digit tokens are interpreted (default 12 / dozenal).
List<RatExpr>? buildRatExpr(List<CalcToken> tokens, {int base = 12}) {
  final exprs = <RatExpr>[];
  var i = 0;
  while (i < tokens.length) {
    final t = tokens[i];
    if (t is Digit) {
      final intD = <DozenalDigit>[];
      final fracD = <DozenalDigit>[];
      var inFrac = false;
      while (i < tokens.length) {
        final tt = tokens[i];
        if (tt is Digit) {
          if (inFrac) {
            fracD.add(tt.value);
          } else {
            intD.add(tt.value);
          }
          i++;
        } else if (tt is Decimal && !inFrac) {
          inFrac = true;
          i++;
        } else {
          break;
        }
      }
      final intVal = DozenalConverter.toDecimalExact(intD, base: base);
      final intRat = Rational.tryNew(intVal, BigInt.one)!;
      Rational rat;
      if (fracD.isEmpty) {
        rat = intRat;
      } else {
        final fracNum = DozenalConverter.toDecimalExact(fracD, base: base);
        final fracDen = BigInt.from(base).pow(fracD.length);
        final fracRat = Rational.tryNew(fracNum, fracDen)!;
        rat = intRat.add(fracRat);
      }
      exprs.add(RatNum(rat));
    } else if (t is Decimal) {
      // Leading decimal point: implicit zero integer (e.g. ".6")
      i++;
      final fracD = <DozenalDigit>[];
      while (i < tokens.length) {
        final tt = tokens[i];
        if (tt is Digit) {
          fracD.add(tt.value);
          i++;
        } else {
          break;
        }
      }
      if (fracD.isEmpty) return null;
      final fracNum = DozenalConverter.toDecimalExact(fracD, base: base);
      final fracDen = BigInt.from(base).pow(fracD.length);
      exprs.add(RatNum(Rational.tryNew(fracNum, fracDen)!));
    } else if (t is Add) {
      exprs.add(const RatAdd());
      i++;
    } else if (t is Sub || t is Negate) {
      exprs.add(const RatSub());
      i++;
    } else if (t is Mul) {
      exprs.add(const RatMul());
      i++;
    } else if (t is Div) {
      exprs.add(const RatDiv());
      i++;
    } else if (t is ParenOpen) {
      exprs.add(const RatLParen());
      i++;
    } else if (t is ParenClose) {
      exprs.add(const RatRParen());
      i++;
    } else if (t is ExpTopRight) {
      exprs.add(const RatPow());
      i++;
    } else if (t is OplusBotLeft) {
      exprs.add(const RatOPlus());
      i++;
    } else if (t is Mod) {
      exprs.add(const RatMod());
      i++;
    } else if (t is Sci) {
      // a EXP b = a × base^b. Reuse the integer-power path so the result stays
      // exact: emit `× base ^` and let the following exponent tokens parse as
      // the power's right operand (a negative exponent via a leading Sub works
      // because RatPow recurses through unary minus).
      exprs.add(const RatMul());
      exprs.add(RatNum(Rational.tryNew(BigInt.from(base), BigInt.one)!));
      exprs.add(const RatPow());
      i++;
    } else if (t is Factorial) {
      exprs.add(const RatFact());
      i++;
    } else if (t is AbsVal) {
      exprs.add(const RatAbs());
      i++;
    } else if (t is Reciprocal) {
      exprs.add(const RatRecip());
      i++;
    } else if (t is RatLit) {
      exprs.add(RatNum(t.value));
      i++;
    } else {
      return null; // non-rational token → collapse
    }
  }
  return exprs;
}

// ---------------------------------------------------------------------------
// resolve_custom_operators — string-level rewrites for ⊕, √, log.
// ---------------------------------------------------------------------------

/// Half-open range `[start, end)` of operand tokens.
typedef _Range = ({int start, int end});

/// A meval string token that opens a paren level: the bare `(` or a function
/// token (`sin(`, `ln(`, `fact(`, …), all of which end in `(`. Self-contained
/// literals carry balanced parens *inside* one token and end in `)` or a
/// digit, so they are not openers.
bool _isStrOpener(String t) => t.endsWith('(');

/// Joins `tokens[start..end)` and appends a `)` for every opener left unclosed
/// inside the range. A function call grabbed as an operand auto-closes at the
/// end of the stream (`sin(36` rather than `sin(36)`); balancing it here keeps
/// the operator's rewrite well-formed — `(sin(36)^(1/2))`, not `(sin(36^(1/2))`.
String _joinBalanced(List<String> tokens, int start, int end) {
  var open = 0;
  final sb = StringBuffer();
  for (var k = start; k < end; k++) {
    final t = tokens[k];
    sb.write(t);
    if (_isStrOpener(t)) {
      open++;
    } else if (t == ')') {
      open--;
    }
  }
  for (var k = 0; k < open; k++) {
    sb.write(')');
  }
  return sb.toString();
}

_Range? _leftOperandRange(List<String> tokens, int opPos) {
  if (opPos == 0) return null;
  if (tokens[opPos - 1] != ')') {
    // A single self-contained value token (number, constant, balanced literal).
    return (start: opPos - 1, end: opPos);
  }
  // Ends in `)`: walk back to the matching opener — a bare `(` or a function
  // opener like `sin(` / `fact(` — so the whole call becomes the operand.
  var depth = 0;
  var j = opPos;
  while (j > 0) {
    j--;
    final t = tokens[j];
    if (t == ')') {
      depth++;
    } else if (_isStrOpener(t)) {
      depth--;
      if (depth == 0) return (start: j, end: opPos);
    }
  }
  return null;
}

_Range? _rightOperandRange(List<String> tokens, int opPos) {
  if (opPos + 1 >= tokens.length) return null;
  if (!_isStrOpener(tokens[opPos + 1])) {
    // A single self-contained value token.
    return (start: opPos + 1, end: opPos + 2);
  }
  // Opener (bare `(` or a function like `sin(`): grab through its matching
  // close, counting nesting.
  var depth = 0;
  for (var j = opPos + 1; j < tokens.length; j++) {
    final t = tokens[j];
    if (_isStrOpener(t)) {
      depth++;
    } else if (t == ')') {
      depth--;
      if (depth == 0) return (start: opPos + 1, end: j + 1);
    }
  }
  // A function operand that auto-closes at the end of the stream extends to
  // the end; _joinBalanced supplies the missing close paren(s).
  return (start: opPos + 1, end: tokens.length);
}

/// Rewrites `⊕`, `√`, `log` into pure infix using the operand ranges. Pure
/// function — operates in place on a String list. Mirrors `eval.rs`:179–217.
void resolveCustomOperators(List<String> tokens) {
  while (true) {
    final i = tokens.indexOf('⊕');
    if (i == -1) break;
    final left = _leftOperandRange(tokens, i);
    if (left == null) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    final a = _joinBalanced(tokens, left.start, left.end);
    final b = _joinBalanced(tokens, right.start, right.end);
    tokens.replaceRange(left.start, right.end, ['(($a*$b)/($a+$b))']);
  }
  while (true) {
    final i = tokens.indexOf('√');
    if (i == -1) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    // `^`, `%`, and a preceding opener (`(` or a function like `sin(`) all
    // mean the √ starts a fresh radicand (unary square root), not a binary
    // nth-root. Without the `^`/`%` guard `2^√3` mis-parses with `^` as the
    // n-th-root index → malformed `(3^(1/^))`; without the opener guard
    // `sin√4` would take `sin(` as the index.
    final precededByOp =
        i == 0 ||
        _isStrOpener(tokens[i - 1]) ||
        const {'+', '-', '*', '/', '^', '%'}.contains(tokens[i - 1]);
    final x = _joinBalanced(tokens, right.start, right.end);
    if (precededByOp) {
      tokens.replaceRange(i, right.end, ['($x^(1/2))']);
    } else {
      final left = _leftOperandRange(tokens, i);
      if (left == null) break;
      final n = _joinBalanced(tokens, left.start, left.end);
      tokens.replaceRange(left.start, right.end, ['($x^(1/$n))']);
    }
  }
  while (true) {
    final i = tokens.indexOf('log');
    if (i == -1) break;
    final left = _leftOperandRange(tokens, i);
    if (left == null) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    final x = _joinBalanced(tokens, left.start, left.end);
    final n = _joinBalanced(tokens, right.start, right.end);
    tokens.replaceRange(left.start, right.end, ['(ln($x)/ln($n))']);
  }
  // Combinatorics: a nCr b = a!/(b!·(a−b)!); a nPr b = a!/(a−b)!. Built on
  // the evaluator's fact(); operands grabbed exactly like ⊕/log.
  while (true) {
    final i = tokens.indexOf('nCr');
    if (i == -1) break;
    final left = _leftOperandRange(tokens, i);
    if (left == null) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    final a = _joinBalanced(tokens, left.start, left.end);
    final b = _joinBalanced(tokens, right.start, right.end);
    tokens.replaceRange(left.start, right.end, [
      '(fact($a)/(fact($b)*fact(($a)-($b))))',
    ]);
  }
  while (true) {
    final i = tokens.indexOf('nPr');
    if (i == -1) break;
    final left = _leftOperandRange(tokens, i);
    if (left == null) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    final a = _joinBalanced(tokens, left.start, left.end);
    final b = _joinBalanced(tokens, right.start, right.end);
    tokens.replaceRange(left.start, right.end, ['(fact($a)/fact(($a)-($b)))']);
  }
}

// ---------------------------------------------------------------------------
// resolvePostfix — reorder postfix-style invocations (`n!`, `|x|`, `1/x`)
// into the prefix function-call shape the downstream pipeline expects.
// ---------------------------------------------------------------------------

/// The three postfix-style functions whose meval string is an opening
/// `name(` token (`fact(`, `abs(`, `recip(`). [resolvePostfix] closes each
/// with an explicit ParenClose right after its operand, so in the token
/// stream they act as paren-openers matched by that ParenClose.
bool _isPostfixFnToken(CalcToken t) =>
    t is Factorial || t is AbsVal || t is Reciprocal;

bool _isFunctionToken(CalcToken t) {
  return t is Sin ||
      t is Cos ||
      t is Tan ||
      t is Cot ||
      t is ArcSin ||
      t is ArcCos ||
      t is ArcTan ||
      t is ArcCot ||
      t is Sinh ||
      t is Cosh ||
      t is Tanh ||
      t is Coth ||
      t is ArSinh ||
      t is ArCosh ||
      t is ArTanh ||
      t is ArCoth ||
      t is Factorial ||
      t is AbsVal ||
      t is Reciprocal;
}

/// Range of the operand immediately to the left of position [opPos] in
/// [tokens], or null if no valid operand sits there. Handles three shapes:
/// a parenthesised sub-expression (with its leading function token if any),
/// a contiguous Digit/Decimal number literal, or a single-token operand
/// (RatLit, constant). Other token types — operators, function tokens
/// without their argument — return null.
({int start, int end})? _leftOperandRangeTokens(
  List<CalcToken> tokens,
  int opPos,
) {
  if (opPos == 0) return null;
  final prev = tokens[opPos - 1];

  if (prev is ParenClose) {
    var depth = 0;
    var j = opPos - 1;
    while (j >= 0) {
      final t = tokens[j];
      if (t is ParenClose) {
        depth++;
      } else if (t is ParenOpen) {
        depth--;
        if (depth == 0) {
          if (j > 0 && _isFunctionToken(tokens[j - 1])) {
            return (start: j - 1, end: opPos);
          }
          return (start: j, end: opPos);
        }
      } else if (_isPostfixFnToken(t)) {
        // A previously-resolved postfix fn (fact(/abs(/recip() emits an
        // opening paren that a resolvePostfix-inserted ParenClose closes.
        // Treat it as a paren-opener so nested postfix (5!!, (3!)!) re-grabs
        // the whole inner call — function token included — as the operand.
        depth--;
        if (depth == 0) {
          return (start: j, end: opPos);
        }
      }
      j--;
    }
    return null;
  }

  if (prev is Digit || prev is Decimal) {
    var j = opPos - 1;
    while (j > 0) {
      final t = tokens[j - 1];
      if (t is Digit || t is Decimal) {
        j--;
      } else {
        break;
      }
    }
    return (start: j, end: opPos);
  }

  if (prev is RatLit || prev.isIrrationalConstant) {
    return (start: opPos - 1, end: opPos);
  }

  return null;
}

/// Rewrites postfix invocations of `Factorial`, `AbsVal`, and `Reciprocal`
/// (whose button labels `n!`, `|x|`, `1/x` suggest the operand precedes the
/// operator) into the prefix function-call shape the rest of the pipeline
/// already understands. So `5, Factorial` becomes `Factorial, 5, )`, which
/// `buildMevalString` renders as `fact(5)` — the function token emits its
/// own opening paren (`fact(`), and the inserted ParenClose closes it right
/// after the operand.
///
/// The ParenClose placement matters: it bounds the call to its operand so a
/// trailing operator can't leak in. Without it (relying on the global
/// end-of-string paren balancer instead), `5! + 2` would render as
/// `fact( (5) + 2 )` = fact(7) rather than `fact(5) + 2`. Likewise `3! + 4!`,
/// `|−3| + 1`, and `4 1/x + 1` would all fold the trailing term into the call.
///
/// Postfix tokens that already sit in a valid prefix position (no operand
/// to their left, or only a non-operand token) are left untouched — the
/// function's own auto-opening `name(` plus the end-of-string balancer keeps
/// the prefix-style entry path (`fact` then `5`) working too.
///
/// Multiple passes resolve nested cases like `5!!` correctly: after the
/// first rewrite `[Factorial, 5, )]` the second pass treats that leading
/// `Factorial` as a paren-opener (see `_leftOperandRangeTokens`) and folds
/// the outer `!` around the whole inner call.
List<CalcToken> resolvePostfix(List<CalcToken> tokens) {
  var current = List<CalcToken>.from(tokens);
  while (true) {
    var changed = false;
    for (var i = 0; i < current.length; i++) {
      final t = current[i];
      final isPostfixCandidate =
          t is Factorial || t is AbsVal || t is Reciprocal;
      if (!isPostfixCandidate) continue;
      final range = _leftOperandRangeTokens(current, i);
      if (range == null) continue;
      final operand = current.sublist(range.start, range.end);
      current = [
        ...current.sublist(0, range.start),
        t,
        ...operand,
        const ParenClose(),
        ...current.sublist(i + 1),
      ];
      changed = true;
      break;
    }
    if (!changed) break;
  }
  return current;
}

// ---------------------------------------------------------------------------
// with_implicit_muls — insert Mul tokens where algebra implies multiplication.
// ---------------------------------------------------------------------------

bool _producesValue(CalcToken curr, CalcToken next) {
  if (curr is Digit) {
    // A digit ends a value only when the next token isn't part of the same
    // number literal.
    return next is! Digit && next is! Decimal;
  }
  return curr is ParenClose || curr is RatLit || curr.isIrrationalConstant;
}

bool _startsSubexpression(CalcToken next) {
  return next is Digit ||
      next is ParenOpen ||
      next is RatLit ||
      next.isIrrationalConstant ||
      next is Sin ||
      next is Cos ||
      next is Tan ||
      next is Cot ||
      next is ArcSin ||
      next is ArcCos ||
      next is ArcTan ||
      next is ArcCot ||
      next is Sinh ||
      next is Cosh ||
      next is Tanh ||
      next is Coth ||
      next is ArSinh ||
      next is ArCosh ||
      next is ArTanh ||
      next is ArCoth ||
      next is AbsVal ||
      next is Reciprocal ||
      next is Ln ||
      next is ExpE ||
      next is Log12;
}

bool _needsImplicitMul(List<CalcToken> tokens, int i) {
  if (i + 1 >= tokens.length) return false;
  final curr = tokens[i];
  final next = tokens[i + 1];
  if (!_producesValue(curr, next)) return false;
  return _startsSubexpression(next);
}

/// Returns a new list with a Mul token inserted wherever algebraic notation
/// implies multiplication.
List<CalcToken> withImplicitMuls(List<CalcToken> tokens) {
  final result = <CalcToken>[];
  for (var i = 0; i < tokens.length; i++) {
    result.add(tokens[i]);
    if (_needsImplicitMul(tokens, i)) {
      result.add(const Mul());
    }
  }
  return result;
}

// ---------------------------------------------------------------------------
// build_meval_string — token sequence → evaluator-ready string.
// ---------------------------------------------------------------------------

/// Maps a non-digit, non-decimal CalcToken to its evaluator-string form.
/// Returns the empty string for tokens that emit nothing on their own.
/// Exhaustive over the sealed CalcToken (no default): a new variant is a
/// compile error here rather than a silently-dropped operator.
String tokenMevalStr(CalcToken t) => switch (t) {
  Add() => '+',
  Sub() || Negate() => '-',
  Mul() => '*',
  Div() => '/',
  Mod() => '%',
  ParenOpen() => '(',
  ParenClose() => ')',
  Sin() => 'sin(',
  Cos() => 'cos(',
  Tan() => 'tan(',
  Cot() => 'cot(',
  ExpTopRight() => '^',
  RootTopLeft() => '√',
  OplusBotLeft() => '⊕',
  LogBotRight() => 'log',
  ArcSin() => 'asin(',
  ArcCos() => 'acos(',
  ArcTan() => 'atan(',
  ArcCot() => 'acot(',
  Sinh() => 'sinh(',
  Cosh() => 'cosh(',
  Tanh() => 'tanh(',
  Coth() => 'coth(',
  ArSinh() => 'arsinh(',
  ArCosh() => 'arcosh(',
  ArTanh() => 'artanh(',
  ArCoth() => 'arcoth(',
  Factorial() => 'fact(',
  AbsVal() => 'abs(',
  Reciprocal() => 'recip(',
  Ln() => 'ln(',
  ExpE() => 'exp(',
  Log12() => 'log12(',
  NCr() => 'nCr',
  NPr() => 'nPr',
  // Emit nothing: Digit/Decimal are consumed by buildMevalString before it
  // calls here; RatLit and the constants are substituted with their numeric
  // value upstream; mode/memory/app-state tokens never reach the evaluator.
  Digit() ||
  Decimal() ||
  RatLit() ||
  ConstPi() ||
  ConstE() ||
  ConstPhi() ||
  ConstSqrt2() ||
  Ac() ||
  Del() ||
  Equals() ||
  Expand() ||
  Close() ||
  MemPlus() ||
  MemMinus() ||
  Square() ||
  PlusMinus() ||
  Sci() ||
  Sto() ||
  Rcl() ||
  Mc() ||
  Ans() ||
  Doz() ||
  Dez() ||
  Drg() ||
  Info() ||
  TriangleLeft() ||
  TriangleRight() => '',
};

/// f64 value for irrational-constant tokens; null for everything else.
double? constValue(CalcToken t) {
  if (t is ConstPi) return math.pi;
  if (t is ConstE) return math.e;
  if (t is ConstPhi) return 1.618033988749895;
  if (t is ConstSqrt2) return math.sqrt2;
  return null;
}

void _flushNumberLiteral(
  List<DozenalDigit> intDigits,
  List<DozenalDigit> fracDigits,
  List<bool> inFractionRef, // mutable single-element list as out param
  List<String> out,
  int base,
) {
  if (intDigits.isEmpty && fracDigits.isEmpty) return;
  final intStr = intDigits.isEmpty
      ? '0'
      : DozenalConverter.toDecimal(intDigits, base: base).toString();
  if (inFractionRef[0] && fracDigits.isNotEmpty) {
    final fracStr = DozenalConverter.toDecimal(
      fracDigits,
      base: base,
    ).toString();
    final len = fracDigits.length;
    out.add('($intStr+($fracStr/($base^$len)))');
  } else {
    out.add(intStr);
  }
  intDigits.clear();
  fracDigits.clear();
  inFractionRef[0] = false;
}

/// Builds the final evaluator-ready expression string from an
/// already-`withImplicitMuls`-expanded token sequence. Resolves ⊕/√/log into
/// pure infix and balances any unclosed parens at the end.
/// [base] selects how Digit tokens are interpreted (default 12 / dozenal).
String buildMevalString(List<CalcToken> expanded, {int base = 12}) {
  final intDigits = <DozenalDigit>[];
  final fracDigits = <DozenalDigit>[];
  final inFraction = [false];
  final tokensStr = <String>[];

  for (final token in expanded) {
    if (token is Digit) {
      if (inFraction[0]) {
        fracDigits.add(token.value);
      } else {
        intDigits.add(token.value);
      }
    } else if (token is Decimal) {
      inFraction[0] = true;
    } else {
      _flushNumberLiteral(intDigits, fracDigits, inFraction, tokensStr, base);
      if (token is Sci) {
        // a Sci b  →  a * base^b  (×10ⁿ in decimal, ×12ⁿ in dozenal). `^`
        // binds tighter than `*`, so this is a·(base^b) without extra parens.
        tokensStr.add('*');
        tokensStr.add('$base');
        tokensStr.add('^');
      } else if (token is RatLit) {
        tokensStr.add(token.value.toDouble().toString());
      } else {
        final c = constValue(token);
        if (c != null) {
          tokensStr.add(c.toString());
        } else {
          final s = tokenMevalStr(token);
          if (s.isNotEmpty) tokensStr.add(s);
        }
      }
    }
  }
  _flushNumberLiteral(intDigits, fracDigits, inFraction, tokensStr, base);

  resolveCustomOperators(tokensStr);

  var mathString = tokensStr.join(' ');
  final openCount = '('.allMatches(mathString).length;
  final closeCount = ')'.allMatches(mathString).length;
  for (var i = 0; i < openCount - closeCount; i++) {
    mathString += ')';
  }
  return mathString;
}

// ---------------------------------------------------------------------------
// Result formatters: Rational / f64 → result_buffer token sequences.
// ---------------------------------------------------------------------------

class PeriodMeta {
  /// Index in result_buffer where the period begins, or null if no period.
  final int? start;

  /// Period digits emitted (capped at maxPeriodDisplay).
  final int len;

  /// True when the true period exceeds maxPeriodDisplay and was truncated.
  final bool capped;

  const PeriodMeta({
    required this.start,
    required this.len,
    required this.capped,
  });
}

({List<CalcToken> buf, PeriodMeta meta}) formatRationalResult(
  Rational r, {
  int base = 12,
}) {
  final dec = r.toDozenalPeriodic(base: base);
  final buf = <CalcToken>[];
  if (r.num.isNegative) {
    buf.add(const Negate());
  }
  for (final d in dec.intDigits) {
    buf.add(Digit(d));
  }
  if (dec.preDigits.isNotEmpty || dec.period.isNotEmpty) {
    buf.add(const Decimal());
  }
  for (final d in dec.preDigits) {
    buf.add(Digit(d));
  }
  final start = dec.period.isEmpty ? null : buf.length;
  final capped = dec.period.length > maxPeriodDisplay;
  final len = math.min(dec.period.length, maxPeriodDisplay);
  for (var i = 0; i < len; i++) {
    buf.add(Digit(dec.period[i]));
  }

  // Bound the buffer for an astronomically large exact result so the display
  // layout pass stays cheap (see maxResultDigits). Drop the least-significant
  // tail, clamp/clear the period if it fell past the cut, and flag capped so
  // the "…" appears.
  if (buf.length > maxResultDigits) {
    buf.removeRange(maxResultDigits, buf.length);
    if (start == null || start >= buf.length) {
      return (buf: buf, meta: const PeriodMeta(start: null, len: 0, capped: true));
    }
    return (
      buf: buf,
      meta: PeriodMeta(
        start: start,
        len: math.min(len, buf.length - start),
        capped: true,
      ),
    );
  }

  return (buf: buf, meta: PeriodMeta(start: start, len: len, capped: capped));
}

List<CalcToken> formatF64Result(double value, {int base = 12}) {
  final buf = <CalcToken>[];
  // Snap a value within fracEpsilon of an integer onto it before splitting into
  // integer/fraction digits. f64 trig lands a hair off exact integers (e.g.
  // tan(45°) = 0.9999999999999999); without the snap, fracToDigits renders a
  // long …BBBBB tail (or a clamped overflow digit) instead of the clean
  // integer. Snapping the *signed* value also collapses tiny negatives
  // (tan(180°) = −1.2e−16) to a plain "0" rather than "−0".
  var v = (value - value.roundToDouble()).abs() < fracEpsilon
      ? value.roundToDouble()
      : value;
  if (v < 0.0) {
    buf.add(const Negate());
    v = v.abs();
  }
  final intDigits = DozenalConverter.fromDecimal(v, base: base);
  for (final d in intDigits) {
    buf.add(Digit(d));
  }
  // Precision-aware fractional budget: aim for ~kF64SigDigits significant
  // dozenal digits in total, so the result shows as much trustworthy detail as
  // its magnitude allows without spilling an f64 noise tail. A value below 1
  // carries only the placeholder "0" before the point (not significant), so it
  // gets the full budget; large integer parts leave fewer (or no) places.
  final intSig = v < 1.0 ? 0 : intDigits.length;
  final fracCount = (kF64SigDigits - intSig).clamp(0, kF64SigDigits);
  final fracPart = v - v.floorToDouble();
  if (fracCount > 0 && fracPart > fracEpsilon) {
    buf.add(const Decimal());
    for (final d in DozenalConverter.fracToDigits(fracPart, fracCount, base: base)) {
      buf.add(Digit(d));
    }
  }
  return buf;
}

// ===========================================================================
// In-house f64 evaluator (replaces the `meval` crate).
// Lexer + recursive-descent parser + interpreter.
// Grammar/precedence mirrors the rational track in rat_parser.dart (the f64
// track follows the same shape).
// ===========================================================================

/// Lightweight token kinds for the f64 evaluator's lexer.
enum _FTokKind {
  num,
  ident,
  lparen,
  rparen,
  plus,
  minus,
  star,
  slash,
  caret,
  percent,
}

class _FTok {
  final _FTokKind kind;
  final String text;
  const _FTok(this.kind, this.text);
}

class _F64Lexer {
  final String src;
  int pos = 0;
  _F64Lexer(this.src);

  void _skipWs() {
    while (pos < src.length && _isWs(src.codeUnitAt(pos))) {
      pos++;
    }
  }

  static bool _isWs(int c) => c == 0x20 || c == 0x09 || c == 0x0A || c == 0x0D;
  static bool _isDigit(int c) => c >= 0x30 && c <= 0x39;
  static bool _isIdStart(int c) =>
      (c >= 0x41 && c <= 0x5A) || (c >= 0x61 && c <= 0x7A) || c == 0x5F;
  static bool _isIdCont(int c) => _isIdStart(c) || _isDigit(c);

  _FTok? next() {
    _skipWs();
    if (pos >= src.length) return null;
    final c = src.codeUnitAt(pos);
    if (_isDigit(c) || c == 0x2E /* . */ ) {
      final start = pos;
      while (pos < src.length && _isDigit(src.codeUnitAt(pos))) {
        pos++;
      }
      if (pos < src.length && src.codeUnitAt(pos) == 0x2E) {
        pos++;
        while (pos < src.length && _isDigit(src.codeUnitAt(pos))) {
          pos++;
        }
      }
      // optional exponent: e[+/-]?digits
      if (pos < src.length &&
          (src.codeUnitAt(pos) == 0x65 || src.codeUnitAt(pos) == 0x45)) {
        pos++;
        if (pos < src.length &&
            (src.codeUnitAt(pos) == 0x2B || src.codeUnitAt(pos) == 0x2D)) {
          pos++;
        }
        while (pos < src.length && _isDigit(src.codeUnitAt(pos))) {
          pos++;
        }
      }
      return _FTok(_FTokKind.num, src.substring(start, pos));
    }
    if (_isIdStart(c)) {
      final start = pos;
      pos++;
      while (pos < src.length && _isIdCont(src.codeUnitAt(pos))) {
        pos++;
      }
      return _FTok(_FTokKind.ident, src.substring(start, pos));
    }
    pos++;
    switch (c) {
      case 0x28:
        return const _FTok(_FTokKind.lparen, '(');
      case 0x29:
        return const _FTok(_FTokKind.rparen, ')');
      case 0x2B:
        return const _FTok(_FTokKind.plus, '+');
      case 0x2D:
        return const _FTok(_FTokKind.minus, '-');
      case 0x2A:
        return const _FTok(_FTokKind.star, '*');
      case 0x2F:
        return const _FTok(_FTokKind.slash, '/');
      case 0x5E:
        return const _FTok(_FTokKind.caret, '^');
      case 0x25:
        return const _FTok(_FTokKind.percent, '%');
    }
    throw FormatException('unexpected character "${String.fromCharCode(c)}"');
  }

  List<_FTok> tokenize() {
    final out = <_FTok>[];
    while (true) {
      final t = next();
      if (t == null) break;
      out.add(t);
    }
    return out;
  }
}

class _F64Parser {
  final List<_FTok> toks;
  final AngleMode angleMode;
  int pos = 0;

  /// Set when a division (the `/` operator, `recip`, `cot`, or `coth`) had a
  /// zero divisor. Lets the caller tell a true division-by-zero (→ DIV BY
  /// ZERO) apart from a magnitude overflow (→ OVERFLOW); both surface as ±∞.
  bool divByZero = false;

  _F64Parser(this.toks, this.angleMode);

  _FTok? _peek() => pos < toks.length ? toks[pos] : null;

  bool _matchKind(_FTokKind k) {
    if (_peek()?.kind == k) {
      pos++;
      return true;
    }
    return false;
  }

  double parse() {
    if (toks.isEmpty) {
      throw const FormatException('empty expression');
    }
    final v = _addSub();
    if (pos != toks.length) {
      throw FormatException('trailing input at token ${toks[pos].text}');
    }
    return v;
  }

  double _addSub() {
    var left = _mulDiv();
    while (true) {
      final p = _peek();
      if (p == null) break;
      if (p.kind == _FTokKind.plus) {
        pos++;
        left = left + _mulDiv();
      } else if (p.kind == _FTokKind.minus) {
        pos++;
        left = left - _mulDiv();
      } else {
        break;
      }
    }
    return left;
  }

  double _mulDiv() {
    var left = _unary();
    while (true) {
      final p = _peek();
      if (p == null) break;
      if (p.kind == _FTokKind.star) {
        pos++;
        left = left * _unary();
      } else if (p.kind == _FTokKind.slash) {
        pos++;
        final r = _unary();
        if (r == 0.0) divByZero = true;
        left = left / r;
      } else if (p.kind == _FTokKind.percent) {
        pos++;
        left = left % _unary();
      } else {
        break;
      }
    }
    return left;
  }

  double _unary() {
    if (_matchKind(_FTokKind.plus)) return _unary();
    if (_matchKind(_FTokKind.minus)) return -_unary();
    return _pow();
  }

  double _pow() {
    final base = _primary();
    if (_matchKind(_FTokKind.caret)) {
      // right-associative: recurse through unary so 2^-3 and 2^3^2 parse correctly
      final exp = _unary();
      return math.pow(base, exp).toDouble();
    }
    return base;
  }

  double _primary() {
    final p = _peek();
    if (p == null) {
      throw const FormatException('unexpected end of input');
    }
    if (p.kind == _FTokKind.num) {
      pos++;
      return double.parse(p.text);
    }
    if (p.kind == _FTokKind.lparen) {
      pos++;
      final v = _addSub();
      if (!_matchKind(_FTokKind.rparen)) {
        throw const FormatException('missing closing paren');
      }
      return v;
    }
    if (p.kind == _FTokKind.ident) {
      pos++;
      // Constant?
      switch (p.text) {
        case 'pi':
          return math.pi;
        case 'e':
          return math.e;
      }
      // Function call: ident '(' expr ')'
      if (!_matchKind(_FTokKind.lparen)) {
        throw FormatException('unknown identifier "${p.text}"');
      }
      final arg = _addSub();
      if (!_matchKind(_FTokKind.rparen)) {
        throw const FormatException('missing closing paren');
      }
      return _applyFunc(p.text, arg);
    }
    throw FormatException('unexpected token "${p.text}"');
  }

  double _applyFunc(String name, double x) {
    switch (name) {
      case 'sin':
        return math.sin(angleMode.toRad(x));
      case 'cos':
        return math.cos(angleMode.toRad(x));
      case 'tan':
        return math.tan(angleMode.toRad(x));
      case 'cot':
        final t = math.tan(angleMode.toRad(x));
        if (t == 0.0) divByZero = true;
        return 1.0 / t;
      case 'asin':
        return angleMode.radToUnit(math.asin(x));
      case 'acos':
        return angleMode.radToUnit(math.acos(x));
      case 'atan':
        return angleMode.radToUnit(math.atan(x));
      case 'acot':
        // Convention A: range (0, π), formula π/2 − atan(x).
        return angleMode.radToUnit(math.pi / 2.0 - math.atan(x));
      case 'sinh':
        return _sinh(x);
      case 'cosh':
        return _cosh(x);
      case 'tanh':
        return _tanh(x);
      case 'coth':
        final sh = _sinh(x);
        if (sh == 0.0) divByZero = true;
        return _cosh(x) / sh;
      case 'arsinh':
        // Symmetric formula via arsinh(-x) = -arsinh(x). The naive form
        // log(x + sqrt(x²+1)) suffers catastrophic cancellation for negative
        // x: |x| - sqrt(x²+1) ≈ 0 → log(≈0) → -∞.
        return x < 0
            ? -math.log(-x + math.sqrt(x * x + 1.0))
            : math.log(x + math.sqrt(x * x + 1.0));
      case 'arcosh':
        return math.log(x + math.sqrt(x * x - 1.0));
      case 'artanh':
        return 0.5 * math.log((1.0 + x) / (1.0 - x));
      case 'arcoth':
        return 0.5 * math.log((x + 1.0) / (x - 1.0));
      case 'ln':
        return math.log(x);
      case 'exp':
        return math.exp(x);
      case 'log12':
        return math.log(x) / math.log(12.0);
      case 'fact':
        return _fact(x);
      case 'abs':
        return x.abs();
      case 'recip':
        if (x == 0.0) divByZero = true;
        return 1.0 / x;
    }
    throw FormatException('unknown function "$name"');
  }

  static double _sinh(double x) => (math.exp(x) - math.exp(-x)) / 2.0;
  static double _cosh(double x) => (math.exp(x) + math.exp(-x)) / 2.0;
  static double _tanh(double x) {
    // Saturate explicitly: beyond |x| ≈ 20 the result rounds to ±1 anyway,
    // and beyond ~709 math.exp overflows to ∞, yielding (∞-0)/(∞+0) = NaN.
    if (x > 20.0) return 1.0;
    if (x < -20.0) return -1.0;
    final ex = math.exp(x);
    final emx = math.exp(-x);
    return (ex - emx) / (ex + emx);
  }

  static double _fact(double x) {
    // double.round() throws UnsupportedError on NaN / ±Infinity, which would
    // bubble out of evalF64 as an uncaught error. Guard so composition like
    // fact(asin(2)) returns NaN cleanly rather than crashing.
    if (x.isNaN || x.isInfinite) return double.nan;
    final n = x.round();
    if (n < 0) return double.nan;
    // 171! already exceeds the f64 range, so anything larger is ∞ — short out
    // before spending a long BigInt loop that would only round to ∞ anyway.
    if (n > 170) return double.infinity;
    var r = BigInt.one;
    for (var i = 1; i <= n; i++) {
      r *= BigInt.from(i);
    }
    return r.toDouble();
  }
}

/// Result of an f64 evaluation: the [value] (null on syntax error) plus a
/// [divByZero] flag that distinguishes a true division-by-zero (1/0, recip(0),
/// cot/coth at a pole) from a magnitude overflow — both yield ±∞ otherwise.
typedef F64Eval = ({double? value, bool divByZero});

/// Evaluates an f64 expression string, reporting division-by-zero separately.
F64Eval evalF64Detailed(String expr, AngleMode angleMode) {
  try {
    final toks = _F64Lexer(expr).tokenize();
    final parser = _F64Parser(toks, angleMode);
    final v = parser.parse();
    return (value: v, divByZero: parser.divByZero);
  } on FormatException {
    return (value: null, divByZero: false);
  }
}

/// Evaluates an f64 expression string. Returns null on syntax error.
/// The caller decides how to handle NaN / ±Infinity (DOMAIN ERROR / OVERFLOW /
/// DIV BY ZERO). See [evalF64Detailed] for the division-by-zero signal.
double? evalF64(String expr, AngleMode angleMode) =>
    evalF64Detailed(expr, angleMode).value;
