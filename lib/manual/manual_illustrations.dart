// Custom-painted illustrations for the manual's teaching chapters. Theme-aware
// (AppColors), small-display friendly, in the same spirit as the theory
// diagrams (lib/theory/theory_illustrations.dart). Curve/accent colours are
// deliberately theme-independent so they read on both light and dark.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../token_painter.dart';
import '../tokens.dart';

// Theme-independent accent colours (match the theory palette).
const _teal = Color(0xFF0F6E56);
const _blue = Color(0xFF185FA5);
const _purple = Color(0xFF534AB7);
const _orange = Color(0xFF993C1D);

void _text(
  Canvas canvas,
  String s,
  Offset topLeft,
  Color color, {
  double size = 10,
  FontStyle style = FontStyle.normal,
  FontWeight weight = FontWeight.w400,
}) {
  final tp = TextPainter(
    text: TextSpan(
      text: s,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontStyle: style,
        fontWeight: weight,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  tp.paint(canvas, topLeft);
}

void _dashedLine(
  Canvas canvas,
  Offset a,
  Offset b,
  Paint paint, {
  double on = 5,
  double off = 4,
}) {
  final total = (b - a).distance;
  if (total == 0) return;
  final dir = (b - a) / total;
  var t = 0.0;
  while (t < total) {
    final s = a + dir * t;
    final e = a + dir * math.min(t + on, total);
    canvas.drawLine(s, e, paint);
    t += on + off;
  }
}

// Hyperbolic helpers — dart:math has no cosh/sinh/tanh. Mirror the engine's
// own definitions (expression.dart _F64Parser) so the curves match the values
// the calculator computes.
double _cosh(double x) => (math.exp(x) + math.exp(-x)) / 2.0;
double _sinh(double x) => (math.exp(x) - math.exp(-x)) / 2.0;
double _tanh(double x) {
  if (x > 20.0) return 1.0;
  if (x < -20.0) return -1.0;
  final ex = math.exp(x), emx = math.exp(-x);
  return (ex - emx) / (ex + emx);
}

/// Filled triangular arrowhead at [tip], pointing along the unit vector [dir].
void _arrowHead(
  Canvas canvas,
  Offset tip,
  Offset dir,
  Color color, {
  double len = 8,
  double halfW = 3.5,
}) {
  final perp = Offset(-dir.dy, dir.dx);
  final back = tip - dir * len;
  canvas.drawPath(
    Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(back.dx + perp.dx * halfW, back.dy + perp.dy * halfW)
      ..lineTo(back.dx - perp.dx * halfW, back.dy - perp.dy * halfW)
      ..close(),
    Paint()..color = color,
  );
}

// ---------------------------------------------------------------------------
// Figure 1 — the relationship bᵉ = n with its three inverse operations.
// ---------------------------------------------------------------------------

class PowerTriangleFigure extends StatelessWidget {
  /// Localizable node roles — German defaults; translated per language.
  final String power;
  final String base;
  final String exponent;
  const PowerTriangleFigure({
    super.key,
    this.power = 'Potenz',
    this.base = 'Basis',
    this.exponent = 'Exponent',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.35,
      child: CustomPaint(
          painter: _PowerTrianglePainter(
              AppColors.of(context), power, base, exponent)),
    ),
  );
}

class _PowerTrianglePainter extends CustomPainter {
  final AppColors c;
  final String power;
  final String base;
  final String exponent;
  _PowerTrianglePainter(this.c, this.power, this.base, this.exponent);

  @override
  void paint(Canvas canvas, Size size) {
    final n = Offset(size.width * 0.5, size.height * 0.16);
    final b = Offset(size.width * 0.16, size.height * 0.84);
    final e = Offset(size.width * 0.84, size.height * 0.84);
    const r = 17.0;

    void node(Offset o, String letter, String role) {
      canvas.drawCircle(o, r, Paint()..color = c.cardFill);
      canvas.drawCircle(
        o,
        r,
        Paint()
          ..color = c.illusLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
      _text(canvas, letter, o - const Offset(4.5, 9), c.textPrimary, size: 16);
      _text(
        canvas,
        role,
        Offset(o.dx - role.length * 2.7, o.dy + r + 3),
        c.textMuted,
        size: 9,
      );
    }

    void arrow(Offset from, Offset to, Color color, String label) {
      final d = (to - from);
      final len = d.distance;
      final u = d / len;
      final s = from + u * r;
      final t = to - u * r;
      canvas.drawLine(
        s,
        t,
        Paint()
          ..color = color
          ..strokeWidth = 1.6
          ..strokeCap = StrokeCap.round,
      );
      // arrowhead at t
      final perp = Offset(-u.dy, u.dx);
      final tip = t;
      final back = t - u * 8.0;
      final p1 = back + perp * 4.0;
      final p2 = back - perp * 4.0;
      canvas.drawPath(
        Path()
          ..moveTo(tip.dx, tip.dy)
          ..lineTo(p1.dx, p1.dy)
          ..lineTo(p2.dx, p2.dy)
          ..close(),
        Paint()..color = color,
      );
      final mid = (s + t) / 2 + perp * 11.0;
      _text(
        canvas,
        label,
        Offset(mid.dx - label.length * 2.6, mid.dy - 6),
        color,
        size: 9.5,
      );
    }

    // Three one-way arrows (clockwise): power finds n, log finds e, root finds b.
    arrow(b, n, _teal, 'bᵉ'); // power
    arrow(n, e, _purple, 'log'); // logarithm
    arrow(e, b, _orange, 'ᵉ√'); // root

    _text(
      canvas,
      'bᵉ = n',
      Offset(size.width * 0.5 - 18, size.height * 0.52),
      c.textPrimary,
      size: 13,
      weight: FontWeight.w500,
    );

    node(n, 'n', power);
    node(b, 'b', base);
    node(e, 'e', exponent);
  }

  @override
  bool shouldRepaint(covariant _PowerTrianglePainter old) =>
      old.c != c ||
      old.power != power ||
      old.base != base ||
      old.exponent != exponent;
}

// ---------------------------------------------------------------------------
// Figure 2 — the exponential curve y = 2ˣ.
// ---------------------------------------------------------------------------

class ExpCurveFigure extends StatelessWidget {
  const ExpCurveFigure({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.2,
      child: CustomPaint(painter: _ExpCurvePainter(AppColors.of(context))),
    ),
  );
}

class _ExpCurvePainter extends CustomPainter {
  final AppColors c;
  _ExpCurvePainter(this.c);

  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTRB(
      size.width * 0.12,
      size.height * 0.08,
      size.width * 0.96,
      size.height * 0.86,
    );
    const xMin = -2.0, xMax = 3.0, yMin = 0.0, yMax = 8.0;
    Offset px(double x, double y) => Offset(
      plot.left + (x - xMin) / (xMax - xMin) * plot.width,
      plot.bottom - (y - yMin) / (yMax - yMin) * plot.height,
    );

    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.5;
    canvas.drawLine(px(xMin, 0), px(xMax, 0), axis); // x-axis
    canvas.drawLine(px(0, yMin), px(0, yMax), axis); // y-axis
    _text(
      canvas,
      'x',
      px(xMax, 0) + const Offset(2, -4),
      c.textMuted,
      size: 11,
    );
    _text(
      canvas,
      'y',
      px(0, yMax) + const Offset(4, -4),
      c.textMuted,
      size: 11,
    );

    // curve y = 2^x
    final path = Path();
    var first = true;
    for (var i = 0; i <= 80; i++) {
      final x = xMin + (xMax - xMin) * i / 80;
      final y = math.pow(2, x).toDouble();
      if (y > yMax) continue;
      final p = px(x, y);
      if (first) {
        path.moveTo(p.dx, p.dy);
        first = false;
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = _teal
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );

    // marked points (x, 2^x) with value labels
    const pts = [
      [0, 1, '1'],
      [1, 2, '2'],
      [2, 4, '4'],
      [3, 8, '8'],
    ];
    for (final p in pts) {
      final o = px((p[0] as int).toDouble(), (p[1] as int).toDouble());
      canvas.drawCircle(o, 3.0, Paint()..color = c.textPrimary);
      _text(
        canvas,
        p[2] as String,
        o + const Offset(4, -12),
        c.textSecondary,
        size: 10,
      );
    }

    _text(
      canvas,
      'y = 2ˣ',
      Offset(plot.left + 4, plot.top - 2),
      c.textSecondary,
      size: 11,
      style: FontStyle.italic,
    );
  }

  @override
  bool shouldRepaint(covariant _ExpCurvePainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure 3 — a function and its inverse mirrored across y = x. Used twice:
// x² ↔ √x (root) and 2ˣ ↔ log₂x (logarithm).
// ---------------------------------------------------------------------------

class SquareRootFigure extends StatelessWidget {
  const SquareRootFigure({super.key});

  @override
  Widget build(BuildContext context) => _ReflectionFigure(
    f: (x) => x * x,
    g: (x) => math.sqrt(x),
    fLabel: 'x²',
    gLabel: '√x',
    fColor: _orange,
    gColor: _blue,
    lo: 0,
    hi: 3,
    fDomainMax: math.sqrt(3),
    gDomainMin: 0,
    pairs: const [(1.0, 1.0)], // self-inverse fixed point
  );
}

class ExpLogFigure extends StatelessWidget {
  const ExpLogFigure({super.key});

  @override
  Widget build(BuildContext context) => _ReflectionFigure(
    f: (x) => math.pow(2, x).toDouble(),
    g: (x) => math.log(x) / math.log(2),
    fLabel: '2ˣ',
    gLabel: 'log₂x',
    fColor: _teal,
    gColor: _purple,
    lo: -1,
    hi: 4,
    fDomainMax: 2,
    gDomainMin: 0.06,
    pairs: const [(1.0, 2.0), (2.0, 4.0)], // (x, 2^x) ↔ mirror
  );
}

class _ReflectionFigure extends StatelessWidget {
  final double Function(double) f;
  final double Function(double) g;
  final String fLabel, gLabel;
  final Color fColor, gColor;
  final double lo, hi, fDomainMax, gDomainMin;
  final List<(double, double)> pairs;

  const _ReflectionFigure({
    required this.f,
    required this.g,
    required this.fLabel,
    required this.gLabel,
    required this.fColor,
    required this.gColor,
    required this.lo,
    required this.hi,
    required this.fDomainMax,
    required this.gDomainMin,
    required this.pairs,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: _ReflectionPainter(
          AppColors.of(context),
          f,
          g,
          fLabel,
          gLabel,
          fColor,
          gColor,
          lo,
          hi,
          fDomainMax,
          gDomainMin,
          pairs,
        ),
      ),
    ),
  );
}

class _ReflectionPainter extends CustomPainter {
  final AppColors c;
  final double Function(double) f;
  final double Function(double) g;
  final String fLabel, gLabel;
  final Color fColor, gColor;
  final double lo, hi, fDomainMax, gDomainMin;
  final List<(double, double)> pairs;

  _ReflectionPainter(
    this.c,
    this.f,
    this.g,
    this.fLabel,
    this.gLabel,
    this.fColor,
    this.gColor,
    this.lo,
    this.hi,
    this.fDomainMax,
    this.gDomainMin,
    this.pairs,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final m = size.width * 0.1;
    final plot = Rect.fromLTRB(m, m, size.width - m, size.height - m);
    Offset px(double x, double y) => Offset(
      plot.left + (x - lo) / (hi - lo) * plot.width,
      plot.bottom - (y - lo) / (hi - lo) * plot.height,
    );

    // axes at x=0 and y=0
    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.4;
    canvas.drawLine(px(lo, 0), px(hi, 0), axis);
    canvas.drawLine(px(0, lo), px(0, hi), axis);

    // diagonal y = x (dashed)
    _dashedLine(
      canvas,
      px(lo, lo),
      px(hi, hi),
      Paint()
        ..color = c.illusFaint
        ..strokeWidth = 1.0,
    );
    _text(
      canvas,
      'y = x',
      px(hi, hi) + const Offset(-30, 2),
      c.textFaint,
      size: 9,
    );

    void curve(
      double Function(double) fn,
      Color color,
      double from,
      double to,
    ) {
      final path = Path();
      var first = true;
      const steps = 90;
      for (var i = 0; i <= steps; i++) {
        final x = from + (to - from) * i / steps;
        final y = fn(x);
        if (y.isNaN || y < lo || y > hi) {
          first = true;
          continue;
        }
        final p = px(x, y);
        if (first) {
          path.moveTo(p.dx, p.dy);
          first = false;
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round,
      );
    }

    curve(f, fColor, math.max(lo, 0), fDomainMax);
    curve(g, gColor, gDomainMin, hi);

    // mirrored point pairs (x, f(x)) and (f(x), x)
    for (final (x, y) in pairs) {
      final a = px(x, y);
      final b = px(y, x);
      _dashedLine(
        canvas,
        a,
        b,
        Paint()
          ..color = c.illusFaint
          ..strokeWidth = 0.8,
        on: 3,
        off: 3,
      );
      canvas.drawCircle(a, 2.6, Paint()..color = c.textPrimary);
      canvas.drawCircle(b, 2.6, Paint()..color = c.textPrimary);
    }

    // curve labels near their ends
    _text(
      canvas,
      fLabel,
      px(fDomainMax, f(fDomainMax)) + const Offset(-22, -12),
      fColor,
      size: 10,
    );
    _text(
      canvas,
      gLabel,
      px(hi, g(hi)) + const Offset(-26, 2),
      gColor,
      size: 10,
    );
  }

  @override
  bool shouldRepaint(covariant _ReflectionPainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure — parallel-resistor schematic: a battery on the left, two resistors
// R1 / R2 as vertical rungs between a top and bottom rail (the ⊕ chapter).
// ---------------------------------------------------------------------------

class ParallelCircuitFigure extends StatelessWidget {
  const ParallelCircuitFigure({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.5,
      child: CustomPaint(
        painter: _ParallelCircuitPainter(AppColors.of(context)),
      ),
    ),
  );
}

class _ParallelCircuitPainter extends CustomPainter {
  final AppColors c;
  _ParallelCircuitPainter(this.c);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    Offset o(double fx, double fy) => Offset(fx * w, fy * h);
    final wire = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    const topY = 0.30, botY = 0.70, leftX = 0.18, rightX = 0.80;

    // top & bottom rails
    canvas.drawLine(o(leftX, topY), o(rightX, topY), wire);
    canvas.drawLine(o(leftX, botY), o(rightX, botY), wire);

    // battery on the left edge (gap in the left rail, two plates)
    canvas.drawLine(o(leftX, topY), o(leftX, 0.45), wire);
    canvas.drawLine(o(leftX, 0.55), o(leftX, botY), wire);
    canvas.drawLine(
      o(0.13, 0.45),
      o(0.23, 0.45),
      Paint()
        ..color = _teal
        ..strokeWidth = 2.4,
    ); // long plate (+)
    canvas.drawLine(
      o(0.15, 0.55),
      o(0.21, 0.55),
      Paint()
        ..color = c.textMuted
        ..strokeWidth = 1.2,
    ); // short plate (−)
    _text(
      canvas,
      '+',
      o(0.235, 0.40),
      _teal,
      size: 12,
      weight: FontWeight.w600,
    );
    _text(canvas, '−', o(0.235, 0.515), c.textMuted, size: 12);
    _text(canvas, 'U', o(0.05, 0.47), c.textMuted, size: 10.5);

    void resistor(double cx, String label, double labelX) {
      const rTop = 0.42, rBot = 0.58, rw = 0.05;
      // lead wires
      canvas.drawLine(o(cx, topY), o(cx, rTop), wire);
      canvas.drawLine(o(cx, rBot), o(cx, botY), wire);
      // body
      final rect = Rect.fromLTRB(
        (cx - rw) * w,
        rTop * h,
        (cx + rw) * w,
        rBot * h,
      );
      canvas.drawRect(rect, Paint()..color = c.cardFill);
      canvas.drawRect(
        rect,
        Paint()
          ..color = c.illusLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.8,
      );
      // node dots on the rails
      canvas.drawCircle(o(cx, topY), 2.6, Paint()..color = c.textPrimary);
      canvas.drawCircle(o(cx, botY), 2.6, Paint()..color = c.textPrimary);
      _text(canvas, label, o(labelX, 0.46), c.textSecondary, size: 12);
    }

    resistor(0.45, 'R₁', 0.515);
    resistor(0.66, 'R₂', 0.725);

    // formula, centred
    const formula = 'R = (R₁·R₂) / (R₁+R₂)';
    final tp = TextPainter(
      text: TextSpan(
        text: formula,
        style: TextStyle(color: c.textMuted, fontSize: 11),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(w / 2 - tp.width / 2, 0.88 * h));
  }

  @override
  bool shouldRepaint(covariant _ParallelCircuitPainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure — bar comparison: the parallel result is shorter than either input
// (R1 = 6, R2 = 3 → R = 2). Shows "always smaller than the smallest".
// ---------------------------------------------------------------------------

class ParallelBarFigure extends StatelessWidget {
  /// Localizable caption — German default; translated per language.
  final String lessThanBoth;
  const ParallelBarFigure({
    super.key,
    this.lessThanBoth = 'kleiner als beide Einzelwerte',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.7,
      child: CustomPaint(
          painter: _ParallelBarPainter(AppColors.of(context), lessThanBoth)),
    ),
  );
}

class _ParallelBarPainter extends CustomPainter {
  final AppColors c;
  final String lessThanBoth;
  _ParallelBarPainter(this.c, this.lessThanBoth);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    const left = 0.20, right = 0.86, maxVal = 6.0;
    final plotW = (right - left) * w;
    Offset o(double fx, double fy) => Offset(fx * w, fy * h);

    void bar(double yc, double value, String name, String val, Color stroke) {
      final len = value / maxVal * plotW;
      final rect = Rect.fromLTRB(
        left * w,
        yc * h - 0.06 * h,
        left * w + len,
        yc * h + 0.06 * h,
      );
      canvas.drawRect(rect, Paint()..color = stroke.withAlpha(0x33));
      canvas.drawRect(
        rect,
        Paint()
          ..color = stroke
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6,
      );
      _text(
        canvas,
        name,
        o(0.03, yc - 0.05),
        c.textSecondary,
        size: 10.5,
        weight: FontWeight.w500,
      );
      _text(
        canvas,
        val,
        Offset(rect.right + 6, yc * h - 6),
        c.textMuted,
        size: 10,
      );
    }

    bar(0.24, 6, 'R₁', '6 Ω', _teal);
    bar(0.48, 3, 'R₂', '3 Ω', _blue);
    bar(0.72, 2, 'R', '2 Ω', _orange);

    // baseline
    canvas.drawLine(
      o(left, 0.86),
      o(right + 0.02, 0.86),
      Paint()
        ..color = c.illusLine
        ..strokeWidth = 1.2,
    );
    _text(
      canvas,
      lessThanBoth,
      o(0.20, 0.9),
      c.textFaint,
      size: 9,
      style: FontStyle.italic,
    );
  }

  @override
  bool shouldRepaint(covariant _ParallelBarPainter old) =>
      old.c != c || old.lessThanBoth != lessThanBoth;
}

// ---------------------------------------------------------------------------
// Figure — the unit circle: a point P at angle θ, with its cos (x) and sin (y)
// projections (the trigonometry chapter).
// ---------------------------------------------------------------------------

class UnitCircleFigure extends StatelessWidget {
  const UnitCircleFigure({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.15,
      child: CustomPaint(painter: _UnitCirclePainter(AppColors.of(context))),
    ),
  );
}

class _UnitCirclePainter extends CustomPainter {
  final AppColors c;
  _UnitCirclePainter(this.c);

  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTRB(
      size.width * 0.12,
      size.height * 0.08,
      size.width * 0.88,
      size.height * 0.92,
    );
    Offset px(double x, double y) => Offset(
      plot.left + (x + 1.25) / 2.5 * plot.width,
      plot.bottom - (y + 1.25) / 2.5 * plot.height,
    );
    final th = 55 * math.pi / 180;
    final cx = math.cos(th), sy = math.sin(th);
    final o = px(0, 0), p = px(cx, sy);

    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.5;
    canvas.drawLine(px(-1.25, 0), px(1.25, 0), axis);
    canvas.drawLine(px(0, -1.25), px(0, 1.25), axis);
    _text(
      canvas,
      'x',
      px(1.25, 0) + const Offset(2, -6),
      c.textMuted,
      size: 10,
    );
    _text(
      canvas,
      'y',
      px(0, 1.25) + const Offset(5, -4),
      c.textMuted,
      size: 10,
    );

    final rPx = (px(1, 0).dx - o.dx);
    canvas.drawCircle(
      o,
      rPx,
      Paint()
        ..color = c.illusLine
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // angle arc
    canvas.drawArc(
      Rect.fromCircle(center: o, radius: rPx * 0.22),
      0,
      -th,
      false,
      Paint()
        ..color = c.illusFaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4,
    );
    _text(canvas, 'θ', px(0.22, 0.12), c.textMuted, size: 11);

    // cos projection (x), teal
    canvas.drawLine(
      o,
      px(cx, 0),
      Paint()
        ..color = _teal
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round,
    );
    _text(
      canvas,
      'cos θ',
      px(cx / 2, 0) + const Offset(-16, 4),
      _teal,
      size: 10,
    );

    // sin projection (y), blue dashed
    _dashedLine(
      canvas,
      px(cx, 0),
      p,
      Paint()
        ..color = _blue
        ..strokeWidth = 1.8,
    );
    _text(
      canvas,
      'sin θ',
      px(cx, sy / 2) + const Offset(5, -4),
      _blue,
      size: 10,
    );

    // radius
    canvas.drawLine(
      o,
      p,
      Paint()
        ..color = c.illusLine
        ..strokeWidth = 1.8,
    );
    _text(
      canvas,
      '1',
      Offset((o.dx + p.dx) / 2 + 6, (o.dy + p.dy) / 2 - 10),
      c.textSecondary,
      size: 10,
      style: FontStyle.italic,
    );

    canvas.drawCircle(p, 3.5, Paint()..color = c.textPrimary);
    _text(canvas, 'P', p + const Offset(5, -14), c.textSecondary, size: 10);
  }

  @override
  bool shouldRepaint(covariant _UnitCirclePainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure — right triangle with the SOHCAHTOA definitions.
// ---------------------------------------------------------------------------

class RightTriangleFigure extends StatelessWidget {
  /// Localizable labels — German defaults; translated per language. The ratio
  /// strings carry the side abbreviations (Geg/An/Hyp), so translate them whole.
  final String adjacent;
  final String opposite;
  final String hypotenuse;
  final String sinRatio;
  final String cosRatio;
  final String tanRatio;
  const RightTriangleFigure({
    super.key,
    this.adjacent = 'Ankathete',
    this.opposite = 'Gegenkathete',
    this.hypotenuse = 'Hypotenuse',
    this.sinRatio = 'sin θ = Geg / Hyp',
    this.cosRatio = 'cos θ = An / Hyp',
    this.tanRatio = 'tan θ = Geg / An',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.6,
      child: CustomPaint(
          painter: _RightTrianglePainter(AppColors.of(context), adjacent,
              opposite, hypotenuse, sinRatio, cosRatio, tanRatio)),
    ),
  );
}

class _RightTrianglePainter extends CustomPainter {
  final AppColors c;
  final String adjacent;
  final String opposite;
  final String hypotenuse;
  final String sinRatio;
  final String cosRatio;
  final String tanRatio;
  _RightTrianglePainter(this.c, this.adjacent, this.opposite, this.hypotenuse,
      this.sinRatio, this.cosRatio, this.tanRatio);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final a = Offset(w * 0.10, h * 0.80); // right angle
    final b = Offset(w * 0.52, h * 0.80); // angle θ
    final cc = Offset(w * 0.10, h * 0.16); // top
    final side = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(a, b, side);
    canvas.drawLine(b, cc, side);
    canvas.drawLine(cc, a, side);

    // right-angle marker at a
    final sq = Path()
      ..moveTo(a.dx + 11, a.dy)
      ..lineTo(a.dx + 11, a.dy - 11)
      ..lineTo(a.dx, a.dy - 11);
    canvas.drawPath(
      sq,
      Paint()
        ..color = c.illusLine
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.3,
    );

    // angle arc at b — sweep normalised to the short way (−π, π]
    final toA = math.atan2(a.dy - b.dy, a.dx - b.dx);
    final toC = math.atan2(cc.dy - b.dy, cc.dx - b.dx);
    var sweep = toC - toA;
    while (sweep <= -math.pi) {
      sweep += 2 * math.pi;
    }
    while (sweep > math.pi) {
      sweep -= 2 * math.pi;
    }
    canvas.drawArc(
      Rect.fromCircle(center: b, radius: 20),
      toA,
      sweep,
      false,
      Paint()
        ..color = _orange
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    _text(canvas, 'θ', b + const Offset(-34, -12), _orange, size: 11);

    // side labels
    _text(
      canvas,
      adjacent,
      Offset((a.dx + b.dx) / 2 - 24, a.dy + 6),
      c.textSecondary,
      size: 9.5,
    );
    _text(
      canvas,
      opposite,
      Offset(w * 0.005, (a.dy + cc.dy) / 2 - 2),
      c.textSecondary,
      size: 9.5,
    );
    _text(
      canvas,
      hypotenuse,
      Offset((b.dx + cc.dx) / 2 - 6, (b.dy + cc.dy) / 2 - 14),
      c.textPrimary,
      size: 9.5,
      weight: FontWeight.w500,
    );

    // SOHCAHTOA formulas on the right
    _text(
      canvas,
      'SOH·CAH·TOA',
      Offset(w * 0.58, h * 0.16),
      c.textFaint,
      size: 9,
      style: FontStyle.italic,
    );
    void formula(double fy, String s, Color col) {
      canvas.drawRect(
        Rect.fromLTWH(w * 0.565, fy * h + 1, 2.4, 13),
        Paint()..color = col,
      );
      _text(canvas, s, Offset(w * 0.59, fy * h), col, size: 10.5);
    }

    formula(0.36, sinRatio, _blue);
    formula(0.54, cosRatio, _teal);
    formula(0.72, tanRatio, _orange);
  }

  @override
  bool shouldRepaint(covariant _RightTrianglePainter old) =>
      old.c != c ||
      old.adjacent != adjacent ||
      old.opposite != opposite ||
      old.hypotenuse != hypotenuse ||
      old.sinRatio != sinRatio ||
      old.cosRatio != cosRatio ||
      old.tanRatio != tanRatio;
}

// ---------------------------------------------------------------------------
// Figure — the sine wave (with cos faint), one full period.
// ---------------------------------------------------------------------------

class SineWaveFigure extends StatelessWidget {
  const SineWaveFigure({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 2.2,
      child: CustomPaint(painter: _SineWavePainter(AppColors.of(context))),
    ),
  );
}

class _SineWavePainter extends CustomPainter {
  final AppColors c;
  _SineWavePainter(this.c);

  @override
  void paint(Canvas canvas, Size size) {
    final plot = Rect.fromLTRB(
      size.width * 0.10,
      size.height * 0.10,
      size.width * 0.96,
      size.height * 0.90,
    );
    Offset px(double x, double y) => Offset(
      plot.left + (x + 0.2) / 6.8 * plot.width,
      plot.bottom - (y + 1.45) / 2.9 * plot.height,
    );
    final twoPi = 2 * math.pi;

    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.5;
    canvas.drawLine(px(-0.2, 0), px(6.6, 0), axis);
    canvas.drawLine(px(0, -1.45), px(0, 1.45), axis);

    // x ticks at the quarter angles
    final ticks = <(double, String)>[
      (math.pi / 2, '90°'),
      (math.pi, '180°'),
      (3 * math.pi / 2, '270°'),
      (twoPi, '360°'),
    ];
    for (final t in ticks) {
      final x = t.$1;
      canvas.drawLine(
        px(x, -0.05),
        px(x, 0.05),
        Paint()
          ..color = c.illusFaint
          ..strokeWidth = 1.0,
      );
      _text(
        canvas,
        t.$2,
        px(x, 0) + const Offset(-9, 6),
        c.textFaint,
        size: 8.5,
      );
    }
    _text(canvas, '1', px(0, 1) + const Offset(4, -8), c.textFaint, size: 8.5);
    _text(
      canvas,
      '−1',
      px(0, -1) + const Offset(4, -4),
      c.textFaint,
      size: 8.5,
    );

    Path curve(double Function(double) f) {
      final path = Path();
      for (var i = 0; i <= 160; i++) {
        final x = twoPi * i / 160;
        final p = px(x, f(x));
        i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
      }
      return path;
    }

    canvas.drawPath(
      curve(math.cos),
      Paint()
        ..color = _purple.withAlpha(0x99)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.drawPath(
      curve(math.sin),
      Paint()
        ..color = _teal
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );
    _text(canvas, 'sin', px(twoPi, 0) + const Offset(3, -10), _teal, size: 10);
    _text(
      canvas,
      'cos',
      px(twoPi, 1) + const Offset(3, -6),
      _purple.withAlpha(0xCC),
      size: 9,
    );

    // peaks
    canvas.drawCircle(px(math.pi / 2, 1), 3.0, Paint()..color = c.textPrimary);
    canvas.drawCircle(
      px(3 * math.pi / 2, -1),
      3.0,
      Paint()..color = c.textPrimary,
    );
  }

  @override
  bool shouldRepaint(covariant _SineWavePainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure — the memory data-flow: result → memory → input, with the Ans
// bypass and the M+/M− feedback loop. (Chapter "Speichern & Abrufen".)
// ---------------------------------------------------------------------------

class MemoryFlowFigure extends StatelessWidget {
  /// Localizable box labels — German defaults; translated per language.
  final String result;
  final String store;
  final String input;
  const MemoryFlowFigure({
    super.key,
    this.result = 'Ergebnis',
    this.store = 'Speicher',
    this.input = 'Eingabe',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.7,
      child: CustomPaint(
          painter: _MemoryFlowPainter(AppColors.of(context), result, store, input)),
    ),
  );
}

class _MemoryFlowPainter extends CustomPainter {
  final AppColors c;
  final String result;
  final String store;
  final String input;
  _MemoryFlowPainter(this.c, this.result, this.store, this.input);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    Offset p(double fx, double fy) => Offset(w * fx, h * fy);

    // Box geometry as (left, top, right, bottom) fractions.
    final boxes = <String, Rect>{
      'res': Rect.fromLTRB(w * 0.03, h * 0.26, w * 0.23, h * 0.50),
      'mem': Rect.fromLTRB(w * 0.40, h * 0.24, w * 0.61, h * 0.52),
      'inp': Rect.fromLTRB(w * 0.76, h * 0.52, w * 0.97, h * 0.76),
    };

    void straightArrow(Offset from, Offset to, Color color, String label) {
      final d = to - from;
      final u = d / d.distance;
      canvas.drawLine(
        from,
        to - u * 8.0,
        Paint()
          ..color = color
          ..strokeWidth = 1.6
          ..strokeCap = StrokeCap.round,
      );
      _arrowHead(canvas, to, u, color);
      final perp = Offset(-u.dy, u.dx);
      final mid = (from + to) / 2 - perp * 10.0;
      _text(
        canvas,
        label,
        Offset(mid.dx - label.length * 2.7, mid.dy - 6),
        color,
        size: 9.5,
        style: FontStyle.italic,
      );
    }

    // --- Ans bypass: dashed L-path result-bottom → along the floor → input-bottom.
    final ansPaint = Paint()
      ..color = c.illusFaint
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    final aStart = p(0.13, 0.50);
    final aCorner1 = p(0.13, 0.88);
    final aCorner2 = p(0.865, 0.88);
    final aEnd = p(0.865, 0.78);
    _dashedLine(canvas, aStart, aCorner1, ansPaint);
    _dashedLine(canvas, aCorner1, aCorner2, ansPaint);
    _dashedLine(canvas, aCorner2, aEnd + const Offset(0, 8), ansPaint);
    _arrowHead(canvas, aEnd, const Offset(0, -1), c.illusFaint);
    _text(
      canvas,
      'Ans',
      Offset(w * 0.45, h * 0.88 - 13),
      c.textFaint,
      size: 9,
      style: FontStyle.italic,
    );

    // --- M+/M− feedback: cubic arc result-top → memory-top.
    final arcPaint = Paint()
      ..color = _orange
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(
      Path()
        ..moveTo(w * 0.13, h * 0.26)
        ..cubicTo(w * 0.13, h * 0.06, w * 0.50, h * 0.06, w * 0.50, h * 0.22),
      arcPaint,
    );
    _arrowHead(canvas, p(0.50, 0.24), const Offset(0, 1), _orange);
    _text(
      canvas,
      'M+ / M−',
      Offset(w * 0.24, h * 0.05),
      _orange,
      size: 9,
      style: FontStyle.italic,
    );

    // --- STO and RCL straight arrows.
    straightArrow(p(0.23, 0.38), p(0.40, 0.38), _teal, 'STO');
    straightArrow(p(0.61, 0.40), p(0.80, 0.52), _blue, 'RCL');

    // --- Boxes (fill then border) drawn over the arrow ends.
    boxes.forEach((id, r) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, const Radius.circular(6)),
        Paint()..color = c.cardFill,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, const Radius.circular(6)),
        Paint()
          ..color = c.illusLine
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    });

    // --- Box labels.
    void centerLabel(Rect r, String s, Color color, double dy,
        {double size = 10, FontWeight weight = FontWeight.w500}) {
      _text(
        canvas,
        s,
        Offset(r.center.dx - s.length * size * 0.27, r.center.dy + dy),
        color,
        size: size,
        weight: weight,
      );
    }

    centerLabel(boxes['res']!, result, c.textSecondary, -6);
    centerLabel(boxes['mem']!, store, c.textPrimary, -9,
        size: 11, weight: FontWeight.w600);
    centerLabel(boxes['mem']!, '(M)', c.textMuted, 4, size: 9);
    centerLabel(boxes['inp']!, input, c.textSecondary, -6);

    // --- MC delete mark: small × just outside the memory box's top-right.
    final mc = Offset(boxes['mem']!.right - 1, boxes['mem']!.top + 1);
    final mcPaint = Paint()
      ..color = c.textMuted
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(mc + const Offset(-3.5, -3.5), mc + const Offset(3.5, 3.5),
        mcPaint);
    canvas.drawLine(mc + const Offset(3.5, -3.5), mc + const Offset(-3.5, 3.5),
        mcPaint);
    _text(canvas, 'MC', mc + const Offset(6, -5), c.textMuted, size: 8.5);
  }

  @override
  bool shouldRepaint(covariant _MemoryFlowPainter old) =>
      old.c != c ||
      old.result != result ||
      old.store != store ||
      old.input != input;
}

// ---------------------------------------------------------------------------
// Figure — the session history tape: swipe down to open, tap an entry to
// recall it into the input. (Chapter "Speichern & Abrufen".)
// ---------------------------------------------------------------------------

class HistoryBandFigure extends StatelessWidget {
  /// Localizable labels — German defaults; translated per language.
  final String swipe;
  final String newCap;
  final String tap;
  const HistoryBandFigure({
    super.key,
    this.swipe = 'wischen',
    this.newCap = 'neu',
    this.tap = 'antippen',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.3,
      child: CustomPaint(
          painter: _HistoryBandPainter(AppColors.of(context), swipe, newCap, tap)),
    ),
  );
}

class _HistoryBandPainter extends CustomPainter {
  final AppColors c;
  final String swipe;
  final String newCap;
  final String tap;
  _HistoryBandPainter(this.c, this.swipe, this.newCap, this.tap);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    Offset p(double fx, double fy) => Offset(w * fx, h * fy);

    // Hairline above the entries.
    canvas.drawLine(
      p(0.06, 0.185),
      p(0.74, 0.185),
      Paint()
        ..color = c.hairline
        ..strokeWidth = 0.8,
    );

    // --- Swipe-down indicator (top, centred over the tape).
    final swipePaint = Paint()
      ..color = c.textMuted
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(p(0.40, 0.04), p(0.40, 0.13), swipePaint);
    _arrowHead(canvas, p(0.40, 0.135), const Offset(0, 1), c.textMuted);
    _text(canvas, swipe, Offset(w * 0.43, h * 0.04), c.textMuted,
        size: 9, style: FontStyle.italic);

    // --- Four entries, newest at top.
    const entries = <(double, String)>[
      (0.28, '8 × 9 = 60'),
      (0.44, '5 + 7 = 10'),
      (0.60, '3! + 1 = 7'),
      (0.76, '9 × 9 = 69'),
    ];
    for (var i = 0; i < entries.length; i++) {
      final cy = entries[i].$1;
      final r = Rect.fromLTWH(w * 0.06, h * cy - h * 0.055, w * 0.68, h * 0.11);
      final rr = RRect.fromRectAndRadius(r, const Radius.circular(5));
      final isNew = i == 0;
      final isOld = i == entries.length - 1;
      canvas.drawRRect(
        rr,
        Paint()
          ..color = isNew ? _teal.withAlpha(0x18) : c.cardFill,
      );
      canvas.drawRRect(
        rr,
        Paint()
          ..color = isNew
              ? _teal
              : (isOld ? c.illusFaint : c.illusLine)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2,
      );
      _text(
        canvas,
        entries[i].$2,
        Offset(w * 0.10, h * cy - h * 0.035),
        isNew
            ? c.textPrimary
            : (isOld ? c.textMuted : c.textSecondary),
        size: 9.5,
        weight: isNew ? FontWeight.w500 : FontWeight.w400,
      );
    }

    // --- "neu" capsule on the newest entry.
    final cap = Rect.fromLTWH(w * 0.62, h * 0.28 - h * 0.028, w * 0.10, h * 0.056);
    canvas.drawRRect(
      RRect.fromRectAndRadius(cap, const Radius.circular(4)),
      Paint()..color = _teal.withAlpha(0x55),
    );
    _text(canvas, newCap, Offset(cap.left + 5, cap.center.dy - 5), _teal,
        size: 8);

    // --- Tap arrow from entry 2 to the input field.
    straight(canvas, p(0.74, 0.44), p(0.88, 0.44), _blue);
    _text(canvas, tap, Offset(w * 0.755, h * 0.44 - 14), _blue,
        size: 9, style: FontStyle.italic);

    // --- Small input field with a red caret (where the value lands).
    final inp = Rect.fromLTWH(w * 0.89, h * 0.40, w * 0.09, h * 0.09);
    canvas.drawRRect(
      RRect.fromRectAndRadius(inp, const Radius.circular(3)),
      Paint()..color = c.cardFill,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(inp, const Radius.circular(3)),
      Paint()
        ..color = _blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
    canvas.drawLine(
      Offset(inp.center.dx, inp.top + 4),
      Offset(inp.center.dx, inp.bottom - 4),
      Paint()
        ..color = const Color(0xFFFF3B30)
        ..strokeWidth = 1.5,
    );
  }

  void straight(Canvas canvas, Offset from, Offset to, Color color) {
    final u = (to - from) / (to - from).distance;
    canvas.drawLine(
      from,
      to - u * 8.0,
      Paint()
        ..color = color
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round,
    );
    _arrowHead(canvas, to, u, color);
  }

  @override
  bool shouldRepaint(covariant _HistoryBandPainter old) =>
      old.c != c ||
      old.swipe != swipe ||
      old.newCap != newCap ||
      old.tap != tap;
}

// ---------------------------------------------------------------------------
// Figure — the unit hyperbola x²−y²=1 with its sector area, the deliberate
// counterpart to the unit-circle figure. (Chapter "Hyperbelfunktionen".)
// ---------------------------------------------------------------------------

class UnitHyperbolaFigure extends StatelessWidget {
  /// Localizable label — German default; translated per language.
  final String area;
  const UnitHyperbolaFigure({super.key, this.area = 'Fläche = t/2'});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.15,
      child: CustomPaint(
          painter: _UnitHyperbolaPainter(AppColors.of(context), area)),
    ),
  );
}

class _UnitHyperbolaPainter extends CustomPainter {
  final AppColors c;
  final String area;
  _UnitHyperbolaPainter(this.c, this.area);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final plot = Rect.fromLTRB(w * 0.12, h * 0.07, w * 0.94, h * 0.93);
    const xMin = -0.6, xMax = 3.0, yMin = -1.8, yMax = 1.8;
    Offset px(double x, double y) => Offset(
      plot.left + (x - xMin) / (xMax - xMin) * plot.width,
      plot.bottom - (y - yMin) / (yMax - yMin) * plot.height,
    );

    // (1) Hyperbolic sector fill (drawn first so axes/curve sit on top).
    const t0 = 0.9;
    final ct = _cosh(t0), st = _sinh(t0);
    final sPath = Path()
      ..moveTo(px(0, 0).dx, px(0, 0).dy)
      ..lineTo(px(1, 0).dx, px(1, 0).dy);
    for (var i = 1; i <= 60; i++) {
      final t = t0 * i / 60;
      final p = px(_cosh(t), _sinh(t));
      sPath.lineTo(p.dx, p.dy);
    }
    sPath
      ..lineTo(px(0, 0).dx, px(0, 0).dy)
      ..close();
    canvas.drawPath(sPath, Paint()..color = const Color(0x220F6E56));

    // (2) Asymptotes y = ±x (dashed).
    final ap = Paint()
      ..color = c.illusFaint
      ..strokeWidth = 1.0;
    _dashedLine(canvas, px(0, 0), px(1.9, 1.9), ap);
    _dashedLine(canvas, px(0, 0), px(1.9, -1.9), ap);
    _text(canvas, 'y = x', px(1.85, 1.85) + const Offset(3, -7), c.textFaint,
        size: 9, style: FontStyle.italic);
    _text(canvas, 'y = −x', px(1.85, -1.85) + const Offset(3, 2), c.textFaint,
        size: 9, style: FontStyle.italic);

    // (3) Axes with arrowheads.
    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.5;
    final xEnd = px(xMax, 0), yEnd = px(0, yMax);
    canvas.drawLine(px(xMin, 0), xEnd, axis);
    canvas.drawLine(px(0, yMin), yEnd, axis);
    _arrowHead(canvas, xEnd, const Offset(1, 0), c.illusLine, len: 7, halfW: 3);
    _arrowHead(canvas, yEnd, const Offset(0, -1), c.illusLine, len: 7, halfW: 3);
    _text(canvas, 'x', xEnd + const Offset(-8, 5), c.textMuted, size: 10);
    _text(canvas, 'y', yEnd + const Offset(5, 1), c.textMuted, size: 10);

    // (4) Right branch of the hyperbola.
    final curve = Paint()
      ..color = c.illusLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    const tMax = 1.32, n = 80;
    final cp = Path();
    for (var i = 0; i <= n; i++) {
      final t = -tMax + 2 * tMax * i / n;
      final p = px(_cosh(t), _sinh(t));
      i == 0 ? cp.moveTo(p.dx, p.dy) : cp.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(cp, curve);
    _text(canvas, 'x²−y²=1', px(2.2, 1.55), c.textSecondary,
        size: 9.5, style: FontStyle.italic);

    // (5) Projection lines for P.
    canvas.drawLine(
      px(0, 0),
      px(ct, 0),
      Paint()
        ..color = _teal
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round,
    );
    _dashedLine(canvas, px(ct, 0), px(ct, st),
        Paint()..color = _blue..strokeWidth = 1.8);
    canvas.drawLine(px(0, 0), px(ct, st),
        Paint()..color = c.illusLine..strokeWidth = 1.8);

    // (6) Axis ticks at the projections.
    final tick = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.0;
    canvas.drawLine(
        px(ct, 0) - const Offset(0, 3), px(ct, 0) + const Offset(0, 3), tick);
    canvas.drawLine(
        px(0, st) - const Offset(3, 0), px(0, st) + const Offset(3, 0), tick);

    // (7) Point P.
    canvas.drawCircle(px(ct, st), 3.5, Paint()..color = c.textPrimary);
    _text(canvas, 'P', px(ct, st) + const Offset(5, -14), c.textSecondary,
        size: 10);

    // (8) Projection labels.
    _text(canvas, 'cosh t', px(ct / 2, 0) + const Offset(-16, 5), _teal,
        size: 10);
    _text(canvas, 'sinh t', px(ct, st / 2) + const Offset(6, -4), _blue,
        size: 10);

    // (9) Sector-area label.
    _text(canvas, area, px(0.42, 0.30), c.textSecondary,
        size: 8.5, style: FontStyle.italic);

    // (10) Unit marker on the radius.
    final mid = (px(0, 0) + px(ct, st)) / 2.0;
    _text(canvas, '1', mid + const Offset(5, -10), c.textSecondary,
        size: 10, style: FontStyle.italic);
  }

  @override
  bool shouldRepaint(covariant _UnitHyperbolaPainter old) =>
      old.c != c || old.area != area;
}

// ---------------------------------------------------------------------------
// Figure — the curves sinh, cosh, tanh together, with tanh's ±1 asymptotes
// and cosh's minimum (0,1). (Chapter "Hyperbelfunktionen".)
// ---------------------------------------------------------------------------

class HyperbolicCurvesFigure extends StatelessWidget {
  const HyperbolicCurvesFigure({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.25,
      child: CustomPaint(painter: _HyperbolicCurvesPainter(AppColors.of(context))),
    ),
  );
}

class _HyperbolicCurvesPainter extends CustomPainter {
  final AppColors c;
  _HyperbolicCurvesPainter(this.c);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final plot = Rect.fromLTRB(w * 0.13, h * 0.06, w * 0.95, h * 0.92);
    const xMin = -2.4, xMax = 2.4, yMin = -3.2, yMax = 3.2;
    Offset px(double x, double y) => Offset(
      plot.left + (x - xMin) / (xMax - xMin) * plot.width,
      plot.bottom - (y - yMin) / (yMax - yMin) * plot.height,
    );

    void drawCurve(double Function(double) fn, Color color) {
      final path = Path();
      var first = true;
      for (var i = 0; i <= 90; i++) {
        final x = xMin + (xMax - xMin) * i / 90;
        final y = fn(x);
        if (y < yMin || y > yMax) {
          first = true;
          continue;
        }
        final p = px(x, y);
        if (first) {
          path.moveTo(p.dx, p.dy);
          first = false;
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.2
          ..strokeJoin = StrokeJoin.round
          ..strokeCap = StrokeCap.round,
      );
    }

    // (1) tanh asymptotes y = ±1 (dashed).
    final ap = Paint()
      ..color = c.illusFaint
      ..strokeWidth = 1.0;
    _dashedLine(canvas, px(xMin, 1.0), px(xMax, 1.0), ap, on: 6, off: 4);
    _dashedLine(canvas, px(xMin, -1.0), px(xMax, -1.0), ap, on: 6, off: 4);
    _text(canvas, '1', px(xMin, 1.0) + const Offset(-10, -7), c.textFaint,
        size: 9);
    _text(canvas, '−1', px(xMin, -1.0) + const Offset(-14, -7), c.textFaint,
        size: 9);

    // (2) Curves, clipped to the plot rect.
    canvas.save();
    canvas.clipRect(
        Rect.fromLTRB(plot.left - 1, plot.top - 1, plot.right + 1, plot.bottom + 1));
    drawCurve(_cosh, _purple);
    drawCurve(_sinh, _teal);
    drawCurve(_tanh, _blue);
    canvas.restore();

    // (3) Axes.
    final axis = Paint()
      ..color = c.illusLine
      ..strokeWidth = 1.5;
    final xEnd = px(xMax, 0), yEnd = px(0, yMax);
    canvas.drawLine(px(xMin, 0), xEnd, axis);
    canvas.drawLine(px(0, yMin), yEnd, axis);
    _arrowHead(canvas, xEnd, const Offset(1, 0), c.illusLine, len: 7, halfW: 3);
    _arrowHead(canvas, yEnd, const Offset(0, -1), c.illusLine, len: 7, halfW: 3);
    _text(canvas, 'x', xEnd + const Offset(-8, 5), c.textMuted, size: 10);
    _text(canvas, 'y', yEnd + const Offset(5, 1), c.textMuted, size: 10);

    // y-axis ticks at ±2.
    final hair = Paint()
      ..color = c.hairline
      ..strokeWidth = 0.8;
    for (final yt in [-2.0, 2.0]) {
      canvas.drawLine(
          px(0, yt) - const Offset(4, 0), px(0, yt) + const Offset(4, 0), hair);
      _text(canvas, yt > 0 ? '2' : '−2',
          px(0, yt) + Offset(yt > 0 ? -12 : -18, -5), c.textFaint, size: 8.5);
    }

    // (4) cosh minimum (0,1).
    canvas.drawCircle(px(0, 1), 3.0, Paint()..color = _purple);
    _text(canvas, '(0, 1)', px(0, 1) + const Offset(5, -14), _purple, size: 9);

    // (5) Curve labels.
    _text(canvas, 'cosh', px(1.7, yMax) + const Offset(-22, 4), _purple,
        size: 9.5, weight: FontWeight.w500);
    _text(canvas, 'sinh', px(1.82, 2.8) + const Offset(5, 0), _teal,
        size: 9.5, weight: FontWeight.w500);
    _text(canvas, 'tanh', px(1.9, 0.88) + const Offset(5, -5), _blue,
        size: 9.5, weight: FontWeight.w500);
  }

  @override
  bool shouldRepaint(covariant _HyperbolicCurvesPainter old) => old.c != c;
}

// ---------------------------------------------------------------------------
// Figure — the catenary y = cosh x (a hanging chain) contrasted with a
// parabola. (Chapter "Hyperbelfunktionen".)
// ---------------------------------------------------------------------------

class CatenaryFigure extends StatelessWidget {
  /// Localizable labels — German defaults; translated per language.
  final String catenary;
  final String parabola;
  const CatenaryFigure({
    super.key,
    this.catenary = 'Kettenlinie',
    this.parabola = 'Parabel',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.6,
      child: CustomPaint(
          painter: _CatenaryPainter(AppColors.of(context), catenary, parabola)),
    ),
  );
}

class _CatenaryPainter extends CustomPainter {
  final AppColors c;
  final String catenary;
  final String parabola;
  _CatenaryPainter(this.c, this.catenary, this.parabola);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final plot = Rect.fromLTRB(w * 0.08, h * 0.08, w * 0.92, h * 0.88);
    const xMin = -2.2, xMax = 2.2, yMin = 0.7, yMax = 4.2;
    Offset px(double x, double y) => Offset(
      plot.left + (x - xMin) / (xMax - xMin) * plot.width,
      plot.bottom - (y - yMin) / (yMax - yMin) * plot.height,
    );

    const xPole = 2.0;
    final yPole = _cosh(xPole);
    final lp = px(-xPole, yPole), rp = px(xPole, yPole);

    // (1) Posts.
    final pole = Paint()
      ..color = c.illusLine
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(lp, Offset(lp.dx, plot.bottom), pole);
    canvas.drawLine(rp, Offset(rp.dx, plot.bottom), pole);
    canvas.drawRect(Rect.fromCenter(center: lp, width: 8, height: 4),
        Paint()..color = c.illusLine);
    canvas.drawRect(Rect.fromCenter(center: rp, width: 8, height: 4),
        Paint()..color = c.illusLine);

    // (2) Parabola y = 0.5x²+1 (thin, faint) — stays below the catenary.
    final parPath = Path();
    var pFirst = true;
    for (var i = 0; i <= 80; i++) {
      final x = xMin + (xMax - xMin) * i / 80;
      final y = 0.5 * x * x + 1.0;
      if (y < yMin || y > yMax) {
        pFirst = true;
        continue;
      }
      final p = px(x, y);
      if (pFirst) {
        parPath.moveTo(p.dx, p.dy);
        pFirst = false;
      } else {
        parPath.lineTo(p.dx, p.dy);
      }
    }
    canvas.drawPath(
      parPath,
      Paint()
        ..color = c.illusFaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..strokeJoin = StrokeJoin.round,
    );
    _text(canvas, parabola, px(1.4, 0.5 * 1.4 * 1.4 + 1.0) + const Offset(6, -2),
        c.textFaint, size: 8.5, style: FontStyle.italic);

    // (3) Catenary y = cosh x.
    final catPath = Path();
    var cFirst = true;
    for (var i = 0; i <= 90; i++) {
      final x = xMin + (xMax - xMin) * i / 90;
      final y = _cosh(x);
      if (y < yMin || y > yMax) {
        cFirst = true;
        continue;
      }
      final p = px(x, y);
      if (cFirst) {
        catPath.moveTo(p.dx, p.dy);
        cFirst = false;
      } else {
        catPath.lineTo(p.dx, p.dy);
      }
    }
    canvas.drawPath(
      catPath,
      Paint()
        ..color = _teal
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );

    // (4) Lowest point (0,1).
    canvas.drawCircle(px(0, 1), 3.0, Paint()..color = _teal);
    _text(canvas, '(0, 1)', px(0, 1) + const Offset(5, -14), _teal, size: 9);

    // (5) Suspension points.
    canvas.drawCircle(lp, 3.5, Paint()..color = c.textPrimary);
    canvas.drawCircle(rp, 3.5, Paint()..color = c.textPrimary);

    // (6) Ground reference line.
    canvas.drawLine(Offset(plot.left, plot.bottom), Offset(plot.right, plot.bottom),
        Paint()..color = c.hairline..strokeWidth = 0.8);

    // (7) Title.
    _text(canvas, '$catenary  y = cosh x',
        Offset(plot.left + plot.width * 0.22, plot.top + 4), c.textSecondary,
        size: 10.5, weight: FontWeight.w500);

    // (8) Difference marker at x = 1.5 (parabola sits below the chain).
    const xA = 1.5;
    final yCat = _cosh(xA), yPar = 0.5 * xA * xA + 1.0;
    final diff = Paint()
      ..color = c.illusDot
      ..strokeWidth = 1.2;
    canvas.drawLine(px(xA, yPar + 0.06), px(xA, yCat - 0.06), diff);
    _arrowHead(canvas, px(xA, yCat), const Offset(0, -1), c.illusDot,
        len: 5, halfW: 2);
    _arrowHead(canvas, px(xA, yPar), const Offset(0, 1), c.illusDot,
        len: 5, halfW: 2);
  }

  @override
  bool shouldRepaint(covariant _CatenaryPainter old) =>
      old.c != c || old.catenary != catenary || old.parabola != parabola;
}

// ---------------------------------------------------------------------------
// Figure — Pascal's triangle (nCr) with the addition rule shown for one
// entry, in dozenal. (Chapter "Set 9 & 10".)
// ---------------------------------------------------------------------------

class PascalTriangleFigure extends StatelessWidget {
  /// Localizable label — German default; pass a translation in the per-language manual file.
  final String title;
  const PascalTriangleFigure({super.key, this.title = 'Pascalsches Dreieck'});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.35,
      child: CustomPaint(
          painter: _PascalTrianglePainter(AppColors.of(context), title)),
    ),
  );
}

class _PascalTrianglePainter extends CustomPainter {
  final AppColors c;
  final String title;
  _PascalTrianglePainter(this.c, this.title);

  // pascal[n][k] = "n choose k", dozenal (10 dec = A).
  static const List<List<String>> _rows = [
    ['1'],
    ['1', '1'],
    ['1', '2', '1'],
    ['1', '3', '3', '1'],
    ['1', '4', '6', '4', '1'],
    ['1', '5', 'A', 'A', '5', '1'],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    const cellW = 0.13, rowTop = 0.15, rowBot = 0.82;
    final rowH = (rowBot - rowTop) / 5 * h;
    Offset cell(int n, int k) =>
        Offset(w * 0.5 + (k - n / 2.0) * cellW * w, h * rowTop + n * rowH);

    // 1. Normal entries.
    for (var n = 0; n < 6; n++) {
      for (var k = 0; k <= n; k++) {
        if (n == 5 && k == 2) continue; // highlighted, drawn later
        final o = cell(n, k);
        canvas.drawCircle(o, 10, Paint()..color = c.cardFill);
        canvas.drawCircle(
          o,
          10,
          Paint()
            ..color = c.illusFaint
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0,
        );
        final lbl = _rows[n][k];
        _text(canvas, lbl, o - Offset(lbl.length * 3.5, 6), c.textSecondary,
            size: 11, weight: FontWeight.w500);
      }
    }

    // 2. Addition-rule lines: parents (4,1)=4 and (4,2)=6 → child (5,2)=A.
    final parent1 = cell(4, 1) + const Offset(0, 10);
    final parent2 = cell(4, 2) + const Offset(0, 10);
    final child = cell(5, 2) - const Offset(0, 10);
    final faint = Paint()
      ..color = c.illusFaint
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(parent1, child, faint);
    canvas.drawLine(parent2, child, faint);
    _text(canvas, '4 + 6 = A',
        Offset(cell(5, 2).dx + 14, (parent1.dy + child.dy) / 2 - 5),
        c.textFaint, size: 8.5, style: FontStyle.italic);

    // 3. Highlighted entry (5 nCr 2 = A).
    final hCell = cell(5, 2);
    canvas.drawCircle(hCell, 12, Paint()..color = const Color(0x2D0F6E56));
    canvas.drawCircle(
      hCell,
      12,
      Paint()
        ..color = _teal
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8,
    );
    _text(canvas, 'A', hCell - const Offset(4, 6), _teal,
        size: 12, weight: FontWeight.w700);
    _text(canvas, '5 nCr 2', Offset(hCell.dx + 16, hCell.dy - 6), c.textMuted,
        size: 9);

    // 4. Row labels.
    for (var n = 0; n < 6; n++) {
      _text(canvas, 'n=$n', Offset(w * 0.03, h * rowTop + n * rowH - 5),
          c.textFaint, size: 8.5);
    }

    // 5. Title.
    _text(canvas, title, Offset(w * 0.17, h * 0.03),
        c.textMuted, size: 10, weight: FontWeight.w500);
  }

  @override
  bool shouldRepaint(covariant _PascalTrianglePainter old) =>
      old.c != c || old.title != title;
}

// ---------------------------------------------------------------------------
// Figure — the modulo clock: 12 positions 0..B, a wrap arrow over 0, the
// example 15₁₂ mod 10₁₂ = 5. (Chapter "Set 9 & 10".)
// ---------------------------------------------------------------------------

class ModuloClockFigure extends StatelessWidget {
  /// Localizable labels — German defaults; pass translations in the per-language manual file.
  final String title;
  final String wrap;
  final String note;
  const ModuloClockFigure({
    super.key,
    this.title = 'Modulo — die Uhr-Arithmetik',
    this.wrap = 'Umlauf',
    this.note = '(= 17 dez., 17 mod 12 = 5)',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
          painter: _ModuloClockPainter(AppColors.of(context), title, wrap, note)),
    ),
  );
}

class _ModuloClockPainter extends CustomPainter {
  final AppColors c;
  final String title;
  final String wrap;
  final String note;
  _ModuloClockPainter(this.c, this.title, this.wrap, this.note);

  static const _labels = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B'];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final cx = w * 0.5, cy = h * 0.50, r = w * 0.38;
    final center = Offset(cx, cy);
    // Position i: 0 at top, clockwise.
    double th(double i) => -math.pi / 2 + i * 2 * math.pi / 12;
    Offset onRing(double i, double rad) =>
        Offset(cx + rad * math.cos(th(i)), cy + rad * math.sin(th(i)));

    // 1. Dial.
    canvas.drawCircle(
      center,
      r,
      Paint()
        ..color = c.illusLine
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );

    // 2. Ticks + digits.
    for (var i = 0; i < 12; i++) {
      final isMain = i % 3 == 0;
      canvas.drawLine(
        onRing(i.toDouble(), r * (isMain ? 0.82 : 0.88)),
        onRing(i.toDouble(), r),
        Paint()
          ..color = c.illusFaint
          ..strokeWidth = isMain ? 1.4 : 1.0
          ..strokeCap = StrokeCap.round,
      );
      final isResult = i == 5;
      final lbl = _labels[i];
      _text(canvas, lbl, onRing(i.toDouble(), r * 0.72) - Offset(lbl.length * 3.5, 5.5),
          isResult ? _teal : c.textSecondary,
          size: isResult ? 12 : 11,
          weight: isResult ? FontWeight.w700 : FontWeight.w400);
    }

    // 3. Highlighted result dot at position 5.
    canvas.drawCircle(onRing(5.0, r * 0.90), 8, Paint()..color = _teal);

    // 4. Hand (centre → position 5).
    final tip = onRing(5.0, r * 0.78);
    final u = (tip - center) / (tip - center).distance;
    canvas.drawLine(
      center + const Offset(0, 4),
      tip - u * 7.0,
      Paint()
        ..color = _teal
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round,
    );
    _arrowHead(canvas, tip, u, _teal, len: 7, halfW: 3.0);
    canvas.drawCircle(center, 4.5, Paint()..color = c.textSecondary);

    // 5. Wrap arc over the top (≈B → 0 → ≈1).
    final rArc = r * 1.12;
    final arcStart = th(10.6);
    final sweep = (1.4 - 10.6 + 12) * 2 * math.pi / 12;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: rArc),
      arcStart,
      sweep,
      false,
      Paint()
        ..color = _orange
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8
        ..strokeCap = StrokeCap.round,
    );
    final arcEnd = th(1.4);
    final arcEndPt = Offset(cx + rArc * math.cos(arcEnd), cy + rArc * math.sin(arcEnd));
    _arrowHead(canvas, arcEndPt, Offset(-math.sin(arcEnd), math.cos(arcEnd)), _orange,
        len: 7, halfW: 3.0);
    _text(canvas, wrap, Offset(cx + rArc * 0.42, cy - rArc * 0.92), _orange,
        size: 9, style: FontStyle.italic);

    // 6. Formula labels.
    _text(canvas, '15₁₂ mod 10₁₂ = 5', Offset(w * 0.20, h * 0.90),
        c.textSecondary, size: 10.5, weight: FontWeight.w500);
    _text(canvas, note, Offset(w * 0.21, h * 0.945),
        c.textFaint, size: 8.5, style: FontStyle.italic);

    // 7. Title.
    _text(canvas, title, Offset(w * 0.14, h * 0.03),
        c.textMuted, size: 10, weight: FontWeight.w500);
  }

  @override
  bool shouldRepaint(covariant _ModuloClockPainter old) =>
      old.c != c || old.title != title || old.wrap != wrap || old.note != note;
}

