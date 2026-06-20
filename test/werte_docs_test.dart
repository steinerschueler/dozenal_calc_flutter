// Structure tests for the two new Werterechner text deliverables: the
// "Bedienung des Werterechners" manual (assetManualChapters) and the
// "Wertetheorie" theory block (werteChapters / theoryBlocks). Phase 1 ships
// German only; the other 13 languages fall back to German until translated.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/manual/manual.dart';
import 'package:dozenal_calc_flutter/theory/theory_blocks.dart';
import 'package:dozenal_calc_flutter/theory/werte_theory.dart';

const _allTags = [
  'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga',
  'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'ar',
];

void main() {
  group('Bedienung des Werterechners (manual)', () {
    test('German has six chapters with the expected bookends', () {
      final de = assetManualChapters('de');
      expect(de.length, 6);
      expect(de.first.title, 'Der dritte Rechner');
      expect(de.last.title, 'Kurve: der historische Vergleich');
    });

    test('Phase 1: every other locale falls back to the German six', () {
      final de = assetManualChapters('de');
      for (final tag in _allTags) {
        final own = assetManualChapters(tag);
        expect(own.length, de.length, reason: '$tag should have six chapters');
        expect(own.first.title, de.first.title,
            reason: '$tag falls back to German until translated');
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
      expect(de.last.title, 'Spekulatives (mit Vorsicht)');
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

    test('Phase 1: every other locale falls back to the German set', () {
      final de = werteChapters('de');
      for (final tag in _allTags) {
        final own = werteChapters(tag);
        expect(own.length, de.length, reason: '$tag should have 27 chapters');
        expect(own.first.title, de.first.title,
            reason: '$tag falls back to German until translated');
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
}
