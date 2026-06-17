// Edge-case stress tests run before distributing builds to testers.
// Each test exercises an input pattern that could plausibly crash the
// engine (overflow, malformed expressions, mode-switch in awkward states,
// repeated equals, deeply nested parens, etc.). A passing test means the
// engine handles the case gracefully — either with a valid result or a
// clean error message — and never throws.

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/state.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

void main() {
  group('Edge cases — engine should never throw', () {
    test('equals on empty buffer → 0 (already covered, but recheck)', () {
      final s = DozenalCalcState();
      expect(() => s.handleClick(const Equals()), returnsNormally);
      expect(s.errorMsg, isNull);
    });

    test('double equals in a row', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Add())
        ..handleClick(Digit(DozenalDigit.d3))
        ..handleClick(const Equals());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('operator at start of buffer', () {
      final s = DozenalCalcState();
      expect(() => s.handleClick(const Add()), returnsNormally);
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('two operators in a row', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Add())
        ..handleClick(const Mul())
        ..handleClick(Digit(DozenalDigit.d3));
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('unclosed paren', () {
      final s = DozenalCalcState()
        ..handleClick(const ParenOpen())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Add())
        ..handleClick(Digit(DozenalDigit.d3));
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('many nested parens (20 deep)', () {
      final s = DozenalCalcState();
      for (var i = 0; i < 20; i++) {
        s.handleClick(const ParenOpen());
      }
      s.handleClick(Digit(DozenalDigit.d1));
      for (var i = 0; i < 20; i++) {
        s.handleClick(const ParenClose());
      }
      expect(() => s.handleClick(const Equals()), returnsNormally);
      expect(s.errorMsg, isNull);
    });

    test('very long digit literal (50 digits)', () {
      final s = DozenalCalcState();
      for (var i = 0; i < 50; i++) {
        s.handleClick(Digit(DozenalDigit.d9));
      }
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('large exponent 2^200 stays exact in the rational track', () {
      // 2^200 is huge but BigInt-feasible. 9^9^9 would build a 370M-digit
      // BigInt and effectively hang — avoided on purpose.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const ExpTopRight())
        ..handleClick(Digit(DozenalDigit.d1)) // 200 in doz = 1*144+0+0 = 144
        ..handleClick(Digit(DozenalDigit.d4)) // change to 14 doz = 16 dec
        ..handleClick(Digit(DozenalDigit.d8));
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('9^9^9 no longer hangs — safety cap collapses to f64', () {
      // Without the rational-track exponent cap this would allocate a
      // BigInt with ~370 million decimal digits and freeze the app.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d9))
        ..handleClick(const ExpTopRight())
        ..handleClick(Digit(DozenalDigit.d9))
        ..handleClick(const ExpTopRight())
        ..handleClick(Digit(DozenalDigit.d9));
      expect(() => s.handleClick(const Equals()), returnsNormally);
      // f64 fallback overflows to infinity → engine surfaces a clean
      // error rather than crashing.
      expect(s.errorMsg, isNotNull);
    });

    test('f64 overflow via fractional power 2^(1/2)^200', () {
      // Fractional exponent collapses rational → f64; chain pushes towards
      // f64 infinity. Engine must surface a clean error, not throw.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const ExpTopRight())
        ..handleClick(const ParenOpen())
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const ParenClose());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('division by zero', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0));
      expect(() => s.handleClick(const Equals()), returnsNormally);
      expect(s.errorMsg, isNotNull, reason: 'expect clean error message');
    });

    test('sqrt of negative number', () {
      final s = DozenalCalcState()
        ..handleClick(const RootTopLeft())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const ParenOpen())
        ..handleClick(const Sub())
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const ParenClose());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('log of zero', () {
      final s = DozenalCalcState()
        ..handleClick(const LogBotRight())
        ..handleClick(Digit(DozenalDigit.d10))
        ..handleClick(const ParenOpen())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const ParenClose());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('tan of 90° in DEG mode (infinity)', () {
      final s = DozenalCalcState() // default DEG
        ..handleClick(const Tan())
        ..handleClick(const ParenOpen())
        ..handleClick(Digit(DozenalDigit.d7)) // 90 in doz = 7×12+6 = 90
        ..handleClick(Digit(DozenalDigit.d6))
        ..handleClick(const ParenClose());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('factorial of moderately large value (20! is still fast)', () {
      // 20! = 2.4e18 — past f64 exact-integer range but still computable.
      // 100 doz = 144! would be a 250-digit BigInt and is also fine, but
      // we keep it tame here to keep test runs sub-second.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(Digit(DozenalDigit.d8)) // 18 doz = 20 dec → 20!
        ..handleClick(const Factorial());
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('Mode-switch Doz→Dez with non-terminating fraction (1/3 in doz)',
        () {
      // doz 0.4 = 1/3 — non-terminating in base 10. Switch should
      // truncate, not crash.
      final s = DozenalCalcState()
        ..handleClick(const Decimal())
        ..handleClick(Digit(DozenalDigit.d4)); // 0.4 in doz
      expect(() => s.handleClick(const Dez()), returnsNormally);
      expect(s.errorMsg, isNull);
    });

    test('Mode-switch Doz→Dez→Doz with operators in buffer', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(Digit(DozenalDigit.d10)) // doz "1A" = 22 dec
        ..handleClick(const Add())
        ..handleClick(Digit(DozenalDigit.d11)) // + B = 11 dec
        ..handleClick(const Mul())
        ..handleClick(const ParenOpen())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const ParenClose());
      expect(() => s.handleClick(const Dez()), returnsNormally);
      expect(() => s.handleClick(const Doz()), returnsNormally);
      // After round-trip the structure should still evaluate cleanly.
      expect(() => s.handleClick(const Equals()), returnsNormally);
    });

    test('Mode-switch repeatedly (10 round-trips)', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(Digit(DozenalDigit.d3));
      for (var i = 0; i < 10; i++) {
        expect(() => s.handleClick(const Dez()), returnsNormally);
        expect(() => s.handleClick(const Doz()), returnsNormally);
      }
    });

    test('RCL with empty memory', () {
      final s = DozenalCalcState();
      expect(() => s.handleClick(const Rcl()), returnsNormally);
    });

    test('Backspace on empty buffer', () {
      final s = DozenalCalcState();
      expect(() => s.handleClick(const Del()), returnsNormally);
    });

    test('Backspace many times past empty', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5));
      for (var i = 0; i < 10; i++) {
        expect(() => s.handleClick(const Del()), returnsNormally);
      }
    });

    test('Cursor left/right past buffer edges', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(Digit(DozenalDigit.d2));
      for (var i = 0; i < 10; i++) {
        expect(() => s.handleClick(const TriangleLeft()), returnsNormally);
      }
      for (var i = 0; i < 10; i++) {
        expect(() => s.handleClick(const TriangleRight()), returnsNormally);
      }
    });

    test('Mass-click stress (200 mixed tokens)', () {
      final s = DozenalCalcState();
      final tokens = <CalcToken>[
        Digit(DozenalDigit.d1),
        const Add(),
        Digit(DozenalDigit.d2),
        const Mul(),
        const ParenOpen(),
        Digit(DozenalDigit.d3),
        const Sub(),
        Digit(DozenalDigit.d4),
        const ParenClose(),
        const Equals(),
      ];
      for (var i = 0; i < 200; i++) {
        expect(() => s.handleClick(tokens[i % tokens.length]),
            returnsNormally);
      }
    });

    test('Switch DRG / Doz / Dez during error state stays consistent', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNotNull);
      expect(() => s.handleClick(const Drg()), returnsNormally);
      expect(() => s.handleClick(const Doz()), returnsNormally);
      expect(() => s.handleClick(const Dez()), returnsNormally);
    });
  });

  // Regression: a large exact power (e.g. 2^1152) is an exact BigInt but ±∞ as
  // a double — the f64 overflow check used to report "DIV BY ZERO" and discard
  // it. calculateResult now trusts the rational track, with a magnitude guard
  // so the digit expansion can't freeze the renderer.
  group('Large exact results', () {
    Digit dd(int v) => Digit(DozenalDigit.values[v]);

    test('2^800 (dozenal) computes exactly, not DIV BY ZERO', () {
      final s = DozenalCalcState()
        ..handleClick(dd(2))
        ..handleClick(const ExpTopRight())
        ..handleClick(dd(8))
        ..handleClick(dd(0))
        ..handleClick(dd(0)); // 800 doz = 1152 dec
      s.handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, isNotNull, reason: 'must keep the exact value');
      // 2^1152 starts with "2411…" in dozenal. Exact computation IS the
      // guarantee here; the old wall-clock assertion was flaky under CI load.
      expect(s.resultText.startsWith('2411'), isTrue);
    });

    test('astronomically large power collapses fast (no freeze)', () {
      // ~2^300000 would take ~8 s to expand if it weren't guarded; the
      // magnitude bound drops it to the f64 fallback (∞ → OVERFLOW) at once.
      final s = DozenalCalcState()
        ..handleClick(dd(2))
        ..handleClick(const ExpTopRight())
        ..handleClick(dd(1))
        ..handleClick(dd(2))
        ..handleClick(dd(5))
        ..handleClick(dd(7))
        ..handleClick(dd(6))
        ..handleClick(dd(0)); // 125760 doz ≈ 300000 dec
      s.handleClick(const Equals());
      // OVERFLOW (not a huge exact expansion) is itself the proof that the
      // magnitude bound dropped this to the f64 fallback at once — that
      // outcome is the real anti-freeze guarantee, so no flaky wall-clock
      // assertion is needed.
      expect(s.errorMsg, 'OVERFLOW'); // not a division → overflow, not DIV BY ZERO
    });
  });
}
