// Port of paint_dozenal_digit from the Rust reference (src/painting.rs:195-264).
// Specification: dozenal_calc/GLYPHS.md.

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
    final q = minEdge / 4;
    final c = Offset(size.width / 2, size.height / 2);
    final top = c + Offset(0, -q);
    final bot = c + Offset(0, q);

    switch (digit) {
      // --- Anchor digits: arrow points in cardinal direction ---
      case DozenalDigit.d1:
        _arrow(canvas, paint, c, Offset(0, -q), Offset(-q, q), Offset(q, q));
        break;
      case DozenalDigit.d4:
        _arrow(canvas, paint, c, Offset(-q, 0), Offset(q, -q), Offset(q, q));
        break;
      case DozenalDigit.d7:
        _arrow(canvas, paint, c, Offset(q, 0), Offset(-q, -q), Offset(-q, q));
        break;
      case DozenalDigit.d10:
        _arrow(canvas, paint, c, Offset(0, q), Offset(-q, -q), Offset(q, -q));
        break;

      // --- Composite digits: top + bottom element, each at radius q ---
      case DozenalDigit.d0:
        // Sole single-element glyph: one full circle centred on c.
        canvas.drawCircle(c, q, paint);
        break;
      case DozenalDigit.d2:
        _rightHalf(canvas, paint, top, q);
        _leftHalf(canvas, paint, bot, q);
        break;
      case DozenalDigit.d3:
        _rightHalf(canvas, paint, top, q);
        _rightHalf(canvas, paint, bot, q);
        break;
      case DozenalDigit.d5:
        _leftHalf(canvas, paint, top, q);
        _rightHalf(canvas, paint, bot, q);
        break;
      case DozenalDigit.d6:
        _leftHalf(canvas, paint, top, q);
        canvas.drawCircle(bot, q, paint);
        break;
      case DozenalDigit.d8:
        canvas.drawCircle(top, q, paint);
        canvas.drawCircle(bot, q, paint);
        break;
      case DozenalDigit.d9:
        canvas.drawCircle(top, q, paint);
        _rightHalf(canvas, paint, bot, q);
        break;
      case DozenalDigit.d11:
        _rightHalf(canvas, paint, top, q);
        canvas.drawCircle(bot, q, paint);
        break;
    }
  }

  /// Two-line V-arrow: tip + two wings, all relative to centre c.
  void _arrow(
    Canvas canvas,
    Paint paint,
    Offset c,
    Offset tipOff,
    Offset wing1Off,
    Offset wing2Off,
  ) {
    final tip = c + tipOff;
    canvas.drawLine(tip, c + wing1Off, paint);
    canvas.drawLine(tip, c + wing2Off, paint);
  }

  /// Right half-circle: arc from -90° (top) to +90° (bottom) going clockwise.
  void _rightHalf(Canvas canvas, Paint paint, Offset center, double radius) {
    _arc(canvas, paint, center, radius, -90, 90);
  }

  /// Left half-circle: arc from +90° (bottom) to +270° (top) going clockwise.
  void _leftHalf(Canvas canvas, Paint paint, Offset center, double radius) {
    _arc(canvas, paint, center, radius, 90, 270);
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
      old.digit != digit ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}
