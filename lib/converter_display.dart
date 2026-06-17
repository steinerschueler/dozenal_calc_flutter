// Two-line display for the unit converter. Shows the compound input expression
// (with a tappable red edit caret) over the result, plus the { } cross-world
// bracket on both lines and the DOZ/DEZ world indicator. Numbers are already
// rendered base-aware (12 or 10) by ConverterState.
//
// Digit rendering follows the shared "Ziffern im Display" preference
// (GlyphStyleScope.styleOf) — exactly like the main display: custom = the
// twelve dozenal glyphs, conventional = ASCII '0'..'9'/'A'/'B'. Because the
// display is monospace, custom mode keeps the normal TextPainter layout (so the
// caret and tap hit-testing stay exact) but renders each base-12 digit cell
// invisible and overlays the glyph at that cell's box. Unit symbols, operators,
// the decimal point and the { } bracket always stay as text.
//
// The input line is custom-painted so the caret and tap hit-testing line up
// exactly even when the text is scaled down to fit. Forced LTR by the host.
// Design: docs/unit-converter.md §4 / §4a.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'calc_prefs.dart';
import 'converter_state.dart';
import 'glyph_painter.dart';
import 'logic/glyph_style.dart';

// Palette slots (lib/app_theme.dart): displayBg/displayBorder for the frame,
// displayText for all digits (neutral — base and system are colour-coded on
// their own carriers), worldTen/worldTwelve for unit symbols (system hue),
// the { } brackets (hue of the world they show) and the DOZ/DEZ base badge.
// The edit caret stays theme-independent red — same convention as the main
// display's cursor.
const Color _kCaret = Colors.redAccent;

/// 0..11 if [ch] is a single base-12 digit character ('0'..'9','A','B); else
/// null (units, '.', operators, spaces and the { } bracket are never glyphs).
int? _glyphDigit(String ch) {
  final c = ch.codeUnitAt(0);
  if (c >= 0x30 && c <= 0x39) return c - 0x30; // '0'..'9'
  if (c == 0x41) return 10; // 'A' = ten
  if (c == 0x42) return 11; // 'B' = eleven
  return null;
}

/// One styled run of a display line. [glyph] gates the custom-mode dozenal
/// glyph overlay: true only for number runs; unit symbols and the { } bracket
/// set it false so letters like 'B' in "BTU" keep their ASCII rendering and
/// are not mistaken for the dozenal eleven glyph (header: units/brackets stay
/// as text).
class _Seg {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final bool glyph;
  const _Seg(this.text, this.color, this.size,
      {this.weight = FontWeight.w400, this.glyph = true});
}

/// A laid-out line: the [TextPainter] plus, per character, its digit value
/// (or null) and colour — used to overlay dozenal glyphs in custom mode. In
/// custom mode each digit character is laid out transparent (so it still
/// occupies its exact monospace cell and the caret/hit-test geometry is
/// unchanged) and the glyph is painted on top.
class _LineLayout {
  final TextPainter tp;
  final List<int?> digits; // per UTF-16 code unit: 0..11 or null
  final List<Color> colors;
  _LineLayout(this.tp, this.digits, this.colors);

