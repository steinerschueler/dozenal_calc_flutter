// Behaviour of AssetState: the three-level drill-down (class → genus → unit),
// compound entry, the `=` ladder/breakdown cycle, the met/imp world toggle
// (inert for currencies) and the decoupled numeral base.

import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AssetState s;
  setUp(() => s = AssetState());

  AssetGenus gold() =>
      generaOf(AssetClass.metal).firstWhere((g) => g.key == 'gold');
  AssetGenus gbp() =>
      generaOf(AssetClass.currency).firstWhere((g) => g.key == 'gbp');
  Unit unit(AssetGenus g, String sym) => g.unitBySymbol(sym)!;

  group('drill-down', () {
    test('starts at the class level', () {
      expect(s.drillLevel, AssetDrillLevel.classes);
      expect(s.activeClass, isNull);
    });

    test('tap class → genera, tap genus → units', () {
      s.tapClass(AssetClass.metal);
      expect(s.drillLevel, AssetDrillLevel.genera);
      expect(s.activeClass, AssetClass.metal);

      s.tapGenus(gold());
      expect(s.drillLevel, AssetDrillLevel.units);
      expect(s.activeGenus!.key, 'gold');
      expect(s.currentLadder.map((u) => u.symbol), contains('oz t'));
    });

    test('tapping the active class header steps back to classes', () {
      s.tapClass(AssetClass.metal);
      s.tapClass(AssetClass.metal);
      expect(s.drillLevel, AssetDrillLevel.classes);
    });

    test('tapping the active genus header collapses to genera', () {
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.tapGenus(gold());
      expect(s.drillLevel, AssetDrillLevel.genera);
    });

    test('pending number survives a class switch (it is unit-less)', () {
      s.tapClass(AssetClass.metal);
      s.inputDigit(5);
      s.tapClass(AssetClass.currency);
      expect(s.pendingInput, '5');
    });
  });

  group('commit + equals cycle', () {
    test('commit one troy oz, = walks the ladder', () {
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.tapMagnitude(unit(gold(), 'oz t'));
      expect(s.termCount, 1);
      expect(s.hasResult, isTrue);

      // First result view is the committed unit itself (1 oz t).
      expect(s.resultLine!.unit, 'oz t');
      expect(s.resultLine!.number, '1');
    });

    test('grams view of one troy oz shows 31.something (base 10)', () {
      s.setBase(10);
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.tapMagnitude(unit(gold(), 'oz t'));
      // Switch to metric so the gram value is on the ladder.
      s.setWorld(UnitWorld.metric);
      // Cycle = until the gram unit shows.
      var guard = 0;
      while (s.resultLine!.unit != 'g' && guard++ < 12) {
        s.equals();
      }
      expect(s.resultLine!.unit, 'g');
      expect(s.resultLine!.number, startsWith('31.10'));
    });
  });

  group('world toggle', () {
    test('metals: imperial ↔ metric is value-preserving', () {
      s.setBase(10);
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(2);
      s.tapMagnitude(unit(gold(), 'oz t')); // 2 troy oz
      expect(s.worldToggleEnabled, isTrue);
      s.setWorld(UnitWorld.metric);
      // total preserved: 2 oz t = 62.206... g
      expect(s.totalBase, closeTo(0.0622069536, 1e-9)); // kg
    });

    test('currencies: world toggle is inert', () {
      s.tapClass(AssetClass.currency);
      s.tapGenus(gbp());
      expect(s.worldToggleEnabled, isFalse);
    });
  });

  group('currency denominations + base bracket', () {
    test('GBP £1, = cycles to shillings/pence and breakdown', () {
      s.setBase(10);
      s.tapClass(AssetClass.currency);
      s.tapGenus(gbp());
      s.inputDigit(1);
      s.tapMagnitude(unit(gbp(), '£'));
      // cycle to the shilling view
      var guard = 0;
      while (s.resultLine!.unit != 'sh' && guard++ < 12) {
        s.equals();
      }
      expect(s.resultLine!.number, '20'); // 1 £ = 20 sh
    });

    test('single-world bracket shows the other numeral base', () {
      s.tapClass(AssetClass.currency);
      s.tapGenus(gbp());
      s.inputDigit(2);
      s.tapMagnitude(unit(gbp(), '£'));
      // base 12 → bracket shows base 10
      expect(s.topLine.bracket, isNotNull);
      expect(s.topLine.bracketTenWorld, isTrue);
    });
  });

  group('base switch', () {
    test('pending number reformats value-preservingly', () {
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.inputDigit(0); // "10" in base 12 = twelve
      s.setBase(10);
      expect(s.pendingInput, '12'); // twelve rendered in base 10
    });
  });

  test('AC resets the whole drill-down', () {
    s.tapClass(AssetClass.metal);
    s.tapGenus(gold());
    s.inputDigit(3);
    s.tapMagnitude(unit(gold(), 'oz t'));
    s.allClear();
    expect(s.drillLevel, AssetDrillLevel.classes);
    expect(s.termCount, 0);
    expect(s.pendingInput, '');
  });
}