// ---------------------------------------------------------------------------
// Figure — powers of twelve as an EXP ladder (12⁰..12⁴), dozenal over
// decimal, with a ×12 jump. (Chapter "Set 9 & 10".)
// ---------------------------------------------------------------------------

class DozenalPowersScaleFigure extends StatelessWidget {
  /// Localizable labels — German defaults; pass translations in the per-language manual file.
  final String title;
  final String dozLabel;
  final String decLabel;
  const DozenalPowersScaleFigure({
    super.key,
    this.title = 'Zwölferpotenzen  —  1 EXP n',
    this.dozLabel = 'Doz.',
    this.decLabel = 'Dez.',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 2.2,
      child: CustomPaint(
          painter: _DozenalPowersScalePainter(
              AppColors.of(context), title, dozLabel, decLabel)),
    ),
  );
}

class _DozenalPowersScalePainter extends CustomPainter {
  final AppColors c;
  final String title;
  final String dozLabel;
  final String decLabel;
  _DozenalPowersScalePainter(this.c, this.title, this.dozLabel, this.decLabel);

  static const _doz = ['1', '10', '100', '1000', '10000'];
  static const _pow = ['12⁰', '12¹', '12²', '12³', '12⁴'];
  static const _dec = ['1', '12', '144', '1728', '20736'];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final x0 = w * 0.12, x1 = w * 0.88, yAxis = h * 0.50;
    double xi(int i) => x0 + i / 4.0 * (x1 - x0);

