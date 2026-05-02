// Generator for assets/feature_graphic.png — the 1024×500 Play Store
// feature graphic (the wide promo banner displayed at the top of the
// listing).
//
// Run from the project root:
//
//   flutter test tool/generate_feature_graphic.dart
//
// Layout: centred "Dozenal Calc" wordmark, all twelve dozenal glyphs as a
// horizontal row beneath it, orange tagline at the bottom. Uses the same
// dark theme + LiberationSans-Bold as the app icon for visual consistency.

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/glyph_painter.dart';
import 'package:dozenal_calc_flutter/logic/dozenal_digit.dart';

const String _fontFamily = 'FeatureLiberation';

Future<void> _loadFont() async {
  final file = File('tool/fonts/LiberationSans-Bold.ttf');
  final bytes = await file.readAsBytes();
  final loader = FontLoader(_fontFamily)
    ..addFont(Future.value(ByteData.sublistView(bytes)));
  await loader.load();
}

void main() {
  test('generate feature graphic', () async {
    await _loadFont();

    const double w = 1024.0;
    const double h = 500.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      const Rect.fromLTWH(0, 0, w, h),
    );

    // Background: dark with a subtle radial highlight at centre.
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, w, h),
      Paint()..color = const Color(0xFF161616),
    );
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..shader = ui.Gradient.radial(
          const Offset(w / 2, h * 0.45),
          w * 0.55,
          [const Color(0xFF2E2E2E), const Color(0xFF161616)],
          [0.0, 1.0],
        ),
    );

    // Wordmark "Dozenal Calc" — top-centre, large heavy weight.
    final wordmark = TextPainter(
      text: const TextSpan(
        text: 'Dozenal Calc',
        style: TextStyle(
          color: Colors.white,
          fontSize: 90,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    wordmark.paint(
      canvas,
      Offset((w - wordmark.width) / 2, h * 0.13),
    );

    // 12 dozenal glyphs in a horizontal row, centred mid-height. Each
    // composite digit needs ~4q vertical room (= cellSize). The single-
    // arrow anchors only need 2q. We size so that composites fit.
    const double glyphCellSize = 50.0;
    const double glyphGap = 22.0;
    final totalGlyphRowWidth =
        12 * glyphCellSize + 11 * glyphGap;
    final glyphRowStartX = (w - totalGlyphRowWidth) / 2 + glyphCellSize / 2;
    final glyphRowY = h * 0.55;
    for (var i = 0; i < 12; i++) {
      paintDozenalDigitAt(
        canvas,
        DozenalDigit.values[i],
        center: Offset(
          glyphRowStartX + i * (glyphCellSize + glyphGap),
          glyphRowY,
        ),
        q: glyphCellSize / 4,
        color: const Color(0xFFD0D0D0),
        strokeWidth: 2.4,
      );
    }

    // Tagline — orange, matches the orange of the equals button in the icon.
    final tagline = TextPainter(
      text: const TextSpan(
        text: 'Rechnen in Basis Zwölf',
        style: TextStyle(
          color: Color(0xFFFF8E2A),
          fontSize: 32,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tagline.paint(
      canvas,
      Offset((w - tagline.width) / 2, h * 0.83),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(w.toInt(), h.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    final out = File('assets/feature_graphic.png');
    await out.parent.create(recursive: true);
    await out.writeAsBytes(bytes);
    // ignore: avoid_print
    print('Wrote ${out.path} (${bytes.length} bytes, $w×$h)');
  });
}
