// Custom-painted theory illustrations, extracted from the (now retired) legacy
// info_content.dart so they survive that file's deletion. These are referenced
// by the prose theory chapters via info_pages.dart's `_customChapterIllustration`
// (math/dodekagon → Chapter4 + Chapter5; math/parkettierung → Parkettierung).
//
// Origin: ports of painting.rs::draw_chapter4_svg / draw_chapter5_svg and the
// 4.6.12 Archimedean tiling. Theme-aware via AppColors (shouldRepaint compares
// const-identity); the polygon/diagonal accent colours are deliberately
// theme-independent so legend ↔ drawing stays exact on both surfaces.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Chapter-4 illustration: dodecagon + inscribed triangle/square/hexagon.
// ---------------------------------------------------------------------------

class Chapter4Illustration extends StatelessWidget {
  const Chapter4Illustration({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: Chapter4Painter(colors: t)),
          ),
          const SizedBox(height: 8),
          // The polygon accent colors (teal/blue/purple fills + strokes)
          // are deliberately theme-independent — they read fine on both
          // surfaces and keep the legend ↔ drawing match exact.
          _legendRow(
            const Color(0x509FE1CB),
            const Color(0xFF0F6E56),
            l.chapterIllustrationTriangle,
            t,
          ),
          _legendRow(
            const Color(0x5085B7EB),
            const Color(0xFF185FA5),
            l.chapterIllustrationSquare,
            t,
          ),
          _legendRow(
            const Color(0x50AFA9EC),
            const Color(0xFF534AB7),
            l.chapterIllustrationHexagon,
            t,
          ),
        ],
      ),
    );
  }

  Widget _legendRow(Color fill, Color border, String label, AppColors t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: fill,
              border: Border.all(color: border),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: t.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class Chapter4Painter extends CustomPainter {
  final AppColors colors;
  Chapter4Painter({this.colors = AppColors.dark});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(size.width, size.height) * 0.42;
    final verts = List<Offset>.generate(12, (i) {
      final a = (i * 30 - 90) * math.pi / 180;
      return Offset(cx + r * math.cos(a), cy + r * math.sin(a));
    });

    void fillPolygon(List<int> idx, Color fill, Color stroke) {
      final path = Path()..moveTo(verts[idx[0]].dx, verts[idx[0]].dy);
      for (var i = 1; i < idx.length; i++) {
        path.lineTo(verts[idx[i]].dx, verts[idx[i]].dy);
      }
      path.close();
      canvas.drawPath(path, Paint()..color = fill);
      canvas.drawPath(
        path,
        Paint()
          ..color = stroke
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    }

    // Hexagon (purple)
    fillPolygon(
      [0, 2, 4, 6, 8, 10],
      const Color(0x20AFA9EC),
      const Color(0xFF534AB7),
    );
    // Square (blue)
    fillPolygon([0, 3, 6, 9], const Color(0x2085B7EB), const Color(0xFF185FA5));
    // Triangle (teal)
    fillPolygon([0, 4, 8], const Color(0x209FE1CB), const Color(0xFF0F6E56));

    // Dodecagon outline
    final outline = Path()..moveTo(verts.first.dx, verts.first.dy);
    for (var i = 1; i < verts.length; i++) {
      outline.lineTo(verts[i].dx, verts[i].dy);
    }
    outline.close();
    canvas.drawPath(
      outline,
      Paint()
        ..color = colors.illusLine
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    // Corner dots: square vertices (i % 3 == 0) larger/brighter.
    for (var i = 0; i < verts.length; i++) {
      final isPrimary = i % 3 == 0;
      canvas.drawCircle(
        verts[i],
        isPrimary ? 3.5 : 2.5,
        Paint()..color = isPrimary ? colors.textPrimary : colors.textFaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant Chapter4Painter old) => old.colors != colors;
}

// ---------------------------------------------------------------------------
// Chapter-5 illustration: dodecagon + 6 diagonal types.
// ---------------------------------------------------------------------------

class Chapter5Illustration extends StatelessWidget {
  const Chapter5Illustration({super.key});

  static const _diagonals = <(List<int>, Color, String, String)>[
    ([0, 1], Color(0xFF5F5E5A), 's = 1', '≈ 1.000'),
    ([1, 3], Color(0xFF0F6E56), 'd₂ = √(2+√3)', '≈ 1.932'),
    ([0, 3], Color(0xFF185FA5), 'd₃ = 1+√3', '≈ 2.732'),
    ([1, 5], Color(0xFF534AB7), 'd₄ = (3√2+√6)/2', '≈ 3.346'),
    ([0, 5], Color(0xFF993C1D), 'd₅ = 2+√3', '≈ 3.732'),
    ([0, 6], Color(0xFFA32D2D), 'd₆ = √6+√2', '≈ 3.864'),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: Chapter5Painter(colors: t)),
          ),
          const SizedBox(height: 8),
          // Diagonal accent colors stay theme-independent (see _diagonals);
          // only the label/approx greys follow the palette.
          for (final d in _diagonals) _legendRow(d.$2, d.$3, d.$4, t),
        ],
      ),
    );
  }

  Widget _legendRow(Color color, String formula, String approx, AppColors t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(width: 24, height: 3, color: color),
          const SizedBox(width: 10),
          SizedBox(
            width: 160,
            child: Text(
              formula,
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 13,
                color: t.textSecondary,
              ),
            ),
          ),
          Text(
            approx,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w300,
              color: t.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class Chapter5Painter extends CustomPainter {
  final AppColors colors;
  Chapter5Painter({this.colors = AppColors.dark});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(size.width, size.height) * 0.42;
    final verts = List<Offset>.generate(12, (i) {
      final a = (i * 30 - 90) * math.pi / 180;
      return Offset(cx + r * math.cos(a), cy + r * math.sin(a));
    });

    // Subtle dodecagon outline
    final outline = Path()..moveTo(verts.first.dx, verts.first.dy);
    for (var i = 1; i < verts.length; i++) {
      outline.lineTo(verts[i].dx, verts[i].dy);
    }
    outline.close();
    canvas.drawPath(
      outline,
      Paint()
        ..color = colors.illusFaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // All vertex dots (subtle)
    for (final v in verts) {
      canvas.drawCircle(v, 2.0, Paint()..color = colors.illusDot);
    }

    // 6 diagonal types
    for (final d in Chapter5Illustration._diagonals) {
      canvas.drawLine(
        verts[d.$1[0]],
        verts[d.$1[1]],
        Paint()
          ..color = d.$2
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round,
      );
    }

    // Highlight involved vertices
    for (final i in [0, 1, 3, 5, 6]) {
      canvas.drawCircle(verts[i], 4.0, Paint()..color = colors.textPrimary);
    }
  }

  @override
  bool shouldRepaint(covariant Chapter5Painter old) => old.colors != colors;
}

// ---------------------------------------------------------------------------
// Tiling illustration: a patch of the 4.6.12 Archimedean tiling — a central
// regular dodecagon ringed by six squares and six hexagons on alternating
// edges. Each vertex carries 90° + 120° + 150° = 360°, so the ring closes
// without gaps. Used by the "Archimedische Parkettierungen" prose chapter
// via imageId 'math/parkettierung'. Construction per docs/research/park_b.md:
// outward unit normal at an edge is the radial direction through its midpoint.
// ---------------------------------------------------------------------------

class ParkettierungIllustration extends StatelessWidget {
  const ParkettierungIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: ParkettierungPainter(colors: AppColors.of(context)),
        ),
      ),
    );
  }
}

