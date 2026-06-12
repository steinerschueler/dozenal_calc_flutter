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
import 'converter_state.dart';
import 'glyph_painter.dart';
import 'logic/glyph_style.dart';

// Palette slots (lib/app_theme.dart): displayBg/displayBorder for the frame,
// displayText for input, equals (egui LIGHT_GREEN) for the result, displaySub
// for the { } bracket, link for the DOZ/DEZ world badge. The edit caret stays
// theme-independent red — same convention as the main display's cursor.
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

/// One styled run of a display line.
class _Seg {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  const _Seg(this.text, this.color, this.size,
      {this.weight = FontWeight.w400});
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
        final v = _glyphDigit(ch);
        digits.add(v);
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

class ConverterDisplay extends StatelessWidget {
  final ConverterLine topLine;
  final ConverterLine? resultLine;

  /// `DOZ` or `DEZ`.
  final String worldLabel;

  /// Caret char offset within [topLine].number (the edit cursor).
  final int inputCaret;

  /// Tap on the input line → char offset within [topLine].number.
  final ValueChanged<int>? onInputTapChar;

  const ConverterDisplay({
    super.key,
    required this.topLine,
    required this.resultLine,
    required this.worldLabel,
    this.inputCaret = 0,
    this.onInputTapChar,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    // Shared with the main display ("Ziffern im Display" in settings).
    final style = GlyphStyleScope.styleOf(context);
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
          final resultSize = (h * 0.24).clamp(18.0, 38.0);
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
                  bracket: topLine.bracket,
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
                  numberColor: t.equals,
                  bracketColor: t.displaySub,
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
                    color: t.link,
                    fontSize: 11,
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

/// Right-aligned, scale-to-fit result line (no caret). Custom-painted so the
/// dozenal glyph overlay lines up with the (possibly down-scaled) text.
class _ResultLine extends StatelessWidget {
  final ConverterLine? line;
  final Color numberColor;
  final Color bracketColor;
  final double numberSize;
  final double bracketSize;
  final GlyphStyle style;

  const _ResultLine({
    required this.line,
    required this.numberColor,
    required this.bracketColor,
    required this.numberSize,
    required this.bracketSize,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final l = line;
    if (l == null) return SizedBox(height: numberSize); // keep the row slot
    final segs = <_Seg>[
      _Seg('= ${l.number}', numberColor, numberSize, weight: FontWeight.w600),
      if (l.unit != null)
        _Seg(' ${l.unit}', numberColor.withValues(alpha: 0.82),
            numberSize * 0.82),
      if (l.bracket != null) _Seg('  {${l.bracket}}', bracketColor, bracketSize),
    ];
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
  final String? bracket;
  final int caret;
  final double numberSize;
  final double bracketSize;
  final GlyphStyle style;
  final ValueChanged<int>? onTapChar;

  const _CaretInputLine({
    required this.text,
    required this.bracket,
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
      _Seg(text, t.displayText, numberSize, weight: FontWeight.w600),
      if (bracket != null) _Seg('  {$bracket}', t.displaySub, bracketSize),
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