    _text(canvas, title, Offset(w * 0.07, h * 0.06),
        c.textMuted, size: 10, weight: FontWeight.w500);
    _text(canvas, dozLabel, Offset(w * 0.01, yAxis - 24), c.textMuted, size: 8.5);
    _text(canvas, decLabel, Offset(w * 0.01, yAxis + 14), c.textFaint,
        size: 8.5, style: FontStyle.italic);

    // Axis + arrow.
    canvas.drawLine(
      Offset(x0, yAxis),
      Offset(x1 + 4, yAxis),
      Paint()
        ..color = c.illusLine
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round,
    );
    _arrowHead(canvas, Offset(x1 + 4, yAxis), const Offset(1, 0), c.illusLine,
        len: 8, halfW: 3.0);

    for (var i = 0; i < 5; i++) {
      final x = xi(i);
      canvas.drawLine(
        Offset(x, yAxis - 8),
        Offset(x, yAxis + 8),
        Paint()
          ..color = c.illusLine
          ..strokeWidth = 1.4
          ..strokeCap = StrokeCap.round,
      );
      if (i == 1 || i == 2) {
        canvas.drawLine(Offset(x, yAxis - 8), Offset(x, yAxis - 44),
            Paint()..color = c.hairline..strokeWidth = 0.8);
      }
      final pow = _pow[i];
      _text(canvas, pow, Offset(x - pow.length * 3.0, yAxis - 44), c.textMuted,
          size: 8.5);
      final doz = _doz[i];
      _text(canvas, doz, Offset(x - doz.length * 3.8, yAxis - 28), c.textSecondary,
          size: 11, weight: FontWeight.w600);
      final dec = _dec[i];
      _text(canvas, dec, Offset(x - dec.length * 3.0, yAxis + 14), c.textFaint,
          size: 8.5, style: FontStyle.italic);
    }

