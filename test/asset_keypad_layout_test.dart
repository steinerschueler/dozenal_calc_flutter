// Layout smoke tests for the asset keypad / page. Mirrors
// converter_keypad_layout_test.dart: no pixel assertions, only that nothing
// overflows across the height regimes, the three drill levels and a matrix of
// extreme Android aspect ratios.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/asset_data.dart';

Widget _pageApp() => MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const AssetPage(),
    );

enum _Drill { classes, metalGenera, metalUnits, currencyGenera, currencyUnits }

Widget _keypad(double height, {_Drill drill = _Drill.classes}) {
  final state = AssetState();
  final metal = generaOf(AssetClass.metal).first; // gold
  final gbp = generaOf(AssetClass.currency).firstWhere((g) => g.key == 'gbp');
  switch (drill) {
    case _Drill.classes:
      break;
    case _Drill.metalGenera:
      state.tapClass(AssetClass.metal);
    case _Drill.metalUnits:
      state.tapClass(AssetClass.metal);
      state.inputDigit(1);
      state.tapGenus(metal); // 6 imperial units fill both columns
    case _Drill.currencyGenera:
      state.tapClass(AssetClass.currency); // 7 genera + header = 8 cells
    case _Drill.currencyUnits:
      state.tapClass(AssetClass.currency);
      state.inputDigit(1);
      state.tapGenus(gbp); // £/sh/d/p
  }
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: height,
          child: AssetKeypad(state: state),
        ),
      ),
    ),
  );
}

void main() {
  group('keypad height regimes × drill levels', () {
    for (final h in [700.0, 520.0, 380.0, 260.0]) {
      for (final d in _Drill.values) {
        testWidgets('builds at height $h (${d.name})', (tester) async {
          await tester.pumpWidget(_keypad(h, drill: d));
          expect(tester.takeException(), isNull);
        });
      }
    }
  });

  group('full page across extreme aspect ratios', () {
    const sizes = <Size>[
      Size(412, 915),
      Size(360, 800),
      Size(412, 960),
      Size(320, 480),
      Size(280, 653),
      Size(412, 400),
      Size(915, 412),
      Size(800, 1280),
    ];

    for (final s in sizes) {
      testWidgets('AssetPage builds at ${s.width}×${s.height}', (tester) async {
        await tester.binding.setSurfaceSize(s);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(_pageApp());
        await tester.pump(const Duration(milliseconds: 50));
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('drill-down via taps on the real keypad', () {
    testWidgets('class → genus → unit tiles commit a term', (tester) async {
      await tester.binding.setSurfaceSize(const Size(412, 915));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final state = AssetState();
      // No label resolvers → tiles show the fallback labels (class.name /
      // genus.key / unit symbol). Wrap in an AnimatedBuilder so taps rebuild.
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 412,
            height: 760,
            child: AnimatedBuilder(
              animation: state,
              builder: (_, _) => AssetKeypad(state: state),
            ),
          ),
        ),
      ));

      await tester.tap(find.text('metal')); // class tile (fallback label)
      await tester.pumpAndSettle();
      expect(state.drillLevel, AssetDrillLevel.genera);

      await tester.tap(find.text('gold')); // genus tile (fallback = key)
      await tester.pumpAndSettle();
      expect(state.drillLevel, AssetDrillLevel.units);

      // Digit keys are CustomPaint (not Text) — drive the number via the state,
      // then tap the troy-ounce unit tile.
      state.inputDigit(1);
      await tester.pumpAndSettle();
      await tester.tap(find.text('oz t'));
      await tester.pumpAndSettle();

      expect(state.termCount, 1);
      expect(state.resultLine!.unit, 'oz t');
      expect(tester.takeException(), isNull);
    });
  });
}
