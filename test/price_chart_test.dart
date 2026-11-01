// Widget/smoke tests for the price chart, the sources page, and the "Kurve"
// toggle that swaps the keypad for the chart in the Werterechner.

import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/price_history.dart';
import 'package:dozenal_calc_flutter/price_chart.dart';
import 'package:dozenal_calc_flutter/price_sources_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: child),
);

PriceChart _chart({int base = 12}) => PriceChart(
  base: base,
  seriesLabel: (id) => id.name,
  unitLabel: (id) => '${id.name} in gold',
  readoutLabel: (id, value) => '${id.name} = $value',
  epochLabel: (epoch) => epoch.name,
  allLabel: 'all',
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

    testWidgets('opens on the newest value, stated as a real amount', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart(base: 10)));
      await tester.pumpAndSettle();
      expect(find.textContaining('2024'), findsWidgets);
      expect(find.textContaining('gold = '), findsOneWidget);
    });

    testWidgets('a tap on the plot reads the nearest point', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart()));
      await tester.pumpAndSettle();
      final before = tester.widget<Text>(find.textContaining('gold = ')).data;
      final plot = tester.getCenter(find.byType(CustomPaint).last);
      await tester.tapAt(plot);
      await tester.pumpAndSettle();
      expect(
        tester.widget<Text>(find.textContaining('gold = ')).data,
        isNot(before),
      );
    });

    testWidgets('dragging keeps a read point in view', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart(base: 10)));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(CustomPaint).last, const Offset(250, 0));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.textContaining('gold = '), findsOneWidget);
      expect(find.textContaining('2024'), findsNothing);
    });

    testWidgets('an epoch chip jumps to that period', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 600));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(_wrap(_chart(base: 10)));
      await tester.pumpAndSettle();
      await tester.tap(find.text('middleAges'));
      await tester.pumpAndSettle();
      expect(find.textContaining('1500'), findsWidgets);
      expect(find.textContaining('2024'), findsNothing);
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
    Widget app() => const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AssetPage(),
    );

    testWidgets('Kurve replaces the keypad with the chart; close restores it', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(412, 915));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      expect(find.byType(AssetKeypad), findsOneWidget);
      expect(find.byType(PriceChart), findsNothing);

      // No overlay any more — the chart key (EN locale: "Chart") is a round key
      // flanking the equals bar, tappable directly.
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
