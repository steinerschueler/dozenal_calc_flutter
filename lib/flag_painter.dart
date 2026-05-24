import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Three horizontal stripes — black / red / gold (RAL 9005 / 3020 / 1023,
/// approximate hex). Canonical aspect ratio is 5:3 (width:height).
class GermanFlagPainter extends CustomPainter {
  const GermanFlagPainter();

  static const _black = Color(0xFF000000);
  static const _red = Color(0xFFDD0000);
  static const _gold = Color(0xFFFFCE00);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stripeH = h / 3;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, stripeH),
      Paint()..color = _black,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH, w, stripeH),
      Paint()..color = _red,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH * 2, w, stripeH),
      Paint()..color = _gold,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Vertical-stripes painter shared by FR / IT (and any future flag using
/// the same blueprint). Three equal-width bands; colours and order are
/// passed in. Canonical aspect ratio of these flags is 3:2.
class _VerticalTribandPainter extends CustomPainter {
  final Color left;
  final Color middle;
  final Color right;

  const _VerticalTribandPainter({
    required this.left,
    required this.middle,
    required this.right,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stripeW = w / 3;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, stripeW, h),
      Paint()..color = left,
    );
    canvas.drawRect(
      Rect.fromLTWH(stripeW, 0, stripeW, h),
      Paint()..color = middle,
    );
    canvas.drawRect(
      Rect.fromLTWH(stripeW * 2, 0, stripeW, h),
      Paint()..color = right,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// French Tricolore — blue / white / red vertical bands. Approximate
/// official colours (Pantone Reflex Blue / Safe White / Bright Red).
/// Canonical aspect ratio is 3:2.
class FrenchFlagPainter extends _VerticalTribandPainter {
  const FrenchFlagPainter()
      : super(
          left: const Color(0xFF002395),
          middle: const Color(0xFFFFFFFF),
          right: const Color(0xFFED2939),
        );
}

/// Italian Tricolore — green / white / red vertical bands. Approximate
/// official colours per CONI/Italian-flag spec. Canonical aspect ratio
/// is 3:2.
class ItalianFlagPainter extends _VerticalTribandPainter {
  const ItalianFlagPainter()
      : super(
          left: const Color(0xFF009246),
          middle: const Color(0xFFF1F2F1),
          right: const Color(0xFFCE2B37),
        );
}

/// Irish Tricolour (bratach na hÉireann) — green / white / orange
/// vertical bands. Pantone 347 green / Safe White / Pantone 151 orange,
/// approximate hex. **Canonical aspect ratio is 2:1** (width:height) —
/// wider than the 3:2 of the Romance tricolours, matching the Union
/// Jack proportionally.
class IrishFlagPainter extends _VerticalTribandPainter {
  const IrishFlagPainter()
      : super(
          left: const Color(0xFF169B62),
          middle: const Color(0xFFFFFFFF),
          right: const Color(0xFFFF883E),
        );
}

/// People's Republic of China flag — red field with five yellow stars in
/// the upper-left canton (one large + four small in an arc). Star
/// positions follow the official spec (mapped to a 30×20 reference grid),
/// scaled to picker size. Small stars are drawn pointing up rather than
/// rotated toward the large star — at picker scale (~2 dp radius) the
/// rotation is invisible anyway. Canonical aspect ratio is 3:2.
class ChineseFlagPainter extends CustomPainter {
  const ChineseFlagPainter();

  static const _red = Color(0xFFDE2910);
  static const _yellow = Color(0xFFFFDE00);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()..color = _red,
    );

    final sx = w / 30;
    final sy = h / 20;
    final yellow = Paint()..color = _yellow;

    // Large star centred at (5, 5) in the 30×20 reference grid,
    // radius 3 grid units.
    _star(canvas, Offset(5 * sx, 5 * sy), 3 * sx, yellow);

    // Four small stars in an arc to the right of the large one,
    // radius 1 grid unit.
    _star(canvas, Offset(10 * sx, 2 * sy), 1 * sx, yellow);
    _star(canvas, Offset(12 * sx, 4 * sy), 1 * sx, yellow);
    _star(canvas, Offset(12 * sx, 7 * sy), 1 * sx, yellow);
    _star(canvas, Offset(10 * sx, 9 * sy), 1 * sx, yellow);
  }

  void _star(Canvas canvas, Offset center, double r, Paint paint) {
    // Pentagram via 10 alternating-radius vertices on a circle. The
    // inner-to-outer ratio for a regular five-pointed star is ~0.382
    // (1/φ²), which gives the classic flag-star geometry.
    final innerR = r * 0.382;
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final angle = (i * math.pi / 5) - math.pi / 2;
      final radius = (i.isEven) ? r : innerR;
      final p = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Indian flag — saffron / white / India-green horizontal bands with the
/// Ashoka Chakra (24-spoke navy wheel) centred in the white band.
/// Approximate official colours (Pantone 165 C saffron / Safe White /
/// Pantone 2258 C green / navy #000080). The Chakra's spokes are rendered
/// as 24 evenly-spaced lines radiating from a central hub; the small
/// spade-shaped spoke tips of the real Chakra are omitted (illegible at
/// picker scale). Canonical aspect ratio is 3:2.
class IndianFlagPainter extends CustomPainter {
  const IndianFlagPainter();

  static const _saffron = Color(0xFFFF9933);
  static const _white = Color(0xFFFFFFFF);
  static const _green = Color(0xFF138808);
  static const _navy = Color(0xFF000080);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stripeH = h / 3;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, stripeH),
      Paint()..color = _saffron,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH, w, stripeH),
      Paint()..color = _white,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH * 2, w, stripeH),
      Paint()..color = _green,
    );

    // Ashoka Chakra — centred in the white band, fits with a thin
    // breathing margin above/below.
    final cx = w / 2;
    final cy = stripeH * 1.5;
    final r = stripeH * 0.42;

    final navy = Paint()
      ..color = _navy
      ..style = PaintingStyle.stroke
      ..strokeWidth = stripeH * 0.045;

    canvas.drawCircle(Offset(cx, cy), r, navy);

    // 24 spokes, every 15°.
    canvas.save();
    canvas.translate(cx, cy);
    final spokeStroke = Paint()
      ..color = _navy
      ..style = PaintingStyle.stroke
      ..strokeWidth = stripeH * 0.03;
    for (var i = 0; i < 24; i++) {
      canvas.drawLine(
        Offset(r * 0.15, 0),
        Offset(r * 0.92, 0),
        spokeStroke,
      );
      canvas.rotate(math.pi / 12);
    }
    canvas.restore();

    // Small navy hub at the centre.
    canvas.drawCircle(
      Offset(cx, cy),
      r * 0.13,
      Paint()..color = _navy,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Russia's flag — white / blue / red horizontal bands. Approximate
/// official colours (Safe White / Pantone 286 C blue / Pantone 485 C
/// red). Canonical aspect ratio is 3:2.
class RussianFlagPainter extends CustomPainter {
  const RussianFlagPainter();

  static const _white = Color(0xFFFFFFFF);
  static const _blue = Color(0xFF0039A6);
  static const _red = Color(0xFFD52B1E);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stripeH = h / 3;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, stripeH),
      Paint()..color = _white,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH, w, stripeH),
      Paint()..color = _blue,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH * 2, w, stripeH),
      Paint()..color = _red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Iran's flag — green / white / red horizontal bands with the official
