// Shared building blocks of the two keypads — main calculator (keypad.dart)
// and unit converter (converter_keypad.dart). The keypads stay separate
// widget trees on purpose: identical-looking keys carry DIFFERENT semantics
// (token pipeline vs. scalar-entry pipeline), enablement is dynamic per
// calculator, and the main keypad's store screenshots must stay untouched.
// Everything that must not drift apart, however, lives here exactly once:
// the pressable key shell, the digit/token painters, the digit-grid layout,
// the set columns both keypads share, and the Hoch height regimes.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_layout.dart';
import 'app_theme.dart';
import 'glyph_painter.dart';
import 'haptics.dart';
import 'logic/glyph_style.dart';
import 'token_painter.dart';
import 'tokens.dart';

// ---------------------------------------------------------------------------
// Hoch-mode height regimes (dp of available keypad height).
// ---------------------------------------------------------------------------

/// Below this keypad height the Hoch layout switches to a tight gap regime
/// to squeeze ~26 dp out of the inter-row spacing.
const double kKeypadTightThreshold = 560.0;

/// Below this keypad height even the tight layout would push buttons below
/// the 44 dp touch-target floor — fall back to a scrollable fixed-height
/// layout so no row is unreachable.
const double kKeypadScrollThreshold = 480.0;

// ---------------------------------------------------------------------------
// Shared key layouts.
// ---------------------------------------------------------------------------

/// The 4×3 digit grid, [A B 0] on top down to [1 2 3] — identical on both
/// keypads.
const List<List<DozenalDigit>> kDigitGridRows = [
  [DozenalDigit.d10, DozenalDigit.d11, DozenalDigit.d0],
  [DozenalDigit.d7, DozenalDigit.d8, DozenalDigit.d9],
  [DozenalDigit.d4, DozenalDigit.d5, DozenalDigit.d6],
  [DozenalDigit.d1, DozenalDigit.d2, DozenalDigit.d3],
];

/// Set columns that exist identically on both keypads. (The remaining sets
/// differ: the converter swaps trig/parens for unit categories.)
const List<CalcToken> kSet1 = [Add(), Sub(), Mul(), Div()];
const List<CalcToken> kSet2 = [
  OplusBotLeft(),
  ExpTopRight(),
  RootTopLeft(),
  LogBotRight(),
];
const List<CalcToken> kSet6 = [Sto(), Rcl(), Mc(), Ans()];
const List<CalcToken> kSet7 = [ConstPi(), ConstE(), ConstPhi(), ConstSqrt2()];

// ---------------------------------------------------------------------------
// Pressable key shell.
// ---------------------------------------------------------------------------

/// The tappable key chassis used by every painted key on both keypads:
/// press-state tracking for the colour flash, tap haptics, the rounded
/// 1 dp border (2 dp in op-blue when [selected], 2 dp gold when [gold] —
/// e.g. the converter's armed −), and the optional long-press hooks for the
/// main keypad's accent popups. Inactive keys ([disabled] or a null
/// [onTap]) show the dimmed border and swallow input. A 44 dp minimum
/// height is enforced here; callers may add their own outer constraints.
class PressableShell extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget Function(BuildContext ctx, bool pressed) builder;
  final bool selected;
  final bool gold;
  final bool disabled;
  // Long-press popup hooks (host keys only — null keeps the recognizer out
  // of the gesture arena so plain keys are unaffected).
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;
  final GestureLongPressEndCallback? onLongPressEnd;

  const PressableShell({
    super.key,
    this.onTap,
    required this.builder,
    this.selected = false,
    this.gold = false,
    this.disabled = false,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressEnd,
  });

  @override
  State<PressableShell> createState() => _PressableShellState();
}

class _PressableShellState extends State<PressableShell> {
  bool _pressed = false;

  bool get _inactive => widget.disabled || widget.onTap == null;

  void _setPressed(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  void _handleTap() {
    if (_inactive) return;
    if (HapticsScope.enabledOf(context)) HapticFeedback.lightImpact();
    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _inactive ? null : (_) => _setPressed(true),
      onTapUp: _inactive ? null : (_) => _setPressed(false),
      onTapCancel: _inactive ? null : () => _setPressed(false),
      onTap: _handleTap,
      onLongPressStart: _inactive ? null : widget.onLongPressStart,
      onLongPressMoveUpdate: _inactive ? null : widget.onLongPressMoveUpdate,
      onLongPressEnd: _inactive ? null : widget.onLongPressEnd,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: minTouchTarget),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.gold
                  ? t.accentGold
                  : widget.selected
                      ? t.op
                      : (_inactive ? t.keyBorderDisabled : t.keyBorder),
              width: widget.gold || widget.selected ? 2 : 1,
            ),
          ),
          child: widget.builder(context, _pressed),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Key painters.
// ---------------------------------------------------------------------------

/// Digit-key painter: either one of the twelve custom dozenal glyphs or the
/// conventional ASCII '0'..'9'/'A'/'B' (Pitman/Dwiggins convention), per the
/// settings-page "Ziffern auf Tasten" preference. Font size chosen so the
/// conventional digit's visual height roughly matches the 2q glyph box.
class DigitKeyPainter extends CustomPainter {
  final DozenalDigit digit;
  final GlyphStyle style;
  final Color color;

  DigitKeyPainter({
    required this.digit,
    required this.color,
    this.style = GlyphStyle.custom,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final minEdge = math.min(size.width, size.height);
    if (style == GlyphStyle.conventional) {
      final tp = TextPainter(
        text: TextSpan(
          text: conventionalDigitChar(digit),
          style: TextStyle(
            color: color,
            fontSize: minEdge * 0.55,
            fontFamily: 'monospace',
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(
        canvas,
        Offset((size.width - tp.width) / 2, (size.height - tp.height) / 2),
      );
      return;
    }
    final q = minEdge / 4;
    paintDozenalDigitAt(
      canvas,
      digit,
      center: Offset(size.width / 2, size.height / 2),
      q: q,
      color: color,
      strokeWidth: 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant DigitKeyPainter old) =>
      old.digit != digit || old.color != color || old.style != style;
}

/// Token-key painter: thin CustomPainter wrapper around [paintTokenAt], the
/// single source of every operator/function glyph.
class TokenKeyPainter extends CustomPainter {
  final CalcToken token;
  final Color color;

  TokenKeyPainter({required this.token, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    paintTokenAt(
      canvas,
      token,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      color: color,
      strokeWidth: 2.0,
    );
  }

  @override
  bool shouldRepaint(covariant TokenKeyPainter old) =>
      old.token != token || old.color != color;
}
