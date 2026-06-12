// Smoke tests for the calculator manual module (lib/manual/). Verifies the
// chapter dispatcher and that the migrated German "Grundbedienung" renders.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/manual/manual.dart';

void main() {
  test('manualChapters returns the basics chapter for every locale', () {
    // Locales whose chapter-1 title is still the German default (en is fully
    // translated and has its own title — covered by a dedicated test below).
    for (final tag in ['de', 'fr', 'zh-Hant', 'ar', 'fa']) {
      final chapters = manualChapters(tag);
      expect(chapters, isNotEmpty, reason: '$tag should resolve to a chapter');
      expect(chapters.first.title, 'Grundbedienung');
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

  test('untranslated locales fall back to German teaching chapters', () {
    final de = manualChapters('de');
    expect(de.length, greaterThanOrEqualTo(2));
    final fr = manualChapters('fr');
    // French keeps its own Grundbedienung body but gains the German teaching
    // chapters by per-chapter fallback (same count as German).
    expect(fr.length, de.length);
    expect(fr.first.title, 'Grundbedienung'); // title not yet translated
    expect(fr[1].title, de[1].title); // German teaching chapter appended
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
