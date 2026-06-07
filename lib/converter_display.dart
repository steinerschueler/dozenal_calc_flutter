// Two-line display for the unit converter. Shows the compound input expression
// (with a tappable red edit caret) over the result, plus the { } cross-world
// bracket on both lines and the DOZ/DEZ world indicator. Numbers are already
// rendered base-aware (12 or 10) by ConverterState.
//
// The input line is custom-painted so the caret and tap hit-testing line up
// exactly even when the text is scaled down to fit. Forced LTR by the host.
// Design: docs/unit-converter.md §4 / §4a.

import 'package:flutter/material.dart';

import 'converter_state.dart';

const Color _kBg = Color(0xFF101010);
const Color _kBorder = Color(0xFF333333);
const Color _kInput = Colors.white;
const Color _kResult = Color(0xFF8CDC8C); // egui LIGHT_GREEN
const Color _kBracket = Color(0xFF8C8C8C);
const Color _kWorld = Color(0xFF64C8FF);
const Color _kCaret = Colors.redAccent;

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
    return Container(
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _kBorder),
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
                  onTapChar: onInputTapChar,
                ),
              ),
              Expanded(
                child: _line(resultLine,
                    numberColor: _kResult,
                    numberSize: resultSize,
                    bracketSize: bracketSize * 1.05,
                    prefix: '= '),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  worldLabel,
                  style: const TextStyle(
                    color: _kWorld,
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

  Widget _line(
    ConverterLine? line, {
    required Color numberColor,
    required double numberSize,
    required double bracketSize,
    String prefix = '',
  }) {
    if (line == null) {
      return SizedBox(height: numberSize); // keep the row's vertical slot
    }
    final spans = <InlineSpan>[
      TextSpan(
        text: '$prefix${line.number}',
        style: TextStyle(
          color: numberColor,
          fontSize: numberSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'monospace',
        ),
      ),
      if (line.unit != null)
        TextSpan(
          text: ' ${line.unit}',
          style: TextStyle(
            color: numberColor.withValues(alpha: 0.82),
            fontSize: numberSize * 0.82,
            fontFamily: 'monospace',
          ),
        ),
      if (line.bracket != null)
        TextSpan(
          text: '  {${line.bracket}}',
          style: TextStyle(
            color: _kBracket,
            fontSize: bracketSize,
            fontFamily: 'monospace',
          ),
        ),
    ];
    return Align(
      alignment: Alignment.centerRight,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: Text.rich(TextSpan(children: spans), maxLines: 1),
      ),
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
  final ValueChanged<int>? onTapChar;

  const _CaretInputLine({
    required this.text,
    required this.bracket,
    required this.caret,
    required this.numberSize,
    required this.bracketSize,
    required this.onTapChar,
  });

  TextPainter _painter() {
    final spans = <InlineSpan>[
      TextSpan(
        text: text,
        style: TextStyle(
          color: _kInput,
          fontSize: numberSize,
          fontWeight: FontWeight.w600,
          fontFamily: 'monospace',
        ),
      ),
      if (bracket != null)
        TextSpan(
          text: '  {$bracket}',
          style: TextStyle(
            color: _kBracket,
            fontSize: bracketSize,
            fontFamily: 'monospace',
          ),
        ),
    ];
    return TextPainter(
      text: TextSpan(children: spans),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, c) {
        final maxW = c.maxWidth;
        final tp = _painter();
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
                  final off = pos.offset > text.length ? text.length : pos.offset;
                  onTapChar!(off);
                },
          child: CustomPaint(
            size: Size(maxW, c.maxHeight.isFinite ? c.maxHeight : numberSize * 1.6),
            painter: _CaretPainter(tp: tp, scale: scale, xOff: xOff, caret: caret),
          ),
        );
      },
    );
  }
}

class _CaretPainter extends CustomPainter {
  final TextPainter tp;
  final double scale;
  final double xOff;
  final int caret;

  _CaretPainter({
    required this.tp,
    required this.scale,
    required this.xOff,
    required this.caret,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final yOff = (size.height - tp.height * scale) / 2;
    canvas.save();
    canvas.translate(xOff, yOff);
    canvas.scale(scale);
    tp.paint(canvas, Offset.zero);
    final caretPos = tp.getOffsetForCaret(TextPosition(offset: caret), Rect.zero);
    canvas.drawLine(
      Offset(caretPos.dx, 1),
      Offset(caretPos.dx, tp.height - 1),
      Paint()
        ..color = _kCaret
        ..strokeWidth = 1.5 / scale,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _CaretPainter old) =>
      old.scale != scale || old.xOff != xOff || old.caret != caret;
}
