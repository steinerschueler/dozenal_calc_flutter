// Step 11 of PORTING.md: info-modal content.
// Port of src/info_content.rs (chapter prose) + the painting.rs helpers
// (info_h / info_p / info_pre, draw_digit_legend, draw_chapter4_svg,
// draw_chapter5_svg). German prose is reproduced verbatim from the Rust
// source; one-line surface-level edits are not allowed without an explicit
// content change request.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'glyph_painter.dart';
import 'l10n/app_localizations.dart';

// Per-locale chapter content lives in these part files so each language's
// prose stays in its own ~850-line file instead of accumulating in one
// monolithic switch. Library-private helpers (_H, _P, _Pre, illustrations)
// remain visible to the parts via the `part of` mechanism.
part 'info_content_de.dart';
part 'info_content_en.dart';
part 'info_content_fr.dart';
part 'info_content_es.dart';
part 'info_content_it.dart';
part 'info_content_fa.dart';
part 'info_content_ru.dart';
part 'info_content_ga.dart';
part 'info_content_hi.dart';
part 'info_content_zh.dart';
part 'info_content_zh_hant.dart';
part 'info_content_cy.dart';
part 'info_content_ja.dart';
part 'info_content_ar.dart';

/// Chapter list titles (12 chapters, fixed). Mirrors Rust `INFO_TITLES`,
/// now routed through AppLocalizations so the same list serves both
/// locales. Callers pass `AppLocalizations.of(context)`.
List<String> infoTitles(AppLocalizations l) => [
      l.chapterTitle01,
      l.chapterTitle02,
      l.chapterTitle03,
      l.chapterTitle04,
      l.chapterTitle05,
      l.chapterTitle06,
      l.chapterTitle07,
      l.chapterTitle08,
      l.chapterTitle09,
      l.chapterTitle10,
      l.chapterTitle11,
      l.chapterTitle12,
    ];

// ---------------------------------------------------------------------------
// Helper widgets (port of info_h, info_p, info_pre).
// ---------------------------------------------------------------------------

class _H extends StatelessWidget {
  final String text;
  const _H(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 4),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );
}

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            height: 1.45,
            color: Color(0xFFE0E0E0),
          ),
        ),
      );
}

class _Pre extends StatelessWidget {
  final String text;
  const _Pre(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        // Force LTR for monospace tables in every locale — column
        // alignment relies on left-to-right flow even in RTL locales
        // like Persian. Without this, the bidi algorithm reorders
        // mixed-direction rows (numbers + RTL labels) and shreds the
        // table layout. FittedBox scales the monospace block uniformly
        // so the column alignment stays exact — Text with softWrap
        // would re-flow individual lines and shred the table. scaleDown
        // means no upscaling on tablets; narrow phones get a
        // proportionally smaller table that still fits.
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              softWrap: false,
              style: const TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 14,
                height: 1.5,
                color: Color(0xFFE0E0E0),
              ),
            ),
          ),
        ),
      );
}

// ---------------------------------------------------------------------------
// Digit legend (chapter 1).
// ---------------------------------------------------------------------------

class _DigitLegend extends StatelessWidget {
  const _DigitLegend();

  @override
  Widget build(BuildContext context) {
    Widget row(int v) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CustomPaint(
                  painter: DozenalGlyphPainter(
                    digit: DozenalDigit.values[v],
                    strokeWidth: 1.4,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '= $v',
                style: const TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 13,
                  color: Color(0xFFC8C8C8),
                ),
              ),
            ],
          ),
        );
    Widget col(Iterable<int> values) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map(row).toList(),
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          col([0, 1, 2, 3, 4, 5]),
          const SizedBox(width: 24),
          col([6, 7, 8, 9, 10, 11]),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Chapter-4 illustration: dodecagon + inscribed triangle/square/hexagon.
// Port of painting.rs::draw_chapter4_svg.
// ---------------------------------------------------------------------------

