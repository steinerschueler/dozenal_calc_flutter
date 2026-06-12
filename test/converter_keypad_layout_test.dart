// Layout smoke tests for the converter keypad / page. Mirrors
// keypad_layout_test.dart: we don't assert pixel geometry, only that nothing
// overflows across the three height regimes and a matrix of extreme Android
// aspect ratios (tall 20:9+, landscape, small phones, foldable cover, split-
// screen). The converter must survive the same shapes as the main calculator.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/converter_keypad.dart';
import 'package:dozenal_calc_flutter/converter_page.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/unit_data.dart';

Widget _pageApp() => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ConverterPage(),
    );

Widget _keypad(double height, {bool overlayOpen = false, bool active = false}) {
  final state = ConverterState();
  if (overlayOpen) state.toggleOverlay();
  if (active) {
    state.inputDigit(1);
    state.tapCategory(UnitCategory.dist); // 7 magnitudes → fills both columns
  }
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: height,
          child: ConverterKeypad(state: state),
        ),
      ),
    ),
  );
}

void main() {
  group('keypad height regimes', () {
    for (final h in [700.0, 520.0, 380.0, 260.0]) {
      testWidgets('builds at height $h (idle)', (tester) async {
        await tester.pumpWidget(_keypad(h));
        expect(tester.takeException(), isNull);
      });
      testWidgets('builds at height $h (overlay)', (tester) async {
        await tester.pumpWidget(_keypad(h, overlayOpen: true));
        expect(tester.takeException(), isNull);
      });
      testWidgets('builds at height $h (dist active, 7 magnitudes)',
          (tester) async {
        await tester.pumpWidget(_keypad(h, active: true));
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('full page across extreme aspect ratios', () {
    // width × height in logical px.
    const sizes = <Size>[
      Size(412, 915), // common 20:9 phone
      Size(360, 800), // ~20:9 budget phone
      Size(412, 960), // ~21:9 tall
      Size(320, 480), // small / minSdk floor
      Size(280, 653), // foldable cover display (narrow)
      Size(412, 400), // split-screen (short)
      Size(915, 412), // landscape
      Size(800, 1280), // tablet portrait
    ];

    for (final s in sizes) {
      testWidgets('ConverterPage builds at ${s.width}×${s.height}',
          (tester) async {
        await tester.binding.setSurfaceSize(s);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(_pageApp());
        await tester.pump(const Duration(milliseconds: 50));
        expect(tester.takeException(), isNull);
      });
    }
  });
}
