// Port of Rational + period-detection tests from src/logic.rs::tests.
// The eval_rational tests are deferred to step 5 (rat_parser.dart).

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/rational.dart';

void main() {
  group('Rational basic arithmetic', () {
    test('rational_new_reduces', () {
      final r = Rational.fromInts(6, 9);
      expect(r.num, equals(BigInt.from(2)));
      expect(r.den, equals(BigInt.from(3)));
    });

    test('rational_new_negative_den', () {
      final r = Rational.fromInts(1, -2);
      expect(r.num, equals(-BigInt.one));
      expect(r.den, equals(BigInt.from(2)));
    });

    test('rational_new_div_by_zero', () {
      expect(Rational.tryNew(BigInt.one, BigInt.zero), isNull);
    });

    test('rational_add: 1/3 + 1/6 = 1/2', () {
      final a = Rational.fromInts(1, 3);
      final b = Rational.fromInts(1, 6);
      final c = a.add(b);
      expect(c.num, equals(BigInt.one));
      expect(c.den, equals(BigInt.from(2)));
    });

    test('rational_sub: 3/4 - 1/4 = 1/2', () {
      final a = Rational.fromInts(3, 4);
      final b = Rational.fromInts(1, 4);
      final c = a.sub(b);
      expect(c.num, equals(BigInt.one));
      expect(c.den, equals(BigInt.from(2)));
    });

    test('rational_mul: 2/3 * 3/4 = 1/2', () {
      final a = Rational.fromInts(2, 3);
      final b = Rational.fromInts(3, 4);
      final c = a.mul(b);
      expect(c.num, equals(BigInt.one));
      expect(c.den, equals(BigInt.from(2)));
    });

    test('rational_div: (1/2) / (3/4) = 2/3', () {
      final a = Rational.fromInts(1, 2);
      final b = Rational.fromInts(3, 4);
      final c = a.div(b)!;
      expect(c.num, equals(BigInt.from(2)));
      expect(c.den, equals(BigInt.from(3)));
    });

    test('rational_div_by_zero', () {
      final a = Rational.fromInts(1, 2);
      expect(a.div(Rational.zero), isNull);
    });

    test('rational_pow_positive: (2/3)^3 = 8/27', () {
      final r = Rational.fromInts(2, 3).pow(3)!;
      expect(r.num, equals(BigInt.from(8)));
      expect(r.den, equals(BigInt.from(27)));
    });

    test('rational_pow_negative: (2/3)^-1 = 3/2', () {
      final r = Rational.fromInts(2, 3).pow(-1)!;
      expect(r.num, equals(BigInt.from(3)));
      expect(r.den, equals(BigInt.from(2)));
    });

    test('rational_pow_zero: (5/7)^0 = 1', () {
      final r = Rational.fromInts(5, 7).pow(0)!;
      expect(r, equals(Rational.one));
    });

    test('rational_oplus: 2 ⊕ 3 = 6/5', () {
      final a = Rational.fromInts(2);
      final b = Rational.fromInts(3);
      final r = a.oplus(b)!;
      expect(r.num, equals(BigInt.from(6)));
      expect(r.den, equals(BigInt.from(5)));
    });
  });

  group('Period detection', () {
    test('period_finite_half: 1/2 = 0.6 base 12 (finite)', () {
      final r = Rational.fromInts(1, 2);
      final res = r.toDozenalPeriodic();
      expect(res.intDigits, equals([DozenalDigit.d0]));
      expect(res.preDigits, equals([DozenalDigit.d6]));
      expect(res.period, isEmpty);
    });

    test('period_one_fifth: 1/5 = 0.[2497] base 12 (period 4)', () {
      final res = Rational.fromInts(1, 5).toDozenalPeriodic();
      expect(res.preDigits, isEmpty);
      expect(
        res.period,
        equals([
          DozenalDigit.d2,
          DozenalDigit.d4,
          DozenalDigit.d9,
          DozenalDigit.d7,
        ]),
      );
    });

    test('period_one_eleventh: 1/B = 0.[1] base 12 (period 1)', () {
      final res = Rational.fromInts(1, 11).toDozenalPeriodic();
      expect(res.preDigits, isEmpty);
      expect(res.period, equals([DozenalDigit.d1]));
    });

    test('period_integer: 7/1 — no fractional part', () {
      final res = Rational.fromInts(7, 1).toDozenalPeriodic();
      expect(res.intDigits, equals([DozenalDigit.d7]));
      expect(res.preDigits, isEmpty);
      expect(res.period, isEmpty);
    });

    test('period_one_seventh: 1/7 = 0.[186A35] base 12 (period 6)', () {
      final res = Rational.fromInts(1, 7).toDozenalPeriodic();
      expect(res.preDigits, isEmpty);
      expect(
        res.period,
        equals([
          DozenalDigit.d1,
          DozenalDigit.d8,
          DozenalDigit.d6,
          DozenalDigit.d10, // A
          DozenalDigit.d3,
          DozenalDigit.d5,
        ]),
      );
    });
  });

  // Exact-track extensions: mod / abs / reciprocal / factorial keep these
  // operations on the rational rail instead of collapsing to the f64 ≈ path.
  group('Rational mod / abs / reciprocal / factorial', () {
    test('mod matches Dart f64 % sign convention (divisor sign)', () {
      expect(Rational.fromInts(7).mod(Rational.fromInts(3)),
          Rational.fromInts(1));
      expect(Rational.fromInts(-7).mod(Rational.fromInts(3)),
          Rational.fromInts(2)); // euclidean
      expect(Rational.fromInts(7).mod(Rational.fromInts(-3)),
          Rational.fromInts(-2));
      expect(Rational.fromInts(-7).mod(Rational.fromInts(-3)),
          Rational.fromInts(-1));
    });

    test('mod of non-integers', () {
      // 7/2 mod 2 = 3/2
      expect(Rational.fromInts(7, 2).mod(Rational.fromInts(2)),
          Rational.fromInts(3, 2));
    });

    test('mod by zero returns null', () {
      expect(Rational.fromInts(5).mod(Rational.zero), isNull);
    });

    test('abs', () {
      expect(Rational.fromInts(-3, 4).abs(), Rational.fromInts(3, 4));
      expect(Rational.fromInts(3, 4).abs(), Rational.fromInts(3, 4));
      expect(Rational.zero.abs(), Rational.zero);
    });

    test('reciprocal, null on zero', () {
      expect(Rational.fromInts(3, 4).reciprocal(), Rational.fromInts(4, 3));
      expect(Rational.fromInts(-2).reciprocal(), Rational.fromInts(-1, 2));
      expect(Rational.zero.reciprocal(), isNull);
    });

    test('factorial of small non-negative integers', () {
      expect(Rational.fromInts(0).factorial(), Rational.fromInts(1));
      expect(Rational.fromInts(5).factorial(), Rational.fromInts(120));
      expect(Rational.fromInts(6).factorial(), Rational.fromInts(720));
    });

    test('factorial null for non-integer, negative, or over the cap', () {
      expect(Rational.fromInts(3, 2).factorial(), isNull); // non-integer
      expect(Rational.fromInts(-1).factorial(), isNull); // negative
      expect(Rational.fromInts(Rational.factorialCap + 1).factorial(), isNull);
    });
  });
}
