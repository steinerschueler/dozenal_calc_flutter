// Tests for the "Empfehlungen" module (lib/recommendations/): the chapter
// dispatcher, the data shape (pros/cons/links), structural fidelity of all 14
// translations against the German template, and that a chapter page renders.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/recommendations/recommendations.dart';
import 'package:dozenal_calc_flutter/recommendations/recommendations_page.dart';

const _allTags = [
  'de', 'en', 'fr', 'es', 'it', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'fa', 'ar',
];

void main() {
  test('German has the seven platform chapters in order', () {
    final ch = recommendationChapters('de');
    expect(ch.length, 7);
    expect(ch.map((c) => c.title).toList(), [
      'Physisch',
      'Android — Play Store',
      'Android — F-Droid',
      'iOS',
      'macOS',
      'Linux',
      'Windows',
    ]);
  });

  test('every locale has 7 chapters with calcs 3,2,2,2,3,4,4', () {
    for (final tag in _allTags) {
      final ch = recommendationChapters(tag);
      expect(ch.length, 7, reason: '$tag chapter count');
      expect(
        ch.map((c) => c.calcs.length).toList(),
        [3, 2, 2, 2, 3, 4, 4],
        reason: '$tag calc counts per chapter',
      );
    }
  });

  test('every calculator entry is well-formed in every locale', () {
    for (final tag in _allTags) {
      for (final chapter in recommendationChapters(tag)) {
        expect(chapter.intro, isNotEmpty, reason: '$tag intro');
        expect(chapter.verdict, isNotEmpty, reason: '$tag verdict');
        for (final c in chapter.calcs) {
          expect(c.name, isNotEmpty, reason: '$tag name');
          expect(c.tag, isNotEmpty, reason: '$tag/${c.name} tag');
          expect(c.blurb, isNotEmpty, reason: '$tag/${c.name} blurb');
          expect(c.pros, isNotEmpty, reason: '$tag/${c.name} pros');
          expect(c.cons, isNotEmpty, reason: '$tag/${c.name} cons');
          expect(c.url, startsWith('https://'),
              reason: '$tag/${c.name} url');
        }
      }
    }
  });

  test('translations preserve the German structure (URLs + bullet counts)', () {
    // The URL set and the per-calc pros/cons counts must match German exactly —
    // catches a translator dropping/adding a bullet or altering a link.
    final de = recommendationChapters('de');
    final deUrls = [
      for (final ch in de) for (final c in ch.calcs) c.url,
    ];
    for (final tag in _allTags) {
      final ch = recommendationChapters(tag);
      final urls = [
        for (final c in ch) for (final x in c.calcs) x.url,
      ];
      expect(urls, deUrls, reason: '$tag URL set must match German verbatim');
      for (var i = 0; i < de.length; i++) {
        for (var j = 0; j < de[i].calcs.length; j++) {
          expect(ch[i].calcs[j].pros.length, de[i].calcs[j].pros.length,
              reason: '$tag ch$i calc$j pros count');
          expect(ch[i].calcs[j].cons.length, de[i].calcs[j].cons.length,
              reason: '$tag ch$i calc$j cons count');
        }
      }
    }
  });

  test('the "Physical" chapter title is translated in every language', () {
    // Platform titles (iOS, macOS, …) are proper nouns and stay; but the first
    // chapter ("Physisch") must be translated away from the German string.
    final dePhysical = recommendationChapters('de').first.title; // 'Physisch'
    for (final tag in _allTags.where((t) => t != 'de')) {
      expect(recommendationChapters(tag).first.title, isNot(dePhysical),
          reason: '$tag should translate the "Physical" chapter title');
    }
  });

  test('zh-Hant resolves distinctly from zh', () {
    final hant = recommendationChapters('zh-Hant');
    final hans = recommendationChapters('zh');
    expect(hant.length, 7);
    expect(hans.length, 7);
    // Traditional vs Simplified first-chapter titles differ.
    expect(hant.first.title, isNot(hans.first.title));
  });

  testWidgets('a chapter page renders its cards (names, pros, link host)', (
    tester,
  ) async {
    final physical = recommendationChapters('de').first;
    await tester.pumpWidget(MaterialApp(home: RecChapterPage(physical)));
    expect(find.text('Casio fx-5800P'), findsOneWidget);
    expect(find.text('SwissMicros DM42n'), findsOneWidget);
    expect(find.text('swissmicros.com'), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
