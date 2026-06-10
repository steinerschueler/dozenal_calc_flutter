// Unit tests for the pure result-presentation helpers extracted from
// DozenalCalcState into logic/result_format.dart.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/rational.dart';
import 'package:dozenal_calc_flutter/logic/result_format.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

void main() {
  group('resultBufferToString', () {
    test('single ten digit renders as A', () {
      expect(resultBufferToString([Digit(DozenalDigit.d10)]), equals('A'));
    });

    test('negate + digits + decimal', () {
      expect(
        resultBufferToString([
          const Negate(),
          Digit(DozenalDigit.d1),
          const Decimal(),
          Digit(DozenalDigit.d6),
        ]),
        equals('-1.6'),
      );
    });

    test('eleven renders as B', () {
      expect(resultBufferToString([Digit(DozenalDigit.d11)]), equals('B'));
    });
  });

  group('compactRationalString', () {
    test('ten is "10" in base 10 and "A" in base 12', () {
      expect(compactRationalString(Rational.fromInts(10), 10), equals('10'));
      expect(compactRationalString(Rational.fromInts(10), 12), equals('A'));
    });

    test('1/3 is finite "0.4" in base 12, periodic in base 10', () {
      expect(compactRationalString(Rational.fromInts(1, 3), 12), equals('0.4'));
      expect(
        compactRationalString(Rational.fromInts(1, 3), 10),
        equals('0.333333…'),
      );
    });

    test('negative eleven is "-B" in base 12', () {
      expect(compactRationalString(Rational.fromInts(-11), 12), equals('-B'));
    });

    test('finite fraction without period has no ellipsis', () {
      // 1/2 = 0.6 in base 12, exact.
      expect(compactRationalString(Rational.fromInts(1, 2), 12), equals('0.6'));
    });
  });

  group('compactF64String', () {
    test('approximate fraction always ends in an ellipsis', () {
      // 0.5 decimal = 0.6 dozenal.
      expect(compactF64String(0.5, 12), equals('0.6…'));
    });

    test('NaN and infinity surface as glyphs', () {
      expect(compactF64String(double.nan, 12), equals('NaN'));
      expect(compactF64String(double.infinity, 12), equals('∞'));
      expect(compactF64String(double.negativeInfinity, 12), equals('∞'));
    });

    test('whole number has no fractional tail', () {
      expect(compactF64String(7.0, 12), equals('7'));
    });
  });
}
