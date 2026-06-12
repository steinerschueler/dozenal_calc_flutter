// Guards the new "Anzahl" (count) unit-theory card: it must be the first tab,
// have German prose + sources, and fall back to German for not-yet-translated
// locales so the tab is never empty.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/theory/unit_theory.dart';

void main() {
  test('count is the first theory tab', () {
    expect(kTheoryAreas.first, UnitCategory.count);
  });

  test('German count article has prose sections and sources', () {
    final sections = unitTheory(UnitCategory.count, 'de');
    expect(sections, isNotEmpty);
    expect(sections.length, 3);
    for (final s in sections) {
      expect(s.heading, isNotEmpty);
      expect(s.body, isNotEmpty);
    }
    expect(unitSources(UnitCategory.count, 'de'), isNotEmpty);
  });

  test('untranslated locales fall back to German (tab never empty)', () {
    final de = unitTheory(UnitCategory.count, 'de');
    for (final tag in ['en', 'fr', 'ar', 'ja', 'zh-Hant']) {
      final r = unitTheory(UnitCategory.count, tag);
      expect(r, isNotEmpty, reason: '$tag count tab must not be empty');
      expect(r.length, de.length);
      expect(unitSources(UnitCategory.count, tag), isNotEmpty);
    }
  });
}
