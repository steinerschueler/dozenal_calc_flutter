// Port of RatExpr + eval_rational + RatParser from src/logic.rs:299–427.
// The token-stream parser for the rational evaluation track. Sealed class for
// RatExpr matches Rust's enum with one payload variant (Num).
//
// Precedence (lowest to highest):
//   1. + and -                            (parseAddSub)
//   2. *, /, ⊕  — left-associative        (parseMulDiv)
//   3. unary +/- and ^ (right-associative) (parsePow)
//   4. literals, parenthesised expressions (parsePrimary)

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
      const int maxResultBits = 10000000;
      final baseBits = base.num.bitLength + base.den.bitLength;
      if (baseBits * expInt.abs() > maxResultBits) return null;
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
    return null;
  }
}
