// Port of Rational + period detection from src/logic.rs.
// BigInt replaces i128: the rational track no longer collapses on overflow.
// Per PORTING.md, the only collapse causes that survive the port are
// non-rational tokens and division by zero.

import 'dozenal_converter.dart';
import 'dozenal_digit.dart';

/// Decomposition of a rational number into its dozenal expansion.
/// `period` is empty iff the expansion is finite.
typedef DozenalPeriodic = ({
  List<DozenalDigit> intDigits,
  List<DozenalDigit> preDigits,
  List<DozenalDigit> period,
});

/// Exact rational number. Invariants: `den > 0`, always reduced.
class Rational {
  final BigInt num;
  final BigInt den;

  const Rational._raw(this.num, this.den);

  /// Reduced constructor. Returns null on `den == 0`. Mirrors Rust `Rational::new`.
  static Rational? tryNew(BigInt num, BigInt den) {
    if (den == BigInt.zero) return null;
    final g = num.gcd(den);
    final sign = den.isNegative ? -BigInt.one : BigInt.one;
    return Rational._raw(sign * (num ~/ g), sign * (den ~/ g));
  }

  /// Convenience constructor for integer literals (tests, common cases).
  /// Throws ArgumentError on `den == 0`.
  factory Rational.fromInts(int num, [int den = 1]) {
    final r = tryNew(BigInt.from(num), BigInt.from(den));
    if (r == null) {
      throw ArgumentError('denominator must be non-zero');
    }
    return r;
  }

  static final Rational zero = Rational._raw(BigInt.zero, BigInt.one);
  static final Rational one = Rational._raw(BigInt.one, BigInt.one);

  // ---------------------------------------------------------------------
  // Arithmetic. BigInt removes the overflow failure mode the Rust version
  // had to thread through every operation. The only remaining failure is
  // division by zero (and 0 raised to a negative exponent).
  // ---------------------------------------------------------------------

  Rational add(Rational rhs) {
    final n = num * rhs.den + rhs.num * den;
    final d = den * rhs.den;
    return tryNew(n, d)!;
  }

  Rational sub(Rational rhs) {
    final n = num * rhs.den - rhs.num * den;
    final d = den * rhs.den;
    return tryNew(n, d)!;
  }

  Rational mul(Rational rhs) {
    return tryNew(num * rhs.num, den * rhs.den)!;
  }

  /// Returns null on division by zero.
  Rational? div(Rational rhs) {
    if (rhs.num == BigInt.zero) return null;
    return tryNew(num * rhs.den, den * rhs.num)!;
  }

  /// Integer power (negative exponent allowed). Returns null on `0^negative`.
  Rational? pow(int exp) {
    if (exp == 0) return one;
    if (exp < 0) {
      if (num == BigInt.zero) return null;
      // x^(-n) = (1/x)^n
      final inv = tryNew(den, num)!;
      return inv.pow(-exp);
    }
    var result = one;
    var base = this;
    var e = exp;
    while (e > 0) {
      if (e & 1 == 1) {
        result = result.mul(base);
      }
      base = base.mul(base);
      e >>= 1;
    }
    return result;
  }

  /// Parallel-resistor operator: (a*b)/(a+b). Returns null on a+b=0.
  Rational? oplus(Rational rhs) {
    final sum = add(rhs);
    if (sum.num == BigInt.zero) return null;
    final product = mul(rhs);
    return product.div(sum);
  }

  /// Euclidean modulo, matching Dart's f64 `%`: r = a − rhs·⌊a/rhs⌋, so the
  /// result carries the divisor's sign and 0 ≤ |r| < |rhs|. Null on rhs = 0.
  Rational? mod(Rational rhs) {
    if (rhs.num == BigInt.zero) return null;
    // a/rhs = (num·rhs.den)/(den·rhs.num); floor it toward −∞.
    final f = _floorDiv(num * rhs.den, den * rhs.num);
    return sub(rhs.mul(Rational._raw(f, BigInt.one)));
  }

  /// Absolute value (den is always positive by invariant).
  Rational abs() => num.isNegative ? Rational._raw(-num, den) : this;

  /// Reciprocal 1/x. Returns null when x = 0.
  Rational? reciprocal() => num == BigInt.zero ? null : tryNew(den, num);

  /// Largest factorial argument expanded on the exact track. Beyond this the
  /// result is far past [maxResultDigits] anyway, so [factorial] collapses to
  /// the f64 fallback instead of spending a long BigInt loop on a value that
  /// would only be rendered truncated.
  static const int factorialCap = 3000;

  /// Factorial n! when this is a non-negative integer ≤ [factorialCap];
  /// null otherwise (non-integer, negative, or too large).
  Rational? factorial() {
    if (den != BigInt.one || num.isNegative || !num.isValidInt) return null;
    final n = num.toInt();
    if (n > factorialCap) return null;
    var r = BigInt.one;
    for (var i = 2; i <= n; i++) {
      r *= BigInt.from(i);
    }
    return Rational._raw(r, BigInt.one);
  }

  /// Integer floor division (toward −∞), unlike `~/` which truncates toward 0.
  static BigInt _floorDiv(BigInt a, BigInt b) {
    var q = a ~/ b;
    if (a % b != BigInt.zero && a.isNegative != b.isNegative) {
      q -= BigInt.one;
    }
    return q;
  }

  double toDouble() => num.toDouble() / den.toDouble();

  // ---------------------------------------------------------------------
  // Period detection — classical school algorithm over remainders.
  // ---------------------------------------------------------------------

  /// Decomposes the fraction into (integer part, pre-period, period) in the
  /// given [base] (default 12). `period` is empty iff the expansion is
  /// finite in that base. The period is capped at 100 digits; beyond that
  /// the result is treated as non-periodic. Sign is dropped — the magnitude
  /// is what's returned.
  DozenalPeriodic toDozenalPeriodic({int base = 12}) {
    final absNum = num.abs();
    final d = den; // always positive by invariant

    final intPart = absNum ~/ d;
    var rem = absNum % d;

    final intDigits = DozenalConverter.fromBigInt(intPart, base: base);

    final fracDigits = <DozenalDigit>[];
    final seen = <BigInt, int>{};
    final b = BigInt.from(base);

    while (true) {
      if (rem == BigInt.zero) {
        return (
          intDigits: intDigits,
          preDigits: fracDigits,
          period: const <DozenalDigit>[],
        );
      }
      final firstPos = seen[rem];
      if (firstPos != null) {
        final period = fracDigits.sublist(firstPos);
        final pre = fracDigits.sublist(0, firstPos);
        return (intDigits: intDigits, preDigits: pre, period: period);
      }
      if (fracDigits.length >= 100) {
        return (
          intDigits: intDigits,
          preDigits: fracDigits,
          period: const <DozenalDigit>[],
        );
      }
      seen[rem] = fracDigits.length;
      rem = rem * b;
      final digitVal = (rem ~/ d).toInt();
      rem = rem % d;
      fracDigits.add(DozenalDigit.values[digitVal]);
    }
  }

  @override
  bool operator ==(Object other) =>
      other is Rational && other.num == num && other.den == den;

  @override
  int get hashCode => Object.hash(num, den);

  @override
  String toString() => '$num/$den';
}
