// Port of paint_token from src/painting.rs:10–193.
// Renders the visual identity of every non-digit CalcToken: arithmetic glyphs
// (+, −, ×, /), the four corner-square composites (x^, √x, ⊕, log), the
// cursor triangles, and text labels for the rest. Free function — surrounding
// widget owns the border / press-state styling.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'tokens.dart';

void paintTokenAt(
  Canvas canvas,
  CalcToken token, {
  required Rect rect,
  Color color = Colors.lightBlueAccent,
  double strokeWidth = 2.0,
}) {
  final c = rect.center;
  final minEdge = math.min(rect.width, rect.height);
  final q = minEdge / 4.0;
  final paint = Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round;

  if (token is Add) {
    canvas.drawLine(c - Offset(q, 0), c + Offset(q, 0), paint);
    canvas.drawLine(c - Offset(0, q), c + Offset(0, q), paint);
    return;
  }
  if (token is Sub) {
    canvas.drawLine(c - Offset(q, 0), c + Offset(q, 0), paint);
    return;
  }
  if (token is Mul) {
    canvas.drawLine(c - Offset(q, q), c + Offset(q, q), paint);
    canvas.drawLine(c + Offset(-q, q), c + Offset(q, -q), paint);
    return;
  }
  if (token is Div) {
    canvas.drawLine(c + Offset(-q, q), c + Offset(q, -q), paint);
    return;
  }

  if (token is ExpTopRight) {
    _paintXWithCornerSquare(
      canvas,
      c,
      minEdge,
      q,
      color,
      strokeWidth,
      cornerOffset: Offset(q * 1.3, -q * 1.3),
    );
    return;
  }
  if (token is RootTopLeft) {
    _paintXWithCornerSquare(
      canvas,
      c,
      minEdge,
      q,
      color,
      strokeWidth,
      cornerOffset: Offset(-q * 1.3, -q * 1.3),
    );
    return;
  }
  if (token is LogBotRight) {
    _paintXWithCornerSquare(
      canvas,
      c,
      minEdge,
      q,
      color,
      strokeWidth,
      cornerOffset: Offset(q * 1.3, q * 1.3),
    );
    return;
  }
  if (token is OplusBotLeft) {
    final sqC = c + Offset(-q * 1.3, q * 1.3);
    final sqSize = minEdge * 0.18;
    _paintXWithCornerSquareAt(
      canvas,
      c,
      minEdge,
      color,
      strokeWidth,
      sqC,
      sqSize,
    );
    // Tiny + inside the corner square.
    final cross = sqSize * 0.3;
    final crossPaint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      sqC + Offset(0, -cross),
      sqC + Offset(0, cross),
      crossPaint,
    );
    canvas.drawLine(
      sqC + Offset(-cross, 0),
      sqC + Offset(cross, 0),
      crossPaint,
    );
    return;
  }

  if (token is TriangleRight) {
    final pts = [c + Offset(-q, -q), c + Offset(-q, q), c + Offset(q, 0)];
    _drawClosedPolygon(canvas, pts, paint);
    return;
  }
  if (token is TriangleLeft) {
    final pts = [c + Offset(q, q), c + Offset(q, -q), c + Offset(-q, 0)];
    _drawClosedPolygon(canvas, pts, paint);
    return;
  }

  // Text fallback for everything else.
  final text = _tokenLabel(token);
  if (text.isEmpty) return;
  _drawCenteredText(canvas, text, c, minEdge * _labelScale(token), color);
}

/// Per-token font scale for the text fallback. Tokens whose glyph is
/// intrinsically tiny (the decimal dot, the … of Expand/Close) or thin
/// (the parens) render larger so they read at keypad size; everything
/// else keeps the 0.35 baseline.
double _labelScale(CalcToken t) {
  if (t is Decimal || t is Expand || t is Close) return 0.55;
  if (t is ParenOpen || t is ParenClose) return 0.5;
  return 0.35;
}

