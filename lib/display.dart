// Static two-line display mock for step 7 of PORTING.md.
// Renders a fixed Vec<CalcToken> as a Casio-style two-line display:
//   - Upper line: input_buffer (left-aligned, with cursor when active)
//   - Lower line: result_buffer (right-aligned, with overline + …-suffixes)
//
// Display states from CLAUDE.md "Display Conventions":
//   A) Exact finite — no suffix
//   B) Rounded f64 — `…` on the baseline
//   C) Periodic, period > maxPeriodDisplay — `…` at overline height

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'glyph_painter.dart';
import 'tokens.dart';

class TwoLineDisplay extends StatelessWidget {
  final List<CalcToken> inputBuffer;
  final int cursorPos;
  final List<CalcToken> resultBuffer;
  final int resultCursorPos;
  final bool resultFieldActive;

  /// Index in resultBuffer where the period begins, or null if no period.
  final int? resultPeriodStart;

  /// Period length emitted (capped at maxPeriodDisplay).
  final int resultPeriodLen;

  /// True when the true period exceeds maxPeriodDisplay → render State-C `…`.
  final bool resultPeriodCapped;

  /// True when the rational track collapsed → render State-B `…`.
  final bool isF64Fallback;

  /// Error message to show in red across the result line (overrides tokens).
  final String? errorMsg;

  /// Memory non-empty → show `M` indicator top-left.
  final bool memoryActive;

  /// Angle-mode label (`DEG`/`RAD`/`GRD`) shown top-right; null hides it.
  final String? angleModeLabel;

  /// Active numeral system label (`DOZ` or `DEZ`) shown just below the
  /// angle-mode label; null hides it.
  final String? numeralSystemLabel;

  const TwoLineDisplay({
    super.key,
    required this.inputBuffer,
    this.cursorPos = 0,
    required this.resultBuffer,
    this.resultCursorPos = 0,
    this.resultFieldActive = false,
    this.resultPeriodStart,
    this.resultPeriodLen = 0,
    this.resultPeriodCapped = false,
    this.isF64Fallback = false,
    this.errorMsg,
    this.memoryActive = false,
    this.angleModeLabel,
    this.numeralSystemLabel,
  });

  @override
  Widget build(BuildContext context) {
    // Two text lines with a small inter-line gap. We size text and period
    // bracket relative to the available height inside the painter, so the
    // display works across the full range from ~60 dp (landscape phone) to
    // 170 dp (portrait tablet) without orientation-specific code.
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF101010),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _TwoLineDisplayPainter(
            inputBuffer: inputBuffer,
            cursorPos: cursorPos,
            resultBuffer: resultBuffer,
            resultCursorPos: resultCursorPos,
            resultFieldActive: resultFieldActive,
            resultPeriodStart: resultPeriodStart,
            resultPeriodLen: resultPeriodLen,
            resultPeriodCapped: resultPeriodCapped,
            isF64Fallback: isF64Fallback,
            errorMsg: errorMsg,
            memoryActive: memoryActive,
            angleModeLabel: angleModeLabel,
            numeralSystemLabel: numeralSystemLabel,
          ),
        ),
      ),
    );
  }
}

class _TwoLineDisplayPainter extends CustomPainter {
  final List<CalcToken> inputBuffer;
  final int cursorPos;
  final List<CalcToken> resultBuffer;
  final int resultCursorPos;
  final bool resultFieldActive;
  final int? resultPeriodStart;
  final int resultPeriodLen;
  final bool resultPeriodCapped;
  final bool isF64Fallback;
  final String? errorMsg;
  final bool memoryActive;
  final String? angleModeLabel;
  final String? numeralSystemLabel;

