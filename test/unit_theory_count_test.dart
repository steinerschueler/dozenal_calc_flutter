// Guards the "Anzahl" (count) unit-theory card: it must be the first tab,
// every language must carry the prose (3 sections) + sources, each non-German
// language must be genuinely translated (not a silent German fallback), and an
// unknown locale must still fall back to German so the tab is never empty.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/logic/unit_data.dart';
import 'package:dozenal_calc_flutter/theory/unit_theory.dart';

const _allTags = [
  'de', 'en', 'fr', 'es', 'it', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'fa', 'ar',
];

void main() {
  test('count is the first theory tab', () {
    expect(kTheoryAreas.first, UnitCategory.count);
  });

  test('every language has the count article (3 sections + sources)', () {
    for (final tag in _allTags) {
      final sections = unitTheory(UnitCategory.count, tag);
      expect(sections.length, 3, reason: '$tag must have 3 count sections');
      for (final s in sections) {
        expect(s.heading, isNotEmpty, reason: '$tag has an empty heading');
        expect(s.body, isNotEmpty, reason: '$tag has an empty body');
      }
      expect(unitSources(UnitCategory.count, tag), isNotEmpty,
          reason: '$tag has no count sources');
    }
  });

  test('each non-German language is genuinely translated (not fallback)', () {
    final deHeadings =
        unitTheory(UnitCategory.count, 'de').map((s) => s.heading).toList();
    for (final tag in _allTags.where((t) => t != 'de')) {
      final headings =
          unitTheory(UnitCategory.count, tag).map((s) => s.heading).toList();
      expect(headings, isNot(deHeadings),
          reason: '$tag count headings should be translated, not German');
    }
  });

  test('unknown locale falls back to German', () {
    final de = unitTheory(UnitCategory.count, 'de').map((s) => s.heading);
    final xx = unitTheory(UnitCategory.count, 'xx').map((s) => s.heading);
    expect(xx.toList(), de.toList());
  });
}
