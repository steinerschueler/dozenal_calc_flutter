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
