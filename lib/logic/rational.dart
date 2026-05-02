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

  double toDouble() => num.toDouble() / den.toDouble();

  // ---------------------------------------------------------------------
  // Period detection — classical school algorithm over remainders.
  // ---------------------------------------------------------------------

  /// Decomposes the fraction into (integer part, pre-period, period).
  /// `period` is empty iff the expansion is finite. The period is capped
  /// at 100 digits; beyond that the result is treated as non-periodic.
  /// Sign is dropped — the magnitude is what's returned.
  DozenalPeriodic toDozenalPeriodic() {
    final absNum = num.abs();
    final d = den; // always positive by invariant

    final intPart = absNum ~/ d;
    var rem = absNum % d;

    final intDigits = DozenalConverter.fromBigInt(intPart);

    final fracDigits = <DozenalDigit>[];
    final seen = <BigInt, int>{};
    final twelve = BigInt.from(12);

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
      rem = rem * twelve;
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
