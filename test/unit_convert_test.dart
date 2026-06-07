// Pins the unit-converter factors and the conversion/bracket logic.
// Spec: docs/unit-converter.md

import 'package:flutter_test/flutter_test.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/logic/unit_convert.dart';

void main() {
  Unit u(UnitCategory c, String symbol) {
    final unit = kUnitCatalogue[c]!.unitBySymbol(symbol);
    expect(unit, isNotNull, reason: 'no unit "$symbol" in $c');
    return unit!;
  }

  double conv(UnitCategory c, double v, String from, String to) =>
      convert(v, u(c, from), u(c, to));

  group('linear conversions', () {
    test('length — imperial internal', () {
      expect(conv(UnitCategory.dist, 12, 'in', 'ft'), closeTo(1, 1e-12));
      expect(conv(UnitCategory.dist, 3, 'ft', 'yd'), closeTo(1, 1e-12));
      expect(conv(UnitCategory.dist, 1760, 'yd', 'mi'), closeTo(1, 1e-9));
    });

    test('length — cross to metric', () {
      expect(conv(UnitCategory.dist, 1, 'mi', 'km'), closeTo(1.609344, 1e-9));
      expect(conv(UnitCategory.dist, 1, 'in', 'cm'), closeTo(2.54, 1e-12));
      expect(conv(UnitCategory.dist, 1, 'm', 'ft'), closeTo(3.280839895, 1e-6));
    });

    test('weight', () {
      expect(conv(UnitCategory.weight, 16, 'oz', 'lb'), closeTo(1, 1e-12));
      expect(conv(UnitCategory.weight, 1, 'lb', 'kg'),
          closeTo(0.45359237, 1e-12));
      expect(conv(UnitCategory.weight, 1, 'st', 'lb'), closeTo(14, 1e-9));
      expect(conv(UnitCategory.weight, 1, 'ton', 'lb'), closeTo(2000, 1e-6));
      // troy ounce ≈ 31.103 g
      expect(conv(UnitCategory.weight, 1, 'oz t', 'g'),
          closeTo(31.1034768, 1e-6));
    });

    test('space — cubic (no fluid units)', () {
      expect(conv(UnitCategory.space, 1, 'cu ft', 'cu in'),
          closeTo(1728, 1e-6));
      expect(conv(UnitCategory.space, 1, 'cu yd', 'cu ft'), closeTo(27, 1e-9));
      expect(conv(UnitCategory.space, 1, 'm³', 'cm³'), closeTo(1e6, 1));
      // fluid measures moved to `liquid`
      expect(kUnitCatalogue[UnitCategory.space]!.unitBySymbol('gallon'),
          isNull);
    });

    test('pressure', () {
      expect(conv(UnitCategory.press, 1, 'atm', 'Pa'),
          closeTo(101325, 1e-6));
      expect(conv(UnitCategory.press, 1, 'bar', 'Pa'),
          closeTo(100000, 1e-6));
      expect(conv(UnitCategory.press, 1, 'psi', 'kPa'),
          closeTo(6.894757293, 1e-6));
    });

    test('energy', () {
      expect(conv(UnitCategory.work, 1, 'kWh', 'J'), closeTo(3.6e6, 1));
      expect(conv(UnitCategory.work, 1, 'kcal', 'cal'), closeTo(1000, 1e-9));
    });

    test('count — dozenal ladder', () {
      expect(conv(UnitCategory.count, 1, 'ggr', 'items'),
          closeTo(1728, 1e-9));
      expect(conv(UnitCategory.count, 1, 'gr', 'dz'), closeTo(12, 1e-9));
    });

    test('angle', () {
      expect(conv(UnitCategory.angle, 1, 'turn', '°'), closeTo(360, 1e-9));
      expect(conv(UnitCategory.angle, 1, 'sign', '°'), closeTo(30, 1e-9));
      expect(conv(UnitCategory.angle, 1, 'turn', 'gon'), closeTo(400, 1e-9));
    });
  });

  group('affine temperature', () {
    test('°C ↔ °F anchors', () {
      expect(conv(UnitCategory.temp, 100, '°C', '°F'), closeTo(212, 1e-9));
      expect(conv(UnitCategory.temp, 0, '°C', '°F'), closeTo(32, 1e-9));
      expect(conv(UnitCategory.temp, -40, '°C', '°F'), closeTo(-40, 1e-9));
    });
    test('via kelvin', () {
      expect(conv(UnitCategory.temp, 0, '°C', 'K'), closeTo(273.15, 1e-9));
      expect(conv(UnitCategory.temp, 212, '°F', 'K'), closeTo(373.15, 1e-9));
    });
  });

  group('liquid volume (US)', () {
    test('gallon ladder', () {
      expect(conv(UnitCategory.liquid, 1, 'gallon', 'quart'), closeTo(4, 1e-9));
      expect(conv(UnitCategory.liquid, 1, 'gallon', 'pint'), closeTo(8, 1e-9));
      expect(conv(UnitCategory.liquid, 1, 'gallon', 'fl oz'),
          closeTo(128, 1e-6));
      expect(conv(UnitCategory.liquid, 1, 'quart', 'fl oz'), closeTo(32, 1e-6));
    });
    test('cross to metric', () {
      expect(conv(UnitCategory.liquid, 1, 'gallon', 'L'),
          closeTo(3.785411784, 1e-9));
      expect(conv(UnitCategory.liquid, 1, 'fl oz', 'mL'),
          closeTo(29.5735296, 1e-6));
    });
  });

  group('round trips', () {
    test('every unit survives a there-and-back', () {
      for (final def in kUnitCatalogue.values) {
        final ref = def.units.first;
        for (final unit in def.units) {
          final there = convert(7.5, ref, unit);
          final back = convert(there, unit, ref);
          expect(back, closeTo(7.5, 1e-6),
              reason: '${def.category} ${ref.symbol}→${unit.symbol}→back');
        }
      }
    });
  });

  group('bracket partner', () {
    Unit? partner(UnitCategory c, String s) => bracketPartner(c, u(c, s));

    test('nearest-magnitude pairs (length)', () {
      expect(partner(UnitCategory.dist, 'in')?.symbol, 'cm');
      expect(partner(UnitCategory.dist, 'ft')?.symbol, 'm');
      expect(partner(UnitCategory.dist, 'yd')?.symbol, 'm');
      expect(partner(UnitCategory.dist, 'mi')?.symbol, 'km');
      expect(partner(UnitCategory.dist, 'm')?.symbol, 'yd'); // 1 m ≈ 1.094 yd
    });
    test('weight pairs', () {
      expect(partner(UnitCategory.weight, 'oz')?.symbol, 'g');
      expect(partner(UnitCategory.weight, 'lb')?.symbol, 'kg');
      expect(partner(UnitCategory.weight, 'ton')?.symbol, 't');
    });
    test('special-case categories', () {
      expect(partner(UnitCategory.temp, '°F')?.symbol, '°C');
      expect(partner(UnitCategory.temp, 'K')?.symbol, '°F');
      expect(partner(UnitCategory.liquid, 'gallon')?.symbol, 'L'); // nearest
      expect(partner(UnitCategory.price, 'sh')?.symbol, '£dec');
      // count → other world's base unit (plain total)
      expect(partner(UnitCategory.count, 'dz')?.symbol, 'ones');
      expect(partner(UnitCategory.count, 'ten')?.symbol, 'items');
    });
    test('time has no cross-world bracket', () {
      expect(bracketPartner(UnitCategory.time, u(UnitCategory.time, 'h')),
          isNull);
      expect(bracketValue(UnitCategory.time, u(UnitCategory.time, 'h'), 11),
          isNull);
    });
    test('bracketValue computes the partner quantity', () {
      // 1 mi shows ≈ 1.609 km in the bracket
      expect(bracketValue(UnitCategory.dist, u(UnitCategory.dist, 'mi'), 1),
          closeTo(1.609344, 1e-9));
    });
  });

  group('= ladder stepping', () {
    test('walks the visible world and wraps', () {
      final imp = kUnitCatalogue[UnitCategory.dist]!
          .ladderFor(UnitWorld.imperial);
      var cur = imp.first; // 'in'
      final seen = <String>[];
      for (var i = 0; i < imp.length; i++) {
        seen.add(cur.symbol);
        cur = nextInLadder(UnitCategory.dist, UnitWorld.imperial, cur);
      }
      expect(seen, imp.map((u) => u.symbol).toList());
      expect(cur.symbol, imp.first.symbol); // wrapped
    });

    test('metric ladder is separate', () {
      final start = u(UnitCategory.dist, 'mm');
      final next = nextInLadder(UnitCategory.dist, UnitWorld.metric, start);
      expect(next.symbol, 'cm');
    });
  });

  group('ladders by world', () {
    test('dist splits into imperial / metric', () {
      final imp = kUnitCatalogue[UnitCategory.dist]!
          .ladderFor(UnitWorld.imperial)
          .map((u) => u.symbol);
      final met = kUnitCatalogue[UnitCategory.dist]!
          .ladderFor(UnitWorld.metric)
          .map((u) => u.symbol);
      expect(imp, containsAll(['in', 'ft', 'mi']));
      expect(met, containsAll(['mm', 'cm', 'm', 'km']));
      expect(imp, isNot(contains('m')));
    });

    test('time is single-world (same ladder both)', () {
      final def = kUnitCatalogue[UnitCategory.time]!;
      expect(def.ladderFor(UnitWorld.imperial).map((u) => u.symbol),
          def.ladderFor(UnitWorld.metric).map((u) => u.symbol));
    });

    test('every non-time category has ≤7 units per world (keypad slots)', () {
      for (final def in kUnitCatalogue.values) {
        if (def.singleWorld) continue;
        expect(def.ladderFor(UnitWorld.imperial).length, lessThanOrEqualTo(7),
            reason: '${def.category} imperial');
        expect(def.ladderFor(UnitWorld.metric).length, lessThanOrEqualTo(7),
            reason: '${def.category} metric');
      }
    });
  });

  group('breakdown (imperial mixed-radix)', () {
    String render(UnitCategory c, double si) {
      final b = breakdown(c, si);
      final body = b.parts
          .map((p) => '${p.$2.toStringAsFixed(p == b.parts.last ? 2 : 0)} '
              '${p.$1.symbol}')
          .join(' ');
      return '${b.negative ? '-' : ''}$body';
    }

    test('length 53 in → 1 yd 1 ft 5 in', () {
      final si = 53 * 0.0254; // 53 inches in metres
      expect(render(UnitCategory.dist, si), '0 mi 1 yd 1 ft 5.00 in');
    });

    test('time 3725 s → 1 h 2 min 5 s', () {
      expect(render(UnitCategory.time, 3725),
          '0 week 0 d 1 h 2 min 5.00 s');
    });

    test('price 250 d → 1 £ 0 sh 10 d', () {
      final si = 250 / 240; // 250 old pence in pounds
      expect(render(UnitCategory.price, si), '1 £ 0 sh 10.00 d');
    });

    test('negative total keeps sign', () {
      final b = breakdown(UnitCategory.dist, -53 * 0.0254);
      expect(b.negative, isTrue);
      expect(b.parts.last.$1.symbol, 'in');
    });

    test('non-cascade categories return empty', () {
      expect(breakdown(UnitCategory.temp, 300).parts, isEmpty);
      expect(breakdown(UnitCategory.press, 1000).parts, isEmpty);
    });

    test('every cascade resolves and is strictly descending', () {
      for (final def in kUnitCatalogue.values) {
        if (!def.hasBreakdown) continue;
        final units = def.breakdownUnits(); // throws if a symbol is missing
        for (var i = 1; i < units.length; i++) {
          expect(units[i].a, lessThan(units[i - 1].a),
              reason: '${def.category} cascade not descending at $i');
        }
      }
    });
  });
}
