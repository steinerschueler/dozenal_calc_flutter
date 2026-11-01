// Static two-line display mock for step 7 of PORTING.md.
// Renders a fixed Vec<CalcToken> as a Casio-style two-line display:
//   - Upper line: input_buffer (left-aligned, with cursor when active)
//   - Lower line: result_buffer (right-aligned, with overline + …-suffixes)
//
// Display states from CLAUDE.md "Display Conventions":
//   A) Exact finite — no marker
//   B) Rounded f64 — `≈` prefix left of the result
//   C) Periodic, period > maxPeriodDisplay — `…` at overline height
// (A baseline `…` appears only when width-truncation drops trailing
// digits — "more there, clipped", deliberately distinct from the ≈ of
// State B.)

import 'dart:math' as math;

import 'package:dozenal_calc_flutter/app_theme.dart';
import 'package:dozenal_calc_flutter/glyph_painter.dart';
import 'package:dozenal_calc_flutter/key_face.dart';
import 'package:dozenal_calc_flutter/line_drag.dart';
import 'package:dozenal_calc_flutter/logic/glyph_style.dart';
import 'package:dozenal_calc_flutter/tokens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TwoLineDisplay extends StatelessWidget {
  const TwoLineDisplay({
    required this.inputBuffer,
    required this.resultBuffer,
    super.key,
    this.cursorPos = 0,
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
    this.crossBaseBracket,
    this.onInputCursorTap,
    this.onLongPress,
    this.onSwipeDown,
    this.showCursor = true,
  });
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

  /// True when the rational track collapsed → render the `≈` prefix (State B).
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

  /// Cross-base reference for the current result (e.g. "10" for a dozenal
  /// `A`), rendered as a dim "{…}" on the result line. Null hides it.
  final String? crossBaseBracket;

  /// Tap-to-position-cursor callback: receives the input-buffer gap index for
  /// a tap on the input line. Null disables tap positioning.
  final ValueChanged<int>? onInputCursorTap;

  /// Long-press anywhere on the display → copy the result string. Wired by the
  /// scaffold to clipboard copy; null disables it.
  final VoidCallback? onLongPress;

  /// Swipe down on the display → open the history tape (#1). Null disables it.
  final VoidCallback? onSwipeDown;

  /// Whether to paint the input/result cursor. False for read-only renders
  /// (e.g. history tiles) where a caret would wrongly imply editability.
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    // Two text lines with a small inter-line gap. We size text and period
    // bracket relative to the available height inside the painter, so the
    // display works across the full range from ~60 dp (landscape phone) to
    // 170 dp (portrait tablet) without orientation-specific code.
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: SizedBox.expand(
        child: Builder(
          // Builder so the painter rebuilds when GlyphStyleScope changes —
          // dependOnInheritedWidgetOfExactType subscribes this widget to
          // the scope's notifier without rebuilding the surrounding tree.
          builder: (innerCtx) {
            final glyphStyle = GlyphStyleScope.of(innerCtx).style;
            final colors = AppColors.of(innerCtx);
            Widget paintWith(double inputPan, double resultPan) => CustomPaint(
              painter: TwoLineDisplayPainter(
                inputPan: inputPan,
                resultPan: resultPan,
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
                crossBaseBracket: crossBaseBracket,
                glyphStyle: glyphStyle,
                inputLineShare: displayInputLineShare,
                showCursor: showCursor,
                colors: colors,
              ),
            );
            final tapHandler = onInputCursorTap;
            final longPress = onLongPress;
            final swipeDown = onSwipeDown;
            if (tapHandler == null && longPress == null && swipeDown == null) {
              return paintWith(0, 0);
            }
            // Tap the input line → position the cursor at the nearest glyph
            // gap; long-press anywhere → copy the result.
            return LayoutBuilder(
              builder: (ctx, c) => _DisplayPanHost(
                size: Size(c.maxWidth, c.maxHeight),
                inputBuffer: inputBuffer,
                cursorPos: cursorPos,
                resultBuffer: errorMsg == null ? resultBuffer : const [],
                resultCursorPos: resultCursorPos,
                glyphStyle: glyphStyle,
                inputLineShare: displayInputLineShare,
                isF64Fallback: isF64Fallback,
                resultPeriodCapped: resultPeriodCapped,
                builder: (inputPan, resultPan) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: tapHandler == null
                      ? null
                      : (d) {
                          final pos = inputCursorPosForTap(
                            d.localPosition,
                            Size(c.maxWidth, c.maxHeight),
                            inputBuffer,
                            glyphStyle,
                            inputLineShare: displayInputLineShare,
                            inputPan: inputPan,
                            cursorPos: cursorPos,
                          );
                          if (pos != null) tapHandler(pos);
                        },
                  onLongPress: longPress,
                  onVerticalDragEnd: swipeDown == null
                      ? null
                      : (d) {
                          // Downward fling (primaryVelocity > 0, y grows down).
                          if ((d.primaryVelocity ?? 0) > 0) swipeDown();
                        },
                  child: paintWith(inputPan, resultPan),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Maps a tap [local] (in painter coordinates) to an input-line cursor gap
/// index, or null if the tap is not on the input line (result line / gap).
/// Mirrors _paintInputLine's left-aligned layout so the hit-test and the
/// rendered cursor agree.
int? inputCursorPosForTap(
  Offset local,
  Size size,
  List<CalcToken> inputBuffer,
  GlyphStyle glyphStyle, {
  double inputLineShare = 0.5,
  double inputPan = 0,
  int? cursorPos,
}) {
  final gap = (size.height * 0.06).clamp(2.0, 10.0);
  final lineH =
      (size.height - gap) * _inputShareAt(size.height, inputLineShare);
  if (local.dy > lineH) return null; // result line or inter-line gap
  // Color is irrelevant for hit-testing — only the widths matter.
  final laid = inputBuffer
      .map((t) => _layoutToken(t, lineH, glyphStyle, Colors.white))
      .toList();
  // Gap boundaries: x[0]=0 (before token 0), x[i]=Σ widths 0..i-1, x[n]=total.
  // Pick the boundary nearest the tap.
  final view = inputLineView(
    size,
    inputBuffer,
    cursorPos ?? inputBuffer.length,
    glyphStyle,
    inputLineShare: inputLineShare,
  );
  var x = -(view.follow + inputPan).clamp(0.0, view.maxOffset);
  var bestIdx = 0;
  var bestDist = (local.dx - x).abs();
  for (var i = 0; i < laid.length; i++) {
    x += laid[i].width;
    final d = (local.dx - x).abs();
    if (d < bestDist) {
      bestDist = d;
      bestIdx = i + 1;
    }
  }
  return bestIdx;
}

/// Room kept free for the angle and base badges beside an overflowing input.
const double _inputBadgeReserve = 40;

/// Room for the cut-off dots beside the cursor of an overflowing input.
double _inputCursorMargin(double lineH) =>
    _ellipsisPainter(lineH, Colors.white).width + 4;

/// How far the input line is shifted left: `follow` keeps the cursor in view
/// on its own, `maxOffset` reveals the line's end. Zero when everything fits.
({double follow, double maxOffset}) inputLineView(
  Size size,
  List<CalcToken> inputBuffer,
  int cursorPos,
  GlyphStyle glyphStyle, {
  double inputLineShare = 0.5,
}) {
  final gap = (size.height * 0.06).clamp(2.0, 10.0);
  final lineH =
      (size.height - gap) * _inputShareAt(size.height, inputLineShare);
  final widths = inputBuffer
      .map((t) => _layoutToken(t, lineH, glyphStyle, Colors.white).width)
      .toList();
  final total = widths.fold<double>(0, (a, w) => a + w);
  final room = size.width - _inputBadgeReserve;
  final margin = _inputCursorMargin(lineH);
  if (total + margin <= room) return (follow: 0, maxOffset: 0);
  final maxOffset = total + margin - room;
  final cursorX = widths.take(cursorPos).fold<double>(0, (a, w) => a + w);
  return (
    follow: (cursorX + margin - room).clamp(0.0, maxOffset),
    maxOffset: maxOffset,
  );
}

/// How far an overflowing result line can be dragged left; zero when it fits.
double resultLineMaxPan(
  Size size,
  List<CalcToken> resultBuffer,
  GlyphStyle glyphStyle, {
  double inputLineShare = 0.5,
  bool isF64Fallback = false,
  bool resultPeriodCapped = false,
}) {
  final gap = (size.height * 0.06).clamp(2.0, 10.0);
  final inputH =
      (size.height - gap) * _inputShareAt(size.height, inputLineShare);
  final lineH = size.height - gap - inputH;
  var total = resultBuffer.fold<double>(
    0,
    (a, t) => a + _layoutToken(t, lineH, glyphStyle, Colors.white).width,
  );
  if (isF64Fallback) {
    total += _approxPainter(lineH, Colors.white).width + _approxGap(lineH);
  }
  if (resultPeriodCapped) {
    total += _ellipsisPainter(lineH, Colors.white).width;
  }
  return math.max(0, total - size.width);
}

/// Holds how far the user dragged each display line. Both stay where they were
/// left until their content or cursor changes.
class _DisplayPanHost extends StatefulWidget {
  const _DisplayPanHost({
    required this.size,
    required this.inputBuffer,
    required this.cursorPos,
    required this.resultBuffer,
    required this.resultCursorPos,
    required this.glyphStyle,
    required this.inputLineShare,
    required this.isF64Fallback,
    required this.resultPeriodCapped,
    required this.builder,
  });

  final Size size;
  final List<CalcToken> inputBuffer;
  final int cursorPos;
  final List<CalcToken> resultBuffer;
  final int resultCursorPos;
  final GlyphStyle glyphStyle;
  final double inputLineShare;
  final bool isF64Fallback;
  final bool resultPeriodCapped;
  final Widget Function(double inputPan, double resultPan) builder;

  @override
  State<_DisplayPanHost> createState() => _DisplayPanHostState();
}

class _DisplayPanHostState extends State<_DisplayPanHost> {
  double _inputPan = 0;
  double _resultPan = 0;
  bool _draggingInput = true;

  @override
  void didUpdateWidget(_DisplayPanHost old) {
    super.didUpdateWidget(old);
    if (!listEquals(old.inputBuffer, widget.inputBuffer) ||
        old.cursorPos != widget.cursorPos) {
      _inputPan = 0;
    }
    if (!listEquals(old.resultBuffer, widget.resultBuffer) ||
        old.resultCursorPos != widget.resultCursorPos) {
      _resultPan = 0;
    }
  }

  ({double follow, double maxOffset}) get _inputView => inputLineView(
    widget.size,
    widget.inputBuffer,
    widget.cursorPos,
    widget.glyphStyle,
    inputLineShare: widget.inputLineShare,
  );

  double get _resultMaxPan => resultLineMaxPan(
    widget.size,
    widget.resultBuffer,
    widget.glyphStyle,
    inputLineShare: widget.inputLineShare,
    isF64Fallback: widget.isF64Fallback,
    resultPeriodCapped: widget.resultPeriodCapped,
  );

  bool _isOnInputLine(Offset local) {
    final height = widget.size.height;
    final gap = (height * 0.06).clamp(2.0, 10.0);
    return local.dy <=
        (height - gap) * _inputShareAt(height, widget.inputLineShare);
  }

  bool _canDragAt(Offset local) {
    final onInput = _isOnInputLine(local);
    if (onInput ? _inputView.maxOffset <= 0 : _resultMaxPan <= 0) return false;
    _draggingInput = onInput;
    return true;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_draggingInput) {
        final view = _inputView;
        _inputPan = (_inputPan - details.delta.dx).clamp(
          -view.follow,
          view.maxOffset - view.follow,
        );
      } else {
        _resultPan = (_resultPan - details.delta.dx).clamp(0.0, _resultMaxPan);
      }
    });
  }

  @override
  Widget build(BuildContext context) => RawGestureDetector(
    gestures: {
      LineDragRecognizer:
          GestureRecognizerFactoryWithHandlers<
            LineDragRecognizer
          >(() => LineDragRecognizer(allowedAt: _canDragAt), (recognizer) {
            recognizer
              ..allowedAt = _canDragAt
              // The device's slop, as the display's other gestures use it; with
              // the default the vertical swipe always wins.
              ..gestureSettings = MediaQuery.maybeGestureSettingsOf(context)
              ..onUpdate = _onDragUpdate;
          }),
    },
    child: widget.builder(_inputPan, _resultPan),
  );
}

class TwoLineDisplayPainter extends CustomPainter {
  TwoLineDisplayPainter({
    required this.inputPan,
    required this.resultPan,
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
    required this.crossBaseBracket,
    required this.glyphStyle,
    required this.inputLineShare,
    required this.showCursor,
    required this.colors,
  });
  final double inputPan;
  final double resultPan;
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
  final String? crossBaseBracket;
  final GlyphStyle glyphStyle;
  final double inputLineShare;
  final bool showCursor;
  final AppColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    // Adaptive line layout: gap shrinks proportionally with height so two
    // lines remain visible from ~60 dp (landscape) to 170 dp (cap).
    final gap = (size.height * 0.06).clamp(2.0, 10.0);
    final inputH =
        (size.height - gap) * _inputShareAt(size.height, inputLineShare);
    final resultH = size.height - gap - inputH;
    final inputRect = Rect.fromLTWH(0, 0, size.width, inputH);
    final resultRect = Rect.fromLTWH(0, inputH + gap, size.width, resultH);
    _paintInputLine(canvas, inputRect, size);
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
          color: colors.displayError,
          fontSize: _displayFontSize(rect.height),
          fontFamily: keyFontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(
        rect.right - tp.width - 8,
        rect.top + (rect.height - tp.height) / 2,
      ),
    );
  }

  void _paintIndicators(Canvas canvas, Size size) {
    if (memoryActive) {
      TextPainter(
          text: TextSpan(
            text: 'M',
            style: TextStyle(
              color: colors.accentGold,
              fontSize: 12,
              fontFamily: keyFontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        )
        ..layout()
        ..paint(canvas, const Offset(2, 2));
    }
    final label = angleModeLabel;
    if (label != null) {
      final tp = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: colors.displayDim,
            fontSize: 10,
            fontFamily: keyFontFamily,
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
          style: TextStyle(
            // Base badge wears its world hue (colour code "eine Farbe pro
            // Welt"): dozenal = Twelve-world violet, decimal = Ten-world
            // green — no longer the link blue, which belongs to functions.
            color: numeralSystemLabel == 'DOZ'
                ? colors.worldTwelve
                : colors.worldTen,
            fontSize: 10,
            fontFamily: keyFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(size.width - tp.width - 2, 14));
    }
  }

  void _paintInputLine(Canvas canvas, Rect rect, Size size) {
    final view = inputLineView(
      size,
      inputBuffer,
      cursorPos,
      glyphStyle,
      inputLineShare: inputLineShare,
    );
    final offset = (view.follow + inputPan).clamp(0.0, view.maxOffset);
    final laid = inputBuffer
        .map(
          (t) => _layoutToken(t, rect.height, glyphStyle, colors.displayText),
        )
        .toList();
    final dots = _ellipsisPainter(rect.height, colors.displayText);
    final dotsY = rect.top + (rect.height - dots.height) / 2;
    final cutLeft = offset > 0;
    final cutRight = offset < view.maxOffset;
    final visibleRight = view.maxOffset > 0
        ? rect.right - _inputBadgeReserve
        : rect.right;
    if (cutLeft) dots.paint(canvas, Offset(rect.left, dotsY));
    if (cutRight) dots.paint(canvas, Offset(visibleRight - dots.width, dotsY));
    canvas.save();
    if (view.maxOffset > 0) {
      canvas.clipRect(
        Rect.fromLTRB(
          rect.left + (cutLeft ? dots.width : 0),
          rect.top,
          visibleRight - (cutRight ? dots.width : 0),
          rect.bottom,
        ),
      );
    }
    var x = rect.left - offset;
    for (var i = 0; i < laid.length; i++) {
      if (showCursor && i == cursorPos && !resultFieldActive) {
        _drawCursor(canvas, x, rect.top, rect.height);
      }
      laid[i].paint(canvas, Offset(x, rect.top), rect.height);
      x += laid[i].width;
    }
    if (showCursor && cursorPos >= laid.length && !resultFieldActive) {
      _drawCursor(canvas, x, rect.top, rect.height);
    }
    canvas.restore();
  }

  /// A result the user moved: nothing is cut off for good, the line just
  /// shifts, and dots mark the sides where more of it lies out of view.
  void _paintDraggedResultLine(Canvas canvas, Rect rect) {
    final laid = resultBuffer
        .map(
          (t) => _layoutToken(t, rect.height, glyphStyle, colors.displayText),
        )
        .toList();
    final approx = isF64Fallback
        ? _approxPainter(rect.height, colors.displayText)
        : null;
    final approxW = approx == null
        ? 0.0
        : approx.width + _approxGap(rect.height);
    final tail = resultPeriodCapped
        ? _ellipsisPainter(rect.height, colors.displayText)
        : null;
    final total =
        approxW +
        laid.fold<double>(0, (a, t) => a + t.width) +
        (tail?.width ?? 0);
    final dots = _ellipsisPainter(rect.height, colors.displayText);
    final dotsY = rect.top + (rect.height - dots.height) / 2;
    final startX = rect.left - resultPan;
    final cutRight = startX + total > rect.right + 0.5;
    dots.paint(canvas, Offset(rect.left, dotsY));
    if (cutRight) dots.paint(canvas, Offset(rect.right - dots.width, dotsY));
    canvas
      ..save()
      ..clipRect(
        Rect.fromLTRB(
          rect.left + dots.width,
          rect.top,
          rect.right - (cutRight ? dots.width : 0),
          rect.bottom,
        ),
      );
    var x = startX;
    approx?.paint(
      canvas,
      Offset(x, rect.top + (rect.height - approx.height) / 2),
    );
    x += approxW;
    final overlineY = rect.top + _overlineYOffset(rect.height);
    final periodStart = resultPeriodStart;
    for (var i = 0; i < laid.length; i++) {
      if (showCursor && resultFieldActive && i == resultCursorPos) {
        _drawCursor(canvas, x, rect.top, rect.height);
      }
      laid[i].paint(canvas, Offset(x, rect.top), rect.height);
      if (periodStart != null &&
          i >= periodStart &&
          i < periodStart + resultPeriodLen) {
        canvas.drawLine(
          Offset(x, overlineY),
          Offset(x + laid[i].width, overlineY),
          Paint()
            ..color = colors.displayText
            ..strokeWidth = 1.2,
        );
      }
      x += laid[i].width;
    }
    if (showCursor && resultFieldActive && resultCursorPos >= laid.length) {
      _drawCursor(canvas, x, rect.top, rect.height);
    }
    tail?.paint(canvas, Offset(x, rect.top + (rect.height - tail.height) / 2));
    canvas.restore();
  }

  void _paintResultLine(Canvas canvas, Rect rect) {
    if (resultPan > 0) {
      _paintDraggedResultLine(canvas, rect);
      return;
    }
    final laid = resultBuffer
        .map(
          (t) => _layoutToken(t, rect.height, glyphStyle, colors.displayText),
        )
        .toList();
    var totalW = laid.fold<double>(0, (a, t) => a + t.width);

    // Leading "≈" when the rational track collapsed and we're showing a
    // rounded f64 value (State B). Deliberately distinct from the
    // width-truncation "…": "≈" means *approximate*, "…" means *exact but
    // clipped to fit*. An f64 fallback never carries a period
    // (formatF64Result clears it), so the prefix and the period/State-C
    // suffix never collide.
    final approxTp = isF64Fallback
        ? _approxPainter(rect.height, colors.displayText)
        : null;
    final approxW = approxTp == null
        ? 0.0
        : approxTp.width + _approxGap(rect.height);

    // State-C dot cluster (period longer than maxPeriodDisplay) reserves a
    // suffix slot up front; a width-truncation "…" may still be added below
    // once we know digits had to be dropped.
    var suffixTp = resultPeriodCapped
        ? _ellipsisPainter(rect.height, colors.displayText)
        : null;
    var suffixW = suffixTp?.width ?? 0.0;

    // Width-Truncation: das Ergebnis ist rechts-ausgerichtet, also lägen
    // überlange Resultate links aus der Anzeige raus. Wir droppen Tokens vom
    // rechten Ende (am wenigsten signifikante Nachkomma-Stellen zuerst) bis es
    // passt — inklusive reserviertem Platz für „≈"-Präfix und Suffix. Die
    // Periode wird mit-geclamped.
    var displayedPeriodLen = resultPeriodLen;
    var displayedPeriodStart = resultPeriodStart;
    var truncated = false;
    void dropTrailing() {
      final dropped = laid.removeLast();
      totalW -= dropped.width;
      truncated = true;
      final ps = displayedPeriodStart;
      if (ps != null) {
        if (laid.length <= ps) {
          displayedPeriodStart = null;
          displayedPeriodLen = 0;
        } else if (laid.length < ps + displayedPeriodLen) {
          displayedPeriodLen = laid.length - ps;
        }
      }
    }

    while (totalW + suffixW + approxW > rect.width && laid.length > 1) {
      dropTrailing();
    }
    // Wenn wir geschnitten haben und (noch) kein State-C-Suffix da war,
    // Baseline-Ellipsis nachziehen (semantisch: „mehr da, aber abgeschnitten").
    if (truncated && suffixTp == null) {
      suffixTp = _ellipsisPainter(rect.height, colors.displayText);
      suffixW = suffixTp.width;
      while (totalW + suffixW + approxW > rect.width && laid.length > 1) {
        dropTrailing();
      }
    }

    // Right-aligned block: [≈] · [tokens…] · [suffix]. The tokens still end at
    // rect.right − suffixW; the "≈" prefix sits to their left.
    var x = rect.right - totalW - suffixW;
    final positions = <double>[];
    for (var i = 0; i < laid.length; i++) {
      positions.add(x);
      laid[i].paint(canvas, Offset(x, rect.top), rect.height);
      x += laid[i].width;
    }

    final overlineY = rect.top + _overlineYOffset(rect.height);
    final periodStart = displayedPeriodStart;
    if (periodStart != null && displayedPeriodLen > 0) {
      final endIdx = periodStart + displayedPeriodLen - 1;
      if (periodStart < positions.length && endIdx < positions.length) {
        final x1 = positions[periodStart] + 1.5;
        final x2 = positions[endIdx] + laid[endIdx].width - 1.5;
        canvas.drawLine(
          Offset(x1, overlineY),
          Offset(x2, overlineY),
          Paint()
            ..color = colors.displayText
            ..strokeWidth = 1.2,
        );
      }
    }
    if (suffixTp != null) {
      if (resultPeriodCapped) {
        // State C: drei Punkte manuell, damit ihre Zentren exakt auf overlineY
        // sitzen. Ein Glyph-„…" läge auf der Font-Baseline und damit sichtbar
        // unter dem Periodenstrich. Bei gleichzeitigem Width-Schnitt gewinnt
        // State C, weil die Period-Info informativer ist als der reine Schnitt.
        final r = rect.height * 0.025;
        final dx = r * 3.6;
        final centerX = x + suffixTp.width / 2;
        final paint = Paint()..color = colors.displayText;
        for (var i = -1; i <= 1; i++) {
          canvas.drawCircle(Offset(centerX + i * dx, overlineY), r, paint);
        }
      } else {
        // Width-Truncation: Baseline-„…".
        final yPos = rect.top + (rect.height - suffixTp.height) / 2;
        suffixTp.paint(canvas, Offset(x, yPos));
      }
    }

    // „≈"-Präfix links vom ersten Token.
    if (approxTp != null) {
      final yPos = rect.top + (rect.height - approxTp.height) / 2;
      approxTp.paint(
        canvas,
        Offset(rect.right - totalW - suffixW - approxW, yPos),
      );
    }

    // Cross-base reference „{…}" on the far left — only when it fits left of
    // the result block. It's secondary: the result keeps width priority and is
    // never pushed for it; the bracket simply hides if there's no room.
    // Colour code: the bracket glows in the hue of the world it shows — here
    // always the OTHER base (dozenal result → green decimal reference).
    final cross = crossBaseBracket;
    if (cross != null) {
      final bracketHue =
          (numeralSystemLabel == 'DOZ' ? colors.worldTen : colors.worldTwelve)
              .withValues(alpha: 0.85);
      final bracketTp = _bracketPainter('{$cross}', rect.height, bracketHue);
      final blockLeft = rect.right - totalW - suffixW - approxW;
      if (rect.left + bracketTp.width + 8 <= blockLeft) {
        bracketTp.paint(
          canvas,
          Offset(rect.left, rect.top + (rect.height - bracketTp.height) / 2),
        );
      }
    }

    if (resultFieldActive) {
      final cx = resultCursorPos <= 0
          ? (positions.isNotEmpty ? positions.first : rect.right - suffixW)
          : (resultCursorPos >= positions.length
                ? rect.right - suffixW
                : positions[resultCursorPos]);
      if (showCursor) _drawCursor(canvas, cx, rect.top, rect.height);
    }
  }

  void _drawCursor(Canvas canvas, double x, double yTop, double height) {
    canvas.drawRect(
      Rect.fromLTWH(x, yTop + 6, 1.5, height - 12),
      Paint()..color = Colors.redAccent,
    );
  }

  @override
  bool shouldRepaint(covariant TwoLineDisplayPainter old) =>
      old.inputLineShare != inputLineShare ||
      old.inputPan != inputPan ||
      old.resultPan != resultPan ||
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
      old.numeralSystemLabel != numeralSystemLabel ||
      old.crossBaseBracket != crossBaseBracket ||
      old.glyphStyle != glyphStyle ||
      old.showCursor != showCursor ||
      old.colors != colors;
}

// ---------------------------------------------------------------------------
// Token layout: turn a CalcToken into a (width, paint-fn) pair.
// ---------------------------------------------------------------------------

class _LaidToken {
  _LaidToken(this.width, this.paint);
  final double width;
  final void Function(Canvas, Offset, double lineH) paint;
}

/// A short display (landscape) cannot afford a small input line: its text
/// would be unreadable, so the input takes nearly half of the height.
double _inputShareAt(double displayHeight, double share) =>
    displayHeight < _shortDisplayHeight
    ? math.max(share, _shortDisplayInputShare)
    : share;

const double _shortDisplayHeight = 130;
const double _shortDisplayInputShare = 0.46;

/// Half-radius factor of the digit glyph relative to the line height.
/// Composite digits (D2/D3/D5/D6/D8/D9/D11) span ±2q around the centre —
/// so 4 · q must fit within lineH with room above for the overline.
const double _digitQRatio = 0.18;

/// Above this a composite glyph would no longer fit its line.
const double _maxGlyphScale = 1.2;

/// Pixel gap between the top of a composite glyph and the overline that
/// signals a periodic expansion.
const double _overlineGap = 4;

/// Text size in a display line. Low lines fill up to [_maxLineFill] before the
/// text drops below the readable floor, which keeps landscape text legible.
double _displayFontSize(double lineH) => math.max(
  lineH * 0.42 * displayCharacterScale,
  math.min(displayMinFontSize, lineH * _maxLineFill),
);

const double _maxLineFill = 0.74;

double _digitQ(double lineH) =>
    lineH * _digitQRatio * math.min(displayCharacterScale, _maxGlyphScale);

/// Y offset (relative to the result rect's top) where the overline sits.
/// Lifts it just above the top of a composite glyph: centre.y − 2·q − gap.
double _overlineYOffset(double lineH) =>
    lineH / 2 - 2 * _digitQ(lineH) - _overlineGap;

_LaidToken _layoutToken(
  CalcToken token,
  double lineH,
  GlyphStyle style,
  Color color,
) {
  if (token is Digit) {
    if (style == GlyphStyle.conventional) {
      // Render as conventional ASCII: '0'..'9' for d0..d9, 'A'/'B' for
      // d10/d11 (Pitman/Dwiggins extension, standard in academic
      // dozenal literature).
      final tp = _textPainter(
        conventionalDigitChar(token.value),
        _displayFontSize(lineH),
        color,
      );
      return _LaidToken(tp.width + 4, (canvas, offset, h) {
        tp.paint(
          canvas,
          Offset(offset.dx + 2, offset.dy + (h - tp.height) / 2),
        );
      });
    }
    final q = _digitQ(lineH);
    final cell = q * 2 + 6;
    return _LaidToken(cell, (canvas, offset, h) {
      paintDozenalDigitAt(
        canvas,
        token.value,
        center: Offset(offset.dx + cell / 2, offset.dy + h / 2),
        q: q,
        color: color,
        strokeWidth: 1.6,
      );
    });
  }
  final text = _tokenText(token);
  if (text.isEmpty) return _LaidToken(0, (_, _, _) {});
  final tp = _textPainter(text, _displayFontSize(lineH), color);
  return _LaidToken(tp.width + 4, (canvas, offset, h) {
    tp.paint(canvas, Offset(offset.dx + 2, offset.dy + (h - tp.height) / 2));
  });
}

TextPainter _textPainter(String text, double fontSize, Color color) =>
    TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: keyFontFamily,
          fontWeight: keyTextWeight,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

TextPainter _ellipsisPainter(double lineH, Color color) =>
    _textPainter('…', _displayFontSize(lineH), color);

/// "≈" marker drawn ahead of a rounded f64-fallback result (State B).
TextPainter _approxPainter(double lineH, Color color) =>
    _textPainter('≈', _displayFontSize(lineH), color);

/// Gap between the "≈" marker and the first result digit.
double _approxGap(double lineH) => lineH * 0.08;

/// Dim "{…}" cross-base reference painter for the result line.
TextPainter _bracketPainter(String text, double lineH, Color color) =>
    TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: lineH * 0.30,
          fontFamily: keyFontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

/// Text label for a non-digit token in display context. Mirrors the Rust
/// `paint_token` text branches but without the button border treatment.
String _tokenText(CalcToken t) => switch (t) {
  Decimal() => '.',
  Negate() => '−',
  Add() => '+',
  Sub() => '−',
  Mul() => '×',
  Div() => '÷',
  Mod() => 'mod',
  ParenOpen() => '(',
  ParenClose() => ')',
  // Prefix functions render with their opening paren so the argument's scope
  // is visible on the input line (TI/Casio style): the user sees how far the
  // function reaches and closes it with `)` when they want to step out. The
  // meval emission already opens these (tokenMevalStr), so this only makes the
  // existing scope visible — it does not change evaluation.
  Sin() => 'sin(',
  Cos() => 'cos(',
  Tan() => 'tan(',
  Cot() => 'cot(',
  ArcSin() => 'sin⁻¹(',
  ArcCos() => 'cos⁻¹(',
  ArcTan() => 'tan⁻¹(',
  ArcCot() => 'cot⁻¹(',
  Sinh() => 'sinh(',
  Cosh() => 'cosh(',
  Tanh() => 'tanh(',
  Coth() => 'coth(',
  ArSinh() => 'sinh⁻¹(',
  ArCosh() => 'cosh⁻¹(',
  ArTanh() => 'tanh⁻¹(',
  ArCoth() => 'coth⁻¹(',
  ConstPi() => 'π',
  ConstE() => 'e',
  ConstPhi() => 'φ',
  ConstSqrt2() => '√2',
  Factorial() => 'n!',
  AbsVal() => '|x|',
  Reciprocal() => '1/x',
  ExpTopRight() => '^',
  RootTopLeft() => '√',
  OplusBotLeft() => '⊕',
  LogBotRight() => 'log',
  Ln() => 'ln(',
  ExpE() => 'exp(',
  Log12() => 'log₁₂(',
  NCr() => 'nCr',
  NPr() => 'nPr',
  Sci() => 'E',
  RatLit(:final label) => label,
  // No display string: real Digit tokens are laid out via the glyph path,
  // never here; app-state/mode tokens (AC, Del, Equals, Expand, Close, Sto,
  // Rcl, Mc, Ans, Doz, Dez, Drg, Info, cursor arrows) never enter a buffer.
  Digit() ||
  Ac() ||
  Del() ||
  Equals() ||
  Expand() ||
  Close() ||
  MemPlus() ||
  MemMinus() ||
  Square() ||
  PlusMinus() ||
  Sto() ||
  Rcl() ||
  Mc() ||
  Ans() ||
  ConvAns() ||
  AssetAns() ||
  Doz() ||
  Dez() ||
  Drg() ||
  Info() ||
  TriangleLeft() ||
  TriangleRight() => '',
};