    // ×12 jump arc (i=1 → i=2), an upward bow landing on the next mark.
    final jStart = Offset(xi(1), yAxis - 3);
    final jEnd = Offset(xi(2), yAxis - 3);
    final jCtrl = Offset((xi(1) + xi(2)) / 2, yAxis - 34);
    canvas.drawPath(
      Path()
        ..moveTo(jStart.dx, jStart.dy)
        ..quadraticBezierTo(jCtrl.dx, jCtrl.dy, jEnd.dx, jEnd.dy),
      Paint()
        ..color = _teal
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round,
    );
    final jDir = (jEnd - jCtrl) / (jEnd - jCtrl).distance;
    _arrowHead(canvas, jEnd, jDir, _teal, len: 7, halfW: 2.8);
    _text(canvas, '× 12', Offset((xi(1) + xi(2)) / 2 - 11, yAxis - 30), _teal,
        size: 9.5, weight: FontWeight.w600);
    canvas.drawCircle(Offset(xi(2), yAxis), 5, Paint()..color = _teal);

    // EXP key mock.
    final btn = RRect.fromLTRBR(
        w * 0.84, h * 0.62, w * 0.97, h * 0.84, const Radius.circular(4));
    canvas.drawRRect(btn, Paint()..color = c.cardFill);
    canvas.drawRRect(
      btn,
      Paint()
        ..color = c.illusFaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );
    _text(canvas, 'EXP', Offset(w * 0.874, h * 0.68), c.textSecondary,
        size: 11, weight: FontWeight.w600);
    _text(canvas, '(Sci)', Offset(w * 0.872, h * 0.77), c.textFaint, size: 8);
  }

  @override
  bool shouldRepaint(covariant _DozenalPowersScalePainter old) =>
      old.c != c ||
      old.title != title ||
      old.dozLabel != dozLabel ||
      old.decLabel != decLabel;
}