/// emblem (نشان جمهوری اسلامی ایران) rendered in red on the white band.
/// The real emblem is a calligraphic tulip composed of four crescents
/// and a central sword spelling "Allah" (الله); at picker scale full
/// fidelity is impossible, so we render a stylised tulip silhouette with
/// a vertical sword-like negative space — enough to distinguish the
/// flag from Bulgaria / Tajikistan / Hungary tricolours. The takbir
/// border calligraphy at the white-band edges is omitted (entirely
/// unreadable at this size). Canonical aspect ratio is 7:4
/// (width:height).
class IranianFlagPainter extends CustomPainter {
  const IranianFlagPainter();

  static const _green = Color(0xFF239F40);
  static const _white = Color(0xFFFFFFFF);
  static const _red = Color(0xFFDA0000);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stripeH = h / 3;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, stripeH),
      Paint()..color = _green,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH, w, stripeH),
      Paint()..color = _white,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, stripeH * 2, w, stripeH),
      Paint()..color = _red,
    );

    // Central emblem — stylised tulip silhouette inscribed in the white
    // band. Bounded so a thin breathing margin remains above/below.
    final cx = w / 2;
    final cy = stripeH * 1.5;
    final eh = stripeH * 0.78;
    final ew = eh * 0.9;
    final red = Paint()..color = _red;

    final outline = Path()
      ..moveTo(cx, cy - eh * 0.5) // top tip
      ..cubicTo(
        cx + ew * 0.55, cy - eh * 0.5,
        cx + ew * 0.55, cy + eh * 0.05,
        cx + ew * 0.32, cy + eh * 0.4,
      )
      ..quadraticBezierTo(
        cx, cy + eh * 0.55,
        cx - ew * 0.32, cy + eh * 0.4,
      )
      ..cubicTo(
        cx - ew * 0.55, cy + eh * 0.05,
        cx - ew * 0.55, cy - eh * 0.5,
        cx, cy - eh * 0.5,
      )
      ..close();
    canvas.drawPath(outline, red);

    // Negative space "sword" — a thin vertical white slot near the
    // emblem's centre, hinting at the alif/sword that bisects the
    // calligraphic original.
    final swordW = ew * 0.09;
    final swordH = eh * 0.55;
    canvas.drawRect(
      Rect.fromLTWH(cx - swordW / 2, cy - swordH * 0.45, swordW, swordH),
      Paint()..color = _white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Spanish flag — red / yellow / red horizontal bands, with the yellow
/// stripe twice the height of each red one (1:2:1 ratio). The coat of
/// arms (escudo) is intentionally omitted: too detailed for the picker
/// size, and the colour split alone reads as Spanish at a glance.
/// Canonical aspect ratio is 3:2.
class SpanishFlagPainter extends CustomPainter {
  const SpanishFlagPainter();

  static const _red = Color(0xFFAA151B);
  static const _yellow = Color(0xFFF1BF00);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    // 1:2:1 split — red, yellow, red.
    final unit = h / 4;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, unit),
      Paint()..color = _red,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, unit, w, unit * 2),
      Paint()..color = _yellow,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, unit * 3, w, unit),
      Paint()..color = _red,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Hong Kong SAR flag — red field with a stylised white five-petal
