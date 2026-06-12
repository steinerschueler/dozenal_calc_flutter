// Guards the unit-converter long-press descriptions (lib/unit_descriptions/):
// every catalogue unit must have a non-empty German one-liner, the
// category+symbol keying must distinguish colliding symbols, and unknown
// locales fall back to German.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/unit_descriptions/unit_descriptions.dart';

void main() {
  test('every catalogue unit has a non-empty German description', () {
    for (final def in kUnitCatalogue.values) {
      for (final u in def.units) {
        final d = unitDescription(def.category, u.symbol, 'de');
        expect(d, isNotNull,
            reason: 'missing: ${def.category.name}/${u.symbol}');
        expect(d, isNotEmpty,
            reason: 'empty: ${def.category.name}/${u.symbol}');
      }
    }
  });

  test('keying by category+symbol distinguishes colliding symbols', () {
    // 'd' = day in time but penny in price.
    final day = unitDescription(UnitCategory.time, 'd', 'de');
    final penny = unitDescription(UnitCategory.price, 'd', 'de');
    expect(day, isNotNull);
    expect(penny, isNotNull);
    expect(day, isNot(penny));
  });

  test('unknown locale falls back to German', () {
    expect(
      unitDescription(UnitCategory.angle, 'turn', 'xx'),
      unitDescription(UnitCategory.angle, 'turn', 'de'),
    );
  });
}
