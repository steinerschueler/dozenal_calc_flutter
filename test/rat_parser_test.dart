// Port of eval_* tests from src/logic.rs::tests.

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/logic/rat_parser.dart';
import 'package:dozenal_calc_flutter/logic/rational.dart';

RatExpr r(int n, [int d = 1]) => RatNum(Rational.fromInts(n, d));

void main() {
  group('evalRational', () {
    test('eval_add: 1/2 + 1/3 = 5/6', () {
      final result = evalRational([r(1, 2), const RatAdd(), r(1, 3)])!;
      expect(result.num, equals(BigInt.from(5)));
      expect(result.den, equals(BigInt.from(6)));
    });

    test('eval_sub: 3/4 - 1/4 = 1/2', () {
      final result = evalRational([r(3, 4), const RatSub(), r(1, 4)])!;
      expect(result.num, equals(BigInt.one));
      expect(result.den, equals(BigInt.from(2)));
    });

    test('eval_mul_div_precedence: 1 + 2 * 3 = 7', () {
      final result =
          evalRational([r(1), const RatAdd(), r(2), const RatMul(), r(3)])!;
      expect(result, equals(Rational.fromInts(7)));
    });

    test('eval_pow: 2^10 = 1024', () {
      final result = evalRational([r(2), const RatPow(), r(10)])!;
      expect(result, equals(Rational.fromInts(1024)));
    });

    test('eval_pow_fraction_collapses: 4^(1/2) → null', () {
      final result = evalRational([
        r(4),
        const RatPow(),
        const RatLParen(),
        r(1),
        const RatDiv(),
        r(2),
        const RatRParen(),
      ]);
      expect(result, isNull);
    });

    test('eval_unary_minus: -5 + 3 = -2', () {
      final result =
          evalRational([const RatSub(), r(5), const RatAdd(), r(3)])!;
      expect(result, equals(Rational.fromInts(-2)));
    });

    test('eval_parens: (1 + 2) * 4 = 12', () {
      final result = evalRational([
        const RatLParen(),
        r(1),
        const RatAdd(),
        r(2),
        const RatRParen(),
        const RatMul(),
        r(4),
      ])!;
      expect(result, equals(Rational.fromInts(12)));
    });

    test('eval_oplus: 2 ⊕ 3 = 6/5', () {
      final result = evalRational([r(2), const RatOPlus(), r(3)])!;
      expect(result.num, equals(BigInt.from(6)));
      expect(result.den, equals(BigInt.from(5)));
    });

    test('eval_div_by_zero_collapses: 1/0 → null', () {
      expect(evalRational([r(1), const RatDiv(), r(0)]), isNull);
    });
  });
}