  static _LineLayout build(List<_Seg> segs, GlyphStyle style) {
    final custom = style == GlyphStyle.custom;
    final spans = <InlineSpan>[];
    final digits = <int?>[];
    final colors = <Color>[];
    for (final s in segs) {
      for (var k = 0; k < s.text.length; k++) {
        final ch = s.text[k];
        // Only number runs (s.glyph) can carry a glyph; unit symbols and the
        // bracket stay ASCII so 'A'/'B' inside e.g. "BTU" aren't glyphified.
        final v = s.glyph ? _glyphDigit(ch) : null;
        // Only record a glyph to overlay in custom mode; in conventional mode
        // the cell keeps its visible ASCII digit and must NOT be overpainted
        // (that caused the glyph to overlap the ASCII number).
        digits.add(custom ? v : null);
        colors.add(s.color);
        final hide = custom && v != null;
        spans.add(TextSpan(
          text: ch,
          style: TextStyle(
            color: hide ? const Color(0x00000000) : s.color,
            fontSize: s.size,
            fontWeight: s.weight,
            fontFamily: 'monospace',
          ),
        ));
      }
    }
    final tp = TextPainter(
      text: TextSpan(children: spans),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    return _LineLayout(tp, digits, colors);
  }

  /// Overlays the dozenal glyphs for every digit cell (no-op in conventional
  /// mode, where [digits] cells were drawn as normal ASCII text).
  void paintGlyphs(Canvas canvas) {
    for (var i = 0; i < digits.length; i++) {
      final v = digits[i];
      if (v == null) continue;
      final boxes = tp.getBoxesForSelection(
          TextSelection(baseOffset: i, extentOffset: i + 1));
      if (boxes.isEmpty) continue;
      final b = boxes.first.toRect();
      final q = math.min(b.width, b.height) * 0.34;
      paintDozenalDigitAt(
        canvas,
        DozenalDigit.fromValue(v)!,
        // Nudge up slightly: the selection box includes the font's descent,
        // but base-12 digits have none, so its centre sits a touch low.
        center: b.center.translate(0, -b.height * 0.06),
        q: q,
        color: colors[i],
        strokeWidth: math.max(1.1, q * 0.24),
      );
    }
  }
}

/// World hue for a bracket flag: null → neutral sub colour (no world info).
Color _bracketHue(bool? tenWorld, AppColors t) => tenWorld == null
    ? t.displaySub
    : (tenWorld ? t.worldTen : t.worldTwelve).withValues(alpha: 0.85);

class ConverterDisplay extends StatelessWidget {
  final ConverterLine topLine;
  final ConverterLine? resultLine;

  /// `DOZ` or `DEZ` — the BASE badge (the unit system shows itself through
  /// the coloured unit symbols and the system keys instead).
  final String worldLabel;

  /// True when the global base is 10 → the badge wears the Ten-world green;
  /// base 12 wears the Twelve-world violet.
  final bool baseIsTen;

  /// True when the metric system is active → unit symbols wear the Ten-world
  /// green; imperial symbols wear the Twelve-world violet.
  final bool systemIsTen;

  /// Caret char offset within [topLine].number (the edit cursor).
  final int inputCaret;

  /// Tap on the input line → char offset within [topLine].number.
  final ValueChanged<int>? onInputTapChar;

