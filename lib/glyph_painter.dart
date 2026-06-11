// Port of paint_dozenal_digit from the Rust reference (src/painting.rs:195-264).
// Specification: dozenal_calc/GLYPHS.md.

import 'dart:math';
import 'package:flutter/material.dart';
import 'logic/dozenal_digit.dart';

export 'logic/dozenal_digit.dart' show DozenalDigit;

/// Conventional ASCII rendering of a dozenal digit: '0'..'9' for d0..d9,
/// 'A'/'B' for d10/d11 (Pitman/Dwiggins extension, standard in academic
/// dozenal literature). Shared by the display and both keypads when the
/// respective GlyphStyle preference is set to conventional.
String conventionalDigitChar(DozenalDigit d) {
  if (d.value == 10) return 'A';
  if (d.value == 11) return 'B';
  return '${d.value}';
}

/// Paints a single dozenal glyph centred at `center` with quarter-size `q`
/// (digit fits in a 2q × 2q box). Free function so result-line and keypad
/// renderers can reuse the same drawing code without instantiating a painter.
void paintDozenalDigitAt(
  Canvas canvas,
  DozenalDigit digit, {
  required Offset center,
  required double q,
  Color color = Colors.white,
  double strokeWidth = 2.0,
}) {
  final paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round;

  final top = center + Offset(0, -q);
  final bot = center + Offset(0, q);

  switch (digit) {
    // --- Anchor digits: arrow points in cardinal direction ---
    case DozenalDigit.d1:
      _arrow(canvas, paint, center, Offset(0, -q), Offset(-q, q), Offset(q, q));
      break;
    case DozenalDigit.d4:
      _arrow(canvas, paint, center, Offset(-q, 0), Offset(q, -q), Offset(q, q));
      break;
    case DozenalDigit.d7:
      _arrow(canvas, paint, center, Offset(q, 0), Offset(-q, -q), Offset(-q, q));
      break;
    case DozenalDigit.d10:
      _arrow(canvas, paint, center, Offset(0, q), Offset(-q, -q), Offset(q, -q));
      break;

    // --- Composite digits: top + bottom element, each at radius q ---
    case DozenalDigit.d0:
      canvas.drawCircle(center, q, paint);
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

void _rightHalf(Canvas canvas, Paint paint, Offset center, double radius) {
  _arc(canvas, paint, center, radius, -90, 90);
}

void _leftHalf(Canvas canvas, Paint paint, Offset center, double radius) {
  _arc(canvas, paint, center, radius, 90, 270);
}

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
    final minEdge = min(size.width, size.height);
    final q = minEdge / 4;
    paintDozenalDigitAt(
      canvas,
      digit,
      center: Offset(size.width / 2, size.height / 2),
      q: q,
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  @override
  bool shouldRepaint(covariant DozenalGlyphPainter old) =>
      old.digit != digit ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}
