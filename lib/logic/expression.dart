// Port of src/eval.rs.
// Two responsibilities:
//   1. Token-pipeline functions (with_implicit_muls, build_rat_expr,
//      build_meval_string, resolve_custom_operators, format_*_result) —
//      structurally 1:1 with Rust.
//   2. An in-house f64 expression evaluator that replaces the `meval` crate.
//      Lexer + recursive-descent parser + interpreter, following the grammar
//      in EXPRESSION_GRAMMAR.md.
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
const int maxPeriodDisplay = 5;

/// Number of dozenal fractional digits emitted in the f64 fallback (when the
/// rational track collapses).
const int f64FracDigits = 4;

// ---------------------------------------------------------------------------
// build_rat_expr — token stream → RatExpr atoms (rational track).
// ---------------------------------------------------------------------------

/// Returns null as soon as a non-rational token is encountered.
List<RatExpr>? buildRatExpr(List<CalcToken> tokens) {
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
      final intVal = DozenalConverter.toDecimalExact(intD);
      final intRat = Rational.tryNew(intVal, BigInt.one)!;
      Rational rat;
      if (fracD.isEmpty) {
        rat = intRat;
      } else {
        final fracNum = DozenalConverter.toDecimalExact(fracD);
        final fracDen = BigInt.from(12).pow(fracD.length);
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
      final fracNum = DozenalConverter.toDecimalExact(fracD);
      final fracDen = BigInt.from(12).pow(fracD.length);
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

_Range? _leftOperandRange(List<String> tokens, int opPos) {
  if (opPos == 0) return null;
  if (tokens[opPos - 1] != ')') {
    return (start: opPos - 1, end: opPos);
  }
  var depth = 0;
  var j = opPos;
  while (j > 0) {
    j--;
    final t = tokens[j];
    if (t == ')') {
      depth++;
    } else if (t == '(') {
      depth--;
      if (depth == 0) return (start: j, end: opPos);
    }
  }
  return null;
}

_Range? _rightOperandRange(List<String> tokens, int opPos) {
  if (opPos + 1 >= tokens.length) return null;
  if (tokens[opPos + 1] != '(') {
    return (start: opPos + 1, end: opPos + 2);
  }
  var depth = 0;
  for (var j = opPos + 1; j < tokens.length; j++) {
    final t = tokens[j];
    if (t == '(') {
      depth++;
    } else if (t == ')') {
      depth--;
      if (depth == 0) return (start: opPos + 1, end: j + 1);
    }
  }
  return null;
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
    final a = tokens.sublist(left.start, left.end).join();
    final b = tokens.sublist(right.start, right.end).join();
    tokens.replaceRange(left.start, right.end, ['(($a*$b)/($a+$b))']);
  }
  while (true) {
    final i = tokens.indexOf('√');
    if (i == -1) break;
    final right = _rightOperandRange(tokens, i);
    if (right == null) break;
    final precededByOp = i == 0 ||
        const {'+', '-', '*', '/', '('}.contains(tokens[i - 1]);
    final x = tokens.sublist(right.start, right.end).join();
    if (precededByOp) {
      tokens.replaceRange(i, right.end, ['($x^(1/2))']);
    } else {
      final left = _leftOperandRange(tokens, i);
      if (left == null) break;
      final n = tokens.sublist(left.start, left.end).join();
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
    final x = tokens.sublist(left.start, left.end).join();
    final n = tokens.sublist(right.start, right.end).join();
    tokens.replaceRange(left.start, right.end, ['(ln($x)/ln($n))']);
  }
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
  return curr is ParenClose ||
      curr is RatLit ||
      curr is ConstPi ||
      curr is ConstE ||
      curr is ConstPhi ||
      curr is ConstSqrt2;
}

bool _startsSubexpression(CalcToken next) {
  return next is Digit ||
      next is ParenOpen ||
      next is RatLit ||
      next is ConstPi ||
      next is ConstE ||
      next is ConstPhi ||
      next is ConstSqrt2 ||
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
      next is Reciprocal;
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
String tokenMevalStr(CalcToken t) {
  if (t is Add) return '+';
  if (t is Sub || t is Negate) return '-';
  if (t is Mul) return '*';
  if (t is Div) return '/';
  if (t is Mod) return '%';
  if (t is ParenOpen) return '(';
  if (t is ParenClose) return ')';
  if (t is Sin) return 'sin(';
  if (t is Cos) return 'cos(';
  if (t is Tan) return 'tan(';
  if (t is Cot) return 'cot(';
  if (t is ExpTopRight) return '^';
  if (t is RootTopLeft) return '√';
  if (t is OplusBotLeft) return '⊕';
  if (t is LogBotRight) return 'log';
  if (t is ArcSin) return 'asin(';
  if (t is ArcCos) return 'acos(';
  if (t is ArcTan) return 'atan(';
  if (t is ArcCot) return 'acot(';
  if (t is Sinh) return 'sinh(';
  if (t is Cosh) return 'cosh(';
  if (t is Tanh) return 'tanh(';
  if (t is Coth) return 'coth(';
  if (t is ArSinh) return 'arsinh(';
  if (t is ArCosh) return 'arcosh(';
  if (t is ArTanh) return 'artanh(';
  if (t is ArCoth) return 'arcoth(';
  if (t is Factorial) return 'fact(';
  if (t is AbsVal) return 'abs(';
  if (t is Reciprocal) return 'recip(';
  return '';
}

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
) {
  if (intDigits.isEmpty && fracDigits.isEmpty) return;
  final intStr = intDigits.isEmpty
      ? '0'
      : DozenalConverter.toDecimal(intDigits).toString();
  if (inFractionRef[0] && fracDigits.isNotEmpty) {
    final fracStr = DozenalConverter.toDecimal(fracDigits).toString();
    final len = fracDigits.length;
    out.add('($intStr+($fracStr/(12^$len)))');
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
String buildMevalString(List<CalcToken> expanded) {
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
      _flushNumberLiteral(intDigits, fracDigits, inFraction, tokensStr);
      if (token is RatLit) {
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
  _flushNumberLiteral(intDigits, fracDigits, inFraction, tokensStr);

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

  const PeriodMeta({required this.start, required this.len, required this.capped});
}

({List<CalcToken> buf, PeriodMeta meta}) formatRationalResult(Rational r) {
  final dec = r.toDozenalPeriodic();
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
  return (buf: buf, meta: PeriodMeta(start: start, len: len, capped: capped));
}

/// Renders an f64 value as a base-10 string with up to 10 fractional digits,
/// trailing zeros stripped. Used by the Doz↔Dec mode (Set 10.1) to show the
/// current result in the familiar decimal notation. Mirrors layout.rs::
/// format_decimal_result.
String formatDecimalResult(double val) {
  if (val.isNaN) return 'NaN';
  if (val.isInfinite) return '∞';
  var s = val.toStringAsFixed(10);
  if (s.contains('.')) {
    while (s.endsWith('0')) {
      s = s.substring(0, s.length - 1);
    }
    if (s.endsWith('.')) {
      s = s.substring(0, s.length - 1);
    }
  }
  return s;
}

List<CalcToken> formatF64Result(double value) {
  final buf = <CalcToken>[];
  var v = value;
  if (v < 0.0) {
    buf.add(const Negate());
    v = v.abs();
  }
  for (final d in DozenalConverter.fromDecimal(v)) {
    buf.add(Digit(d));
  }
  final fracPart = v - v.floorToDouble();
  if (fracPart > fracEpsilon) {
    buf.add(const Decimal());
    for (final d in DozenalConverter.fracToDigits(fracPart, f64FracDigits)) {
      buf.add(Digit(d));
    }
  }
  return buf;
}

// ===========================================================================
// In-house f64 evaluator (replaces the `meval` crate).
// Lexer + recursive-descent parser + interpreter.
// Grammar: see EXPRESSION_GRAMMAR.md "Rational-Track-Grammatik" (the f64
// track follows the same shape).
// ===========================================================================

/// Lightweight token kinds for the f64 evaluator's lexer.
enum _FTokKind { num, ident, lparen, rparen, plus, minus, star, slash, caret, percent }

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
    if (_isDigit(c) || c == 0x2E /* . */) {
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
        left = left / _unary();
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
        return 1.0 / math.tan(angleMode.toRad(x));
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
        return _cosh(x) / _sinh(x);
      case 'arsinh':
        return math.log(x + math.sqrt(x * x + 1.0));
      case 'arcosh':
        return math.log(x + math.sqrt(x * x - 1.0));
      case 'artanh':
        return 0.5 * math.log((1.0 + x) / (1.0 - x));
      case 'arcoth':
        return 0.5 * math.log((x + 1.0) / (x - 1.0));
      case 'ln':
        return math.log(x);
      case 'fact':
        return _fact(x);
      case 'abs':
        return x.abs();
      case 'recip':
        return 1.0 / x;
    }
    throw FormatException('unknown function "$name"');
  }

  static double _sinh(double x) => (math.exp(x) - math.exp(-x)) / 2.0;
  static double _cosh(double x) => (math.exp(x) + math.exp(-x)) / 2.0;
  static double _tanh(double x) {
    final ex = math.exp(x);
    final emx = math.exp(-x);
    return (ex - emx) / (ex + emx);
  }

  static double _fact(double x) {
    final n = x.round();
    if (n < 0) return double.nan;
    var r = BigInt.one;
    for (var i = 1; i <= n; i++) {
      r *= BigInt.from(i);
    }
    return r.toDouble();
  }
}

/// Evaluates an f64 expression string. Returns null on syntax error.
/// The caller decides how to handle NaN / ±Infinity (DOMAIN ERROR / DIV BY ZERO).
double? evalF64(String expr, AngleMode angleMode) {
  try {
    final toks = _F64Lexer(expr).tokenize();
    return _F64Parser(toks, angleMode).parse();
  } on FormatException {
    return null;
  }
}
