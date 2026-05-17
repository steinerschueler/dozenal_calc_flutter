// Step 9 of PORTING.md: state-management regression tests.
// Exercises the click pipeline: digit/operator/equals, AC, Del, cursor,
// the inverse double-tap toggle, Ans auto-insertion, and error recovery.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/rational.dart';
import 'package:dozenal_calc_flutter/state.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

void main() {
  group('DozenalCalcState', () {
    test('digits + operator + equals: 1+2 = 3', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Add())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, equals(Rational.fromInts(3)));
      expect(s.resultFieldActive, isTrue);
      expect(s.resultBuffer.length, equals(1));
      expect(s.resultBuffer.first, equals(Digit(DozenalDigit.d3)));
    });

    test('1/7 produces capped period (State C)', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d7))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, equals(Rational.fromInts(1, 7)));
      expect(s.resultPeriodStart, isNotNull);
      expect(s.resultPeriodLen, equals(5));
      expect(s.resultPeriodCapped, isTrue);
    });

    test('π collapses rational track → State B (isF64Fallback)', () {
      final s = DozenalCalcState()
        ..handleClick(const ConstPi())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, isNull);
      expect(s.isF64Fallback, isTrue);
    });

    test('AC clears everything', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Add())
        ..handleClick(Digit(DozenalDigit.d3))
        ..handleClick(const Ac());
      expect(s.inputBuffer, isEmpty);
      expect(s.cursorPos, equals(0));
      expect(s.resultBuffer.length, equals(1));
      expect(s.errorMsg, isNull);
    });

    test('Del backspaces by one token', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Del());
      expect(s.inputBuffer, equals([Digit(DozenalDigit.d1)]));
      expect(s.cursorPos, equals(1));
    });

    test('inverse toggle: Sin Sin → ArcSin; Sin Sin Sin → Sin', () {
      final s = DozenalCalcState()..handleClick(const Sin());
      expect(s.inputBuffer.last, isA<Sin>());
      expect(s.isArmed(const Sin()), isTrue);

      s.handleClick(const Sin());
      expect(s.inputBuffer.last, isA<ArcSin>());
      expect(s.isArmed(const Sin()), isFalse);

      s.handleClick(const Sin());
      expect(s.inputBuffer.last, isA<Sin>(),
          reason: 'third tap toggles back to Sin');
    });

    test('Ans auto-insert: digit → equals → operator inserts RatLit(prev)', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Equals());
      expect(s.lastAns, equals(Rational.fromInts(5)));
      expect(s.resultFieldActive, isTrue);

      s.handleClick(const Add());
      expect(s.inputBuffer.length, equals(2));
      expect(s.inputBuffer.first, isA<RatLit>());
      expect((s.inputBuffer.first as RatLit).value,
          equals(Rational.fromInts(5)));
      expect(s.inputBuffer.last, isA<Add>());
    });

    test('digit after = starts fresh expression (no Ans auto-insert)', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Equals())
        ..handleClick(Digit(DozenalDigit.d3));
      expect(s.inputBuffer, equals([Digit(DozenalDigit.d3)]));
      expect(s.resultFieldActive, isFalse);
    });

    test('div-by-zero produces DIV BY ZERO error', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals());
      expect(s.errorMsg, equals('DIV BY ZERO'));
    });

    test('typing after error clears it and starts a new expression', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNotNull);

      s.handleClick(Digit(DozenalDigit.d5));
      expect(s.errorMsg, isNull);
      expect(s.inputBuffer, equals([Digit(DozenalDigit.d5)]));
    });

    test('mode keys stay blocked during error state', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNotNull);

      s.handleClick(const Drg());
      expect(s.errorMsg, isNotNull,
          reason: 'DRG must not clear errors — only AC or input does');
      expect(s.angleMode, equals(AngleMode.deg),
          reason: 'angle mode must not change while error is active');
    });

    test('cursor arrows move within input', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(Digit(DozenalDigit.d3));
      expect(s.cursorPos, equals(3));

      s.handleClick(const TriangleLeft());
      expect(s.cursorPos, equals(2));

      s.handleClick(const TriangleRight());
      expect(s.cursorPos, equals(3));
    });

    test('Drg cycles through angle modes', () {
      final s = DozenalCalcState();
      expect(s.angleMode, equals(AngleMode.deg));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.rad));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.grad));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.deg));
    });

    test('Expand opens overlay; Close closes it', () {
      final s = DozenalCalcState();
      expect(s.overlayOpen, isFalse);
      s.handleClick(const Expand());
      expect(s.overlayOpen, isTrue);
      s.handleClick(const Close());
      expect(s.overlayOpen, isFalse);
    });

    test('overlay constants insert + close overlay', () {
      final s = DozenalCalcState();
      s.handleClick(const Expand());
      expect(s.overlayOpen, isTrue);
      s.handleClick(const ConstPi());
      expect(s.overlayOpen, isFalse);
      expect(s.inputBuffer, equals([const ConstPi()]));
    });

    test('STO captures result + closes overlay', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Equals())
        ..handleClick(const Expand())
        ..handleClick(const Sto());
      expect(s.overlayOpen, isFalse);
      expect(s.memory.isNotEmpty, isTrue);
      expect(s.memoryRational, equals(Rational.fromInts(5)));
    });

    test('STO/RCL preserves Rational so periodicity survives', () {
      // Compute 1/7, store it, clear, recall, and re-evaluate. The recalled
      // value must still trigger the period-detection path (CLAUDE.md:
      // "Memory stores the exact `Rational` ... so periodicity survives a
      // STO/RCL roundtrip").
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d7))
        ..handleClick(const Equals());
      expect(s.lastAns, equals(Rational.fromInts(1, 7)));

      s
        ..handleClick(const Expand())
        ..handleClick(const Sto())
        ..handleClick(const Ac());
      expect(s.memoryRational, equals(Rational.fromInts(1, 7)));

      s
        ..handleClick(const Expand())
        ..handleClick(const Rcl())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, equals(Rational.fromInts(1, 7)),
          reason: 'recalled rational must round-trip exactly');
      expect(s.resultPeriodLen, greaterThan(0),
          reason: 'period detection must still fire after RCL → =');
      expect(s.isF64Fallback, isFalse,
          reason: 'rational track must not collapse on a recalled value');
    });

    test('Sinh double-tap toggles to ArSinh + closes overlay', () {
      final s = DozenalCalcState();
      s.handleClick(const Expand());
      s.handleClick(const Sinh());
      expect(s.overlayOpen, isFalse);
      expect(s.inputBuffer.last, isA<Sinh>());

      s.handleClick(const Expand());
      s.handleClick(const Sinh());
      expect(s.inputBuffer.last, isA<ArSinh>(),
          reason: 'second Sinh tap toggles the previous Sinh to ArSinh');
    });

    test('notifyListeners fires once per click', () {
      final s = DozenalCalcState();
      var count = 0;
      s.addListener(() => count++);
      s.handleClick(Digit(DozenalDigit.d1));
      expect(count, equals(1));
      s.handleClick(const Add());
      expect(count, equals(2));
    });

    test('= on an empty buffer yields 0, not SYNTAX ERROR', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Ac())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull,
          reason: 'AC clears the buffer; = on nothing should not error');
      expect(s.resultBuffer, equals([Digit(DozenalDigit.d0)]));
    });

    test('default numeral system is dozenal', () {
      final s = DozenalCalcState();
      expect(s.numeralSystem, equals(NumeralSystem.doz));
      expect(s.activeBase, equals(12));
    });

    test('Dez switches active base to 10, Doz back to 12', () {
      final s = DozenalCalcState();
      s.handleClick(const Dez());
      expect(s.numeralSystem, equals(NumeralSystem.dez));
      expect(s.activeBase, equals(10));
      s.handleClick(const Doz());
      expect(s.numeralSystem, equals(NumeralSystem.doz));
      expect(s.activeBase, equals(12));
    });

    test('Dez mode evaluates 1+2 as decimal 3 (same as doz for small ints)',
        () {
      final s = DozenalCalcState()..handleClick(const Dez());
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(const Add());
      s.handleClick(Digit(DozenalDigit.d2));
      s.handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.resultBuffer, equals([Digit(DozenalDigit.d3)]));
    });

    test('Dez mode: 9+1 = 10 (rendered as 1,0 in base 10)', () {
      final s = DozenalCalcState()..handleClick(const Dez());
      s.handleClick(Digit(DozenalDigit.d9));
      s.handleClick(const Add());
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(const Equals());
      expect(s.errorMsg, isNull);
      // In base 10, 10 = [1, 0]; in base 12 it would have been [A].
      expect(s.resultBuffer,
          equals([Digit(DozenalDigit.d1), Digit(DozenalDigit.d0)]));
    });

    test('Doz→Dez switch converts buffer: doz 1,0 (=12) becomes dez 1,2', () {
      final s = DozenalCalcState();
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(Digit(DozenalDigit.d0));
      s.handleClick(const Dez());
      expect(
        s.inputBuffer,
        equals([Digit(DozenalDigit.d1), Digit(DozenalDigit.d2)]),
        reason: 'doz "10" (=12 dec) → dez "12"',
      );
    });

    test('Dez→Doz switch converts buffer: dez 1,2 (=12) becomes doz 1,0', () {
      final s = DozenalCalcState()..handleClick(const Dez());
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(Digit(DozenalDigit.d2));
      s.handleClick(const Doz());
      expect(
        s.inputBuffer,
        equals([Digit(DozenalDigit.d1), Digit(DozenalDigit.d0)]),
        reason: 'dez "12" → doz "10"',
      );
    });

    test('round-trip: doz "23" → dez → doz preserves digits', () {
      final s = DozenalCalcState();
      s.handleClick(Digit(DozenalDigit.d2));
      s.handleClick(Digit(DozenalDigit.d3));
      s.handleClick(const Dez());
      s.handleClick(const Doz());
      expect(s.inputBuffer,
          equals([Digit(DozenalDigit.d2), Digit(DozenalDigit.d3)]));
    });

    test('mode-switch preserves operators between literals', () {
      // doz "10 + 11" (= 12 + 13 dec) → dez "12 + 13"
      final s = DozenalCalcState();
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(Digit(DozenalDigit.d0));
      s.handleClick(const Add());
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(Digit(DozenalDigit.d1));
      s.handleClick(const Dez());
      expect(
          s.inputBuffer,
          equals([
            Digit(DozenalDigit.d1),
            Digit(DozenalDigit.d2),
            const Add(),
            Digit(DozenalDigit.d1),
            Digit(DozenalDigit.d3),
          ]));
    });

    // -------------------------------------------------------------------
    // Build 5 regression tests
    // -------------------------------------------------------------------

    // B3: isF64Fallback used to be derived from "any Decimal in
    // resultBuffer", which missed whole-number f64 results.
    test('B3: f64-fallback flag fires for integer fallback results', () {
      // 1 + sin(0) = 1 — rational track collapses on sin, f64 yields 1.0
      // (integer, no Decimal in buffer). State must still flag fallback.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Add())
        ..handleClick(const Sin())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const ParenClose())
        ..handleClick(const Equals());
      expect(s.errorMsg, isNull);
      expect(s.lastAns, isNull, reason: 'rational track must have collapsed');
      expect(s.isF64Fallback, isTrue,
          reason: 'integer f64 results still need the ≈ suffix');
    });

    // B4: lastAns must be cleared on error so a subsequent Ans (after AC)
    // does not insert the pre-error value. With lastAns == null Ans falls
    // back to the just-reset resultBuffer (= [Digit(d0)]), inserting a
    // harmless zero rather than the stale 5.
    test('B4: error clears lastAns so Ans after AC does not paste stale 5', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d5))
        ..handleClick(const Equals()); // lastAns = 5
      expect(s.lastAns, equals(Rational.fromInts(5)));

      s
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals()); // DIV BY ZERO
      expect(s.errorMsg, equals('DIV BY ZERO'));
      expect(s.lastAns, isNull,
          reason: 'error must invalidate the previous lastAns');

      s.handleClick(const Ac());
      s.handleClick(const Ans());
      // The pre-error 5 must NOT come back. After AC + Ans the buffer
      // either is empty or holds the post-AC zero, but never RatLit(5).
      for (final t in s.inputBuffer) {
        expect(t, isNot(isA<RatLit>()),
            reason: 'no stale RatLit from before the error');
      }
    });

    // B5: memory operations must be blocked during error state to prevent
    // mixing pre-error lastAns into the freshly-reset buffer.
    test('B5: Sto/Rcl/Mc/Ans are blocked during error state', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Div())
        ..handleClick(Digit(DozenalDigit.d0))
        ..handleClick(const Equals());
      expect(s.errorMsg, isNotNull);

      final memBefore = s.memory;
      s.handleClick(const Sto());
      expect(s.errorMsg, isNotNull,
          reason: 'Sto during error must not clear the error');
      expect(s.memory, equals(memBefore),
          reason: 'Sto during error must not mutate memory');

      // The buffer the user typed before the error stays intact too,
      // because the blocked-token branch returns *before* the buffer reset.
      final bufBefore = List.of(s.inputBuffer);
      s.handleClick(const Rcl());
      expect(s.errorMsg, isNotNull, reason: 'Rcl blocked during error');
      s.handleClick(const Mc());
      expect(s.errorMsg, isNotNull, reason: 'Mc blocked during error');
      s.handleClick(const Ans());
      expect(s.errorMsg, isNotNull, reason: 'Ans blocked during error');
      expect(s.inputBuffer, equals(bufBefore),
          reason: 'no buffer mutation under blocked-token error state');
    });

    // B9: a second Decimal in the same number literal must be a no-op.
    test('B9: second Decimal in same literal is ignored', () {
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Decimal())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Decimal()) // <- should be ignored
        ..handleClick(Digit(DozenalDigit.d3));
      expect(
          s.inputBuffer,
          equals([
            Digit(DozenalDigit.d1),
            const Decimal(),
            Digit(DozenalDigit.d2),
            Digit(DozenalDigit.d3),
          ]));
    });

    test('B9: Decimal in a fresh literal (after operator) is allowed', () {
      // Operator resets the "current literal" window, so a Decimal there
      // is a leading dot and must be accepted.
      final s = DozenalCalcState()
        ..handleClick(Digit(DozenalDigit.d1))
        ..handleClick(const Decimal())
        ..handleClick(Digit(DozenalDigit.d2))
        ..handleClick(const Add())
        ..handleClick(const Decimal()) // <- new literal, accepted
        ..handleClick(Digit(DozenalDigit.d5));
      expect(
          s.inputBuffer,
          equals([
            Digit(DozenalDigit.d1),
            const Decimal(),
            Digit(DozenalDigit.d2),
            const Add(),
            const Decimal(),
            Digit(DozenalDigit.d5),
          ]));
    });
  });
}
