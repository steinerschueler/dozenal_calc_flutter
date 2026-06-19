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

// ---------------------------------------------------------------------------
// Shared label / system keys + the long-press info box.
//
// Used by both the unit converter (converter_keypad.dart) and the asset
// converter (asset_keypad.dart): the category/genus/magnitude tiles, the two
// round met/imp system keys flanking the equals bar, and the info box a unit
// tile pops on long-press. Promoted here so the two keypads can't drift apart.
// ---------------------------------------------------------------------------

/// A bordered text tile (a unit category, an asset class/genus, or a
/// magnitude). [gold] draws the full-strength active frame (the Überbegriff);
/// [softGold] the fainter selected-sub-unit frame. Optional [info] adds a
/// long-press box (one-sentence description + a "more in the theory" pointer).
class LabelButton extends StatefulWidget {
  final String label;

  /// Resolves the label colour from the active palette (called in build, so
  /// the button follows theme switches without rebuilding the call sites).
  final Color Function(AppColors) colorOf;

  /// Full-strength gold frame (active category — the Überbegriff).
  final bool gold;

  /// Fainter gold frame, same hue (selected sub-unit / magnitude). Subordinate
  /// to a category's [gold] frame.
  final bool softGold;
  final VoidCallback onTap;

  /// Optional long-press box content (one-sentence description + the
  /// "more in the … theory" pointer). Null → no long-press box.
  final ({String desc, String more})? info;

  /// When false the tile is inert: no tap, no haptics, no long-press, and it
  /// reports `button: false` to a11y (callers also grey it via [colorOf]).
  final bool enabled;

  const LabelButton({
    super.key,
    required this.label,
    required this.colorOf,
    this.gold = false,
    this.softGold = false,
    required this.onTap,
    this.info,
    this.enabled = true,
  });

  @override
  State<LabelButton> createState() => _LabelButtonState();
}

class _LabelButtonState extends State<LabelButton> {
  bool _pressed = false;

  void _set(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final enabled = widget.enabled;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? (_) => _set(true) : null,
      onTapUp: enabled ? (_) => _set(false) : null,
      onTapCancel: enabled ? () => _set(false) : null,
      onTap: !enabled
          ? null
          : () {
              if (HapticsScope.enabledOf(context)) {
                HapticFeedback.lightImpact();
              }
              widget.onTap();
            },
      onLongPress: (!enabled || widget.info == null)
          ? null
          : () {
              if (HapticsScope.enabledOf(context)) {
                HapticFeedback.mediumImpact();
              }
              final rb = context.findRenderObject();
              if (rb is! RenderBox) return;
              final anchor = rb.localToGlobal(Offset.zero) & rb.size;
              showUnitInfoBox(
                  context, anchor, widget.info!.desc, widget.info!.more);
            },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: minTouchTarget),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.gold
                  ? t.accentGold
                  : (widget.softGold ? t.accentGoldSoft : t.keyBorder),
              width: widget.gold ? 2 : (widget.softGold ? 1.5 : 1),
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.label,
              maxLines: 1,
              style: TextStyle(
                color: _pressed ? t.opPressed : widget.colorOf(t),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// One of the two round unit-system keys flanking the equals bar — styled like
/// the (i)/(?) buttons on the main calculator so the pager pages rhyme. Carries
/// its world hue permanently (metric → Ten-world green, imperial → Twelve-world
/// violet); the active system also gets a 2 dp ring in its own hue.
/// [enabled] greys it out (e.g. currencies have no metric/imperial axis).
class SystemKey extends StatefulWidget {
  final String label;
  final String semanticLabel;
  final bool tenWorld;
  final bool active;
  final bool enabled;
  final VoidCallback onTap;

  const SystemKey({
    super.key,
    required this.label,
    required this.semanticLabel,
    required this.tenWorld,
    required this.active,
    required this.onTap,
    this.enabled = true,
  });

  @override
  State<SystemKey> createState() => _SystemKeyState();
}

class _SystemKeyState extends State<SystemKey> {
  bool _pressed = false;

  void _set(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    final hue = widget.tenWorld ? t.worldTen : t.worldTwelve;
    final enabled = widget.enabled;
    return Semantics(
      button: enabled,
      enabled: enabled,
      selected: widget.active,
      label: widget.semanticLabel,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (_) => _set(true) : null,
        onTapUp: enabled ? (_) => _set(false) : null,
        onTapCancel: enabled ? () => _set(false) : null,
        onTap: !enabled
            ? null
            : () {
                if (HapticsScope.enabledOf(context)) {
                  HapticFeedback.lightImpact();
                }
                widget.onTap();
              },
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: minTouchTarget,
            minWidth: minTouchTarget,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: t.pagerFill,
              border: Border.all(
                color: !enabled
                    ? t.keyBorderDisabled
                    : (widget.active ? hue : t.pagerBorder),
                width: widget.active ? 2 : 1,
              ),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.label,
                maxLines: 1,
                style: TextStyle(
                  color: !enabled
                      ? t.inertKey
                      : (_pressed
                          ? t.opPressed
                          : (widget.active
                              ? hue
                              : hue.withValues(alpha: 0.55))),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows a small info box directly above [anchor] (a tile's global rect) with a
/// one-sentence [desc] and the [more] pointer. A translucent, non-swallowing
/// barrier dismisses it on the next outside pointer-down (the same tap still
/// acts on the key beneath — smartphone-keyboard convention).
void showUnitInfoBox(
    BuildContext context, Rect anchor, String desc, String more) {
  final overlay = Overlay.of(context);
  final t = AppColors.of(context);
  final media = MediaQuery.of(context);
  final w = math.min(300.0, media.size.width - 16);
  final left = (anchor.center.dx - w / 2).clamp(8.0, media.size.width - w - 8);
  final bottom = media.size.height - anchor.top + 6;
  late OverlayEntry entry;
  entry = OverlayEntry(
    builder: (ctx) => Stack(
      children: [
        Positioned.fill(
          child: Listener(
            behavior: HitTestBehavior.translucent,
            onPointerDown: (_) {
              if (entry.mounted) entry.remove();
            },
          ),
        ),
        Positioned(
          left: left,
          bottom: bottom,
          width: w,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: t.cardFill,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: t.cardBorder),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                        color: t.textPrimary, fontSize: 13, height: 1.35),
                  ),
                  if (more.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      more,
                      style: TextStyle(
                          color: t.textMuted, fontSize: 11, height: 1.3),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
  overlay.insert(entry);
}
