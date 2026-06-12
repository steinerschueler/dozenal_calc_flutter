// Tests for the function-key block (#2-#4): memory accumulator (M+/M−),
// x² and ± modifiers, ln / eˣ / log₁₂, nCr / nPr, and scientific notation.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/expression.dart';
import 'package:dozenal_calc_flutter/state.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

import 'dart:math' as math;

double evalDouble(String expr) {
  final v = evalF64(expr, AngleMode.rad);
  expect(v, isNotNull, reason: 'evalF64 returned null for: $expr');
  return v!;
}

Digit d(int v) => Digit(DozenalDigit.values[v]);

void main() {
  group('f64 evaluator — new functions', () {
    test('exp(1) ≈ e, exp(0) = 1', () {
      expect((evalDouble('exp(1)') - math.e).abs(), lessThan(1e-12));
      expect(evalDouble('exp(0)'), 1.0);
    });
    test('log12(12) = 1, log12(144) = 2, log12(1) = 0', () {
      expect((evalDouble('log12(12)') - 1.0).abs(), lessThan(1e-12));
      expect((evalDouble('log12(144)') - 2.0).abs(), lessThan(1e-12));
      expect(evalDouble('log12(1)'), 0.0);
    });
  });

  group('resolveCustomOperators — nCr / nPr', () {
    test('rewrites to factorial form and evaluates correctly', () {
      final c = ['5', 'nCr', '2'];
      resolveCustomOperators(c);
      expect((evalDouble(c.join()) - 10.0).abs(), lessThan(1e-9)); // 5C2 = 10
      final p = ['5', 'nPr', '2'];
      resolveCustomOperators(p);
      expect((evalDouble(p.join()) - 20.0).abs(), lessThan(1e-9)); // 5P2 = 20
    });
  });

  group('state — memory accumulator', () {
    test('M+ / M− accumulate exactly; Rcl recalls', () {
      final s = DozenalCalcState();
      s
        ..handleClick(d(5))
        ..handleClick(const Equals())
        ..handleClick(const MemPlus()) // mem = 5
        ..handleClick(d(7))
        ..handleClick(const Equals())
        ..handleClick(const MemPlus()) // mem = 12 (decimal)
        ..handleClick(d(3))
        ..handleClick(const Equals())
        ..handleClick(const MemMinus()); // mem = 9
      expect(s.memory, isNotEmpty); // M indicator lights
      s
        ..handleClick(const Ac())
        ..handleClick(const Rcl())
        ..handleClick(const Equals());
      expect(s.resultText, '9'); // 9 decimal = 9 dozenal
    });
  });

  group('state — x² and ±', () {
    test('x² squares the preceding value (5² = 21 dozenal)', () {
      final s = DozenalCalcState();
      s
        ..handleClick(d(5))
        ..handleClick(const Square())
        ..handleClick(const Equals());
      expect(s.resultText, '21'); // 25 decimal = 21 dozenal
    });
    test('± toggles the sign of the current literal', () {
      final s = DozenalCalcState();
      s
        ..handleClick(d(5))
        ..handleClick(const PlusMinus())
        ..handleClick(const Equals());
      expect(s.resultText, '-5');
      // Pressing ± again removes the unary minus.
      final s2 = DozenalCalcState();
      s2
        ..handleClick(d(5))
        ..handleClick(const PlusMinus())
        ..handleClick(const PlusMinus())
        ..handleClick(const Equals());
      expect(s2.resultText, '5');
    });
  });

  group('state — log₁₂, nCr, scientific notation', () {
    test('log₁₂(10₁₂ = twelve) = 1', () {
      final s = DozenalCalcState();
      s
        ..handleClick(const Log12())
        ..handleClick(d(1))
        ..handleClick(d(0)) // "10" dozenal = twelve
        ..handleClick(const Equals());
      expect(s.resultText, '1');
    });
    test('5 nCr 2 = A (ten) dozenal', () {
      final s = DozenalCalcState();
      s
        ..handleClick(d(5))
        ..handleClick(const NCr())
        ..handleClick(d(2))
        ..handleClick(const Equals());
      expect(s.resultText, 'A'); // 10 decimal = A dozenal
    });
    test('5 EXP 2 in dozenal = 5·12² = 500 dozenal', () {
      final s = DozenalCalcState();
      s
        ..handleClick(d(5))
        ..handleClick(const Sci())
        ..handleClick(d(2))
        ..handleClick(const Equals());
      expect(s.resultText, '500'); // 720 decimal = 500 dozenal
    });
  });

  // Regression: postfix n!/|x|/1/x must bind to their operand only — a
  // trailing operator used to be swallowed by the function's auto-paren
  // (`5! + 2` → fact(5+2) = 5040). See resolvePostfix in expression.dart.
  group('state — postfix binding (n!, |x|, 1/x)', () {
    test('5! + 2 = A2 dozenal (122 dec), not 5040', () {
      final s = DozenalCalcState()
        ..handleClick(d(5))
        ..handleClick(const Factorial())
        ..handleClick(const Add())
        ..handleClick(d(2))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastResultF64, 122.0);
      expect(s.resultText, 'A2');
    });

    test('3! + 4! = 26 dozenal (30 dec)', () {
      final s = DozenalCalcState()
        ..handleClick(d(3))
        ..handleClick(const Factorial())
        ..handleClick(const Add())
        ..handleClick(d(4))
        ..handleClick(const Factorial())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastResultF64, 30.0);
    });

    test('(−3)|x| + 1 = 4 (abs bounded)', () {
      final s = DozenalCalcState()
        ..handleClick(const ParenOpen())
        ..handleClick(const Sub())
        ..handleClick(d(3))
        ..handleClick(const ParenClose())
        ..handleClick(const AbsVal())
        ..handleClick(const Add())
        ..handleClick(d(1))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastResultF64, 4.0);
    });

    test('4 1/x + 1 = 1.25 (reciprocal bounded)', () {
      final s = DozenalCalcState()
        ..handleClick(d(4))
        ..handleClick(const Reciprocal())
        ..handleClick(const Add())
        ..handleClick(d(1))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastResultF64, 1.25);
    });
  });

  // Regression: custom operators (√, ⊕, log, nCr, nPr) with an
  // unparenthesised function-call operand. See resolveCustomOperators.
  group('state — custom ops with function operands', () {
    test('5! nCr 2 = 4170 dozenal (7140 dec = C(120,2))', () {
      final s = DozenalCalcState()
        ..handleClick(d(5))
        ..handleClick(const Factorial())
        ..handleClick(const NCr())
        ..handleClick(d(2))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastResultF64, 7140.0);
      expect(s.resultText, '4170');
    });

    test('√sin30 (deg) evaluates instead of erroring', () {
      final s = DozenalCalcState()
        ..handleClick(const RootTopLeft())
        ..handleClick(const Sin())
        ..handleClick(d(3))
        ..handleClick(d(0)) // "30" dozenal = 36 decimal degrees
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      // sqrt(sin(36°))
      expect((s.lastResultF64 - math.sqrt(math.sin(36 * math.pi / 180))).abs(),
          lessThan(1e-9));
    });

    test('√4! evaluates to sqrt(24)', () {
      final s = DozenalCalcState()
        ..handleClick(const RootTopLeft())
        ..handleClick(d(4))
        ..handleClick(const Factorial())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect((s.lastResultF64 - math.sqrt(24)).abs(), lessThan(1e-9));
    });
  });

  // Exactly-rational operations stay on the exact rail (no "≈"): Sci, Mod,
  // n!, 1÷x, |x|. Irrational ones (√, log, sin) still fall back to f64.
  group('state — exact (no ≈) for rational operations', () {
    DozenalCalcState run(List<CalcToken> tokens) {
      final s = DozenalCalcState();
      for (final t in tokens) {
        s.handleClick(t);
      }
      s.handleClick(const Equals());
      return s;
    }

    test('Sci is exact: 5 EXP 2 = 500 dozenal (720 dec)', () {
      final s = run([d(5), const Sci(), d(2)]);
      expect(s.isF64Fallback, isFalse);
      expect(s.lastAns, isNotNull);
      expect(s.resultText, '500');
    });

    test('Sci with negative exponent is exact: 2 EXP -3 = 0.002 dozenal', () {
      final s = run([d(2), const Sci(), const Sub(), d(3)]);
      expect(s.isF64Fallback, isFalse);
      expect(s.resultText, '0.002');
    });

    test('Mod is exact: 7 mod 3 = 1', () {
      final s = run([d(7), const Mod(), d(3)]);
      expect(s.isF64Fallback, isFalse);
      expect(s.resultText, '1');
    });

    test('factorial is exact: 5! = A0 dozenal (120 dec)', () {
      final s = run([d(5), const Factorial()]);
      expect(s.isF64Fallback, isFalse);
      expect(s.resultText, 'A0');
    });

    test('reciprocal is exact: 4 1/x = 0.3 dozenal (¼), period kept for 1/7', () {
      final quarter = run([d(4), const Reciprocal()]);
      expect(quarter.isF64Fallback, isFalse);
      expect(quarter.resultText, '0.3'); // ¼ = 0.3 dozenal

      final seventh = run([d(7), const Reciprocal()]);
      expect(seventh.isF64Fallback, isFalse);
      expect(seventh.resultPeriodStart, isNotNull); // 1/7 periodic, exact
    });

    test('abs is exact: (−5)|x| = 5', () {
      final s = run([
        const ParenOpen(), const Sub(), d(5), const ParenClose(),
        const AbsVal(),
      ]);
      expect(s.isF64Fallback, isFalse);
      expect(s.resultText, '5');
    });

    test('mixed exact: 5! mod 7 = 1', () {
      final s = run([d(5), const Factorial(), const Mod(), d(7)]);
      expect(s.isF64Fallback, isFalse);
      expect(s.resultText, '1');
    });

    test('irrational stays ≈: √4, sin0, 8 log 2', () {
      expect(run([const RootTopLeft(), d(4)]).isF64Fallback, isTrue);
      expect(run([const Sin(), d(0)]).isF64Fallback, isTrue);
      expect(run([d(8), const LogBotRight(), d(2)]).isF64Fallback, isTrue);
    });
  });
}
