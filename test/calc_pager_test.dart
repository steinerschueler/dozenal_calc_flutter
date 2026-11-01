// The calculator ↔ unit-converter pager: the converter is page 2 of a
// PageView that changes through the switch key, with the Ans/CONV result bridge carrying values across.
//
// Runs at the default 800×600 test surface (landscape → Breit keypads), where
// every set is inline: the converter's Ans key (Set 6) and the main keypad's
// CONV key (Set 10) are visible without opening an overlay.

import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_keypad.dart';
import 'package:dozenal_calc_flutter/display.dart';
import 'package:dozenal_calc_flutter/info_pages.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/main.dart';
import 'package:dozenal_calc_flutter/tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  /// Lets the transient page-peek indicator (1050 ms hold + fade) finish and
  /// unmount, so its labels can't collide with later finders.
  Future<void> flushPagePeek(WidgetTester tester) async {
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pumpAndSettle();
  }

  // Defaults boot decimal now; tests that assert dozenal digits opt in via
  // numeralSystem: 'doz'.
  Future<void> bootApp(WidgetTester tester, {String? numeralSystem}) async {
    SharedPreferences.setMockInitialValues({
      'intro_seen_v5': true,
      'numeral_system_v1': ?numeralSystem,
    });
    await tester.pumpWidget(const DozenalCalcApp());
    await tester.pumpAndSettle();
    await flushPagePeek(tester); // boot pulse
  }

  Future<void> tapSwitchKey(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.swap_horiz).hitTestable().first);
    await tester.pumpAndSettle();
  }

  // The switch key steps forward through all three calculators.
  Future<void> showConverter(WidgetTester tester) => tapSwitchKey(tester);

  Future<void> showCalculatorFromConverter(WidgetTester tester) async {
    await tapSwitchKey(tester);
    await tapSwitchKey(tester);
  }

  String converterInput(WidgetTester tester) => tester
      .widget<ConverterDisplay>(find.byType(ConverterDisplay))
      .topLine
      .number;

  // Both the unit converter (page 2) and the asset converter (page 3) reuse
  // ConverterDisplay, so a page is identified by its keypad type. The asset
  // input is the display under AssetBody.
  Future<void> stepCalculators(WidgetTester tester, int steps) async {
    for (var i = 0; i < steps; i++) {
      await tapSwitchKey(tester);
    }
  }

  String assetInput(WidgetTester tester) => tester
      .widget<ConverterDisplay>(
        find.descendant(
          of: find.byType(AssetBody),
          matching: find.byType(ConverterDisplay),
        ),
      )
      .topLine
      .number;

  testWidgets('boots on the main calculator; switch key pages between '
      'the two calculators', (tester) async {
    await bootApp(tester);
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(ConverterDisplay), findsNothing);

    await showConverter(tester);
    expect(find.byType(ConverterDisplay), findsOneWidget);
    expect(find.byType(TwoLineDisplay), findsNothing);

    await showCalculatorFromConverter(tester);
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(ConverterDisplay), findsNothing);
  });

  testWidgets('a finger sliding across the keys leaves the page in place', (
    tester,
  ) async {
    await bootApp(tester);
    await tester.fling(find.byType(PageView), const Offset(-400, 0), 1000);
    await tester.pumpAndSettle();
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(ConverterDisplay), findsNothing);
  });

  testWidgets('physical keyboard routes to the visible calculator', (
    tester,
  ) async {
    await bootApp(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
    await tester.pump();
    var display = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(display.inputBuffer, [const Digit(DozenalDigit.d5)]);

    // On the converter page the same keys drive the converter…
    await showConverter(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.digit7);
    await tester.pump();
    expect(converterInput(tester), '7');

    // …and the main calculator's buffer stays untouched.
    await showCalculatorFromConverter(tester);
    display = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(display.inputBuffer, [const Digit(DozenalDigit.d5)]);
  });

  testWidgets(
    'result bridge round trip: calc → converter (Ans) → calc (CONV)',
    (tester) async {
      await bootApp(tester, numeralSystem: 'doz'); // asserts dozenal digits

      // 5 × 3 = → 13 (dozenal 13 = decimal 15).
      await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
      await tester.sendKeyEvent(LogicalKeyboardKey.numpadMultiply);
      await tester.sendKeyEvent(LogicalKeyboardKey.digit3);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      final display = tester.widget<TwoLineDisplay>(
        find.byType(TwoLineDisplay),
      );
      expect(display.resultBuffer, [
        const Digit(DozenalDigit.d1),
        const Digit(DozenalDigit.d3),
      ]);

      // Converter: Ans pulls the answer as the pending number (world base 12).
      await showConverter(tester);
      await tester.tap(find.bySemanticsLabel('Ergebnis des Rechners einfügen'));
      await tester.pump();
      expect(converterInput(tester), '13');

      // Commit it as 13 ft (category first taps fine after Ans — the pending
      // number survives the category switch).
      await tester.tap(find.text('Length'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('ft'));
      await tester.pump();
      expect(converterInput(tester), '13 ft');

      // Back on the calculator, CONV inserts the converter's shown result
      // (13 ft → the same 13 in dozenal digits).
      await showCalculatorFromConverter(tester);
      await tester.tap(
        find.bySemanticsLabel("Insert the unit converter's result"),
      );
      await tester.pump();
      final after = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
      expect(after.inputBuffer, [
        const Digit(DozenalDigit.d1),
        const Digit(DozenalDigit.d3),
      ]);
    },
  );

  testWidgets(
    'asset bridge round trip: calc → asset (Ans) → calc (CONV fallback)',
    (tester) async {
      await bootApp(tester, numeralSystem: 'doz'); // asserts dozenal digits

      // 5 × 3 = → 13 (dozenal 13 = decimal 15).
      await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
      await tester.sendKeyEvent(LogicalKeyboardKey.numpadMultiply);
      await tester.sendKeyEvent(LogicalKeyboardKey.digit3);
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      // Two presses of the switch key → asset converter. The drill's Ans key (class level)
      // pulls the calc answer as the pending number.
      await stepCalculators(tester, 1);
      await stepCalculators(tester, 1);
      expect(find.byType(AssetKeypad), findsOneWidget);
      await tester.tap(find.bySemanticsLabel('Ergebnis des Rechners einfügen'));
      await tester.pump();
      expect(assetInput(tester), '13');

      // Commit as 13 oz t of gold (drill: class → genus → unit; the pending
      // number survives the drill navigation).
      await tester.tap(find.text('Precious metal'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Gold'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('oz t'));
      await tester.pump();
      expect(assetInput(tester), '13 oz t');

      // Back on the calculator (switch key), the CONV tap falls back to
      // the asset result — the unit converter holds nothing.
      await stepCalculators(tester, 2);
      await stepCalculators(tester, 2);
      await tester.tap(
        find.bySemanticsLabel("Insert the unit converter's result"),
      );
      await tester.pump();
      final after = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
      expect(after.inputBuffer, [
        const Digit(DozenalDigit.d1),
        const Digit(DozenalDigit.d3),
      ]);
    },
  );

  testWidgets('the menu unfolds the manuals of all three calculators; there is '
      'no converter nav entry', (tester) async {
    await bootApp(tester);
    await tester.tap(find.byTooltip('theory chapters'));
    await tester.pumpAndSettle();

    // No "Unit converter" navigation entry at the top level: the switch key
    // carries that. The manual groups all three calculators under one entry.
    expect(find.text('Unit converter'), findsNothing);
    await tester.tap(find.text('How to use'));
    await tester.pumpAndSettle();
    expect(find.text('Main calculator'), findsOneWidget);
    expect(find.text('Value calculator'), findsOneWidget);

    // The converter manual opens its chapters (now fully translated — the
    // EN locale shows the English titles, no German fallback).
    await tester.tap(find.text('Unit converter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('The second calculator'));
    await tester.pumpAndSettle();
    expect(find.byType(ManualChapterPage), findsOneWidget);
    expect(find.byType(InfoListPage), findsNothing);
  });

  testWidgets(
    'page peek pulses on a calculator change, blocks nothing, and unmounts',
    (tester) async {
      await bootApp(tester); // helper already flushed the boot pulse …
      expect(find.text('Main calculator'), findsNothing); // … fully unmounted

      await showConverter(tester);
      // The pulse shows both page cards.
      expect(find.text('Main calculator'), findsOneWidget);
      expect(find.text('Unit converter'), findsOneWidget);

      // Input passes straight through the overlay: a tap on a key under the
      // indicator region works (Length expands its magnitude ladder) …
      await tester.tap(find.text('Length'));
      await tester.pump();
      expect(find.text('ft'), findsOneWidget);
      // … and so do physical keys.
      await tester.sendKeyEvent(LogicalKeyboardKey.digit4);
      await tester.pump();
      expect(converterInput(tester), '4');

      // After the hold + fade the overlay unmounts entirely.
      await flushPagePeek(tester);
      expect(find.text('Main calculator'), findsNothing);
      expect(find.text('Unit converter'), findsNothing);
    },
  );

  testWidgets(
    'a second press of the switch key reaches the asset converter (page 3); '
    'physical keys route there',
    (tester) async {
      await bootApp(tester);
      expect(find.byType(AssetKeypad), findsNothing);

      await stepCalculators(tester, 1); // → unit converter
      expect(find.byType(ConverterKeypad), findsOneWidget);
      await flushPagePeek(tester);

      await stepCalculators(tester, 1); // → asset converter
      expect(find.byType(AssetKeypad), findsOneWidget);
      expect(find.byType(ConverterKeypad), findsNothing);
      await flushPagePeek(tester);

      // Physical keys now drive the asset page, not the hidden calculators.
      await tester.sendKeyEvent(LogicalKeyboardKey.digit6);
      await tester.pump();
      expect(assetInput(tester), '6');

      // Step all the way back to the main calculator.
      await stepCalculators(tester, 2);
      await flushPagePeek(tester);
      await stepCalculators(tester, 2);
      expect(find.byType(TwoLineDisplay), findsOneWidget);
      expect(find.byType(AssetKeypad), findsNothing);
    },
  );

  testWidgets('page peek carries all three page names', (tester) async {
    await bootApp(tester);
    await stepCalculators(tester, 1); // pulse fires on the change
    // The dots indicator stacks one crossfading name per page — all three
    // stay in the tree (the inactive ones at opacity 0).
    expect(find.text('Main calculator'), findsOneWidget);
    expect(find.text('Unit converter'), findsOneWidget);
    expect(find.text('Value calculator'), findsOneWidget);
    await flushPagePeek(tester);
  });
}