/// Bauhinia blakeana flower centred on the field, each petal carrying
/// a small red five-pointed star near its tip. The real flower has
/// elaborate curved petals; at picker scale we approximate each petal
/// with a single cubic-bezier teardrop, which still reads as a radial
/// five-fold flower distinct from the PRC red field. Canonical aspect
/// ratio is 3:2. Picked here as the visual marker for Traditional
/// Chinese alongside Mainland's Simplified.
class HongKongFlagPainter extends CustomPainter {
  const HongKongFlagPainter();

  static const _red = Color(0xFFBA0000);
  static const _white = Color(0xFFFFFFFF);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), Paint()..color = _red);

    final cx = w / 2;
    final cy = h / 2;
    final r = math.min(w, h) * 0.40;
    final white = Paint()..color = _white;
    final red = Paint()..color = _red;

    final petalLen = r;
    final petalWidth = r * 0.50;
    for (var i = 0; i < 5; i++) {
      canvas.save();
      canvas.translate(cx, cy);
      canvas.rotate(i * (2 * math.pi / 5) - math.pi / 2);

      final petal = Path()
        ..moveTo(0, 0)
        ..cubicTo(
          petalWidth * 0.75, -petalLen * 0.15,
          petalWidth * 0.40, -petalLen * 0.75,
          0, -petalLen,
        )
        ..cubicTo(
          -petalWidth * 0.40, -petalLen * 0.75,
          -petalWidth * 0.75, -petalLen * 0.15,
          0, 0,
        )
        ..close();
      canvas.drawPath(petal, white);

      _star(canvas, Offset(0, -petalLen * 0.60), r * 0.13, red);

      canvas.restore();
    }

    // Centre disc covers the petal-bases meeting point cleanly.
    canvas.drawCircle(Offset(cx, cy), r * 0.18, white);
  }

  void _star(Canvas canvas, Offset center, double r, Paint paint) {
    final innerR = r * 0.382;
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final angle = (i * math.pi / 5) - math.pi / 2;
      final radius = (i.isEven) ? r : innerR;
      final p = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

/// Simplified Union Jack — recognizable at picker size without the
/// counterchanged St-Patrick offset (too small to see). Canonical aspect
/// ratio is 2:1. Stroke widths are fractions of flag height so the
/// proportions stay correct at any rendered size.
class UnionJackPainter extends CustomPainter {
  const UnionJackPainter();

  static const _blue = Color(0xFF012169);
  static const _red = Color(0xFFC8102E);
  static const _white = Color(0xFFFFFFFF);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final rect = Rect.fromLTWH(0, 0, w, h);

    canvas.drawRect(rect, Paint()..color = _blue);

    // Saltires — clipped so the strokes don't overshoot the corners when
    // the line tip extends past the geometric endpoint.
    canvas.save();
    canvas.clipRect(rect);

    final whiteSaltire = Paint()
      ..color = _white
      ..strokeWidth = h * 0.21
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset.zero, Offset(w, h), whiteSaltire);
    canvas.drawLine(Offset(w, 0), Offset(0, h), whiteSaltire);

    final redSaltire = Paint()
      ..color = _red
      ..strokeWidth = h * 0.07
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset.zero, Offset(w, h), redSaltire);
    canvas.drawLine(Offset(w, 0), Offset(0, h), redSaltire);

    canvas.restore();

    // St-George cross — white fimbriation under a narrower red bar.
    final whiteCross = Paint()..color = _white;
    final whiteW = h * 0.33;
    final hMid = w / 2;
    final vMid = h / 2;
    canvas.drawRect(
      Rect.fromLTWH(hMid - whiteW / 2, 0, whiteW, h),
      whiteCross,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, vMid - whiteW / 2, w, whiteW),
      whiteCross,
    );

    final redCross = Paint()..color = _red;
    final redW = h * 0.21;
    canvas.drawRect(
      Rect.fromLTWH(hMid - redW / 2, 0, redW, h),
      redCross,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, vMid - redW / 2, w, redW),
      redCross,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
