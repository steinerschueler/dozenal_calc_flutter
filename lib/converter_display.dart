// Four-row display for the unit converter. Shows the compound input expression
// (with a tappable red edit caret) over the result, each above its { } cross-world
// bracket, plus the DOZ/DEZ world indicator. Numbers are already
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
// Both lines are custom-painted and keep their size: a line too long for the
// display can be dragged, shows dots on each side where it continues, and the
// input follows its caret on its own. Forced LTR by the host.
// Design: docs/unit-converter.md §4 / §4a.

import 'dart:math' as math;

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/converter_state.dart';
import 'package:dozenal_calc_flutter/glyph_painter.dart';
import 'package:dozenal_calc_flutter/key_face.dart';
import 'package:dozenal_calc_flutter/line_drag.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:flutter/material.dart';

// Palette slots (lib/app_theme.dart): displayText for all digits (neutral — base and system are colour-coded on
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
  const _Seg(
    this.text,
    this.color,
    this.size, {
    this.weight = keyTextWeight,
    this.glyph = true,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final bool glyph;
}

/// A laid-out line: the [TextPainter] plus, per character, its digit value
/// (or null) and colour — used to overlay dozenal glyphs in custom mode. In
/// custom mode each digit character is laid out transparent (so it still
/// occupies its exact monospace cell and the caret/hit-test geometry is
/// unchanged) and the glyph is painted on top.
class _LineLayout {
  _LineLayout(this.tp, this.digits, this.colors);

  factory _LineLayout.build(List<_Seg> segs, GlyphStyle style) {
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
        spans.add(
          TextSpan(
            text: ch,
            style: TextStyle(
              color: hide ? const Color(0x00000000) : s.color,
              fontSize: s.size,
              fontWeight: s.weight,
              fontFamily: keyFontFamily,
            ),
          ),
        );
      }
    }
    final tp = TextPainter(
      text: TextSpan(children: spans),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    return _LineLayout(tp, digits, colors);
  }
  final TextPainter tp;
  final List<int?> digits; // per UTF-16 code unit: 0..11 or null
  final List<Color> colors;

  /// Overlays the dozenal glyphs for every digit cell (no-op in conventional
  /// mode, where [digits] cells were drawn as normal ASCII text).
  void paintGlyphs(Canvas canvas) {
    for (var i = 0; i < digits.length; i++) {
      final v = digits[i];
      if (v == null) continue;
      final boxes = tp.getBoxesForSelection(
        TextSelection(baseOffset: i, extentOffset: i + 1),
      );
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

const double _displaySidePadding = 14;
const double _displayVerticalPadding = 4;
const double _fallbackHeight = 120;
const double _badgeWidth = 36;
const double _emptyHintFontSize = 16;
const int _emptyHintMaxLines = 3;
const double _minNumberSize = 18;
const double _minBracketSize = 11;
const int _numberRowFlex = 3;
const int _bracketRowFlex = 2;
const int _sideBySideNumberFlex = 3;
const int _sideBySideBracketFlex = 2;
const double _sideBySideGap = 8;

/// Text height as a share of its row, matching the main display.
const double _rowFill = 0.74;

/// World hue for a bracket flag: null → neutral sub colour (no world info).
Color _bracketHue(bool? tenWorld, AppColors t) => tenWorld == null
    ? t.displaySub
    : (tenWorld ? t.worldTen : t.worldTwelve).withValues(alpha: 0.85);

class ConverterDisplay extends StatelessWidget {
  const ConverterDisplay({
    required this.topLine,
    required this.resultLine,
    required this.worldLabel,
    super.key,
    this.baseIsTen = false,
    this.systemIsTen = false,
    this.inputCaret = 0,
    this.onInputTapChar,
    this.resultPrefix = '= ',
    this.emptyHint,
    this.sideBySide = false,
  });
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

  /// Prefix on the result line ('= ' for exact results; '≈ ' for the value
  /// calculator's rate-based value line).
  final String resultPrefix;

  /// Guidance shown below the input while the calculator is empty.
  final String? emptyHint;

  /// Puts each conversion beside its number instead of below it: two rows,
  /// for a display that has to stay low.
  final bool sideBySide;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    // Shared with the main display ("Ziffern im Display" in settings).
    final style = GlyphStyleScope.styleOf(context);
    final unitColor = systemIsTen ? t.worldTen : t.worldTwelve;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _displaySidePadding,
        vertical: _displayVerticalPadding,
      ),
      child: LayoutBuilder(
        builder: (ctx, c) {
          final h = c.maxHeight.isFinite ? c.maxHeight : _fallbackHeight;
          final unit = sideBySide
              ? h / 2 / _numberRowFlex
              : h / (2 * (_numberRowFlex + _bracketRowFlex));
          final numberSize = math.max(
            _minNumberSize,
            unit * _numberRowFlex * _rowFill,
          );
          final bracketSize = math.max(
            _minBracketSize,
            unit * _bracketRowFlex * _rowFill,
          );
          Widget bracketRow(String? bracket, {required bool? tenWorld}) =>
              _BracketLine(
                bracket: bracket,
                color: _bracketHue(tenWorld, t),
                size: bracketSize,
                style: style,
              );
          final input = _CaretInputLine(
            text: topLine.number,
            unitRanges: topLine.unitRanges,
            unitColor: unitColor,
            caret: inputCaret,
            numberSize: numberSize,
            style: style,
            onTapChar: onInputTapChar,
          );
          final result = _ResultLine(
            line: resultLine,
            // Result digits are neutral since the colour rebuild —
            // green belongs to the Ten world now, not to "result".
            numberColor: t.displayText,
            unitColor: unitColor,
            numberSize: numberSize,
            style: style,
            prefix: resultPrefix,
          );
          Widget hintText(int maxLines) => Text(
            emptyHint ?? '',
            textAlign: TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: t.displaySub, fontSize: _emptyHintFontSize),
          );
          final inputBracket = bracketRow(
            topLine.bracket,
            tenWorld: topLine.bracketTenWorld,
          );
          final resultBracket = bracketRow(
            resultLine?.bracket,
            tenWorld: resultLine?.bracketTenWorld,
          );
          Widget numberWithBracket(Widget number, Widget bracket) => Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // The number keeps the right edge, with or without a conversion.
              Expanded(flex: _sideBySideBracketFlex, child: bracket),
              const SizedBox(width: _sideBySideGap),
              Expanded(flex: _sideBySideNumberFlex, child: number),
            ],
          );

          // Four rows: each number over its conversion into the other system,
          // so a long conversion no longer pushes the number out of view.
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: sideBySide
                    ? [
                        Expanded(child: numberWithBracket(input, inputBracket)),
                        Expanded(
                          child: Padding(
                            // The base badge sits in this row's corner.
                            padding: const EdgeInsets.only(left: _badgeWidth),
                            child: numberWithBracket(result, resultBracket),
                          ),
                        ),
                      ]
                    : [
                        Expanded(flex: _numberRowFlex, child: input),
                        Expanded(flex: _bracketRowFlex, child: inputBracket),
                        Expanded(flex: _numberRowFlex, child: result),
                        Expanded(
                          flex: _bracketRowFlex,
                          child: Padding(
                            // The base badge sits in this row's corner.
                            padding: const EdgeInsets.only(left: _badgeWidth),
                            child: resultBracket,
                          ),
                        ),
                      ],
              ),
              if (emptyHint != null)
                Positioned(
                  left: _badgeWidth,
                  right: 0,
                  top: unit * _numberRowFlex,
                  bottom: 0,
                  child: Center(
                    // A low display has one row left for it: it shrinks to fit.
                    child: sideBySide
                        ? FittedBox(fit: BoxFit.scaleDown, child: hintText(1))
                        : hintText(_emptyHintMaxLines),
                  ),
                ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  worldLabel,
                  style: TextStyle(
                    color: baseIsTen ? t.worldTen : t.worldTwelve,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: keyFontFamily,
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
    segs.add(
      _Seg(
        text.substring(start, end),
        unitColor,
        size,
        weight: weight,
        glyph: false,
      ),
    );
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
  double? bracketSize,
  String prefix = '= ',
}) => <_Seg>[
  // The 'PREFIX value' run is neutral; breakdown strings carry their unit
  // symbols inside `number`, coloured via the ranges (the prefix shifts the
  // ranges by its length — '= ' for exact results, '≈ ' for value mode).
  ..._splitByUnitRanges(
    '$prefix${l.number}',
    l.unitRanges,
    numberColor,
    unitColor,
    numberSize,
    offset: prefix.length,
  ),
  if (l.unit != null)
    _Seg(' ${l.unit}', unitColor, numberSize * 0.82, glyph: false),
  // Painted on a row of its own; the test hook passes a size to cover it too.
  if (l.bracket != null && bracketSize != null)
    _Seg('  {${l.bracket}}', bracketColor, bracketSize, glyph: false),
];

/// Test hook: the per-character glyph overlay cells for a result [line] in
/// [style] (custom → the dozenal digit overlaid at that cell, null → stays
/// ASCII). Locks in that unit symbols like "BTU" are never glyphified.
@visibleForTesting
List<int?> debugResultGlyphCells(ConverterLine line, GlyphStyle style) =>
    _LineLayout.build(
      _resultSegs(
        line,
        numberColor: const Color(0xFFFFFFFF),
        unitColor: const Color(0xFFFFFFFF),
        bracketColor: const Color(0xFFFFFFFF),
        numberSize: 20,
        bracketSize: 14,
      ),
      style,
    ).digits;

/// A conversion into the other system, on a row of its own.
class _BracketLine extends StatelessWidget {
  const _BracketLine({
    required this.bracket,
    required this.color,
    required this.size,
    required this.style,
  });
  final String? bracket;
  final Color color;
  final double size;
  final GlyphStyle style;

  @override
  Widget build(BuildContext context) {
    final text = bracket;
    if (text == null) return const SizedBox.shrink();
    return _MovableLine(
      layout: _LineLayout.build([
        _Seg('{$text}', color, size, glyph: false),
      ], style),
      numberSize: size,
      dotsColor: color,
      style: style,
    );
  }
}

/// The result line (no caret).
class _ResultLine extends StatelessWidget {
  const _ResultLine({
    required this.line,
    required this.numberColor,
    required this.unitColor,
    required this.numberSize,
    required this.style,
    this.prefix = '= ',
  });
  final ConverterLine? line;
  final Color numberColor;
  final Color unitColor;
  final double numberSize;
  final GlyphStyle style;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    final l = line;
    if (l == null) return SizedBox(height: numberSize); // keep the row slot
    final segs = _resultSegs(
      l,
      numberColor: numberColor,
      unitColor: unitColor,
      bracketColor: numberColor,
      numberSize: numberSize,
      prefix: prefix,
    );
    return _MovableLine(
      layout: _LineLayout.build(segs, style),
      numberSize: numberSize,
      dotsColor: numberColor,
      style: style,
    );
  }
}

