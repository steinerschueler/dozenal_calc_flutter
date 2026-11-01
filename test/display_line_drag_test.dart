// Long display lines: the input follows its cursor, and dragging a line that
// overflows moves that line, and a line that fits stays put.

import 'package:dozenal_calc_flutter/display.dart';
import 'package:dozenal_calc_flutter/glyph_painter.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:dozenal_calc_flutter/tokens.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const Size _displaySize = Size(300, 120);
const List<CalcToken> _shortLine = [Digit(DozenalDigit.d1)];
final List<CalcToken> _longLine = List.filled(60, const Digit(DozenalDigit.d1));

Future<void> _pumpDisplay(
  WidgetTester tester, {
  required List<CalcToken> input,
  required List<CalcToken> result,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      builder: (context, child) => MediaQuery(
        // A real device's slop, smaller than the framework default.
        data: MediaQuery.of(
          context,
        ).copyWith(gestureSettings: const DeviceGestureSettings(touchSlop: 8)),
        child: child!,
      ),
      home: Scaffold(
        body: Center(
          child: SizedBox.fromSize(
            size: _displaySize,
            child: GlyphStyleScope(
              notifier: GlyphStyleNotifier(),
              child: TwoLineDisplay(
                inputBuffer: input,
                cursorPos: input.length,
                resultBuffer: result,
                onInputCursorTap: (_) {},
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

TwoLineDisplayPainter _displayPainter(WidgetTester tester) => tester
    .widgetList<CustomPaint>(find.byType(CustomPaint))
    .map((paint) => paint.painter)
    .whereType<TwoLineDisplayPainter>()
    .single;

void main() {
  group('input line follows the cursor', () {
    test('a short input stays where it is', () {
      final view = inputLineView(
        _displaySize,
        _shortLine,
        1,
        GlyphStyle.conventional,
      );
      expect(view.follow, 0);
      expect(view.maxOffset, 0);
    });

    test('a long input shifts left so the cursor at its end stays visible', () {
      final view = inputLineView(
        _displaySize,
        _longLine,
        _longLine.length,
        GlyphStyle.conventional,
      );
      expect(view.follow, greaterThan(0));
      expect(view.follow, view.maxOffset);
    });

    test('a cursor moved back to the start shows the start again', () {
      final view = inputLineView(
        _displaySize,
        _longLine,
        0,
        GlyphStyle.conventional,
      );
      expect(view.follow, 0);
      expect(view.maxOffset, greaterThan(0));
    });

    test('a tap on a shifted input lands on the digit shown there', () {
      final pos = inputCursorPosForTap(
        const Offset(0, 5),
        _displaySize,
        _longLine,
        GlyphStyle.conventional,
        cursorPos: _longLine.length,
      );
      expect(pos, greaterThan(0));
    });
  });

  group('dragging a display line', () {
    testWidgets('moves an overflowing input', (tester) async {
      await _pumpDisplay(tester, input: _longLine, result: _shortLine);
      final center = tester.getCenter(find.byType(TwoLineDisplay));
      await tester.dragFrom(
        center + const Offset(-100, -35),
        const Offset(150, 0),
      );
      await tester.pumpAndSettle();
      expect(_displayPainter(tester).inputPan, lessThan(0));
    });

    testWidgets('a moved result stays where it was left after release', (
      tester,
    ) async {
      await _pumpDisplay(tester, input: _shortLine, result: _longLine);
      final center = tester.getCenter(find.byType(TwoLineDisplay));
      await tester.dragFrom(
        center + const Offset(100, 35),
        const Offset(-150, 0),
      );
      await tester.pumpAndSettle();
      expect(_displayPainter(tester).resultPan, greaterThan(0));
    });

    testWidgets('a new result starts at its first digit again', (tester) async {
      final result = ValueNotifier<List<CalcToken>>(_longLine);
      addTearDown(result.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox.fromSize(
                size: _displaySize,
                child: GlyphStyleScope(
                  notifier: GlyphStyleNotifier(),
                  child: ValueListenableBuilder<List<CalcToken>>(
                    valueListenable: result,
                    builder: (_, buffer, _) => TwoLineDisplay(
                      inputBuffer: _shortLine,
                      cursorPos: 1,
                      resultBuffer: buffer,
                      onInputCursorTap: (_) {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      final center = tester.getCenter(find.byType(TwoLineDisplay));
      await tester.dragFrom(
        center + const Offset(100, 35),
        const Offset(-150, 0),
      );
      await tester.pump();
      expect(_displayPainter(tester).resultPan, greaterThan(0));
      result.value = List.filled(50, const Digit(DozenalDigit.d2));
      await tester.pump();
      expect(_displayPainter(tester).resultPan, 0);
    });

    testWidgets('leaves a line that fits where it is', (tester) async {
      await _pumpDisplay(tester, input: _shortLine, result: _shortLine);
      final center = tester.getCenter(find.byType(TwoLineDisplay));
      await tester.dragFrom(
        center + const Offset(100, 35),
        const Offset(-150, 0),
      );
      await tester.pumpAndSettle();
      expect(_displayPainter(tester).inputPan, 0);
      expect(_displayPainter(tester).resultPan, 0);
    });
  });
}
