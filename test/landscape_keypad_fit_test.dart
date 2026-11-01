// A phone held sideways has little height. All three calculators must show
// every key row and their equals row at once, without scrolling.

import 'package:dozenal_calc_flutter/app_layout.dart';
import 'package:dozenal_calc_flutter/asset_page.dart';
import 'package:dozenal_calc_flutter/asset_state.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_page.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/key_face.dart';
import 'package:dozenal_calc_flutter/keypad.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

const Size _phoneLandscape = Size(705, 332);

Future<void> _pump(WidgetTester tester, Widget page) async {
  tester.view.physicalSize = _phoneLandscape;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: GlyphStyleScope(notifier: GlyphStyleNotifier(), child: page),
    ),
  );
  await tester.pump();
}

void _expectNoVerticalScrolling(WidgetTester tester) {
  final vertical = tester
      .widgetList<SingleChildScrollView>(find.byType(SingleChildScrollView))
      .where((view) => view.scrollDirection == Axis.vertical);
  expect(vertical, isEmpty);
  expect(tester.takeException(), isNull);
}

void main() {
  testWidgets('the main keypad fits a low screen without scrolling', (
    tester,
  ) async {
    final bodyHeight = _phoneLandscape.height - 4;
    final keypadHeight = bodyHeight - displayHeightFor(bodyHeight) - 2;
    await _pump(
      tester,
      Scaffold(
        body: Center(
          child: SizedBox(
            width: _phoneLandscape.width - 24,
            height: keypadHeight,
            child: Keypad(onTap: (_) {}),
          ),
        ),
      ),
    );
    _expectNoVerticalScrolling(tester);
  });

  testWidgets('the unit converter fits a low screen without scrolling', (
    tester,
  ) async {
    await _pump(tester, const ConverterPage());
    _expectNoVerticalScrolling(tester);
  });

  testWidgets('the value calculator fits a low screen without scrolling', (
    tester,
  ) async {
    await _pump(tester, const AssetPage());
    _expectNoVerticalScrolling(tester);
  });

  group('value calculator on a low screen', () {
    testWidgets('the display shows each conversion beside its number', (
      tester,
    ) async {
      await _pump(
        tester,
        const Scaffold(
          body: SizedBox(
            width: 600,
            height: 80,
            child: ConverterDisplay(
              topLine: ConverterLine('12 ft', bracket: '3.66 m'),
              resultLine: null,
              worldLabel: 'DEZ',
              sideBySide: true,
            ),
          ),
        ),
      );
      final painted = tester.renderObjectList<RenderCustomPaint>(
        find.descendant(
          of: find.byType(ConverterDisplay),
          matching: find.byType(CustomPaint),
        ),
      );
      final tops = painted
          .where((box) => box.hasSize && box.size.width > 0)
          .map((box) => box.localToGlobal(Offset.zero))
          .toList();
      expect(tops, hasLength(greaterThanOrEqualTo(2)));
      expect(tops.first.dy, tops[1].dy);
      expect(tops[1].dx, isNot(tops.first.dx));
    });

    testWidgets('the open chart keeps the series choice left of the display', (
      tester,
    ) async {
      final state = AssetState()..toggleChart();
      await _pump(tester, Scaffold(body: AssetBody(state: state)));
      expect(tester.takeException(), isNull);
      expect(
        tester.getTopRight(find.text('Gold')).dx,
        lessThan(tester.getTopLeft(find.byType(ConverterDisplay)).dx),
      );
    });
  });

  group('landscape column widths', () {
    final layout = BreitColumnLayout.solve(
      columnChars: const [1, 1, 3, 4, 4],
      buttonHeight: 40,
      available: 500,
    );

    test('a column with a longer label is wider', () {
      expect(layout.widthFor(4), greaterThan(layout.widthFor(1)));
    });

    test('every label fits its column at the shared size', () {
      for (final chars in [1, 3, 4]) {
        expect(
          chars * keyFontCharacterWidth * layout.labelFont,
          lessThanOrEqualTo(layout.widthFor(chars) - keyLabelSideSpace),
        );
      }
    });

    test('the shared label size shrinks until the columns fit', () {
      const columns = [4, 4, 4, 4, 4, 4, 4, 4];
      const available = 480.0;
      final tight = BreitColumnLayout.solve(
        columnChars: columns,
        buttonHeight: 40,
        available: available,
      );
      expect(tight.labelFont, lessThan(layout.labelFont));
      expect(
        columns.map(tight.widthFor).reduce((a, b) => a + b),
        lessThanOrEqualTo(available),
      );
    });
  });
}
