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
  });
}
