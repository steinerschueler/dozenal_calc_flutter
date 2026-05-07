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
      expect(s.angleMode, equals(AngleMode.rad),
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
      expect(s.angleMode, equals(AngleMode.rad));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.grad));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.deg));
      s.handleClick(const Drg());
      expect(s.angleMode, equals(AngleMode.rad));
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
  });
}
