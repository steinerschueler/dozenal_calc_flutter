// Port of src/eval.rs::tests.
// The `eval()` helper that uses meval directly is replaced by evalF64 in
// the Dart implementation; identical observable behaviour for the test
// surface (acot Convention A, cot, sqrt, unary minus, custom ops).

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/expression.dart';
import 'package:dozenal_calc_flutter/logic/rat_parser.dart';
import 'package:dozenal_calc_flutter/logic/rational.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

import 'dart:math' as math;

double evalDouble(String expr) {
  final v = evalF64(expr, AngleMode.rad);
  expect(v, isNotNull, reason: 'evalF64 returned null for: $expr');
  return v!;
}

String resolved(List<String> v) {
  final t = List.of(v);
  resolveCustomOperators(t);
  return t.join(' ');
}

void main() {
  // --- Direct evaluator tests (formerly meval pipeline) ---

  group('f64 evaluator', () {
    test('acot_convention_a: range (0, π), π/2 − atan(x)', () {
      const pi = math.pi;
      expect((evalDouble('acot(1)') - pi / 4.0).abs(), lessThan(1e-10));
      expect((evalDouble('acot(-1)') - 3.0 * pi / 4.0).abs(), lessThan(1e-10));
      expect((evalDouble('acot(0)') - pi / 2.0).abs(), lessThan(1e-10));
    });

    test('cot_basic', () {
      // cot(π/4) = 1
      expect((evalDouble('cot(pi/4)') - 1.0).abs(), lessThan(1e-10));
      // 6 / cot(π/4) = 6
      expect((evalDouble('6/cot(pi/4)') - 6.0).abs(), lessThan(1e-10));
    });

    test('sqrt_mid_expression: square and n-th root via ^(1/n)', () {
      expect((evalDouble('(16^(1/2))') - 4.0).abs(), lessThan(1e-10));
      expect(
        (evalDouble('(8^(1/9))') - math.pow(8.0, 1.0 / 9.0)).abs(),
        lessThan(1e-10),
      );
    });

    test('unary_minus', () {
      expect((evalDouble('-5+3') - (-2.0)).abs(), lessThan(1e-10));
      expect((evalDouble('5*-3') - (-15.0)).abs(), lessThan(1e-10));
      expect((evalDouble('5-3') - 2.0).abs(), lessThan(1e-10));
    });

    test('hyperbolic_origin_values: sinh(0)=0, cosh(0)=1, tanh(0)=0', () {
      expect(evalDouble('sinh(0)').abs(), lessThan(1e-12));
      expect((evalDouble('cosh(0)') - 1.0).abs(), lessThan(1e-12));
      expect(evalDouble('tanh(0)').abs(), lessThan(1e-12));
    });

    test('coth_one: coth(1) = cosh(1)/sinh(1)', () {
      final expected =
          ((math.e + 1 / math.e) / 2) / ((math.e - 1 / math.e) / 2);
      expect((evalDouble('coth(1)') - expected).abs(), lessThan(1e-10));
    });

    test('hyperbolic_inverse_roundtrip: arX(X(v)) = v', () {
      expect((evalDouble('arsinh(sinh(1))') - 1.0).abs(), lessThan(1e-10));
      expect((evalDouble('arcosh(cosh(1))') - 1.0).abs(), lessThan(1e-10));
      expect((evalDouble('artanh(tanh(0.5))') - 0.5).abs(), lessThan(1e-10));
      expect((evalDouble('arcoth(coth(2))') - 2.0).abs(), lessThan(1e-10));
    });

    test('hyperbolic_inverse_domain_violations_yield_nan_or_inf', () {
      // arcosh defined for x >= 1: arcosh(0) → NaN.
      expect(evalDouble('arcosh(0)').isNaN, isTrue);
      // artanh defined for |x| < 1: artanh(1) → +Infinity.
      expect(evalDouble('artanh(1)').isInfinite, isTrue);
      // arcoth defined for |x| > 1: arcoth(0.5) → NaN (log of negative).
      expect(evalDouble('arcoth(0.5)').isNaN, isTrue);
    });

    test('angle_mode_consistency: sin equals 1 at 90°, π/2 rad, 100 grad', () {
      final degSin = evalF64('sin(90)', AngleMode.deg)!;
      final radSin = evalF64('sin(pi/2)', AngleMode.rad)!;
      final gradSin = evalF64('sin(100)', AngleMode.grad)!;
      expect((degSin - 1.0).abs(), lessThan(1e-10));
      expect((radSin - 1.0).abs(), lessThan(1e-10));
      expect((gradSin - 1.0).abs(), lessThan(1e-10));
    });

    test('angle_mode_inverse: asin(1) returns 90°, π/2, 100 grad', () {
      expect((evalF64('asin(1)', AngleMode.deg)! - 90.0).abs(),
          lessThan(1e-10));
      expect((evalF64('asin(1)', AngleMode.rad)! - math.pi / 2.0).abs(),
          lessThan(1e-10));
      expect((evalF64('asin(1)', AngleMode.grad)! - 100.0).abs(),
          lessThan(1e-10));
    });

    test('factorial_basic_and_negative: 5! = 120, 0! = 1, (-1)! = NaN', () {
      expect((evalDouble('fact(5)') - 120.0).abs(), lessThan(1e-10));
      expect((evalDouble('fact(0)') - 1.0).abs(), lessThan(1e-10));
      expect(evalDouble('fact(-1)').isNaN, isTrue);
    });

    test('abs_recip_basic: |-3|=3, recip(4)=0.25', () {
      expect((evalDouble('abs(-3)') - 3.0).abs(), lessThan(1e-10));
      expect((evalDouble('abs(3)') - 3.0).abs(), lessThan(1e-10));
      expect((evalDouble('recip(4)') - 0.25).abs(), lessThan(1e-10));
    });

    test('mod_basic_and_div_by_zero: 10 mod 3 = 1, 10 mod 0 → NaN/Inf', () {
      expect((evalDouble('10 % 3') - 1.0).abs(), lessThan(1e-10));
      // Dart: (10 % 0) returns NaN for doubles.
      final modZero = evalF64('10 % 0', AngleMode.rad)!;
      expect(modZero.isNaN || modZero.isInfinite, isTrue);
    });

    // Regression: B6 — tanh used to return NaN for |x| > ~709 because
    // exp(x) overflows to ∞, yielding (∞-0)/(∞+0) = NaN. Should saturate.
    test('tanh_saturates_for_large_magnitudes', () {
      expect((evalDouble('tanh(1000)') - 1.0).abs(), lessThan(1e-9));
      expect((evalDouble('tanh(-1000)') - (-1.0)).abs(), lessThan(1e-9));
      // Continuity check: tanh(20) is already essentially 1.
      expect((evalDouble('tanh(20)') - 1.0).abs(), lessThan(1e-9));
    });

    // Regression: B7 — arsinh used to lose precision for negative x because
    // x + sqrt(x²+1) catastrophically cancels. Symmetric formula fixes it.
    test('arsinh_negative_x_does_not_underflow', () {
      // arsinh(-1000) ≈ -ln(2 * 1000) ≈ -7.6009
      expect((evalDouble('arsinh(-1000)') - (-7.6009024595420813)).abs(),
          lessThan(1e-6));
      // arsinh(-1) = -ln(1 + sqrt(2))
      expect((evalDouble('arsinh(-1)') - (-math.log(1 + math.sqrt(2)))).abs(),
          lessThan(1e-10));
      // Symmetry: arsinh(-x) = -arsinh(x)
      expect(
        (evalDouble('arsinh(-3)') + evalDouble('arsinh(3)')).abs(),
        lessThan(1e-10),
      );
    });

    // Regression: B2 — fact(NaN) / fact(±∞) used to throw UnsupportedError
    // from x.round(), bubbling out of evalF64 uncaught.
    test('factorial_of_nan_or_infinity_returns_nan_cleanly', () {
      // asin(2) = NaN; fact(NaN) must not crash.
      expect(evalDouble('fact(asin(2))').isNaN, isTrue);
      // Direct large argument that pushes round() through Infinity territory.
      expect(evalDouble('fact(1/0)').isNaN, isTrue);
    });
  });

  // --- resolveCustomOperators ---

  group('resolveCustomOperators', () {
    test('oplus_with_paren_right_operand', () {
      final out = resolved(['5', '⊕', '(', '3', '+', '2', ')']);
      expect(out, equals('((5*(3+2))/(5+(3+2)))'));
      expect(
        (evalDouble(out) - (5.0 * 5.0) / (5.0 + 5.0)).abs(),
        lessThan(1e-10),
      );
    });

    test('oplus_with_paren_left_operand', () {
      final out = resolved(['(', '2', '+', '3', ')', '⊕', '5']);
      expect(out, equals('(((2+3)*5)/((2+3)+5))'));
      expect((evalDouble(out) - 25.0 / 10.0).abs(), lessThan(1e-10));
    });

    test('sqrt_with_paren_arg', () {
      final out = resolved(['√', '(', '1', '+', '1', ')']);
      expect(out, equals('((1+1)^(1/2))'));
      expect((evalDouble(out) - math.sqrt(2.0)).abs(), lessThan(1e-10));
    });

    test('log_with_paren_base: log_4(64) = 3', () {
      final out = resolved(['64', 'log', '(', '2', '+', '2', ')']);
      expect(out, equals('(ln(64)/ln((2+2)))'));
      expect((evalDouble(out) - 3.0).abs(), lessThan(1e-10));
    });

    test('nth_root_with_paren_arg: 3√27 = 3', () {
      final out = resolved(['3', '√', '(', '27', ')']);
      expect(out, equals('((27)^(1/3))'));
      expect((evalDouble(out) - 3.0).abs(), lessThan(1e-10));
    });

    // Regression: B1 — √ after ^ used to mis-parse as binary nth-root with
    // ^ as left operand, producing a malformed (3^(1/^)) substring.
    test('sqrt_after_caret_is_unary: 2^√3 = 2^sqrt(3)', () {
      final out = resolved(['2', '^', '√', '3']);
      expect(out, equals('2 ^ (3^(1/2))'));
      expect(
        (evalDouble(out) - math.pow(2.0, math.sqrt(3.0))).abs(),
        lessThan(1e-10),
      );
    });

    test('sqrt_after_percent_is_unary', () {
      final out = resolved(['10', '%', '√', '4']);
      expect(out, equals('10 % (4^(1/2))'));
    });
  });

  // --- buildRatExpr / rational evaluation ---

  group('buildRatExpr + evalRational', () {
    test('rational_oplus_with_paren: 5⊕(3+2) = 5/2', () {
      final tokens = <CalcToken>[
        Digit(DozenalDigit.d5),
        const OplusBotLeft(),
        const ParenOpen(),
        Digit(DozenalDigit.d3),
        const Add(),
        Digit(DozenalDigit.d2),
        const ParenClose(),
      ];
      final exprs = buildRatExpr(tokens);
      expect(exprs, isNotNull, reason: 'rat track should not collapse');
      final result = evalRational(exprs!);
      expect(result, equals(Rational.fromInts(5, 2)));
    });

    test('ratlit_token_evaluates_to_embedded_value: Ans + Ans = 10/7', () {
      final prevAns = Rational.fromInts(5, 7);
      final tokens = <CalcToken>[
        RatLit(prevAns),
        const Add(),
        RatLit(prevAns),
      ];
      final exprs = buildRatExpr(tokens);
      expect(exprs, isNotNull);
      final result = evalRational(exprs!);
      expect(result, equals(Rational.fromInts(10, 7)));
    });
  });

  // --- formatRationalResult ---

  group('formatRationalResult', () {
    test('period_longer_than_display_is_capped: 1/7 → period 6 capped to 5',
        () {
      final r = formatRationalResult(Rational.fromInts(1, 7));
      expect(r.meta.start, isNotNull, reason: '1/7 must be periodic');
      expect(r.meta.len, equals(maxPeriodDisplay));
      expect(r.meta.capped, isTrue);
      // "0" + 5 period digits = 6 Digit tokens; pre-period is empty for 1/7
      final digitCount = r.buf.whereType<Digit>().length;
      expect(digitCount, equals(1 + maxPeriodDisplay));
    });

    test('period_shorter_than_display_is_not_capped: 1/5 → period 4 (2497)',
        () {
      final r = formatRationalResult(Rational.fromInts(1, 5));
      expect(r.meta.start, isNotNull);
      expect(r.meta.len, equals(4));
      expect(r.meta.capped, isFalse);
    });

    test('negative_rational_renders_negate_token: -1/2 → leading Negate', () {
      final r = formatRationalResult(Rational.fromInts(-1, 2));
      expect(r.buf.first, isA<Negate>());
    });
  });

  // --- withImplicitMuls ---

  group('withImplicitMuls', () {
    test('implicit_mul_constant_constant: π π → π * π', () {
      final out = withImplicitMuls(const [ConstPi(), ConstPi()]);
      expect(out.length, equals(3));
      expect(out[0], isA<ConstPi>());
      expect(out[1], isA<Mul>());
      expect(out[2], isA<ConstPi>());
    });

    test('implicit_mul_digit_paren: 2 ( → 2 * (', () {
      final out = withImplicitMuls(<CalcToken>[
        Digit(DozenalDigit.d2),
        const ParenOpen(),
      ]);
      expect(out.length, equals(3));
      expect(out[0], isA<Digit>());
      expect(out[1], isA<Mul>());
      expect(out[2], isA<ParenOpen>());
    });

    test('implicit_mul_close_open_paren: ) ( → ) * (', () {
      final out = withImplicitMuls(const [ParenClose(), ParenOpen()]);
      expect(out.length, equals(3));
      expect(out[1], isA<Mul>());
    });

    test('implicit_mul_digit_function: 2 sin → 2 * sin', () {
      final out = withImplicitMuls(<CalcToken>[
        Digit(DozenalDigit.d2),
        const Sin(),
      ]);
      expect(out.length, equals(3));
      expect(out[1], isA<Mul>());
    });

    test('no_implicit_mul_within_number: 1 2 stays "12"', () {
      final out = withImplicitMuls(<CalcToken>[
        Digit(DozenalDigit.d1),
        Digit(DozenalDigit.d2),
      ]);
      expect(out.length, equals(2),
          reason: 'no Mul should be inserted within a number');
    });
  });

  group('formatDecimalResult', () {
    test('integers are shown without trailing zeros or dot', () {
      expect(formatDecimalResult(3.0), equals('3'));
      expect(formatDecimalResult(-7.0), equals('-7'));
      expect(formatDecimalResult(0.0), equals('0'));
    });

    test('finite fractions trim trailing zeros', () {
      expect(formatDecimalResult(0.5), equals('0.5'));
      expect(formatDecimalResult(0.25), equals('0.25'));
    });

    test('NaN and Infinity surface as glyphs', () {
      expect(formatDecimalResult(double.nan), equals('NaN'));
      expect(formatDecimalResult(double.infinity), equals('∞'));
      expect(formatDecimalResult(double.negativeInfinity), equals('∞'));
    });
  });
}
