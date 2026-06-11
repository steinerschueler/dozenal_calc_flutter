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
}
