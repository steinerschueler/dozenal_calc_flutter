// One-off generator for assets/icon.png — the source PNG that
// flutter_launcher_icons / flutter_native_splash consume.
//
// Run from the project root:
//
//   flutter test tool/generate_icon.dart
//
// Renders a centred D5 dozenal glyph (white, thick stroke) on the app's
// dark background colour (#1F1F1F) at 1024×1024. The D5 is the most
// geometrically balanced composite glyph (left-half top + right-half
// bottom) and reads as a logo at any scale.

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/glyph_painter.dart';

void main() {
  test('generate app icon', () async {
    const double size = 1024.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      const Rect.fromLTWH(0, 0, size, size),
    );

    // Background — same dark grey as the app theme.
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, size, size),
      Paint()..color = const Color(0xFF1F1F1F),
    );

    // Centred D5: q = size * 0.16 ⇒ composite glyph spans 4·q ≈ 656 px,
    // leaving ~184 px margin top/bottom for safe-area cropping by Android
    // adaptive-icon masks. Stroke proportional to the canvas (≈ 41 px).
    paintDozenalDigitAt(
      canvas,
      DozenalDigit.d5,
      center: const Offset(size / 2, size / 2),
      q: size * 0.16,
      strokeWidth: size * 0.04,
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    final out = File('assets/icon.png');
    await out.parent.create(recursive: true);
    await out.writeAsBytes(bytes);
    // ignore: avoid_print
    print('Wrote ${out.path} (${bytes.length} bytes)');
  });
}
