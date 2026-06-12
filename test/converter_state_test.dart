// Behaviour of ConverterState (compound input) + the base_num helpers.
// Spec: docs/unit-converter.md §4 / §4a / §7

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/logic/base_num.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';

void main() {
  group('base_num', () {
    test('parse respects base', () {
      expect(parseBaseNum('144', 10), closeTo(144, 1e-12));
      expect(parseBaseNum('144', 12), closeTo(196, 1e-12));
      expect(parseBaseNum('A', 12), closeTo(10, 1e-12));
      expect(parseBaseNum('1.6', 12), closeTo(1.5, 1e-12));
      expect(parseBaseNum('-B', 12), closeTo(-11, 1e-12));
      expect(parseBaseNum('', 12), 0);
    });
    test('format trims and uses A/B', () {
      expect(formatBaseNum(196, 12), '144');
      expect(formatBaseNum(1.5, 12), '1.6');
      expect(formatBaseNum(10, 12), 'A');
      expect(formatBaseNum(2.0, 12), '2');
    });

    test('scalar entries fold left to right and tolerate dangling ops', () {
      expect(parseScalarEntry('3×2', 12), closeTo(6, 1e-12));
      expect(parseScalarEntry('10÷4', 12), closeTo(3, 1e-12)); // 12/4
      expect(parseScalarEntry('3×2÷4', 10), closeTo(1.5, 1e-12));
      expect(parseScalarEntry('3×', 12), closeTo(3, 1e-12));
      expect(parseScalarEntry('5', 10), closeTo(5, 1e-12));
      expect(parseScalarEntry('-6÷2', 10), closeTo(-3, 1e-12));
    });

    test('scalar entries re-render per segment on a base switch', () {
      expect(reformatScalarEntry('13×2', 12, 10), '15×2');
      expect(reformatScalarEntry('15×2', 10, 12), '13×2');
      expect(reformatScalarEntry('3×', 12, 10), '3×');
    });
  });

  ConverterState distState() {
    return ConverterState()..tapCategory(UnitCategory.dist);
  }

  void type(ConverterState s, String digits) {
    for (final c in digits.split('')) {
      s.inputDigit(int.parse(c, radix: 16));
    }
  }

  Unit mag(ConverterState s, String symbol) =>
      s.magnitudeUnits.firstWhere((u) => u.symbol == symbol);

  group('pending input', () {
    test('typing builds the expression, no terms yet', () {
      final s = distState();
      type(s, '100'); // base 12
      expect(s.termCount, 0);
      expect(s.topLine.number, '100');
      expect(s.resultLine, isNull);
    });

    test('A/B disabled in base 10', () {
      // Base is decoupled from the unit system: only setBase(10) gates A/B.
      final s = ConverterState()..setBase(10);
      s.inputDigit(10); // 'A'
      expect(s.topLine.number, '0');
      expect(s.isDigitEnabled(10), isFalse);
      expect(s.isDigitEnabled(9), isTrue);
    });
  });

  group('single term', () {
    test('commit shows expression, bracket, and total in that unit', () {
      final s = ConverterState()..setWorld(UnitWorld.metric);
      s.tapCategory(UnitCategory.dist);
      type(s, '100');
      s.tapMagnitude(mag(s, 'm'));
      expect(s.termCount, 1);
      expect(s.topLine.number, '100 m');
      expect(s.topLine.bracket, endsWith('yd')); // 100 m ≈ 109.36 yd
      final r = s.resultLine!;
      expect(r.unit, 'm');
      expect(r.number, '100');
    });

    test('magnitude tap without a number is ignored', () {
      final s = distState();
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.termCount, 0);
    });
  });

  group('compound terms', () {
    test('different magnitudes: implicit + (hidden)', () {
      final s = distState(); // imperial / base 12
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in'));
      expect(s.termCount, 2);
      expect(s.topLine.number, '5 ft 3 in'); // no '+'
      expect(s.totalSi, closeTo(5 * 0.3048 + 3 * 0.0254, 1e-9));
    });

    test('same magnitude: operator shown to disambiguate', () {
      final s = ConverterState()..tapCategory(UnitCategory.time);
      type(s, '3');
      s.tapMagnitude(mag(s, 'h'));
      type(s, '2');
      s.tapMagnitude(mag(s, 'h'));
      expect(s.topLine.number, '3 h + 2 h');
      expect(s.totalSi, closeTo(5 * 3600, 1e-9));
    });

    test('subtraction is explicit and shown', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      s.setSubtract(true);
      type(s, '3');
      s.tapMagnitude(mag(s, 'in'));
      expect(s.topLine.number, contains('−'));
      expect(s.totalSi, closeTo(5 * 0.3048 - 3 * 0.0254, 1e-9));
    });

    test('del removes pending char, then the last term', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '37');
      s.del(); // drop '7'
      expect(s.topLine.number, '5 ft 3');
      s.del(); // drop '3' (pending empty)
      s.del(); // remove the 'ft' term
      expect(s.termCount, 0);
    });
  });

  group('= cycles units then breakdown (imperial)', () {
    test('breakdown of 5 ft 3 in = 1 yd 2 ft 3 in', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in'));

      ConverterLine? breakdown;
      for (var i = 0; i < 12; i++) {
        final r = s.resultLine!;
        if (r.unit == null) {
          breakdown = r;
          break;
        }
        s.equals();
      }
      expect(breakdown, isNotNull);
      expect(breakdown!.number, '1 yd 2 ft 3 in'); // leading 0 mi dropped
    });

    test('metric world offers no breakdown view', () {
      final s = ConverterState()..setWorld(UnitWorld.metric);
      s.tapCategory(UnitCategory.dist);
      type(s, '5');
      s.tapMagnitude(mag(s, 'm'));
      for (var i = 0; i < 8; i++) {
        expect(s.resultLine!.unit, isNotNull); // never a breakdown line
        s.equals();
      }
    });
  });

  group('world toggle', () {
    test('collapses compound total to a single partner term', () {
      final s = distState(); // imperial
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in'));
      final before = s.totalSi;

      s.toggleWorld(); // → metric
      expect(s.world, UnitWorld.metric);
      expect(s.termCount, 1);
      expect(s.inputUnit!.symbol, 'cm'); // partner of 'in'
      expect(s.totalSi, closeTo(before, 1e-9)); // physical value preserved
    });

    test('temperature stays single-term and converts the point', () {
      final s = ConverterState()..setWorld(UnitWorld.metric);
      s.tapCategory(UnitCategory.temp);
      type(s, '100');
      s.tapMagnitude(mag(s, '°C'));
      type(s, '50');
      s.tapMagnitude(mag(s, 'K')); // replaces, not adds
      expect(s.termCount, 1);
    });
  });

  group('category toggle', () {
    test('second tap collapses but keeps terms + category', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      s.tapCategory(UnitCategory.dist); // collapse
      expect(s.magnitudesExpanded, isFalse);
      expect(s.activeCategory, UnitCategory.dist);
      expect(s.termCount, 1);
      expect(s.hasResult, isTrue);
    });
  });

  group('time base-swap bracket', () {
    test('11 h shows {11 h} in the other base', () {
      final s = ConverterState()..tapCategory(UnitCategory.time);
      s.inputDigit(11); // 'B' in base 12
      s.tapMagnitude(mag(s, 'h'));
      expect(s.topLine.number, 'B h');
      expect(s.topLine.bracket, '11 h');
    });
  });

  group('edit cursor (Variant 2)', () {
    test('digit inserts at the caret within the pending number', () {
      final s = distState();
      type(s, '13'); // pending "13", caret at 2
      expect(s.inputCursor, 2);
      s.moveInputCaret(1);
      s.inputDigit(2); // insert '2' at index 1 → "123"
      expect(s.pendingInput, '123');
      expect(s.inputCursor, 2);
    });

    test('commit at a mid-expression boundary inserts the term there', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in')); // "5 ft 3 in", cursorTerm = 2
      s.moveCursorToTermBoundary(1); // between ft and in
      type(s, '7');
      s.tapMagnitude(mag(s, 'yd'));
      expect(s.termCount, 3);
      expect(s.topLine.number, '5 ft 7 yd 3 in');
    });

    test('Del at a term boundary removes the preceding term', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in'));
      s.moveCursorToTermBoundary(1); // between ft and in
      s.del(); // removes the term before the boundary (5 ft)
      expect(s.termCount, 1);
      expect(s.topLine.number, '3 in');
    });

    test('tapping a boundary discards an incomplete pending number', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '9'); // pending "9", no unit yet
      s.moveCursorToTermBoundary(0);
      expect(s.pendingInput, isEmpty);
      expect(s.termCount, 1);
      expect(s.cursorTerm, 0);
    });

    test('arrow keys step the caret without discarding the pending number', () {
      final s = distState();
      type(s, '13');
      s.moveCaretLeft();
      expect(s.inputCursor, 1);
      s.moveCaretLeft();
      expect(s.inputCursor, 0);
      s.moveCaretLeft(); // at the edge: stops, keeps the pending number
      expect(s.inputCursor, 0);
      expect(s.pendingInput, '13');
      s.moveCaretRight();
      expect(s.inputCursor, 1);
    });

    test('arrow keys cross term boundaries with nothing pending', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft')); // cursorTerm = 1
      s.moveCaretLeft();
      expect(s.cursorTerm, 0);
      s.moveCaretRight();
      expect(s.cursorTerm, 1);
      s.moveCaretRight(); // past the last term: stops
      expect(s.cursorTerm, 1);
    });
  });

  group('scalar operators × ÷', () {
    test('entry-first: 3 × 2 then ft commits 6 ft', () {
      final s = distState();
      type(s, '3');
      s.inputScalarOp(kScalarTimes);
      type(s, '2');
      expect(s.pendingInput, '3×2');
      expect(s.topLine.number, '3×2');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.termCount, 1);
      expect(s.resultLine!.number, '6');
      expect(s.resultLine!.unit, 'ft');
    });

    test('division folds left to right in the active base', () {
      final s = distState();
      type(s, '10'); // 12 dec in base 12
      s.inputScalarOp(kScalarDivide);
      type(s, '4');
      s.tapMagnitude(mag(s, 'in'));
      expect(s.resultLine!.number, '3');
    });

    test('term-first: × collapses the compound into editable digits', () {
      final s = distState();
      type(s, '3');
      s.tapMagnitude(mag(s, 'ft'));
      s.inputScalarOp(kScalarTimes); // collapses "3 ft" → pending "3×"
      expect(s.termCount, 0);
      expect(s.pendingInput, '3×');
      type(s, '2');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '6');
      expect(s.resultLine!.unit, 'ft');
    });

    test('compound collapse uses the working-unit total', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in')); // 5 ft 3 in = 63 in (dec) = "53" doz
      s.inputScalarOp(kScalarTimes);
      expect(s.pendingInput, '53×');
    });

    test('guards: no leading, doubled, or empty-state operators', () {
      final s = distState();
      s.inputScalarOp(kScalarTimes); // nothing at all → silent no-op
      expect(s.pendingInput, isEmpty);
      expect(s.termCount, 0);
      type(s, '3');
      s.inputScalarOp(kScalarTimes);
      s.inputScalarOp(kScalarDivide); // doubled → no-op
      expect(s.pendingInput, '3×');
      s.moveInputCaret(0);
      s.inputScalarOp(kScalarTimes); // would lead → no-op
      expect(s.pendingInput, '3×');
    });

    test('decimal guard works per segment', () {
      final s = distState();
      type(s, '1');
      s.inputDecimal();
      type(s, '6'); // 1.6
      s.inputScalarOp(kScalarTimes);
      s.inputDecimal(); // segment start → seeds "0."
      type(s, '6');
      expect(s.pendingInput, '1.6×0.6');
      s.inputDecimal(); // second dot in the same segment → no-op
      expect(s.pendingInput, '1.6×0.6');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '0.9'); // 1.5 × 0.5 = 0.75 = 0;9 doz
    });

    test('setBase re-renders every segment of the entry', () {
      final s = distState();
      type(s, '13'); // 15 dec
      s.inputScalarOp(kScalarTimes);
      type(s, '2');
      s.setBase(10);
      expect(s.pendingInput, '15×2');
    });
  });

  group('Set 2 entry operators (⊕ ^ √ ㏒)', () {
    test('power: 3 ^ 2 then ft commits 9 ft', () {
      final s = distState();
      type(s, '3');
      s.inputScalarOp(kScalarPower);
      type(s, '2');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '9');
      expect(s.resultLine!.unit, 'ft');
    });

    test('root and log use the left operand as degree/base', () {
      expect(parseScalarEntry('2√9', 10), closeTo(3, 1e-9));
      expect(parseScalarEntry('3√1000', 10), closeTo(10, 1e-9));
      expect(parseScalarEntry('2㏒8', 10), closeTo(3, 1e-9));
    });

    test('parallel sum folds like the main calculator ⊕', () {
      expect(parseScalarEntry('6⊕6', 10), closeTo(3, 1e-9));
      expect(parseScalarEntry('4⊕4⊕4', 10), closeTo(4 / 3, 1e-9));
    });

    test('mixed entry folds strictly left to right', () {
      // 2^3 = 8, then ×3 = 24 — no precedence, it's a running entry.
      expect(parseScalarEntry('2^3×3', 10), closeTo(24, 1e-9));
    });
  });

  group('memory register (STO/RCL/MC)', () {
    test('stores the result-line value and recalls it into the entry', () {
      final s = distState();
      expect(s.canMemStore, isFalse); // truly nothing yet
      type(s, '13'); // 15 dec
      expect(s.canMemStore, isTrue); // a typed entry is storable
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.canMemStore, isTrue);
      s.memStore();
      expect(s.memoryAvailable, isTrue);

      s.allClear();
      s.tapCategory(UnitCategory.dist); // memory survives AC + category
      expect(s.memoryAvailable, isTrue);
      s.memRecall();
      expect(s.pendingInput, '13');
      s.memClear();
      expect(s.memoryAvailable, isFalse);
      expect(s.canMemRecall, isFalse);
    });

    test('recall composes with the scalar entry', () {
      final s = distState();
      type(s, '2');
      s.tapMagnitude(mag(s, 'ft'));
      s.memStore(); // M = 2
      s.inputScalarOp(kScalarTimes); // collapse → "2×"
      s.memRecall();
      expect(s.pendingInput, '2×2');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '4');
    });
  });

  group('constants (Set 7)', () {
    test('insert into / replace the caret segment in the active base', () {
      final s = distState();
      s.insertValueEntry(1.5); // stand-in for a constant tap
      expect(s.pendingInput, '1.6'); // base 12
      s.insertValueEntry(2.0); // replaces the segment, never splices
      expect(s.pendingInput, '2');
      s.inputScalarOp(kScalarTimes);
      s.insertValueEntry(1.5); // empty second segment → plain insert
      expect(s.pendingInput, '2×1.6');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '3'); // 2 × 1.5
    });

    test('negative values must cover the whole entry (sign → term level)', () {
      final s = distState();
      type(s, '3');
      s.inputScalarOp(kScalarPower);
      type(s, '2');
      s.moveInputCaret(2); // caret in the exponent segment of "3^2"
      s.insertValueEntry(-2.0); // 3^(−2) not representable → no-op
      expect(s.pendingInput, '3^2');
      s.allClear();
      s.tapCategory(UnitCategory.dist);
      type(s, '4'); // single segment = whole entry → replace + arm −
      s.insertValueEntry(-2.0);
      expect(s.pendingInput, '2');
      expect(s.subtractArmed, isTrue);
    });
  });

  group('calc-Ans bridge (main result → pending number)', () {
    test('inserts the answer as pending digits in the world base', () {
      final s = ConverterState()..calcAnsProvider = () => 15.0;
      expect(s.calcAnsAvailable, isTrue);
      s.insertCalcAns();
      expect(s.pendingInput, '13'); // imperial world = base 12
      expect(s.inputCursor, 2);
    });

    test('base 10 formats the pulled answer in decimal digits', () {
      final s = ConverterState()
        ..setBase(10)
        ..calcAnsProvider = () => 15.0;
      s.insertCalcAns();
      expect(s.pendingInput, '15');
    });

    test('the world switch alone does NOT change the digit base', () {
      final s = ConverterState()
        ..setWorld(UnitWorld.metric)
        ..calcAnsProvider = () => 15.0;
      s.insertCalcAns();
      expect(s.base, 12); // decoupled: metric units, dozenal digits
      expect(s.pendingInput, '13');
    });

    test('replaces the caret segment — composes, never splices', () {
      final s = ConverterState()..calcAnsProvider = () => 7.0;
      s.inputDigit(4);
      expect(s.calcAnsAvailable, isTrue); // value keys always act
      s.insertCalcAns();
      expect(s.pendingInput, '7'); // replaced the typed segment
      s.inputScalarOp(kScalarTimes); // "7×" → empty second segment
      s.insertCalcAns();
      expect(s.pendingInput, '7×7'); // composes with the entry
      s.moveInputCaret(0);
      s.insertCalcAns(); // caret in first segment → replaces only it
      expect(s.pendingInput, '7×7');
    });

    test('a negative answer arms − and converts to a negative term', () {
      final s = distState()..calcAnsProvider = () => -2.0;
      s.insertCalcAns();
      expect(s.pendingInput, '2');
      expect(s.subtractArmed, isTrue);
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.totalSi, lessThan(0));
      expect(s.topLine.number, '−2 ft');
    });

    test('without a provider the key is inert', () {
      final s = ConverterState();
      expect(s.calcAnsAvailable, isFalse);
      s.insertCalcAns();
      expect(s.pendingInput, isEmpty);
    });

    test('the pending number survives a category switch', () {
      final s = ConverterState();
      s.inputDigit(5); // type first …
      s.tapCategory(UnitCategory.dist); // … then choose the category
      expect(s.pendingInput, '5');
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.termCount, 1);
      expect(s.topLine.number, '5 ft');
      // Switching to another category drops the committed terms (their units
      // are meaningless there) but keeps a freshly typed number.
      s.inputDigit(3);
      s.tapCategory(UnitCategory.weight);
      expect(s.termCount, 0);
      expect(s.pendingInput, '3');
    });
  });

  group('base/system decoupling', () {
    test('setBase re-renders the pending number, keeps terms and world', () {
      final s = distState(); // imperial, base 12
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '13'); // pending, base 12 = 15 dec
      s.setBase(10);
      expect(s.base, 10);
      expect(s.world, UnitWorld.imperial); // system untouched
      expect(s.pendingInput, '15'); // value preserved, digits re-rendered
      expect(s.termCount, 1);
      expect(s.resultLine!.number, '5'); // 5 ft, now in decimal digits
      expect(s.resultLine!.unit, 'ft');
    });

    test('all four base×system combinations format the result line', () {
      final s = distState();
      type(s, '12'); // 14 dec
      s.tapMagnitude(mag(s, 'ft'));
      expect(s.resultLine!.number, '12'); // doz + imperial
      s.setBase(10);
      expect(s.resultLine!.number, '14'); // dez + imperial
      s.setWorld(UnitWorld.metric); // collapses to the partner unit (m)
      expect(s.resultLine!.unit, 'm'); // dez + metric
      final dezMetric = parseBaseNum(s.resultLine!.number, 10);
      s.setBase(12); // doz + metric
      expect(parseBaseNum(s.resultLine!.number, 12), closeTo(dezMetric, 1e-4));
    });

    test('digit gating follows the base, not the world', () {
      final s = ConverterState()..setWorld(UnitWorld.metric);
      expect(s.isDigitEnabled(11), isTrue); // metric + dozenal: B allowed
      s.setBase(10);
      expect(s.isDigitEnabled(11), isFalse);
    });

    test('breakdown availability follows the system, not the base', () {
      final s = distState();
      type(s, '15');
      s.tapMagnitude(mag(s, 'ft'));
      s.setBase(10); // imperial units in decimal digits
      var sawBreakdown = false;
      for (var i = 0; i < 8 && !sawBreakdown; i++) {
        s.equals();
        sawBreakdown = s.resultLine!.unit == null;
      }
      expect(sawBreakdown, isTrue);
    });

    test('brackets carry the world hue of what they show', () {
      final s = distState(); // imperial
      type(s, '1');
      s.tapMagnitude(mag(s, 'ft'));
      // Bracket shows the metric partner → Ten world (green).
      expect(s.resultLine!.bracketTenWorld, isTrue);
      expect(s.topLine.bracketTenWorld, isTrue);
      s.setWorld(UnitWorld.metric);
      // Now the bracket shows the imperial partner → Twelve world.
      expect(s.resultLine!.bracketTenWorld, isFalse);
      // Time category: the bracket shows the other BASE instead.
      final t = ConverterState()..tapCategory(UnitCategory.time);
      t.inputDigit(2);
      t.tapMagnitude(t.magnitudeUnits.firstWhere((u) => u.symbol == 'h'));
      expect(t.topLine.bracketTenWorld, isTrue); // base 12 → other is ten
      t.setBase(10);
      expect(t.topLine.bracketTenWorld, isFalse); // base 10 → other is twelve
    });

    test('unit-symbol ranges mark the system-hue carriers', () {
      final s = distState();
      type(s, '5');
      s.tapMagnitude(mag(s, 'ft'));
      type(s, '3');
      s.tapMagnitude(mag(s, 'in')); // "5 ft 3 in"
      final line = s.topLine;
      final units = [
        for (final (a, b) in line.unitRanges) line.number.substring(a, b),
      ];
      expect(units, ['ft', 'in']);
    });
  });

  group('ansForBridge (converter result → main calculator)', () {
    test('null without committed terms', () {
      final s = distState();
      type(s, '5'); // pending only
      expect(s.ansForBridge, isNull);
    });

    test('offers the number shown on the result line and follows =', () {
      final s = distState();
      type(s, '1');
      s.tapMagnitude(mag(s, 'ft')); // result line: 1 ft
      expect(s.ansForBridge, closeTo(1.0, 1e-12));
      // = cycles to the next ladder unit; the bridge follows the shown value.
      s.equals();
      // The shown string truncates at 6 fractional base-12 digits, so compare
      // within that resolution.
      final shown = parseBaseNum(s.resultLine!.number, s.base);
      expect(s.ansForBridge, closeTo(shown, 1e-6));
    });

    test('on the breakdown view it falls back to the working unit', () {
      final s = distState();
      type(s, '15'); // 17 dec ft
      s.tapMagnitude(mag(s, 'ft'));
      // Walk = to the breakdown view (one step past the ladder units).
      while (s.resultLine!.unit != null) {
        s.equals();
      }
      expect(s.ansForBridge, closeTo(17.0, 1e-9)); // total in ft
    });
  });
}
