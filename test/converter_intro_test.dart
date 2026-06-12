// Guards the converter-intro card (the first tab on the unit-theory page):
// every language has the three sections (can do / can't do / how to operate),
// each non-German language is genuinely translated (not a German fallback), and
// an unknown locale falls back to German.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/theory/unit_theory.dart';

const _allTags = [
  'de', 'en', 'fr', 'es', 'it', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'fa', 'ar',
];

void main() {
  test('every language has the converter intro (3 sections with content)', () {
    for (final tag in _allTags) {
      final sections = converterIntro(tag);
      expect(sections.length, 3, reason: '$tag must have 3 intro sections');
      for (final s in sections) {
        expect(s.heading, isNotEmpty, reason: '$tag has an empty heading');
        expect(s.body, isNotEmpty, reason: '$tag has an empty body');
      }
    }
  });

  test('each non-German language is genuinely translated (not fallback)', () {
    final deHeadings = converterIntro('de').map((s) => s.heading).toList();
    for (final tag in _allTags.where((t) => t != 'de')) {
      expect(
        converterIntro(tag).map((s) => s.heading).toList(),
        isNot(deHeadings),
        reason: '$tag intro headings should be translated, not German',
      );
    }
  });

  test('unknown locale falls back to German', () {
    expect(
      converterIntro('xx').map((s) => s.heading).toList(),
      converterIntro('de').map((s) => s.heading).toList(),
    );
  });
}
