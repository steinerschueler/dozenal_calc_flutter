// The rate editor (RatesPage): renders the snapshot, writes overrides on edit,
// and resets back to the snapshot per-row and globally.

import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/rate_store.dart';
import 'package:dozenal_calc_flutter/rates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _app(RateStore store) => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RatesPage(store: store),
    );

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('renders the snapshot rates', (tester) async {
    final store = RateStore();
    await store.load();
    await tester.pumpWidget(_app(store));
    await tester.pumpAndSettle();
    // The EUR snapshot rate (0.92) and the gold spot (2350) are shown.
    expect(find.text('0.92'), findsOneWidget);
    expect(find.text('2350'), findsOneWidget);
  });

  testWidgets('editing a field writes an override', (tester) async {
    final store = RateStore();
    await store.load();
    await tester.pumpWidget(_app(store));
    await tester.pumpAndSettle();

    // The pivot (USD) row is skipped, so EUR is the first currency field.
    await tester.enterText(find.byType(TextField).at(0), '0.9');
    await tester.pump();
    expect(store.currencyRate('eur'), closeTo(0.9, 1e-9));
    expect(store.hasCurrencyOverride('eur'), isTrue);
  });

  testWidgets('reset-all clears every override', (tester) async {
    // Tall surface so the whole rate list (incl. the bottom reset-all button)
    // is laid out without scrolling.
    await tester.binding.setSurfaceSize(const Size(600, 2000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final store = RateStore();
    await store.load();
    store.setMetalOverride('gold', 3000);
    await tester.pumpWidget(_app(store));
    await tester.pumpAndSettle();

    final l = AppLocalizations.of(tester.element(find.byType(RatesPage)));
    await tester.tap(find.text(l.assetRatesResetAll));
    await tester.pumpAndSettle();
    expect(store.hasAnyOverride, isFalse);
    expect(store.metalSpot('gold'), 2350);
  });
}