  _TwoLineDisplayPainter({
    required this.inputBuffer,
    required this.cursorPos,
    required this.resultBuffer,
    required this.resultCursorPos,
    required this.resultFieldActive,
    required this.resultPeriodStart,
    required this.resultPeriodLen,
    required this.resultPeriodCapped,
    required this.isF64Fallback,
    required this.errorMsg,
    required this.memoryActive,
    required this.angleModeLabel,
    required this.numeralSystemLabel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Adaptive line layout: gap shrinks proportionally with height so two
    // lines remain visible from ~60 dp (landscape) to 170 dp (cap).
    final gap = (size.height * 0.06).clamp(2.0, 10.0);
    final lineH = (size.height - gap) / 2;
    final inputRect = Rect.fromLTWH(0, 0, size.width, lineH);
    final resultRect = Rect.fromLTWH(0, lineH + gap, size.width, lineH);
    _paintInputLine(canvas, inputRect);
    if (errorMsg != null) {
      _paintError(canvas, resultRect, errorMsg!);
    } else {
      _paintResultLine(canvas, resultRect);
    }
    _paintIndicators(canvas, size);
  }

  void _paintError(Canvas canvas, Rect rect, String msg) {
    final tp = TextPainter(
      text: TextSpan(
        text: msg,
        style: TextStyle(
          color: Colors.redAccent.shade100,
          fontSize: rect.height * 0.42,
          fontFamily: 'monospace',
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(rect.right - tp.width - 8, rect.top + (rect.height - tp.height) / 2),
    );
  }

  void _paintIndicators(Canvas canvas, Size size) {
    if (memoryActive) {
      final tp = TextPainter(
        text: const TextSpan(
          text: 'M',
          style: TextStyle(
            color: Color(0xFFFFD700), // GOLD
            fontSize: 12,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, const Offset(2, 2));
    }
    final label = angleModeLabel;
    if (label != null) {
      final tp = TextPainter(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: Color(0xFFB4B4B4),
            fontSize: 10,
            fontFamily: 'monospace',
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(size.width - tp.width - 2, 2));
    }
    if (numeralSystemLabel != null) {
      final tp = TextPainter(
        text: TextSpan(
          text: numeralSystemLabel,
          style: const TextStyle(
            color: Color(0xFF64C8FF),
            fontSize: 10,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(size.width - tp.width - 2, 14));
    }
  }

  void _paintInputLine(Canvas canvas, Rect rect) {
    final laid = inputBuffer.map((t) => _layoutToken(t, rect.height)).toList();
    var x = rect.left;
    for (var i = 0; i < laid.length; i++) {
      if (i == cursorPos && !resultFieldActive) {
        _drawCursor(canvas, x, rect.top, rect.height);
      }
      laid[i].paint(canvas, Offset(x, rect.top), rect.height);
      x += laid[i].width;
    }
    if (cursorPos >= laid.length && !resultFieldActive) {
      _drawCursor(canvas, x, rect.top, rect.height);
    }
  }

  void _paintResultLine(Canvas canvas, Rect rect) {
    final laid = resultBuffer.map((t) => _layoutToken(t, rect.height)).toList();
    final totalW = laid.fold<double>(0.0, (a, t) => a + t.width);

    final needsSuffix = isF64Fallback || resultPeriodCapped;
    final suffixTp = needsSuffix ? _ellipsisPainter(rect.height) : null;
    final suffixW = suffixTp?.width ?? 0.0;

    var x = rect.right - totalW - suffixW;
    final positions = <double>[];
    for (var i = 0; i < laid.length; i++) {
      positions.add(x);
      laid[i].paint(canvas, Offset(x, rect.top), rect.height);
      x += laid[i].width;
    }

    final overlineY = rect.top + _overlineYOffset(rect.height);
    if (resultPeriodStart != null && resultPeriodLen > 0) {
      final start = resultPeriodStart!;
      final endIdx = start + resultPeriodLen - 1;
      if (start < positions.length && endIdx < positions.length) {
        final x1 = positions[start] + 1.5;
        final x2 = positions[endIdx] + laid[endIdx].width - 1.5;
        canvas.drawLine(
          Offset(x1, overlineY),
          Offset(x2, overlineY),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 1.2,
        );
      }
    }

    if (suffixTp != null) {
      if (isF64Fallback) {
        // State B: text-based ellipsis at vertical centre (mid-line).
        final yPos = rect.top + (rect.height - suffixTp.height) / 2;
        suffixTp.paint(canvas, Offset(x, yPos));
      } else {
        // State C: render three dots manually so their centres land
        // exactly on overlineY. A glyph-based "…" sits at the font
        // baseline within its bounding box, which leaves the dots
        // visibly below the period bar — drawing circles avoids that
        // font-metric dance and keeps the alignment exact.
        final r = rect.height * 0.025;
        final dx = r * 3.6;
        final centerX = x + suffixTp.width / 2;
        final paint = Paint()..color = Colors.white;
        for (var i = -1; i <= 1; i++) {
          canvas.drawCircle(
            Offset(centerX + i * dx, overlineY),
            r,
            paint,
          );
        }
      }
    }

    if (resultFieldActive) {
      final cx = resultCursorPos <= 0
          ? (positions.isNotEmpty ? positions.first : rect.right - suffixW)
          : (resultCursorPos >= positions.length
              ? rect.right - suffixW
              : positions[resultCursorPos]);
      _drawCursor(canvas, cx, rect.top, rect.height);
    }
  }

  void _drawCursor(Canvas canvas, double x, double yTop, double height) {
    canvas.drawRect(
      Rect.fromLTWH(x, yTop + 6, 1.5, height - 12),
      Paint()..color = Colors.redAccent,
    );
  }

  @override
  bool shouldRepaint(covariant _TwoLineDisplayPainter old) =>
      !listEquals(old.inputBuffer, inputBuffer) ||
      old.cursorPos != cursorPos ||
      !listEquals(old.resultBuffer, resultBuffer) ||
      old.resultCursorPos != resultCursorPos ||
      old.resultFieldActive != resultFieldActive ||
      old.resultPeriodStart != resultPeriodStart ||
      old.resultPeriodLen != resultPeriodLen ||
      old.resultPeriodCapped != resultPeriodCapped ||
      old.isF64Fallback != isF64Fallback ||
      old.errorMsg != errorMsg ||
      old.memoryActive != memoryActive ||
      old.angleModeLabel != angleModeLabel ||
      old.numeralSystemLabel != numeralSystemLabel;
}

// ---------------------------------------------------------------------------
// Token layout: turn a CalcToken into a (width, paint-fn) pair.
// ---------------------------------------------------------------------------

class _LaidToken {
  final double width;
  final void Function(Canvas, Offset, double lineH) paint;
  _LaidToken(this.width, this.paint);
}

/// Half-radius factor of the digit glyph relative to the line height.
/// Composite digits (D2/D3/D5/D6/D8/D9/D11) span ±2q around the centre —
/// so 4 · q must fit within lineH with room above for the overline.
const double _digitQRatio = 0.18;

/// Pixel gap between the top of a composite glyph and the overline that
/// signals a periodic expansion.
const double _overlineGap = 4.0;

double _digitQ(double lineH) => lineH * _digitQRatio;

/// Y offset (relative to the result rect's top) where the overline sits.
/// Lifts it just above the top of a composite glyph: centre.y − 2·q − gap.
double _overlineYOffset(double lineH) =>
    lineH / 2 - 2 * _digitQ(lineH) - _overlineGap;

_LaidToken _layoutToken(CalcToken token, double lineH) {
  if (token is Digit) {
    final q = _digitQ(lineH);
    final cell = q * 2 + 6;
    return _LaidToken(cell, (canvas, offset, h) {
      paintDozenalDigitAt(
        canvas,
        token.value,
        center: Offset(offset.dx + cell / 2, offset.dy + h / 2),
        q: q,
        strokeWidth: 1.6,
      );
    });
  }
  final text = _tokenText(token);
  if (text.isEmpty) return _LaidToken(0, (_, _, _) {});
  final tp = _textPainter(text, lineH * 0.42);
  return _LaidToken(tp.width + 4, (canvas, offset, h) {
    tp.paint(canvas, Offset(offset.dx + 2, offset.dy + (h - tp.height) / 2));
  });
}

TextPainter _textPainter(String text, double fontSize) => TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: 'monospace',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

TextPainter _ellipsisPainter(double lineH) => _textPainter('…', lineH * 0.42);

/// Text label for a non-digit token in display context. Mirrors the Rust
/// `paint_token` text branches but without the button border treatment.
String _tokenText(CalcToken t) {
  if (t is Decimal) return '.';
  if (t is Negate) return '−';
  if (t is Add) return '+';
  if (t is Sub) return '−';
  if (t is Mul) return '×';
  if (t is Div) return '÷';
  if (t is Mod) return 'mod';
  if (t is ParenOpen) return '(';
  if (t is ParenClose) return ')';
  if (t is Sin) return 'sin';
  if (t is Cos) return 'cos';
  if (t is Tan) return 'tan';
  if (t is Cot) return 'cot';
  if (t is ArcSin) return 'sin⁻¹';
  if (t is ArcCos) return 'cos⁻¹';
  if (t is ArcTan) return 'tan⁻¹';
  if (t is ArcCot) return 'cot⁻¹';
  if (t is Sinh) return 'sinh';
  if (t is Cosh) return 'cosh';
  if (t is Tanh) return 'tanh';
  if (t is Coth) return 'coth';
  if (t is ArSinh) return 'sinh⁻¹';
  if (t is ArCosh) return 'cosh⁻¹';
  if (t is ArTanh) return 'tanh⁻¹';
  if (t is ArCoth) return 'coth⁻¹';
  if (t is ConstPi) return 'π';
  if (t is ConstE) return 'e';
  if (t is ConstPhi) return 'φ';
  if (t is ConstSqrt2) return '√2';
  if (t is Factorial) return 'n!';
  if (t is AbsVal) return '|x|';
  if (t is Reciprocal) return '1/x';
  if (t is ExpTopRight) return '^';
  if (t is RootTopLeft) return '√';
  if (t is OplusBotLeft) return '⊕';
  if (t is LogBotRight) return 'log';
  if (t is RatLit) return t.label;
  // App-state tokens (AC, Del, Equals, Expand, Sto, Rcl, Mc, Ans, Doz, Dez,
  // Drg, Info, Close, TriangleLeft, TriangleRight) never appear in
  // input_buffer or result_buffer.
  return '';
}
