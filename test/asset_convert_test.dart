// Verifies the exact factors and conversion helpers of the asset converter
// (metals & currencies). Mirrors unit_convert_test.dart. All metal factors are
// definitional integer multiples of the grain, so they must be exact to tight
// tolerance.

import 'package:dozenal_calc_flutter/logic/asset_convert.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

Unit _u(AssetGenus g, String symbol) => g.unitBySymbol(symbol)!;

void main() {
  final gold = generaOf(AssetClass.metal).first;
  final gbp =
      generaOf(AssetClass.currency).firstWhere((g) => g.key == 'gbp');

  group('precious-metal weight factors (exact, base = kg)', () {
    test('1 troy ounce = 31.1034768 g exactly', () {
      final ozt = _u(gold, 'oz t');
      final g = _u(gold, 'g');
      expect(convert(1, ozt, g), closeTo(31.1034768, 1e-9));
    });

    test('12 troy oz = 1 troy lb (the dozenal hook)', () {
      final ozt = _u(gold, 'oz t');
      final lbt = _u(gold, 'lb t');
      expect(convert(12, ozt, lbt), closeTo(1.0, 1e-12));
      expect(convert(1, lbt, _u(gold, 'g')), closeTo(373.2417216, 1e-7));
    });

    test('1 troy oz = 20 dwt = 480 grains', () {
      final ozt = _u(gold, 'oz t');
      expect(convert(1, ozt, _u(gold, 'dwt')), closeTo(20.0, 1e-9));
      expect(convert(1, ozt, _u(gold, 'gr')), closeTo(480.0, 1e-9));
    });

    test('troy oz is 9.71% heavier than avoirdupois oz', () {
      final ratio = convert(1, _u(gold, 'oz t'), _u(gold, 'oz'));
      expect(ratio, closeTo(192 / 175, 1e-12)); // = 1.097142857…
    });

    test('troy pound is LIGHTER than avoirdupois pound (the trap)', () {
      final g = _u(gold, 'g');
      expect(convert(1, _u(gold, 'lb t'), g), lessThan(convert(1, _u(gold, 'lb'), g)));
    });

    test('all four metals share the identical weight ladder', () {
      for (final m in generaOf(AssetClass.metal)) {
        expect(convert(1, _u(m, 'oz t'), _u(m, 'g')), closeTo(31.1034768, 1e-9));
      }
    });
  });

  group('troy breakdown', () {
    test('1 troy lb + 2 oz t + 3 dwt cascades back exactly', () {
      final total = _u(gold, 'lb t').toBase(1) +
          _u(gold, 'oz t').toBase(2) +
          _u(gold, 'dwt').toBase(3);
      final b = assetBreakdown(gold, total);
      expect(b.negative, isFalse);
      final byUnit = {for (final (u, v) in b.parts) u.symbol: v};
      expect(byUnit['lb t'], closeTo(1, 1e-9));
      expect(byUnit['oz t'], closeTo(2, 1e-9));
      expect(byUnit['dwt'], closeTo(3, 1e-9));
      expect(byUnit['gr'], closeTo(0, 1e-6));
    });
  });

  group('currency denominations (exact, single-world)', () {
    test('GBP £sd: 1 £ = 20 sh = 240 d', () {
      expect(convert(1, _u(gbp, '£'), _u(gbp, 'sh')), closeTo(20, 1e-12));
      expect(convert(1, _u(gbp, '£'), _u(gbp, 'd')), closeTo(240, 1e-12));
      expect(convert(1, _u(gbp, 'sh'), _u(gbp, 'd')), closeTo(12, 1e-12));
    });

    test('GBP breakdown of £1 7sh 6d round-trips', () {
      final total = _u(gbp, '£').toBase(1) +
          _u(gbp, 'sh').toBase(7) +
          _u(gbp, 'd').toBase(6);
      final b = assetBreakdown(gbp, total);
      final byUnit = {for (final (u, v) in b.parts) u.symbol: v};
      expect(byUnit['£'], closeTo(1, 1e-9));
      expect(byUnit['sh'], closeTo(7, 1e-9));
      expect(byUnit['d'], closeTo(6, 1e-6));
    });

    test('currencies are single-world (no cross-world bracket partner)', () {
      expect(assetBracketPartner(gbp, _u(gbp, '£')), isNull);
    });
  });

  group('metal bracket partner (cross-world)', () {
    test('troy oz maps to a metric partner', () {
      final partner = assetBracketPartner(gold, _u(gold, 'oz t'));
      expect(partner, isNotNull);
      expect(partner!.world, UnitWorld.metric);
    });
  });

  group('catalogue shape', () {
    test('metal has four genera, currency at most seven', () {
      expect(generaOf(AssetClass.metal).length, 4);
      expect(generaOf(AssetClass.currency).length, lessThanOrEqualTo(7));
    });

    test('every breakdown symbol exists and factors strictly descend', () {
      for (final genera in kAssetCatalogue.values) {
        for (final g in genera) {
          if (!g.hasBreakdown) continue;
          final units = g.breakdownUnits();
          for (var i = 1; i < units.length; i++) {
            expect(units[i].a, lessThan(units[i - 1].a),
                reason: '${g.key} breakdown not descending');
          }
        }
      }
    });
  });

  test('debug: factor table prints (no-op assertion)', () {
    if (kDebugMode) {
      // keeps the import meaningful without noisy output in CI
    }
    expect(true, isTrue);
  });
}
