// Guards the unit-converter long-press descriptions (lib/unit_descriptions/):
// every catalogue unit has a non-empty description in every language, the
// languages are genuinely translated (not just German fallback), the
// category+symbol keying distinguishes colliding symbols, and unknown locales
// fall back to German.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/unit_descriptions/unit_descriptions.dart';

const _allTags = [
  'de', 'en', 'fr', 'es', 'it', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'fa', 'ar',
];

void main() {
  test('every catalogue unit has a non-empty description in every language', () {
    for (final tag in _allTags) {
      for (final def in kUnitCatalogue.values) {
        for (final u in def.units) {
          final d = unitDescription(def.category, u.symbol, tag);
          expect(d, isNotNull,
              reason: 'missing: $tag ${def.category.name}/${u.symbol}');
          expect(d, isNotEmpty,
              reason: 'empty: $tag ${def.category.name}/${u.symbol}');
        }
      }
    }
  });

  test('each non-German language is genuinely translated (not all fallback)', () {
    // Sample units across categories; their text must differ from German,
    // proving the language file is wired and not silently falling back.
    const samples = [
      (UnitCategory.count, 'dz'),
      (UnitCategory.angle, 'turn'),
      (UnitCategory.liquid, 'gill'),
      (UnitCategory.weight, 'lb'),
    ];
    for (final tag in _allTags.where((t) => t != 'de')) {
      for (final (cat, sym) in samples) {
        expect(
          unitDescription(cat, sym, tag),
          isNot(unitDescription(cat, sym, 'de')),
          reason: '$tag/$sym should be translated, not German',
        );
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
