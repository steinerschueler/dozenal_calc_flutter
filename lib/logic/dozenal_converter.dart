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
  static BigInt toDecimalExact(List<DozenalDigit> digits) {
    var result = BigInt.zero;
    final twelve = BigInt.from(12);
    for (final d in digits) {
      result = result * twelve + BigInt.from(d.value);
    }
    return result;
  }

  /// Dozenal digits → f64. Used by the f64 evaluation track.
  static double toDecimal(List<DozenalDigit> digits) {
    var result = 0.0;
    for (var i = 0; i < digits.length; i++) {
      final d = digits[digits.length - 1 - i];
      result += d.value * math.pow(12.0, i).toDouble();
    }
    return result;
  }

  /// Non-negative BigInt → dozenal digits. Exact at any magnitude.
  static List<DozenalDigit> fromBigInt(BigInt value) {
    if (value.isNegative) value = -value;
    if (value == BigInt.zero) return [DozenalDigit.d0];
    final twelve = BigInt.from(12);
    final digits = <DozenalDigit>[];
    while (value > BigInt.zero) {
      final rem = (value % twelve).toInt();
      digits.add(DozenalDigit.values[rem]);
      value = value ~/ twelve;
    }
    return digits.reversed.toList();
  }

  /// f64 → dozenal digits (integer part). Mirrors the Rust from_decimal
  /// loop exactly; precision is bounded by the f64 mantissa.
  static List<DozenalDigit> fromDecimal(double value) {
    var integerPart = value.floorToDouble();
    if (integerPart < 1.0) {
      return [DozenalDigit.d0];
    }
    final digits = <DozenalDigit>[];
    while (integerPart >= 1.0) {
      final remainder = (integerPart % 12.0).toInt();
      digits.add(DozenalDigit.values[remainder]);
      integerPart = (integerPart / 12.0).floorToDouble();
    }
    return digits.reversed.toList();
  }

  /// f64 fractional part → dozenal digits, capped at `precision` digits.
  /// Stops early once the residual drops below fracEpsilon.
  static List<DozenalDigit> fracToDigits(double frac, int precision) {
    final digits = <DozenalDigit>[];
    for (var i = 0; i < precision; i++) {
      frac *= 12.0;
      final dVal = (frac + fracEpsilon).floor();
      final d = DozenalDigit.fromValue(dVal);
      if (d != null) digits.add(d);
      frac -= dVal;
      if (frac.abs() < fracEpsilon) break;
    }
    return digits;
  }
}