/// The input line with a red edit caret and tap positioning.
class _CaretInputLine extends StatelessWidget {
  const _CaretInputLine({
    required this.text,
    required this.unitRanges,
    required this.unitColor,
    required this.caret,
    required this.numberSize,
    required this.style,
    required this.onTapChar,
  });
  final String text;
  final List<(int, int)> unitRanges;
  final Color unitColor;
  final int caret;
  final double numberSize;
  final GlyphStyle style;
  final ValueChanged<int>? onTapChar;

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    // Same string, char for char, as the un-coloured version — only span
    // colours differ, so the caret/tap geometry stays exact.
    final segs = _splitByUnitRanges(
      text,
      unitRanges,
      t.displayText,
      unitColor,
      numberSize,
    );
    return _MovableLine(
      layout: _LineLayout.build(segs, style),
      numberSize: numberSize,
      dotsColor: t.displayText,
      style: style,
      caret: caret,
      caretTextLength: text.length,
      onTapChar: onTapChar,
    );
  }
}

/// A line that sits right-aligned while it fits. Longer lines keep their size:
/// they start at their first character (an input follows its [caret]), can be
/// dragged and stay where they are left until their content or caret changes.
class _MovableLine extends StatefulWidget {
  const _MovableLine({
    required this.layout,
    required this.numberSize,
    required this.dotsColor,
    required this.style,
    this.caret,
    this.caretTextLength = 0,
    this.onTapChar,
  });
  final _LineLayout layout;
  final double numberSize;
  final Color dotsColor;
  final GlyphStyle style;
  final int? caret;
  final int caretTextLength;
  final ValueChanged<int>? onTapChar;