void _paintXWithCornerSquare(
  Canvas canvas,
  Offset center,
  double minEdge,
  double q,
  Color color,
  double strokeWidth, {
  required Offset cornerOffset,
}) {
  final sqC = center + cornerOffset;
  final sqSize = minEdge * 0.18;
  _paintXWithCornerSquareAt(
    canvas,
    center,
    minEdge,
    color,
    strokeWidth,
    sqC,
    sqSize,
  );
}

void _paintXWithCornerSquareAt(
  Canvas canvas,
  Offset center,
  double minEdge,
  Color color,
  double strokeWidth,
  Offset squareCenter,
  double squareSize,
) {
  _drawCenteredText(canvas, 'x', center, minEdge * 0.45, color);
  canvas.drawRect(
    Rect.fromCenter(
      center: squareCenter,
      width: squareSize,
      height: squareSize,
    ),
    Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth,
  );
}

void _drawClosedPolygon(Canvas canvas, List<Offset> pts, Paint paint) {
  final path = Path()..moveTo(pts.first.dx, pts.first.dy);
  for (var i = 1; i < pts.length; i++) {
    path.lineTo(pts[i].dx, pts[i].dy);
  }
  path.close();
  canvas.drawPath(path, paint);
}

void _drawCenteredText(
  Canvas canvas,
  String text,
  Offset center,
  double fontSize,
  Color color,
) {
  final tp = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'monospace',
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
}

/// Maps a CalcToken to its keypad text label (used for the text-fallback
/// branch of paint_token). Mirrors the Rust string table 1:1.
String _tokenLabel(CalcToken t) {
  if (t is Sin) return 'sin';
  if (t is Cos) return 'cos';
  if (t is Tan) return 'tan';
  if (t is Cot) return 'cot';
  if (t is ArcSin) return 'sin⁻¹';
  if (t is ArcCos) return 'cos⁻¹';
  if (t is ArcTan) return 'tan⁻¹';
  if (t is ArcCot) return 'cot⁻¹';
  if (t is ParenOpen) return '(';
  if (t is ParenClose) return ')';
  if (t is Sinh) return 'sinh';
  if (t is Cosh) return 'cosh';
  if (t is Tanh) return 'tanh';
  if (t is Coth) return 'coth';
  if (t is ArSinh) return 'sinh⁻¹';
  if (t is ArCosh) return 'cosh⁻¹';
  if (t is ArTanh) return 'tanh⁻¹';
  if (t is ArCoth) return 'coth⁻¹';
  if (t is Ac) return 'AC';
  if (t is Del) return 'DEL';
  if (t is Decimal) return '.';
  if (t is Equals) return '=';
  if (t is Expand) return '…';
  if (t is Sto) return 'STO';
  if (t is Rcl) return 'RCL';
  if (t is Mc) return 'MC';
  if (t is Ans) return 'Ans';
  if (t is ConstPi) return 'π';
  if (t is ConstE) return 'e';
  if (t is ConstPhi) return 'φ';
  if (t is ConstSqrt2) return '√2';
  if (t is Factorial) return 'n!';
  if (t is AbsVal) return '|x|';
  if (t is Reciprocal) return '1/x';
  if (t is Mod) return 'mod';
  if (t is Doz) return 'Doz';
  if (t is Dez) return 'Dez';
  if (t is Drg) return 'DRG';
  if (t is ConvAns) return 'CONV';
  if (t is Info) return 'Info';
  if (t is Close) return '…';
  if (t is MemPlus) return 'M+';
  if (t is MemMinus) return 'M−';
  if (t is Square) return 'x²';
  if (t is PlusMinus) return '±';
  if (t is Ln) return 'ln';
  if (t is ExpE) return 'eˣ';
  if (t is Log12) return 'log₁₂';
  if (t is NCr) return 'nCr';
  if (t is NPr) return 'nPr';
  if (t is Sci) return 'EXP';
  return '';
}
