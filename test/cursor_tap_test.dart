// Tap-to-position-cursor (the fine red line): state.moveCursorTo + the
// display hit-test inputCursorPosForTap. Spec: docs/unit-converter.md (shared
// editing feature) — main calculator part.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/display.dart';
import 'package:dozenal_calc_flutter/state.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:dozenal_calc_flutter/tokens.dart';

void main() {
  group('state.moveCursorTo', () {
    test('positions, clamps, and clears result focus', () {
      final s = DozenalCalcState();
      s.handleClick(const Digit(DozenalDigit.d1));
      s.handleClick(const Digit(DozenalDigit.d2));
      s.handleClick(const Digit(DozenalDigit.d3));
      expect(s.cursorPos, 3);
      expect(s.inputBuffer.length, 3);

      s.moveCursorTo(1);
      expect(s.cursorPos, 1);
      expect(s.resultFieldActive, isFalse);

      s.moveCursorTo(99);
      expect(s.cursorPos, 3); // clamped to length
      s.moveCursorTo(-5);
      expect(s.cursorPos, 0); // clamped to 0
    });
  });

  group('inputCursorPosForTap', () {
    const size = Size(300, 120);
    final buf = <CalcToken>[
      const Digit(DozenalDigit.d1),
      const Digit(DozenalDigit.d2),
      const Digit(DozenalDigit.d3),
    ];

    testWidgets('maps taps on the input line to the nearest gap',
        (tester) async {
      // far left → before first glyph
      expect(
          inputCursorPosForTap(
              const Offset(0, 20), size, buf, GlyphStyle.custom),
          0);
      // far right → after last glyph
      expect(
          inputCursorPosForTap(
              const Offset(10000, 20), size, buf, GlyphStyle.custom),
          3);
      // empty buffer → 0
      expect(
          inputCursorPosForTap(
              const Offset(50, 20), size, const [], GlyphStyle.custom),
          0);
    });

    testWidgets('returns null for taps below the input line', (tester) async {
      // y = 110 is in the result line (lineH ≈ 56 for height 120)
      expect(
          inputCursorPosForTap(
              const Offset(50, 110), size, buf, GlyphStyle.custom),
          isNull);
    });
  });
}
