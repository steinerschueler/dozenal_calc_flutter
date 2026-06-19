// Widget/smoke tests for the price chart, the sources page, and the "Kurve"
// toggle that swaps the keypad for the chart in the Werterechner.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/price_history.dart';
import 'package:dozenal_calc_flutter/price_chart.dart';
import 'package:dozenal_calc_flutter/price_sources_page.dart';

Widget _wrap(Widget child) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );

PriceChart _chart() => PriceChart(
      base: 12,
      seriesLabel: (id) => id.name,
      unitLabel: (id) => '${id.name} in gold',
      sourcesLabel: 'Quellen',
      caption: 'caption',
      eraReconstructedLabel: 'Ankerpunkt',
    );

void main() {
  group('PriceChart', () {
    for (final s in const [Size(412, 500), Size(800, 360), Size(320, 480)]) {
      testWidgets('builds at ${s.width}×${s.height}', (tester) async {
        await tester.binding.setSurfaceSize(s);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(_wrap(_chart()));
        await tester.pumpAndSettle();
        expect(find.byType(PriceChart), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('series tabs switch the active series', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart()));
      await tester.pumpAndSettle();
      // The three series tabs render (gold/silver/wheat via id.name).
      for (final id in PriceSeriesId.values) {
        expect(find.text(id.name), findsOneWidget);
      }
      await tester.tap(find.text('silver'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('tap on the plot reads a point (no crash)', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart()));
      await tester.pumpAndSettle();
      await tester.tapAt(const Offset(250, 300));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('PriceSourcesPage lists the bundled sources', (tester) async {
    await tester.pumpWidget(_wrap(const PriceSourcesPage()));
    await tester.pumpAndSettle();
    expect(find.byType(PriceSourcesPage), findsOneWidget);
    expect(find.textContaining('World Bank'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  group('Kurve toggle in the Werterechner', () {
    Widget app() => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const AssetPage(),
        );

    testWidgets('Kurve replaces the keypad with the chart; close restores it',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 915));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      expect(find.byType(AssetKeypad), findsOneWidget);
      expect(find.byType(PriceChart), findsNothing);

      // Open the expansion overlay, then tap the chart key (EN locale: "Chart").
      await tester.tap(find.bySemanticsLabel('Erweiterungsfeld öffnen'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Chart'));
      await tester.pumpAndSettle();
      expect(find.byType(PriceChart), findsOneWidget);

      // Close (×) restores the keypad.
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(find.byType(AssetKeypad), findsOneWidget);
      expect(find.byType(PriceChart), findsNothing);
    });
  });
}