/// Centered text by measured width (robust across scripts/lengths, unlike the
/// char-count estimates used elsewhere). Forced LTR like [_text].
void _textCenteredAt(
  Canvas canvas,
  String s,
  double centerX,
  double top,
  Color color, {
  double size = 9,
}) {
  final tp = TextPainter(
    text: TextSpan(text: s, style: TextStyle(color: color, fontSize: size)),
    textDirection: TextDirection.ltr,
  )..layout();
  tp.paint(canvas, Offset(centerX - tp.width / 2, top));
}

/// The four exponent/root/log key glyphs exactly as they appear on the keypad
/// (x², x^□, □√x, x_□), each captioned with what it does. Renders the real
/// button glyphs via [paintTokenAt] so the manual shows precisely what the user
/// taps — the corner of the little square encodes the role (see the prose).
class KeyGlyphsFigure extends StatelessWidget {
  /// Localizable captions — German defaults; translated per language.
  final String square;
  final String power;
  final String root;
  final String logarithm;
  const KeyGlyphsFigure({
    super.key,
    this.square = 'Quadrat',
    this.power = 'Potenz',
    this.root = 'Wurzel',
    this.logarithm = 'Logarithmus',
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: AspectRatio(
      aspectRatio: 2.7,
      child: CustomPaint(
        painter: _KeyGlyphsPainter(
            AppColors.of(context), square, power, root, logarithm),
      ),
    ),
  );
}

class _KeyGlyphsPainter extends CustomPainter {
  final AppColors c;
  final String square;
  final String power;
  final String root;
  final String logarithm;
  _KeyGlyphsPainter(
      this.c, this.square, this.power, this.root, this.logarithm);

