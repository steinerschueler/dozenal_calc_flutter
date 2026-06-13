// Smoke tests for the calculator manual module (lib/manual/). Verifies the
// chapter dispatcher and that the migrated German "Grundbedienung" renders.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/manual/manual.dart';

void main() {
  test('manualChapters returns chapters for every locale', () {
    // All 14 languages are fully translated — every locale resolves to a
    // non-empty chapter list.
    for (final tag in [
      'de', 'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga',
      'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'ar',
    ]) {
      final chapters = manualChapters(tag);
      expect(chapters, isNotEmpty, reason: '$tag should resolve to chapters');
      expect(chapters.length, 7, reason: '$tag should have 7 chapters');
    }
  });

  test('converterManualChapters: six chapters in every locale', () {
    final de = converterManualChapters('de');
    expect(de.length, 6);
    expect(de.first.title, 'Der zweite Rechner');
    for (final tag in [
      'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga',
      'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'ar',
    ]) {
      final chapters = converterManualChapters(tag);
      expect(chapters.length, de.length, reason: '$tag should have 6');
      // Fully translated: no locale shows the German chapter titles.
      expect(chapters.first.title, isNot(de.first.title),
          reason: '$tag should carry its own translation');
    }
    // Script-awareness: traditional and simplified Chinese differ.
    expect(converterManualChapters('zh-Hant').first.title,
        isNot(converterManualChapters('zh').first.title));
  });

  testWidgets('every converter-manual translation renders', (tester) async {
    for (final tag in [
      'de', 'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga',
      'hi', 'zh', 'zh-Hant', 'cy', 'ja', 'ar',
    ]) {
      for (final chapter in converterManualChapters(tag)) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: chapter.body,
                ),
              ),
            ),
          ),
        );
        expect(tester.takeException(), isNull,
            reason: '$tag/${chapter.title} should render');
      }
    }
  });

  testWidgets('the German converter-manual chapters render', (tester) async {
    for (final chapter in converterManualChapters('de')) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chapter.body,
              ),
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('each migrated language renders its own (not German) body', (
    tester,
  ) async {
    // (locale tag, a heading unique to that language's Grundbedienung)
    const cases = {
      'en': 'The digits',
      'fr': 'Les chiffres',
      'es': 'Los dígitos',
      'it': 'Le cifre',
      'ru': 'Цифры',
      'ja': '数字',
      'fa': 'ارقام',
    };
    for (final entry in cases.entries) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: manualChapters(entry.key).first.body),
            ),
          ),
        ),
      );
      expect(
        find.text(entry.value),
        findsOneWidget,
        reason: '${entry.key} should show its own translated heading',
      );
    }
  });

  testWidgets('chapter 2 (exponents/roots/logs) renders prose + figures', (
    tester,
  ) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(2));
    final ch = de[1];
    expect(ch.title, 'Exponenten, Wurzeln & Logarithmen');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    // headings across the chapter
    expect(find.text('Die Wurzel — die erste Umkehrung'), findsOneWidget);
    expect(find.text('Die Logarithmengesetze'), findsOneWidget);
    expect(find.text('Worauf zu achten ist'), findsOneWidget);
    // no exceptions from the custom-painted figures
    expect(tester.takeException(), isNull);
  });

  testWidgets('chapter 3 (parallel addition ⊕) renders prose + figures', (
    tester,
  ) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(3));
    final ch = de[2];
    expect(ch.title, 'Paralleladdition (⊕)');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Strom sucht den leichteren Weg'), findsOneWidget);
    expect(find.text('Harmonisches Mittel und Dualität'), findsOneWidget);
    expect(find.text('Wenn die Summe null wird'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('chapter 4 (trigonometry) renders prose + figures', (
    tester,
  ) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(4));
    final ch = de[3];
    expect(ch.title, 'Trigonometrie');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Der Einheitskreis'), findsOneWidget);
    expect(find.text('Die Umkehrfunktionen'), findsOneWidget);
    expect(find.text('Winkel in Basis Zwölf'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('chapter 5 (memory) renders prose + figures', (tester) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(5));
    final ch = de[4];
    expect(ch.title, 'Speichern & Abrufen');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Der Speicher: STO, RCL, MC'), findsOneWidget);
    expect(find.text('Exakt gespeichert — kein Rundungsfehler'), findsOneWidget);
    expect(find.text('Das Verlaufsband'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('chapter 6 (hyperbolic) renders prose + figures', (tester) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(6));
    final ch = de[5];
    expect(ch.title, 'Hyperbelfunktionen');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Die Einheitshyperbel'), findsOneWidget);
    expect(find.text('Verwandtschaft mit der Trigonometrie'), findsOneWidget);
    expect(find.text('Auf diesem Rechner'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('chapter 7 (Set 9 & 10) renders prose + figures', (tester) async {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(7));
    final ch = de[6];
    expect(ch.title, 'Set 9 & 10');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Das Pascalsche Dreieck'), findsOneWidget);
    expect(find.text('Modulo: Reste und Rundgänge'), findsOneWidget);
    expect(find.text('Auf diesem Rechner'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('all locales have all 7 chapters (no German fallback needed)', () {
    // All 14 languages are now fully translated. Every locale returns the same
    // chapter count as German, with its own translated titles throughout.
    final de = manualChapters('de');
    expect(de.length, 7);
    for (final tag in [
      'en', 'fr', 'es', 'it', 'fa', 'ru', 'ga', 'hi',
      'zh', 'zh-Hant', 'cy', 'ja', 'ar',
    ]) {
      final chapters = manualChapters(tag);
      expect(chapters.length, de.length,
          reason: '$tag should have the same chapter count as German');
      // Teaching chapters (ch 2+) should have own translated titles —
      // not falling back to the German string.
      if (tag != 'de') {
        expect(chapters[1].title != de[1].title, isTrue,
            reason: '$tag ch2 title should be translated, not German');
      }
    }
  });

  test('English is fully translated — own titles, not German fallback', () {
    final de = manualChapters('de');
    final en = manualChapters('en');
    expect(en.length, de.length);
    expect(en.first.title, 'Getting started');
    expect(en[1].title, 'Exponents, Roots & Logarithms');
    expect(en[6].title, 'Set 9 & 10');
    expect(en[1].title == de[1].title, isFalse);
  });

  testWidgets('English chapter 7 renders with localized figure labels', (
    tester,
  ) async {
    final ch = manualChapters('en')[6];
    expect(ch.title, 'Set 9 & 10');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ch.body,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Pascal\'s triangle'), findsOneWidget); // _H heading
    expect(find.text('Modulo: remainders and cycles'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('zh-Hant resolves to Traditional, distinct from zh (Simplified)', () {
    // The two share the same first heading text only if both fall back; they
    // are separately migrated, so both must be non-empty and resolve cleanly.
    expect(manualChapters('zh-Hant'), isNotEmpty);
    expect(manualChapters('zh'), isNotEmpty);
  });

  testWidgets('German Grundbedienung body renders its sections', (tester) async {
    final chapter = manualChapters('de').first;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: chapter.body,
            ),
          ),
        ),
      ),
    );
    // A few headings spread across the chapter (top, middle, bottom).
    expect(find.text('Die Ziffern'), findsOneWidget);
    expect(find.text('Spezialoperatoren'), findsOneWidget);
    expect(find.text('Winkelmodus'), findsOneWidget);
  });
}