class ParkettierungPainter extends CustomPainter {
  final AppColors colors;
  const ParkettierungPainter({this.colors = AppColors.dark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = math.min(size.width, size.height) * 0.23;
    final verts = List<Offset>.generate(12, (i) {
      final a = (i * 30 - 90) * math.pi / 180;
      return center + Offset(r * math.cos(a), r * math.sin(a));
    });

    final squareFill = Paint()..color = const Color(0x2085B7EB);
    final squareStroke = Paint()
      ..color = const Color(0xFF185FA5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final hexFill = Paint()..color = const Color(0x20AFA9EC);
    final hexStroke = Paint()
      ..color = const Color(0xFF534AB7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    void drawPoly(List<Offset> p, Paint fill, Paint stroke) {
      final path = Path()..moveTo(p[0].dx, p[0].dy);
      for (var i = 1; i < p.length; i++) {
        path.lineTo(p[i].dx, p[i].dy);
      }
      path.close();
      canvas.drawPath(path, fill);
      canvas.drawPath(path, stroke);
    }

    // Ring: squares on even edges, hexagons on odd edges (6 of each).
    for (var k = 0; k < 12; k++) {
      final a = verts[k];
      final b = verts[(k + 1) % 12];
      final s = (b - a).distance;
      final mid = (a + b) / 2;
      final radial = mid - center;
      final u = radial / radial.distance; // outward unit normal
      if (k.isEven) {
        drawPoly([a, b, b + u * s, a + u * s], squareFill, squareStroke);
      } else {
        final hc = mid + u * (s * math.sqrt(3) / 2);
        final th0 = math.atan2(a.dy - hc.dy, a.dx - hc.dx);
        final th1 = math.atan2(b.dy - hc.dy, b.dx - hc.dx);
        var diff = th1 - th0;
        while (diff <= -math.pi) {
          diff += 2 * math.pi;
        }
        while (diff > math.pi) {
          diff -= 2 * math.pi;
        }
        final dir = diff > 0 ? 1.0 : -1.0;
        final hex = List<Offset>.generate(6, (i) {
          final th = th0 + dir * i * math.pi / 3;
          return hc + Offset(s * math.cos(th), s * math.sin(th));
        });
        drawPoly(hex, hexFill, hexStroke);
      }
    }

    // Central dodecagon: subtle fill + bright outline.
    final dod = Path()..moveTo(verts[0].dx, verts[0].dy);
    for (var i = 1; i < 12; i++) {
      dod.lineTo(verts[i].dx, verts[i].dy);
    }
    dod.close();
    canvas.drawPath(dod, Paint()..color = colors.illusLine.withAlpha(0x14));
    canvas.drawPath(
      dod,
      Paint()
        ..color = colors.illusLine
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    // Vertex dots where the 4.6.12 configuration meets.
    for (final v in verts) {
      canvas.drawCircle(v, 2.5, Paint()..color = colors.textPrimary);
    }
  }

  @override
  bool shouldRepaint(covariant ParkettierungPainter old) =>
      old.colors != colors;
}
