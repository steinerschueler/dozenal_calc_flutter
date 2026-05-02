// One-off generator for assets/icon.png — the source PNG that
// flutter_launcher_icons / flutter_native_splash consume.
//
// Run from the project root:
//
//   flutter test tool/generate_icon.dart
//
// Renders a stylised calculator with "BASIS / 12" on its display.
// The 4×3 button grid (= 12 buttons) is a nod to the base-12 system.
// One button (bottom right) is orange — the equals key.
// The whole device is slightly rotated and given a thickness ledge +
// drop shadow for a 3D sticker look.

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const String _iconFontFamily = 'IconLiberation';

Future<void> _loadIconFont() async {
  final fontFile = File('tool/fonts/LiberationSans-Bold.ttf');
  final bytes = await fontFile.readAsBytes();
  final loader = FontLoader(_iconFontFamily)
    ..addFont(Future.value(ByteData.sublistView(bytes)));
  await loader.load();
}

void main() {
  test('generate app icon', () async {
    await _loadIconFont();

    const double size = 1024.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      const Rect.fromLTWH(0, 0, size, size),
    );

    // Solid background — matches app theme.
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, size, size),
      Paint()..color = const Color(0xFF1F1F1F),
    );

    // Rotate the whole calculator by a small angle around the icon centre.
    canvas.save();
    canvas.translate(size / 2, size / 2);
    canvas.rotate(-0.10); // ≈ -5.7°, counter-clockwise tilt
    canvas.translate(-size / 2, -size / 2);

    // Calculator body bounds within the rotated frame.
    final bodyRect = Rect.fromLTRB(
      size * 0.13,
      size * 0.10,
      size * 0.87,
      size * 0.92,
    );
    final bodyRadius = Radius.circular(size * 0.07);

    // 1. Soft drop shadow: a blurred dark rounded rect behind everything.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        bodyRect.shift(Offset(size * 0.018, size * 0.030)),
        bodyRadius,
      ),
      Paint()
        ..color = const Color(0x80000000)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22),
    );

    // 2. Thickness ledge: a darker duplicate offset south-east, suggesting
    //    the calculator has physical depth (3D from above).
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        bodyRect.shift(Offset(size * 0.010, size * 0.014)),
        bodyRadius,
      ),
      Paint()..color = const Color(0xFF161616),
    );

    // 3. Main body.
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, bodyRadius),
      Paint()..color = const Color(0xFF2E2E2E),
    );

    // 4. Edge highlight (light from upper-left).
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, bodyRadius),
      Paint()
        ..color = const Color(0xFF555555)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size * 0.005,
    );

    // 5. Display: dark inset rect.
    final dispRect = Rect.fromLTRB(
      size * 0.19,
      size * 0.15,
      size * 0.81,
      size * 0.51,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(dispRect, Radius.circular(size * 0.025)),
      Paint()..color = const Color(0xFF0A0F12),
    );
    // Subtle inner highlight on display top edge — adds depth.
    canvas.drawRRect(
      RRect.fromRectAndRadius(dispRect, Radius.circular(size * 0.025)),
      Paint()
        ..color = const Color(0xFF1A2128)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size * 0.0025,
    );

    // 6. "BASIS" text.
    final basisTp = TextPainter(
      text: TextSpan(
        text: 'BASIS',
        style: TextStyle(
          color: const Color(0xFFB8C4CC),
          fontSize: size * 0.075,
          fontFamily: _iconFontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: size * 0.012,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    basisTp.paint(
      canvas,
      Offset(
        dispRect.center.dx - basisTp.width / 2,
        dispRect.top + dispRect.height * 0.13,
      ),
    );

    // 7. "12" text — dominant.
    final twelveTp = TextPainter(
      text: TextSpan(
        text: '12',
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.22,
          fontFamily: _iconFontFamily,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    twelveTp.paint(
      canvas,
      Offset(
        dispRect.center.dx - twelveTp.width / 2,
        dispRect.top + dispRect.height * 0.36,
      ),
    );

    // 8. Buttons: 4 cols × 3 rows = 12. Bottom-right is orange (= key).
    const cols = 4;
    const rows = 3;
    final btnAreaLeft = size * 0.20;
    final btnAreaRight = size * 0.80;
    final btnAreaTop = size * 0.57;
    final btnAreaBottom = size * 0.88;
    final btnGapX = size * 0.018;
    final btnGapY = size * 0.020;
    final btnW = (btnAreaRight - btnAreaLeft - btnGapX * (cols - 1)) / cols;
    final btnH = (btnAreaBottom - btnAreaTop - btnGapY * (rows - 1)) / rows;
    final btnRadius = Radius.circular(size * 0.016);

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        final isEquals = (r == rows - 1 && c == cols - 1);
        final btnRect = Rect.fromLTWH(
          btnAreaLeft + c * (btnW + btnGapX),
          btnAreaTop + r * (btnH + btnGapY),
          btnW,
          btnH,
        );
        // Tiny shadow under each button for subtle depth.
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            btnRect.shift(Offset(0, size * 0.003)),
            btnRadius,
          ),
          Paint()..color = const Color(0xFF1A1A1A),
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(btnRect, btnRadius),
          Paint()
            ..color = isEquals
                ? const Color(0xFFFF8E2A) // Apple-Calculator-ish orange
                : const Color(0xFF4C4C4C),
        );

        // Equals "=" symbol drawn as two horizontal bars.
        if (isEquals) {
          final eqCenter = btnRect.center;
          final eqHalfW = btnRect.width * 0.26;
          final eqGap = btnRect.height * 0.13;
          final eqStroke = Paint()
            ..color = Colors.white
            ..strokeWidth = btnRect.height * 0.11
            ..strokeCap = StrokeCap.round;
          canvas.drawLine(
            Offset(eqCenter.dx - eqHalfW, eqCenter.dy - eqGap),
            Offset(eqCenter.dx + eqHalfW, eqCenter.dy - eqGap),
            eqStroke,
          );
          canvas.drawLine(
            Offset(eqCenter.dx - eqHalfW, eqCenter.dy + eqGap),
            Offset(eqCenter.dx + eqHalfW, eqCenter.dy + eqGap),
            eqStroke,
          );
        }
      }
    }

    canvas.restore();

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
