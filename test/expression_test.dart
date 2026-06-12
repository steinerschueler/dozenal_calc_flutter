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

    // Regression: a custom operator (√/⊕/log/nCr/nPr) adjacent to a function
    // call used to fail. Function tokens render as an *unclosed* opener
    // (`sin(`, `fact(`, …) that auto-closes at the end of the stream, so the
    // operand-range walk grabbed only the bare `sin(` token and produced a
    // malformed substring → SYNTAX ERROR (or, when the function wrapped the
    // left side, a silently wrong result). The ranges now treat any `…(`
    // token as an opener and _joinBalanced supplies the missing close.
    test('unary sqrt of an unparenthesised function operand', () {
      // √ sin( 1   →   (sin(1)^(1/2))   (sin(1 rad) > 0 so the root is real)
      final out = resolved(['√', 'sin(', '1']);
      expect(out, equals('(sin(1)^(1/2))'));
      expect(
        (evalDouble(out) - math.sqrt(math.sin(1.0))).abs(),
        lessThan(1e-10),
      );
    });

    test('sqrt after a function opener is unary, not an nth-root', () {
      // sin √ 4   →   sin( (4^(1/2))   (√ unary because preceded by `sin(`)
      final out = resolved(['sin(', '√', '4']);
      expect(out, equals('sin( (4^(1/2))'));
    });

    test('oplus with an unparenthesised function right operand', () {
      // 5 ⊕ sin( 9   →   ((5*sin(9))/(5+sin(9)))
      final out = resolved(['5', '⊕', 'sin(', '9']);
      expect(out, equals('((5*sin(9))/(5+sin(9)))'));
      final v = evalDouble(out);
      final s = math.sin(9.0);
      expect((v - (5 * s) / (5 + s)).abs(), lessThan(1e-10));
    });

    test('nCr with a factorial (fact(…)) left operand', () {
      // fact( 5 ) nCr 2  — the postfix `5!` shape after resolvePostfix.
      // Left operand must include the whole fact(5) call, not just `(5)`.
      final out = resolved(['fact(', '5', ')', 'nCr', '2']);
      expect((evalDouble(out) - 7140.0).abs(), lessThan(1e-6)); // C(120,2)
    });
  });

  // --- resolvePostfix binding ---

  group('resolvePostfix', () {
    // Run the full postfix→meval pipeline on base-10 digit tokens.
    double pipe(List<CalcToken> tokens) {
      final ms = buildMevalString(
        withImplicitMuls(resolvePostfix(tokens)),
        base: 10,
      );
      final v = evalF64(ms, AngleMode.rad);
      expect(v, isNotNull, reason: 'pipeline returned null for: $ms');
      return v!;
    }

    Digit d(int v) => Digit(DozenalDigit.values[v]);

    // Regression: a postfix n!/|x|/1/x followed by a binary operator used to
    // fold the trailing term into the call. resolvePostfix wrapped the operand
    // as `[fact, (, operand, )]`, but `fact` *also* emits an opening paren, so
    // the explicit `)` closed the inner paren and `fact(`'s own paren floated
    // to the end of the string: `5! + 2` became `fact((5)+2)` = fact(7) = 5040.
    test('5! + 2 = 122 (factorial binds to its operand only)', () {
      expect(pipe([d(5), const Factorial(), const Add(), d(2)]), 122.0);
    });

    test('5! * 2 = 240, not fact(10)', () {
      expect(pipe([d(5), const Factorial(), const Mul(), d(2)]), 240.0);
    });

    test('3! + 4! = 30 (both factorials bounded)', () {
      expect(
        pipe([d(3), const Factorial(), const Add(), d(4), const Factorial()]),
        30.0,
      );
    });

    test('|−3| + 1 = 4 (abs bounded)', () {
      expect(
        pipe([
          const ParenOpen(), const Sub(), d(3), const ParenClose(),
          const AbsVal(), const Add(), d(1),
        ]),
        4.0,
      );
    });

    test('4 1/x + 1 = 1.25 (reciprocal bounded)', () {
      expect(pipe([d(4), const Reciprocal(), const Add(), d(1)]), 1.25);
    });

    // Previously-working shapes must keep working.
    test('5! = 120 and prefix fact 5 = 120', () {
      expect(pipe([d(5), const Factorial()]), 120.0);
      expect(pipe([const Factorial(), d(5)]), 120.0);
    });

    test('nested 3!! = 720 ((3!)! = 6!)', () {
      expect(pipe([d(3), const Factorial(), const Factorial()]), 720.0);
    });

    test('5 + 3! = 11 (postfix binds tighter than +)', () {
      expect(pipe([d(5), const Add(), d(3), const Factorial()]), 11.0);
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
    test('period_longer_than_display_is_capped (1/17dec, period 16₁₂)', () {
      // 1/17 (decimal) has a 16-digit base-12 period — longer than the cap.
      final r = formatRationalResult(Rational.fromInts(1, 17));
      expect(r.meta.start, isNotNull, reason: '1/17 must be periodic');
      expect(r.meta.len, equals(maxPeriodDisplay));
      expect(r.meta.capped, isTrue);
      // "0" + maxPeriodDisplay period digits; pre-period is empty for 1/17.
      final digitCount = r.buf.whereType<Digit>().length;
      expect(digitCount, equals(1 + maxPeriodDisplay));
    });

    test('period_within_cap_is_shown_in_full: 1/7 → period 6 (186A35)', () {
      // With the cap at 10, 1/7's six-digit period renders fully, uncapped.
      final r = formatRationalResult(Rational.fromInts(1, 7));
      expect(r.meta.start, isNotNull);
      expect(r.meta.len, equals(6));
      expect(r.meta.capped, isFalse);
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

  // --- formatF64Result precision budget ---

  group('formatF64Result precision budget (~kF64SigDigits significant)', () {
    int fracCount(List<CalcToken> buf) {
      final dot = buf.indexWhere((t) => t is Decimal);
      return dot < 0 ? 0 : buf.length - dot - 1;
    }

    test('value below 1 gets the full fractional budget', () {
      final r = formatF64Result(math.sin(36 * math.pi / 180)); // 0.5877…
      expect(fracCount(r), kF64SigDigits);
    });

    test('one integer digit → kF64SigDigits − 1 fractional (π = 3.…)', () {
      final r = formatF64Result(math.pi);
      expect(fracCount(r), kF64SigDigits - 1);
      expect(r.first, Digit(DozenalDigit.d3));
    });

    test('large integer part leaves fewer fractional places (~12 sig total)',
        () {
      // π·12⁵ ≈ 318480.95₁₂ → six integer dozenal digits.
      final r = formatF64Result(math.pi * 248832);
      final dot = r.indexWhere((t) => t is Decimal);
      expect(dot, 6, reason: 'six integer digits before the point');
      expect(fracCount(r), kF64SigDigits - 6);
    });

    test('shown digits track the true value (π = 3.184809493B9…)', () {
      final r = formatF64Result(math.pi);
      final s = r
          .whereType<Digit>()
          .map((d) => d.value.value)
          .map((v) => v < 10 ? '$v' : (v == 10 ? 'A' : 'B'))
          .join();
      expect(s, '3184809493B9'); // 3 + first 11 fractional digits of π₁₂
    });

    test('a clean value stops early (no zero padding): 0.5 → 0.6₁₂', () {
      final r = formatF64Result(0.5);
      expect(fracCount(r), 1);
    });

    String ascii(List<CalcToken> buf) => buf.map((t) {
          if (t is Digit) {
            final v = t.value.value;
            return v < 10 ? '$v' : (v == 10 ? 'A' : 'B');
          }
          if (t is Decimal) return '.';
          if (t is Negate) return '-';
          return '';
        }).join();

    test('near-integer f64 noise snaps onto the integer (tan 45° → 1)', () {
      // tan(45°) lands at 0.9999999999999999; without the snap this rendered as
      // 0.BBBBBBBBBBBB (or a clamped overflow digit), not the clean 1.
      expect(ascii(formatF64Result(0.9999999999999999)), '1');
      expect(ascii(formatF64Result(1.0000000000000002)), '1');
    });

    test('tiny negative snaps to a plain "0" (no "-0"): tan 180°', () {
      // tan(180°) ≈ −1.2e−16 — the signed snap must collapse it to "0".
      expect(ascii(formatF64Result(-1.2246467991473532e-16)), '0');
    });

    test('a value half a unit off does NOT snap (sin 30° stays 0.6₁₂)', () {
      // 0.5 is 0.5 away from the nearest integer — well past fracEpsilon.
      expect(ascii(formatF64Result(0.49999999999999994)), '0.6');
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
}