  @override
  State<_MovableLine> createState() => _MovableLineState();
}

class _MovableLineState extends State<_MovableLine> {
  double _pan = 0;
  double _follow = 0;
  double _maxOffset = 0;

  @override
  void didUpdateWidget(_MovableLine old) {
    super.didUpdateWidget(old);
    if (old.layout.tp.plainText != widget.layout.tp.plainText ||
        old.caret != widget.caret) {
      _pan = 0;
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _pan = (_pan - details.delta.dx).clamp(-_follow, _maxOffset - _follow);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tp = widget.layout.tp;
    final caret = widget.caret;
    return LayoutBuilder(
      builder: (ctx, c) {
        final maxW = c.maxWidth;
        final dots = TextPainter(
          text: TextSpan(
            text: '…',
            style: TextStyle(
              color: widget.dotsColor,
              fontSize: widget.numberSize,
              fontFamily: keyFontFamily,
              fontWeight: keyTextWeight,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        final caretRoom = caret == null ? 0.0 : dots.width + _caretAir;
        final overflow = tp.width + _caretEdgeAir > maxW;
        _maxOffset = overflow ? math.max(0, tp.width + caretRoom - maxW) : 0;
        final caretX = caret == null
            ? 0.0
            : tp.getOffsetForCaret(TextPosition(offset: caret), Rect.zero).dx;
        _follow = caret == null
            ? 0
            : (caretX + caretRoom - maxW).clamp(0.0, _maxOffset);
        final offset = (_follow + _pan).clamp(0.0, _maxOffset);
        final xOff = overflow ? -offset : maxW - tp.width - _caretEdgeAir;
        final onTapChar = widget.onTapChar;
        return RawGestureDetector(
          gestures: {
            LineDragRecognizer:
                GestureRecognizerFactoryWithHandlers<
                  LineDragRecognizer
                >(() => LineDragRecognizer(allowedAt: (_) => _maxOffset > 0), (
                  recognizer,
                ) {
                  recognizer
                    ..allowedAt = ((_) => _maxOffset > 0)
                    // The device's slop, as the display's other gestures use it; with
                    // the default the vertical swipe always wins.
                    ..gestureSettings = MediaQuery.maybeGestureSettingsOf(
                      context,
                    )
                    ..onUpdate = _onDragUpdate;
                }),
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: onTapChar == null
                ? null
                : (d) {
                    final textX = d.localPosition.dx - xOff;
                    final pos = tp.getPositionForOffset(
                      Offset(textX.clamp(0.0, tp.width), tp.height / 2),
                    );
                    onTapChar(math.min(pos.offset, widget.caretTextLength));
                  },
            child: CustomPaint(
              size: Size(
                maxW,
                c.maxHeight.isFinite
                    ? c.maxHeight
                    : widget.numberSize * _fallbackLineHeightFactor,
              ),
              painter: _LinePainter(
                layout: widget.layout,
                xOff: xOff,
                style: widget.style,
                caret: caret,
                caretColor: _kCaret,
                dots: overflow ? dots : null,
                cutLeft: overflow && offset > 0,
                cutRight: overflow && offset < _maxOffset,
              ),
            ),
          ),
        );
      },
    );
  }
}

const double _caretAir = 4;

/// Keeps a caret at the end of a fitting line clear of the clip edge.
const double _caretEdgeAir = 2;
const double _fallbackLineHeightFactor = 1.6;

/// Paints a [_LineLayout] (text + dozenal glyph overlay) at [xOff], with dots
/// on the sides where it continues and an optional edit caret.
class _LinePainter extends CustomPainter {
  _LinePainter({
    required this.layout,
    required this.xOff,
    required this.style,
    this.caret,
    this.caretColor,
    this.dots,
    this.cutLeft = false,
    this.cutRight = false,
  });
  final _LineLayout layout;
  final double xOff;
  final GlyphStyle style;
  final int? caret;
  final Color? caretColor;
  final TextPainter? dots;
  final bool cutLeft;
  final bool cutRight;

  @override
  void paint(Canvas canvas, Size size) {
    final tp = layout.tp;
    final yOff = (size.height - tp.height) / 2;
    final dotsWidth = dots?.width ?? 0;
    final dotsY = (size.height - (dots?.height ?? 0)) / 2;
    if (cutLeft) dots?.paint(canvas, Offset(0, dotsY));
    if (cutRight) dots?.paint(canvas, Offset(size.width - dotsWidth, dotsY));
    canvas
      ..save()
      ..clipRect(
        Rect.fromLTRB(
          cutLeft ? dotsWidth : 0,
          0,
          size.width - (cutRight ? dotsWidth : 0),
          size.height,
        ),
      )
      ..translate(xOff, yOff);
    tp.paint(canvas, Offset.zero);
    layout.paintGlyphs(canvas);
    if (caret != null) {
      final caretPos = tp.getOffsetForCaret(
        TextPosition(offset: caret!),
        Rect.zero,
      );
      canvas.drawLine(
        Offset(caretPos.dx, 1),
        Offset(caretPos.dx, tp.height - 1),
        Paint()
          ..color = caretColor ?? _kCaret
          ..strokeWidth = 1.5,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _LinePainter old) =>
      old.xOff != xOff ||
      old.style != style ||
      old.caret != caret ||
      old.caretColor != caretColor ||
      old.cutLeft != cutLeft ||
      old.cutRight != cutRight ||
      old.layout != layout;
}