class _Chapter4Illustration extends StatelessWidget {
  const _Chapter4Illustration();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: _Chapter4Painter()),
          ),
          const SizedBox(height: 8),
          _legendRow(
            const Color(0x509FE1CB),
            const Color(0xFF0F6E56),
            l.chapterIllustrationTriangle,
          ),
          _legendRow(
            const Color(0x5085B7EB),
            const Color(0xFF185FA5),
            l.chapterIllustrationSquare,
          ),
          _legendRow(
            const Color(0x50AFA9EC),
            const Color(0xFF534AB7),
            l.chapterIllustrationHexagon,
          ),
        ],
      ),
    );
  }

  Widget _legendRow(Color fill, Color border, String label) {
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
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Color(0xFFC8C8C8),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chapter4Painter extends CustomPainter {
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
    fillPolygon(
      [0, 3, 6, 9],
      const Color(0x2085B7EB),
      const Color(0xFF185FA5),
    );
    // Triangle (teal)
    fillPolygon(
      [0, 4, 8],
      const Color(0x209FE1CB),
      const Color(0xFF0F6E56),
    );

    // Dodecagon outline
    final outline = Path()..moveTo(verts.first.dx, verts.first.dy);
    for (var i = 1; i < verts.length; i++) {
      outline.lineTo(verts[i].dx, verts[i].dy);
    }
    outline.close();
    canvas.drawPath(
      outline,
      Paint()
        ..color = const Color(0xFFD0D0D0)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    // Corner dots: square vertices (i % 3 == 0) larger/brighter.
    for (var i = 0; i < verts.length; i++) {
      final isPrimary = i % 3 == 0;
      canvas.drawCircle(
        verts[i],
        isPrimary ? 3.5 : 2.5,
        Paint()
          ..color = isPrimary
              ? Colors.white
              : const Color(0xFF8C8C8C),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _Chapter4Painter old) => false;
}

// ---------------------------------------------------------------------------
// Chapter-5 illustration: dodecagon + 6 diagonal types.
// Port of painting.rs::draw_chapter5_svg.
// ---------------------------------------------------------------------------

class _Chapter5Illustration extends StatelessWidget {
  const _Chapter5Illustration();

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CustomPaint(painter: _Chapter5Painter()),
          ),
          const SizedBox(height: 8),
          for (final d in _diagonals) _legendRow(d.$2, d.$3, d.$4),
        ],
      ),
    );
  }

  Widget _legendRow(Color color, String formula, String approx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 3,
            color: color,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 160,
            child: Text(
              formula,
              style: const TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 13,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
          Text(
            approx,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w300,
              color: Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chapter5Painter extends CustomPainter {
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
        ..color = const Color(0xFF6E6E6E)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // All vertex dots (subtle)
    for (final v in verts) {
      canvas.drawCircle(v, 2.0, Paint()..color = const Color(0xFF646464));
    }

    // 6 diagonal types
    for (final d in _Chapter5Illustration._diagonals) {
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
      canvas.drawCircle(verts[i], 4.0, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant _Chapter5Painter old) => false;
}

// ---------------------------------------------------------------------------
// Chapter content. Each entry returns the body widgets for that chapter.
// One-to-one port of src/info_content.rs::draw_info_chapter. The actual
// switches live in info_content_<code>.dart files registered above; this
// file holds only the dispatch table.
// ---------------------------------------------------------------------------

typedef _ChapterBuilder = List<Widget> Function(
  int chapter,
  AppLocalizations l,
);

/// Per-locale chapter content table. Keyed by BCP-47 language tag
/// (e.g. `de`, `zh`, `zh-Hant`) so script-tagged locales like
/// Traditional Chinese stay distinct from the bare-language variant.
/// To add a language: create `info_content_<code>.dart` as a
/// `part of 'info_content.dart'`, implement `_chapter<Code>`, and
/// register it here. The dispatcher falls back to German if the active
/// locale's builder is missing — that should not happen at runtime
/// because locale resolution only yields supported codes, but the
/// fallback keeps the app debuggable.
const Map<String, _ChapterBuilder> _chapterBuilders = {
  'de': _chapterDe,
  'en': _chapterEn,
  'fr': _chapterFr,
  'es': _chapterEs,
  'it': _chapterIt,
  'fa': _chapterFa,
  'ru': _chapterRu,
  'ga': _chapterGa,
  'hi': _chapterHi,
  'zh': _chapterZh,
  'zh-Hant': _chapterZhHant,
  'cy': _chapterCy,
  'ja': _chapterJa,
  'ar': _chapterAr,
};

List<Widget> buildChapterContent(int chapter, BuildContext context) {
  final tag = Localizations.localeOf(context).toLanguageTag();
  final builder = _chapterBuilders[tag] ?? _chapterBuilders['de']!;
  return builder(chapter, AppLocalizations.of(context));
}

