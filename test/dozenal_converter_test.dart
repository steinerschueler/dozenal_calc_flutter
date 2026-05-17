// Port of DozenalConverter tests from src/logic.rs::tests.

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_converter.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';

void main() {
  group('DozenalConverter', () {
    test('test_conversion: 14 dec → [D1, D2]; [D1, D4] → 16 dec', () {
      expect(
        DozenalConverter.fromDecimal(14.0),
        equals([DozenalDigit.d1, DozenalDigit.d2]),
      );
      expect(
        DozenalConverter.toDecimal([DozenalDigit.d1, DozenalDigit.d4]),
        equals(16.0),
      );
    });

    test('to_decimal_exact_basic', () {
      expect(DozenalConverter.toDecimalExact([]), equals(BigInt.zero));
      expect(
        DozenalConverter.toDecimalExact([DozenalDigit.d1, DozenalDigit.d0]),
        equals(BigInt.from(12)),
      );
      expect(
        DozenalConverter.toDecimalExact([DozenalDigit.d1, DozenalDigit.d1]),
        equals(BigInt.from(13)),
      );
    });

    // Regression: B11 — frac near 1.0 used to yield dVal == base (= 12),
    // which DozenalDigit.fromValue rejected as null, silently dropping the
    // digit and leaving an empty result.
    test('frac_to_digits_near_one_does_not_drop_silently', () {
      final out = DozenalConverter.fracToDigits(0.99999, 5, base: 12);
      // Must produce at least one digit (the leading 'B' / d11) and not be
      // an empty list.
      expect(out, isNotEmpty);
      expect(out.first, equals(DozenalDigit.d11));
    });
  });
}
