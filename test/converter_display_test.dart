// Guards the unit-converter display's glyph rendering: it shares the main
// display's "Ziffern im Display" preference (GlyphStyleScope.styleOf) and must
// render in both custom (dozenal glyphs overlaid on invisible digit cells) and
// conventional (ASCII) modes, plus without a scope (fallback to custom).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';

Widget _host(GlyphStyleNotifier n) => MaterialApp(
      home: Scaffold(
        body: GlyphStyleScope(
          notifier: n,
          child: const SizedBox(
            height: 140,
            width: 360,
            child: ConverterDisplay(
              // Includes ten (A) and eleven (B) so both glyph paths exercise.
              topLine: ConverterLine('1A.5', bracket: '2.3 m'),
              resultLine: ConverterLine('4B', unit: 'kg', bracket: '94.7 lb'),
              worldLabel: 'DOZ',
              inputCaret: 4,
            ),
          ),
        ),
      ),
    );

void main() {
  testWidgets('renders in both custom and conventional glyph styles',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final n = GlyphStyleNotifier();
    // The notifier defaults to conventional, so the custom overlay path must be
    // selected explicitly — otherwise this test would only ever exercise the
    // conventional path twice (audit L-glyphtest).
    await n.setStyle(GlyphStyle.custom);

    await tester.pumpWidget(_host(n));
    expect(find.text('DOZ'), findsOneWidget);
    expect(tester.takeException(), isNull, reason: 'custom mode');

    await n.setStyle(GlyphStyle.conventional);
    await tester.pumpWidget(_host(n));
    await tester.pump();
    expect(tester.takeException(), isNull, reason: 'conventional mode');
  });

  test('custom overlay glyphifies number digits but not unit letters (M2)', () {
    // Result "AB BTU" → text "= AB BTU". The number's A/B become dozenal
    // glyphs; the same 'B' inside the unit "BTU" must stay ASCII (audit M2).
    final cells = debugResultGlyphCells(
        const ConverterLine('AB', unit: 'BTU'), GlyphStyle.custom);
    // indices: 0'=' 1' ' 2'A' 3'B' 4' ' 5'B' 6'T' 7'U'
    expect(cells[2], 10); // 'A' in the number → dozenal ten
    expect(cells[3], 11); // 'B' in the number → dozenal eleven
    expect(cells[5], isNull); // 'B' in "BTU" is NOT a glyph (the bug)
    expect(cells[6], isNull);
    expect(cells[7], isNull);
  });

  test('conventional mode overlays no glyphs at all', () {
    final cells = debugResultGlyphCells(
        const ConverterLine('AB', unit: 'BTU'), GlyphStyle.conventional);
    expect(cells.every((c) => c == null), isTrue);
  });

  testWidgets('renders without a GlyphStyleScope (fallback to custom)',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 140,
          width: 360,
          child: ConverterDisplay(
            topLine: ConverterLine('B0.1', bracket: '12 in'),
            resultLine: null,
            worldLabel: 'DEZ',
          ),
        ),
      ),
    ));
    expect(find.text('DEZ'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
