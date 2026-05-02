// Generator for assets/compass.png — secondary asset for marketing /
// READMEs / hero images. Shows the four anchor digits (D1/D4/D7/D10)
// arranged around a clock face at 1, 4, 7, 10 o'clock positions, each
// in its natural orientation (arrows point up/right/down/left). Inside
// each glyph, a small numeric label shows its decimal value.
//
// Run from the project root:
//
//   flutter test tool/generate_compass.dart

import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/glyph_painter.dart';

const String _fontFamily = 'CompassLiberation';

Future<void> _loadFont() async {
  final file = File('tool/fonts/LiberationSans-Bold.ttf');
  final bytes = await file.readAsBytes();
  final loader = FontLoader(_fontFamily)
    ..addFont(Future.value(ByteData.sublistView(bytes)));
  await loader.load();
}

void main() {
  test('generate compass image', () async {
    await _loadFont();

    const double size = 1024.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      const Rect.fromLTWH(0, 0, size, size),
    );

    // Transparent background — composites onto any host surface.
    // (For a solid-bg variant uncomment the drawRect below.)
    // canvas.drawRect(
    //   const Rect.fromLTWH(0, 0, size, size),
    //   Paint()..color = const Color(0xFF1F1F1F),
    // );

    final cx = size / 2;
    final cy = size / 2;
    final outerR = size * 0.40;

    // Subtle dashed-ish clock-face circle (a continuous stroke is fine for
    // a marketing asset; the visual cue is "compass / clock").
    canvas.drawCircle(
      Offset(cx, cy),
      outerR,
      Paint()
        ..color = const Color(0xFF6E6E6E)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size * 0.0035,
    );

    // Center dot.
    canvas.drawCircle(
      Offset(cx, cy),
      size * 0.012,
      Paint()..color = const Color(0xFF6E6E6E),
    );

    // Anchor placements: each entry is (digit, clock-hour, label-text).
    // 1 o'clock = 30° from 12 (clockwise); use math angle = -60° from +x axis.
    const placements = <(DozenalDigit, double, String)>[
      (DozenalDigit.d1, 1.0, '1'),
      (DozenalDigit.d7, 4.0, '7'),
      (DozenalDigit.d10, 7.0, '10'),
      (DozenalDigit.d4, 10.0, '4'),
    ];

    final glyphRadius = outerR;
    final labelRadius = outerR * 0.55;
    final glyphQ = size * 0.06; // half-extent of the anchor arrow

    for (final p in placements) {
      // Convert clock-hour to math-angle: 12 o'clock = top = -π/2 in
      // math convention (y grows downward in canvas, so math.cos/sin work
      // with x→right, y→down equivalence to clock by flipping y).
      // Easier: angle from 12 clockwise in radians.
      final clockAngle = (p.$2 / 12.0) * 2 * math.pi;
      // Convert to canvas xy: 12 o'clock direction is (0, -1).
      final dx = math.sin(clockAngle);
      final dy = -math.cos(clockAngle);

      final glyphCenter = Offset(
        cx + dx * glyphRadius,
        cy + dy * glyphRadius,
      );

      // Glyph in its natural (un-rotated) orientation. The arrow points
      // up/right/down/left per its inherent shape — at 1/4/7/10 o'clock
      // this gives a subtle pinwheel feel rather than strict symmetry.
      paintDozenalDigitAt(
        canvas,
        p.$1,
        center: glyphCenter,
        q: glyphQ,
        color: const Color(0xFF2C2C2C),
        strokeWidth: size * 0.012,
      );

      // Label on the inner side: small digit text.
      final labelCenter = Offset(
        cx + dx * labelRadius,
        cy + dy * labelRadius,
      );
      final tp = TextPainter(
        text: TextSpan(
          text: '= ${p.$3}',
          style: TextStyle(
            color: const Color(0xFFB0B0B0),
            fontSize: size * 0.038,
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(
        canvas,
        Offset(
          labelCenter.dx - tp.width / 2,
          labelCenter.dy - tp.height / 2,
        ),
      );
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    final out = File('assets/compass.png');
    await out.parent.create(recursive: true);
    await out.writeAsBytes(bytes);
    // ignore: avoid_print
    print('Wrote ${out.path} (${bytes.length} bytes)');
  });
}
