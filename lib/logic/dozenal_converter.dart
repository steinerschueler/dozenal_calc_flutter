// Port of DozenalConverter from src/logic.rs.
// BigInt replaces the i128-bounded to_decimal_exact path; from_bigint is the
// new exact-integer route used by Rational.toDozenalPeriodic to avoid the
// f64-precision pitfalls of the legacy from_decimal pipeline.

import 'dart:math' as math;

import 'dozenal_digit.dart';

/// Numerical tolerance used when extracting dozenal digits from a `double`
/// fractional part. Below this threshold floating-point drift is treated as
/// zero, so `0.6000000000001` reads as `0.6` instead of leaking into a fake
/// periodic tail.
const double fracEpsilon = 0.000001;

class DozenalConverter {
  DozenalConverter._();

  /// Exact integer conversion via Horner's method. BigInt removes the
  /// overflow path that the Rust version had to guard with `checked_*`.
  /// [base] defaults to 12 (dozenal); pass 10 for decimal interpretation.
  static BigInt toDecimalExact(List<DozenalDigit> digits, {int base = 12}) {
    var result = BigInt.zero;
    final b = BigInt.from(base);
    for (final d in digits) {
      result = result * b + BigInt.from(d.value);
    }
    return result;
  }

  /// Digit list → f64. Used by the f64 evaluation track.
  static double toDecimal(List<DozenalDigit> digits, {int base = 12}) {
    var result = 0.0;
    final b = base.toDouble();
    for (var i = 0; i < digits.length; i++) {
      final d = digits[digits.length - 1 - i];
      result += d.value * math.pow(b, i).toDouble();
    }
    return result;
  }

  /// Non-negative BigInt → digits in the given [base]. Exact at any magnitude.
  static List<DozenalDigit> fromBigInt(BigInt value, {int base = 12}) {
    if (value.isNegative) value = -value;
    if (value == BigInt.zero) return [DozenalDigit.d0];
    final b = BigInt.from(base);
    final digits = <DozenalDigit>[];
    while (value > BigInt.zero) {
      final rem = (value % b).toInt();
      digits.add(DozenalDigit.values[rem]);
      value = value ~/ b;
    }
    return digits.reversed.toList();
  }

  /// f64 → digits in [base] (integer part). Mirrors the Rust from_decimal
  /// loop exactly; precision is bounded by the f64 mantissa.
  static List<DozenalDigit> fromDecimal(double value, {int base = 12}) {
    var integerPart = value.floorToDouble();
    if (integerPart < 1.0) {
      return [DozenalDigit.d0];
    }
    final b = base.toDouble();
    final digits = <DozenalDigit>[];
    while (integerPart >= 1.0) {
      final remainder = (integerPart % b).toInt();
      digits.add(DozenalDigit.values[remainder]);
      integerPart = (integerPart / b).floorToDouble();
    }
    return digits.reversed.toList();
  }

  /// f64 fractional part → digits in [base], capped at `precision` digits.
  /// Stops early once the residual drops below fracEpsilon.
  static List<DozenalDigit> fracToDigits(double frac, int precision,
      {int base = 12}) {
    final digits = <DozenalDigit>[];
    final b = base.toDouble();
    for (var i = 0; i < precision; i++) {
      frac *= b;
      final dVal = (frac + fracEpsilon).floor();
      final d = DozenalDigit.fromValue(dVal);
      if (d != null) digits.add(d);
      frac -= dVal;
      if (frac.abs() < fracEpsilon) break;
    }
    return digits;
  }
}
