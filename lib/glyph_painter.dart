// Pilot port of paint_dozenal_digit from the Rust reference (src/painting.rs).
// Specification: dozenal_calc/GLYPHS.md.
//
// This file renders a subset of the twelve glyphs (D1, D5, D8) to validate
// that the geometric spec ports cleanly to Flutter's Canvas API. If these
// three look right, the remaining nine should follow the same primitives
// without surprises.

import 'dart:math';
import 'package:flutter/material.dart';

enum DozenalDigit { d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11 }

class DozenalGlyphPainter extends CustomPainter {
  final DozenalDigit digit;
  final Color color;
  final double strokeWidth;

  const DozenalGlyphPainter({
    required this.digit,
    this.color = Colors.white,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final minEdge = min(size.width, size.height);
    final r = minEdge / 2;
    final q = minEdge / 4;
    final c = Offset(size.width / 2, size.height / 2);

    switch (digit) {
      case DozenalDigit.d1:
        // Anchor: arrow up. Tip at c + (0, -q).
        final tip = c + Offset(0, -q);
        canvas.drawLine(tip, c + Offset(-q, q), paint);
        canvas.drawLine(tip, c + Offset(q, q), paint);
        break;

      case DozenalDigit.d5:
        // Composite: top = left half-circle, bottom = right half-circle.
        _arc(canvas, paint, c + Offset(0, -q), q, 90, 270);
        _arc(canvas, paint, c + Offset(0, q), q, -90, 90);
        break;

      case DozenalDigit.d8:
        // Composite: two stacked full circles.
        canvas.drawCircle(c + Offset(0, -q), q, paint);
        canvas.drawCircle(c + Offset(0, q), q, paint);
        break;

      // Remaining digits omitted in the pilot. To be ported following GLYPHS.md.
      default:
        // Placeholder: a small dot so missing digits are visible, not invisible.
        final dotPaint = Paint()..color = color.withValues(alpha: 0.3);
        canvas.drawCircle(c, 4, dotPaint);
    }

    // Suppress unused-import warning by referencing r in debug; the variable
    // is retained for parity with the Rust source where r is used by some
    // (not-yet-ported) digits.
    assert(r > 0);
  }

  /// Draws an arc using degrees (egui convention: 0° = right, 90° = down,
  /// clockwise positive). Flutter Canvas uses radians and the same convention.
  void _arc(
    Canvas canvas,
    Paint paint,
    Offset center,
    double radius,
    double startDeg,
    double endDeg,
  ) {
    final startRad = startDeg * pi / 180;
    final sweepRad = (endDeg - startDeg) * pi / 180;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startRad, sweepRad, false, paint);
  }

  @override
  bool shouldRepaint(covariant DozenalGlyphPainter old) =>
      old.digit != digit || old.color != color || old.strokeWidth != strokeWidth;
}
