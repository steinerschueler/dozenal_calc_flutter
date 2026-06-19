// Behaviour of AssetState: the three-level drill-down (class → genus → unit),
// compound entry, the `=` ladder/breakdown cycle, the working world derived
// from the committed unit (no met/imp toggle — both systems sit on the ladder)
// and the decoupled numeral base.

import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/rate_store.dart';
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
      // All units (Troy + metric) are on the ladder at once — cycle = until the
      // gram unit shows.
      var guard = 0;
      while (s.resultLine!.unit != 'g' && guard++ < 12) {
        s.equals();
      }
      expect(s.resultLine!.unit, 'g');
      expect(s.resultLine!.number, startsWith('31.10'));
    });
  });

  group('world (derived from the committed unit)', () {
    test('committing a unit sets the working world to its system', () {
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      expect(s.worldToggleEnabled, isTrue); // a metal has a met/imp axis
      s.inputDigit(2);
      s.tapMagnitude(unit(gold(), 'g')); // commit in grams
      expect(s.world, UnitWorld.metric); // world follows the committed unit
      s.allClear();
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(2);
      s.tapMagnitude(unit(gold(), 'oz t')); // commit in Troy
      expect(s.world, UnitWorld.imperial);
    });

    test('currencies are single-world (no met/imp axis)', () {
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

  group('value mode (Phase 2)', () {
    AssetGenus usd() =>
        generaOf(AssetClass.currency).firstWhere((g) => g.key == 'usd');

    void commitGoldOzt() {
      s.setBase(10);
      s.rates = RateStore();
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.tapMagnitude(unit(gold(), 'oz t'));
    }

    test('value key is inert without a rate store', () {
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.tapMagnitude(unit(gold(), 'oz t'));
      expect(s.canEnterValueMode, isFalse); // no rates injected
      s.enterValueMode();
      expect(s.valueMode, isFalse);
    });

    test('1 oz t gold → ≈ value in a target currency', () {
      commitGoldOzt();
      expect(s.canEnterValueMode, isTrue);
      s.enterValueMode();
      expect(s.valueMode, isTrue);
      expect(s.drillLevel, AssetDrillLevel.valueTargets);
      s.setValueTarget('usd');
      expect(s.valueLine!.unit, r'$');
      expect(s.valueLine!.number, '2350'); // 1 oz × 2350 USD
      s.setValueTarget('eur');
      expect(s.valueLine!.unit, '€');
      expect(s.valueLine!.number, startsWith('2162')); // 2350 × 0.92
    });

    test('currency cross-conversion: 100 USD → EUR', () {
      s.setBase(10);
      s.rates = RateStore();
      s.tapClass(AssetClass.currency);
      s.tapGenus(usd());
      s.inputDigit(1);
      s.inputDigit(0);
      s.inputDigit(0);
      s.tapMagnitude(unit(usd(), r'$'));
      s.enterValueMode();
      s.setValueTarget('eur');
      expect(s.valueLine!.number, '92'); // 100 USD × 0.92
    });

    test('editing a digit drops back out of value mode', () {
      commitGoldOzt();
      s.enterValueMode();
      expect(s.valueMode, isTrue);
      s.inputDigit(2);
      expect(s.valueMode, isFalse);
      expect(s.drillLevel, AssetDrillLevel.units);
    });

    test('toggle off returns to the exact ladder', () {
      commitGoldOzt();
      s.enterValueMode();
      s.toggleValueMode();
      expect(s.valueMode, isFalse);
    });

    void commit100Usd() {
      s.setBase(10);
      s.rates = RateStore();
      s.tapClass(AssetClass.currency);
      s.tapGenus(usd());
      s.inputDigit(1);
      s.inputDigit(0);
      s.inputDigit(0);
      s.tapMagnitude(unit(usd(), r'$'));
    }

    test('setValueTarget refuses the source currency (no self-conversion)', () {
      commit100Usd();
      s.enterValueMode();
      s.setValueTarget('usd'); // the source — must be refused
      expect(s.valueTarget, isNot('usd'));
    });

    test('re-entering value mode re-validates a stale source target', () {
      s.setBase(10);
      s.rates = RateStore();
      // First a gold quantity valued in USD.
      s.tapClass(AssetClass.metal);
      s.tapGenus(gold());
      s.inputDigit(1);
      s.tapMagnitude(unit(gold(), 'oz t'));
      s.enterValueMode();
      s.setValueTarget('usd');
      s.exitValueMode();
      // Switch to a USD source — the 'usd' target is now stale (== source).
      s.tapClass(AssetClass.currency);
      s.tapGenus(usd());
      s.inputDigit(1);
      s.tapMagnitude(unit(usd(), r'$'));
      s.enterValueMode();
      expect(s.valueTarget, isNot('usd')); // re-validated off the source
    });

    test('= is inert in value mode (no hidden ladder cycling)', () {
      commitGoldOzt();
      s.enterValueMode();
      s.equals();
      expect(s.valueMode, isTrue);
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
