// Guards the converter-intro card (the first tab on the unit-theory page):
// German has the three sections (can do / can't do / how to operate), English
// is genuinely translated, and an unknown locale falls back to German.

import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/theory/unit_theory.dart';

void main() {
  test('German converter intro has 3 sections with content', () {
    final de = converterIntro('de');
    expect(de.length, 3);
    for (final s in de) {
      expect(s.heading, isNotEmpty);
      expect(s.body, isNotEmpty);
    }
  });

  test('English converter intro is translated (differs from German)', () {
    expect(
      converterIntro('en').map((s) => s.heading).toList(),
      isNot(converterIntro('de').map((s) => s.heading).toList()),
    );
  });

  test('unknown locale falls back to German', () {
    expect(
      converterIntro('xx').map((s) => s.heading).toList(),
      converterIntro('de').map((s) => s.heading).toList(),
    );
  });
}
