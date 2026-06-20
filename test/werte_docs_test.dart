// Structure tests for the two new Werterechner text deliverables: the
// "Bedienung des Werterechners" manual (assetManualChapters) and the
// "Wertetheorie" theory block (werteChapters / theoryBlocks). German and
// English are authored; the other 12 languages fall back to German.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/manual/manual.dart';
import 'package:dozenal_calc_flutter/theory/prose_chapter.dart';
import 'package:dozenal_calc_flutter/theory/theory_blocks.dart';
import 'package:dozenal_calc_flutter/theory/werte_illustrations.dart';
import 'package:dozenal_calc_flutter/theory/werte_theory.dart';

// All supported BCP-47 tags. A language either has its own authored set or
// falls back to German — either way the structure must match German exactly.
const _allTags = [
  'de', 'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'ar',
];

List<String> _figureIds(List<ProseChapter> chapters) => [
      for (final c in chapters)
        for (final s in c.sections)
          if (s.illustrationId != null) s.illustrationId!,
    ];

void main() {
  group('Bedienung des Werterechners (manual)', () {
    test('German has six chapters with the expected bookends', () {
      final de = assetManualChapters('de');
      expect(de.length, 6);
      expect(de.first.title, 'Der dritte Rechner');
      expect(de.last.title, 'Kurve: der historische Vergleich');
    });

    test('every locale yields six asset-manual chapters (own or fallback)', () {
      for (final tag in _allTags) {
        expect(assetManualChapters(tag).length, 6, reason: tag);
      }
    });

    test('script-aware tag is accepted (zh-Hant resolves, not empty)', () {
      expect(assetManualChapters('zh-Hant'), isNotEmpty);
      expect(assetManualChapters('zh'), isNotEmpty);
    });

    testWidgets('the German asset-manual chapters render', (tester) async {
      for (final chapter in assetManualChapters('de')) {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chapter.body,
              ),
            ),
          ),
        ));
        expect(tester.takeException(), isNull,
            reason: '${chapter.title} should render');
      }
    });
  });

  group('Wertetheorie (theory)', () {
    test('German is the full 27-chapter set with the expected bookends', () {
      final de = werteChapters('de');
      expect(de.length, 27);
      expect(de.first.title, 'Was ist Wert?');
      expect(de.last.title, 'Strittige Deutungen');
      // Titles are unique (no accidental duplicate from the assembly).
      expect(de.map((c) => c.title).toSet().length, de.length);
    });

    test('every chapter has sections; most carry cited sources', () {
      final de = werteChapters('de');
      for (final c in de) {
        expect(c.sections, isNotEmpty, reason: '${c.title} needs sections');
      }
      final withSources = de.where((c) => c.sources.isNotEmpty).length;
      expect(withSources, greaterThanOrEqualTo(20),
          reason: 'the factual chapters should be sourced');
    });

    test('every locale: 27 chapters, section/source/figure parity to German',
        () {
      final de = werteChapters('de');
      final deIds = _figureIds(de);
      for (final tag in _allTags) {
        final own = werteChapters(tag);
        expect(own.length, de.length, reason: '$tag chapter count');
        for (var i = 0; i < de.length; i++) {
          expect(own[i].sections.length, de[i].sections.length,
              reason: '$tag chapter $i section count');
          expect(own[i].sources.length, de[i].sources.length,
              reason: '$tag chapter $i source count');
        }
        expect(_figureIds(own), deIds, reason: '$tag figure tags');
      }
    });

    test('Wertetheorie is its own block, placed after the Einheitentheorie', () {
      final l = lookupAppLocalizations(const Locale('de'));
      // It is intentionally NOT among theoryBlocks (those four prose blocks
      // render before the Einheitentheorie entry); the info list renders the
      // Wertetheorie block last, after that entry.
      final blocks = theoryBlocks(l, 'de');
      expect(blocks.length, 4);
      expect(blocks.map((b) => b.title), isNot(contains('Wertetheorie')));
      final werte = werteTheoryBlock(l, 'de');
      expect(werte.title, 'Wertetheorie');
      expect(werte.chapters.length, 27);
      // Carries imageId slots (werte/$i) through to the refs.
      expect(werte.chapters.last.imageId, isNotNull);
    });
  });

  group('Wertetheorie inline figures', () {
    List<String> taggedIds() => [
          for (final c in werteChapters('de'))
            for (final s in c.sections)
              if (s.illustrationId != null) s.illustrationId!,
        ];

    test('exactly twelve sections carry a distinct illustration id', () {
      final ids = taggedIds();
      expect(ids.length, 12);
      expect(ids.toSet().length, 12, reason: 'no figure is tagged twice');
    });

    test('every tagged id resolves to a figure; null/unknown does not', () {
      for (final id in taggedIds()) {
        expect(inlineTheoryIllustration(id), isNotNull,
            reason: '$id should resolve to a figure');
      }
      expect(inlineTheoryIllustration(null), isNull);
      expect(inlineTheoryIllustration('werte/does-not-exist'), isNull);
    });

    testWidgets('every tagged figure paints without exception', (tester) async {
      for (final id in taggedIds().toSet()) {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(width: 360, child: inlineTheoryIllustration(id)),
            ),
          ),
        ));
        await tester.pump();
        expect(tester.takeException(), isNull, reason: '$id should paint');
      }
    });
  });

  group('English translation (parity with German)', () {
    test('asset manual: six EN chapters with translated titles', () {
      final en = assetManualChapters('en');
      final de = assetManualChapters('de');
      expect(en.length, de.length);
      expect(en.first.title, 'The third calculator');
      expect(en.last.title, 'Curve: the historical comparison');
      expect(en.first.title, isNot(de.first.title), reason: 'not a DE fallback');
    });

    test('theory: 27 EN chapters with translated, unique titles', () {
      final en = werteChapters('en');
      expect(en.length, 27);
      expect(en.first.title, 'What Is Value?');
      expect(en.last.title, 'Contested Interpretations');
      expect(en.map((c) => c.title).toSet().length, en.length);
    });

    test('theory: section/source counts + figure tags match German', () {
      final en = werteChapters('en');
      final de = werteChapters('de');
      for (var i = 0; i < de.length; i++) {
        expect(en[i].sections.length, de[i].sections.length,
            reason: 'chapter $i (${de[i].title}) section count');
        expect(en[i].sources.length, de[i].sources.length,
            reason: 'chapter $i (${de[i].title}) source count');
        // Source URLs/tiers are carried over from German verbatim.
        expect(en[i].sources.map((s) => s.url).toList(),
            de[i].sources.map((s) => s.url).toList(),
            reason: 'chapter $i source urls');
      }
      final enIds = [
        for (final c in en)
          for (final s in c.sections)
            if (s.illustrationId != null) s.illustrationId!,
      ];
      final deIds = [
        for (final c in de)
          for (final s in c.sections)
            if (s.illustrationId != null) s.illustrationId!,
      ];
      expect(enIds, deIds, reason: 'illustrationId tags identical to German');
    });

    testWidgets('the English asset-manual chapters render', (tester) async {
      for (final chapter in assetManualChapters('en')) {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chapter.body,
              ),
            ),
          ),
        ));
        expect(tester.takeException(), isNull, reason: chapter.title);
      }
    });
  });
}