  const ConverterDisplay({
    super.key,
    required this.topLine,
    required this.resultLine,
    required this.worldLabel,
    this.baseIsTen = false,
    this.systemIsTen = false,
    this.inputCaret = 0,
    this.onInputTapChar,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    // Shared with the main display ("Ziffern im Display" in settings).
    final style = GlyphStyleScope.styleOf(context);
    final unitColor = systemIsTen ? t.worldTen : t.worldTwelve;
    // The wide tablet display would otherwise leave the height-sized text —
    // the unit symbols especially — lost in empty space. Scale with the same
    // factor as the rest of the app (the Schriftgröße setting × the automatic
    // tablet baseline); the app-wide textScaler can't reach this custom-
    // painted line, so it reads the factor directly. Capped so the two lines
    // never overflow the fixed-height panel. Phones at Normal stay 1.0.
    final fontSize =
        CalcPrefsScope.maybeOf(context)?.fontSize ?? FontSize.normal;
    final shortest = MediaQuery.maybeOf(context)?.size.shortestSide ?? 0.0;
    final tabletScale = effectiveTextScale(fontSize, shortest).clamp(1.0, 1.8);
    return Container(
      decoration: BoxDecoration(
        color: t.displayBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: t.displayBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: LayoutBuilder(
        builder: (ctx, c) {
          final h = c.maxHeight.isFinite ? c.maxHeight : 120.0;
          final resultSize = (h * 0.24).clamp(18.0, 38.0) * tabletScale;
          final topSize = resultSize * 0.72;
          final bracketSize = topSize * 0.74;

          // Flexible rows so the two lines share the available height and
          // never overflow on very short displays (split-screen, foldables).
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _CaretInputLine(
                  text: topLine.number,
                  unitRanges: topLine.unitRanges,
                  unitColor: unitColor,
                  bracket: topLine.bracket,
                  bracketColor: _bracketHue(topLine.bracketTenWorld, t),
                  caret: inputCaret,
                  numberSize: topSize,
                  bracketSize: bracketSize,
                  style: style,
                  onTapChar: onInputTapChar,
                ),
              ),
              Expanded(
                child: _ResultLine(
                  line: resultLine,
                  // Result digits are neutral since the colour rebuild —
                  // green belongs to the Ten world now, not to "result".
                  numberColor: t.displayText,
                  unitColor: unitColor,
                  bracketColor:
                      _bracketHue(resultLine?.bracketTenWorld, t),
                  numberSize: resultSize,
                  bracketSize: bracketSize * 1.05,
                  style: style,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  worldLabel,
                  style: TextStyle(
                    color: baseIsTen ? t.worldTen : t.worldTwelve,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Splits [text] into neutral/[unitColor] runs along [unitRanges] (the
/// system-hue carrier: unit symbols inside a composed expression or
/// breakdown string). [offset] shifts the ranges when a prefix was prepended.
List<_Seg> _splitByUnitRanges(
  String text,
  List<(int, int)> unitRanges,
  Color neutral,
  Color unitColor,
  double size, {
  int offset = 0,
  FontWeight weight = FontWeight.w600,
}) {
  final segs = <_Seg>[];
  var pos = 0;
  for (final (s, e) in unitRanges) {
    final start = s + offset;
    final end = e + offset;
    if (start > pos) {
      segs.add(_Seg(text.substring(pos, start), neutral, size, weight: weight));
    }
    segs.add(_Seg(text.substring(start, end), unitColor, size,
        weight: weight, glyph: false));
    pos = end;
  }
  if (pos < text.length) {
    segs.add(_Seg(text.substring(pos), neutral, size, weight: weight));
  }
  return segs;
}

/// Segments for the result line (`= value  unit  {bracket}`). Shared by the
/// painter and the test hook so the unit/bracket glyph-gating can't drift.
List<_Seg> _resultSegs(
  ConverterLine l, {
  required Color numberColor,
  required Color unitColor,
  required Color bracketColor,
  required double numberSize,
  required double bracketSize,
}) =>
    <_Seg>[
      // The '= value' run is neutral; breakdown strings carry their unit
      // symbols inside `number`, coloured via the ranges ('= ' shifts by 2).
      ..._splitByUnitRanges('= ${l.number}', l.unitRanges, numberColor,
          unitColor, numberSize, offset: 2),
      if (l.unit != null)
        _Seg(' ${l.unit}', unitColor, numberSize * 0.82, glyph: false),
      if (l.bracket != null)
        _Seg('  {${l.bracket}}', bracketColor, bracketSize, glyph: false),
    ];

/// Test hook: the per-character glyph overlay cells for a result [line] in
/// [style] (custom → the dozenal digit overlaid at that cell, null → stays
/// ASCII). Locks in that unit symbols like "BTU" are never glyphified.
@visibleForTesting
List<int?> debugResultGlyphCells(ConverterLine line, GlyphStyle style) =>
    _LineLayout.build(
      _resultSegs(line,
          numberColor: const Color(0xFFFFFFFF),
          unitColor: const Color(0xFFFFFFFF),
          bracketColor: const Color(0xFFFFFFFF),
          numberSize: 20,
          bracketSize: 14),
      style,
    ).digits;

/// Right-aligned, scale-to-fit result line (no caret). Custom-painted so the
/// dozenal glyph overlay lines up with the (possibly down-scaled) text.
class _ResultLine extends StatelessWidget {
  final ConverterLine? line;
  final Color numberColor;
  final Color unitColor;
  final Color bracketColor;
  final double numberSize;
  final double bracketSize;
  final GlyphStyle style;

  const _ResultLine({
    required this.line,
    required this.numberColor,
    required this.unitColor,
    required this.bracketColor,
    required this.numberSize,
    required this.bracketSize,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final l = line;
    if (l == null) return SizedBox(height: numberSize); // keep the row slot
    final segs = _resultSegs(l,
        numberColor: numberColor,
        unitColor: unitColor,
        bracketColor: bracketColor,
        numberSize: numberSize,
        bracketSize: bracketSize);
    final layout = _LineLayout.build(segs, style);
    return LayoutBuilder(
      builder: (ctx, c) {
        final maxW = c.maxWidth;
        final w = layout.tp.width;
        final scale = (w > maxW && w > 0) ? maxW / w : 1.0; // scale down only
        return CustomPaint(
          size: Size(maxW,
              c.maxHeight.isFinite ? c.maxHeight : numberSize * 1.4),
          painter: _LinePainter(
            layout: layout,
            scale: scale,
            xOff: maxW - w * scale, // right-align
            style: style,
          ),
        );
      },
    );
  }
}

/// Right-aligned, scale-to-fit input line with a red edit caret. Custom-painted
/// so the caret and taps map to the same character positions as the rendered
/// (possibly down-scaled) text.
class _CaretInputLine extends StatelessWidget {
  final String text;
  final List<(int, int)> unitRanges;
  final Color unitColor;
  final String? bracket;
  final Color bracketColor;
  final int caret;
  final double numberSize;
  final double bracketSize;
  final GlyphStyle style;
  final ValueChanged<int>? onTapChar;

  const _CaretInputLine({
    required this.text,
    required this.unitRanges,
    required this.unitColor,
    required this.bracket,
    required this.bracketColor,
    required this.caret,
    required this.numberSize,
    required this.bracketSize,
    required this.style,
    required this.onTapChar,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final segs = <_Seg>[
      // Same string, char for char, as the un-coloured version — only span
      // colours differ, so the caret/tap geometry stays exact.
      ..._splitByUnitRanges(
          text, unitRanges, t.displayText, unitColor, numberSize),
      if (bracket != null)
        _Seg('  {$bracket}', bracketColor, bracketSize, glyph: false),
    ];
    final layout = _LineLayout.build(segs, style);
    final tp = layout.tp;
    return LayoutBuilder(
      builder: (ctx, c) {
        final maxW = c.maxWidth;
        final scale = (tp.width > maxW && tp.width > 0) ? maxW / tp.width : 1.0;
        final xOff = maxW - tp.width * scale; // right-align
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: onTapChar == null
              ? null
              : (d) {
                  final textX = (d.localPosition.dx - xOff) / scale;
                  final pos = tp.getPositionForOffset(
                    Offset(textX.clamp(0.0, tp.width), tp.height / 2),
                  );
                  final off =
                      pos.offset > text.length ? text.length : pos.offset;
                  onTapChar!(off);
                },
          child: CustomPaint(
            size: Size(
                maxW, c.maxHeight.isFinite ? c.maxHeight : numberSize * 1.6),
            painter: _LinePainter(
              layout: layout,
              scale: scale,
              xOff: xOff,
              style: style,
              caret: caret,
              caretColor: _kCaret,
            ),
          ),
        );
      },
    );
  }
}

/// Paints a [_LineLayout] (text + dozenal glyph overlay) right-aligned and
/// scaled, with an optional edit caret.
class _LinePainter extends CustomPainter {
  final _LineLayout layout;
  final double scale;
  final double xOff;
  final GlyphStyle style;
  final int? caret;
  final Color? caretColor;

  _LinePainter({
    required this.layout,
    required this.scale,
    required this.xOff,
    required this.style,
    this.caret,
    this.caretColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tp = layout.tp;
    final yOff = (size.height - tp.height * scale) / 2;
    canvas.save();
    canvas.translate(xOff, yOff);
    canvas.scale(scale);
    tp.paint(canvas, Offset.zero);
    layout.paintGlyphs(canvas);
    if (caret != null) {
      final caretPos =
          tp.getOffsetForCaret(TextPosition(offset: caret!), Rect.zero);
      canvas.drawLine(
        Offset(caretPos.dx, 1),
        Offset(caretPos.dx, tp.height - 1),
        Paint()
          ..color = caretColor ?? _kCaret
          ..strokeWidth = 1.5 / scale,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LinePainter old) =>
      old.scale != scale ||
      old.xOff != xOff ||
      old.style != style ||
      old.caret != caret ||
      old.caretColor != caretColor ||
      old.layout != layout;
}