  @override
  void paint(Canvas canvas, Size size) {
    const tokens = <CalcToken>[
      Square(),
      ExpTopRight(),
      RootTopLeft(),
      LogBotRight(),
    ];
    final captions = [square, power, root, logarithm];
    const n = 4;
    const captionBand = 16.0;
    final gap = size.width * 0.045;
    final cell = math.min(
      (size.width - gap * (n + 1)) / n,
      size.height - captionBand,
    );
    final totalW = cell * n + gap * (n - 1);
    var x = (size.width - totalW) / 2;
    final top = (size.height - captionBand - cell) / 2;

    for (var i = 0; i < n; i++) {
      final r = Rect.fromLTWH(x, top, cell, cell);
      final rr = RRect.fromRectAndRadius(r, const Radius.circular(8));
      canvas.drawRRect(rr, Paint()..color = c.cardFill);
      canvas.drawRRect(
        rr,
        Paint()
          ..color = c.keyBorder
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2,
      );
      // The real keypad glyph, inset within the key cell.
      paintTokenAt(
        canvas,
        tokens[i],
        rect: r.deflate(cell * 0.27),
        color: c.op,
        strokeWidth: 2.0,
      );
      _textCenteredAt(
        canvas,
        captions[i],
        x + cell / 2,
        top + cell + 4,
        c.textMuted,
      );
      x += cell + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _KeyGlyphsPainter old) =>
      old.c != c ||
      old.square != square ||
      old.power != power ||
      old.root != root ||
      old.logarithm != logarithm;
}
