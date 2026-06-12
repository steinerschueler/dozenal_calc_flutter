// Port of RatExpr + eval_rational + RatParser from src/logic.rs:299–427.
// The token-stream parser for the rational evaluation track. Sealed class for
// RatExpr matches Rust's enum with one payload variant (Num).
//
// Precedence (lowest to highest):
//   1. + and -                            (parseAddSub)
//   2. *, /, ⊕, mod — left-associative    (parseMulDiv)
//   3. unary +/- and ^ (right-associative) (parsePow)
//   4. literals, parenthesised expressions, and the rationality-preserving
//      unary functions fact()/abs()/recip()  (parsePrimary)
//
// Beyond the Rust original the Dart track also keeps mod, scientific notation
// (a EXP b → a·base^b, expanded in buildRatExpr), and n!/|x|/1÷x exact, so
// these no longer collapse to the f64 ≈ fallback.

import 'rational.dart';

sealed class RatExpr {
  const RatExpr();
}

final class RatNum extends RatExpr {
  final Rational value;
  const RatNum(this.value);

  @override
  bool operator ==(Object other) => other is RatNum && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

final class RatAdd extends RatExpr {
  const RatAdd();
}

/// Also used for unary minus.
final class RatSub extends RatExpr {
  const RatSub();
}

final class RatMul extends RatExpr {
  const RatMul();
}

final class RatDiv extends RatExpr {
  const RatDiv();
}

final class RatPow extends RatExpr {
  const RatPow();
}

final class RatOPlus extends RatExpr {
  const RatOPlus();
}

/// Modulo — same precedence as `*` and `/` (left-associative).
final class RatMod extends RatExpr {
  const RatMod();
}

/// Rationality-preserving unary functions on a parenthesised operand:
/// `fact(…)`, `abs(…)`, `recip(…)`. Each is an opener matched by a following
/// [RatRParen] — the shape `resolvePostfix` produces for n! / |x| / 1÷x.
final class RatFact extends RatExpr {
  const RatFact();
}

final class RatAbs extends RatExpr {
  const RatAbs();
}

final class RatRecip extends RatExpr {
  const RatRecip();
}

final class RatLParen extends RatExpr {
  const RatLParen();
}

final class RatRParen extends RatExpr {
  const RatRParen();
}

/// Evaluates a `RatExpr` token sequence as an arithmetic expression.
/// Returns null if the expression is malformed, divides by zero, or uses a
/// non-integer exponent (which would make the result irrational).
Rational? evalRational(List<RatExpr> exprs) {
  final p = _RatParser(exprs);
  final result = p._parseAddSub();
  if (result == null) return null;
  if (p._pos != exprs.length) return null; // unconsumed tokens → malformed
  return result;
}

class _RatParser {
  final List<RatExpr> _exprs;
  int _pos = 0;

  _RatParser(this._exprs);

  RatExpr? _peek() => _pos < _exprs.length ? _exprs[_pos] : null;

  // Level 1 (lowest): + and -
  Rational? _parseAddSub() {
    final initial = _parseMulDiv();
    if (initial == null) return null;
    Rational left = initial;
    while (true) {
      final p = _peek();
      if (p is RatAdd) {
        _pos++;
        final r = _parseMulDiv();
        if (r == null) return null;
        left = left.add(r);
      } else if (p is RatSub) {
        _pos++;
        final r = _parseMulDiv();
        if (r == null) return null;
        left = left.sub(r);
      } else {
        break;
      }
    }
    return left;
  }

  // Level 2: *, /, ⊕ (same precedence, left-associative)
  Rational? _parseMulDiv() {
    final initial = _parsePow();
    if (initial == null) return null;
    Rational left = initial;
    while (true) {
      final p = _peek();
      if (p is RatMul) {
        _pos++;
        final r = _parsePow();
        if (r == null) return null;
        left = left.mul(r);
      } else if (p is RatDiv) {
        _pos++;
        final r = _parsePow();
        if (r == null) return null;
        final d = left.div(r);
        if (d == null) return null;
        left = d;
      } else if (p is RatOPlus) {
        _pos++;
        final r = _parsePow();
        if (r == null) return null;
        final o = left.oplus(r);
        if (o == null) return null;
        left = o;
      } else if (p is RatMod) {
        _pos++;
        final r = _parsePow();
        if (r == null) return null;
        final m = left.mod(r);
        if (m == null) return null; // mod by zero → collapse
        left = m;
      } else {
        break;
      }
    }
    return left;
  }

  // Level 3: unary +/- and right-associative ^
  Rational? _parsePow() {
    final p = _peek();
    if (p is RatSub) {
      _pos++;
      final val = _parsePow();
      if (val == null) return null;
      return val.mul(Rational.fromInts(-1));
    }
    if (p is RatAdd) {
      _pos++;
      return _parsePow();
    }
    final base = _parsePrimary();
    if (base == null) return null;
    if (_peek() is RatPow) {
      _pos++;
      final exp = _parsePow(); // right-associative recursion
      if (exp == null) return null;
      if (exp.den != BigInt.one) return null; // fractional exponent → collapse
      if (!exp.num.isValidInt) return null;
      final expInt = exp.num.toInt();
      // Safety cap: avoid astronomically large BigInt powers that would
      // freeze the engine (e.g. 9^9^9 = 9^387_420_489 would allocate a
      // ~150 MB BigInt). Estimated result-bit-length is bits(base) * |exp|;
      // anything above ~10 M bits (~1.25 MB BigInt) collapses to f64.
      // Compare in BigInt so a near-max_int exponent can't wrap the product
      // through int64 overflow and slip past the cap.
      const int maxResultBits = 10000000;
      final baseBits = base.num.bitLength + base.den.bitLength;
      final product = BigInt.from(baseBits) * BigInt.from(expInt).abs();
      if (product > BigInt.from(maxResultBits)) return null;
      return base.pow(expInt);
    }
    return base;
  }

  // Level 4 (highest): literals and parenthesised sub-expressions
  Rational? _parsePrimary() {
    final p = _peek();
    if (p is RatNum) {
      _pos++;
      return p.value;
    }
    if (p is RatLParen) {
      _pos++;
      final val = _parseAddSub();
      if (val == null) return null;
      if (_peek() is RatRParen) {
        _pos++;
        return val;
      }
      return null; // unmatched paren
    }
    // Unary rational functions: fact( … ) / abs( … ) / recip( … ). The opener
    // is followed by its operand and a matching RatRParen.
    if (p is RatFact || p is RatAbs || p is RatRecip) {
      _pos++;
      final inner = _parseAddSub();
      if (inner == null) return null;
      if (_peek() is! RatRParen) return null;
      _pos++;
      if (p is RatFact) return inner.factorial(); // null if non-int/neg/huge
      if (p is RatAbs) return inner.abs();
      return inner.reciprocal(); // RatRecip; null on zero
    }
    return null;
  }
}
