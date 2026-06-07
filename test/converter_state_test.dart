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

    test('A/B disabled in base 10 (metric world)', () {
      final s = ConverterState()..setWorld(UnitWorld.metric);
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
  });
}
