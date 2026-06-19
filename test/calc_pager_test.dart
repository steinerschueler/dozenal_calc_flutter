// The calculator ↔ unit-converter pager: the converter is page 2 of a
// horizontal PageView (swipe left from the main calculator, swipe right to
// come back), with the Ans/CONV result bridge carrying values across.
//
// Runs at the default 800×600 test surface (landscape → Breit keypads), where
// every set is inline: the converter's Ans key (Set 6) and the main keypad's
// CONV key (Set 10) are visible without opening an overlay.

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/asset_keypad.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_keypad.dart';
import 'package:dozenal_calc_flutter/display.dart';
import 'package:dozenal_calc_flutter/info_pages.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/main.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

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
      'intro_seen_v4': true,
      'numeral_system_v1': ?numeralSystem,
    });
    await tester.pumpWidget(const DozenalCalcApp());
    await tester.pumpAndSettle();
    await flushPagePeek(tester); // boot pulse
  }

  Future<void> swipeToConverter(WidgetTester tester) async {
    await tester.fling(
      find.byType(TwoLineDisplay),
      const Offset(-400, 0),
      1000,
    );
    await tester.pumpAndSettle();
  }

  Future<void> swipeToCalculator(WidgetTester tester) async {
    await tester.fling(
      find.byType(ConverterDisplay),
      const Offset(400, 0),
      1000,
    );
    await tester.pumpAndSettle();
  }

  String converterInput(WidgetTester tester) => tester
      .widget<ConverterDisplay>(find.byType(ConverterDisplay))
      .topLine
      .number;

  // Both the unit converter (page 2) and the asset converter (page 3) reuse
  // ConverterDisplay, so a page is identified by its keypad type. The asset
  // input is the display under AssetBody.
  Future<void> swipePager(WidgetTester tester, double dx) async {
    await tester.fling(find.byType(PageView), Offset(dx, 0), 1000);
    await tester.pumpAndSettle();
  }

  String assetInput(WidgetTester tester) => tester
      .widget<ConverterDisplay>(find.descendant(
        of: find.byType(AssetBody),
        matching: find.byType(ConverterDisplay),
      ))
      .topLine
      .number;

  testWidgets('boots on the main calculator; swipe left/right pages between '
      'the two calculators', (tester) async {
    await bootApp(tester);
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(ConverterDisplay), findsNothing);

    await swipeToConverter(tester);
    expect(find.byType(ConverterDisplay), findsOneWidget);
    expect(find.byType(TwoLineDisplay), findsNothing);

    await swipeToCalculator(tester);
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(ConverterDisplay), findsNothing);
  });

  testWidgets('physical keyboard routes to the visible calculator',
      (tester) async {
    await bootApp(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
    await tester.pump();
    var display =
        tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(display.inputBuffer, [const Digit(DozenalDigit.d5)]);

    // On the converter page the same keys drive the converter…
    await swipeToConverter(tester);
    await tester.sendKeyEvent(LogicalKeyboardKey.digit7);
    await tester.pump();
    expect(converterInput(tester), '7');

    // …and the main calculator's buffer stays untouched.
    await swipeToCalculator(tester);
    display = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(display.inputBuffer, [const Digit(DozenalDigit.d5)]);
  });

  testWidgets('result bridge round trip: calc → converter (Ans) → calc (CONV)',
      (tester) async {
    await bootApp(tester, numeralSystem: 'doz'); // asserts dozenal digits

    // 5 × 3 = → 13 (dozenal 13 = decimal 15).
    await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
    await tester.sendKeyEvent(LogicalKeyboardKey.numpadMultiply);
    await tester.sendKeyEvent(LogicalKeyboardKey.digit3);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    final display =
        tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(display.resultBuffer, [
      const Digit(DozenalDigit.d1),
      const Digit(DozenalDigit.d3),
    ]);

    // Converter: Ans pulls the answer as the pending number (world base 12).
    await swipeToConverter(tester);
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
    await swipeToCalculator(tester);
    await tester
        .tap(find.bySemanticsLabel("Insert the unit converter's result"));
    await tester.pump();
    final after = tester.widget<TwoLineDisplay>(find.byType(TwoLineDisplay));
    expect(after.inputBuffer, [
      const Digit(DozenalDigit.d1),
      const Digit(DozenalDigit.d3),
    ]);
  });

  testWidgets('the info list carries both manuals; the converter nav entry '
      'is gone', (tester) async {
    await bootApp(tester);
    await tester.tap(find.byTooltip('theory chapters'));
    await tester.pumpAndSettle();

    // Restructured list: two manual sections at the top, no "Unit
    // converter" navigation entry anymore (swipe + page peek carry that).
    expect(find.text('Using the main calculator'), findsOneWidget);
    expect(find.text('Using the unit converter'), findsOneWidget);
    expect(find.text('Unit converter'), findsNothing);

    // The converter manual opens its chapters (now fully translated — the
    // EN locale shows the English titles, no German fallback).
    await tester.tap(find.text('Using the unit converter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('The second calculator'));
    await tester.pumpAndSettle();
    expect(find.byType(ManualChapterPage), findsOneWidget);
    expect(find.byType(InfoListPage), findsNothing);
  });

  testWidgets('page peek pulses on swipe, blocks nothing, and unmounts',
      (tester) async {
    await bootApp(tester); // helper already flushed the boot pulse …
    expect(find.text('Main calculator'), findsNothing); // … fully unmounted

    await swipeToConverter(tester);
    // The swipe pulse shows both page cards.
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
  });

  testWidgets('a second left swipe reaches the asset converter (page 3); '
      'physical keys route there', (tester) async {
    await bootApp(tester);
    expect(find.byType(AssetKeypad), findsNothing);

    await swipePager(tester, -400); // → unit converter
    expect(find.byType(ConverterKeypad), findsOneWidget);
    await flushPagePeek(tester);

    await swipePager(tester, -400); // → asset converter
    expect(find.byType(AssetKeypad), findsOneWidget);
    expect(find.byType(ConverterKeypad), findsNothing);
    await flushPagePeek(tester);

    // Physical keys now drive the asset page, not the hidden calculators.
    await tester.sendKeyEvent(LogicalKeyboardKey.digit6);
    await tester.pump();
    expect(assetInput(tester), '6');

    // Swipe all the way back to the main calculator.
    await swipePager(tester, 400);
    await flushPagePeek(tester);
    await swipePager(tester, 400);
    expect(find.byType(TwoLineDisplay), findsOneWidget);
    expect(find.byType(AssetKeypad), findsNothing);
  });

  testWidgets('page peek shows all three page cards', (tester) async {
    await bootApp(tester);
    await swipePager(tester, -400); // pulse fires on the swipe
    // The minimap renders one card per page (the asset card may be clipped
    // off-screen but is still in the tree).
    expect(find.text('Main calculator'), findsOneWidget);
    expect(find.text('Unit converter'), findsOneWidget);
    expect(find.text('Value calculator'), findsOneWidget);
    await flushPagePeek(tester);
  });
}
