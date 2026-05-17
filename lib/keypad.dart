// Orientation-driven keypad layout.
//
// Top-level Keypad dispatches to:
//   - _HochKeypad   (portrait, vertical stack + AnimatedSwitcher panel-swap
//                    between Sets 1-4 and Sets 6-10)
//   - _BreitKeypad  (landscape and tablet, inline layout with all ten sets
//                    visible side-by-side, no overlay)
//
// Both modes derive button sizes from LayoutBuilder constraints. Each button
// is wrapped in a 44 dp minimum-touch-target floor. When the Hoch mode falls
// below the minimum viable layout, a SingleChildScrollView is used as a
// safety net so no row is unreachable.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_layout.dart';
import 'glyph_painter.dart';
import 'token_painter.dart';
import 'tokens.dart';

const Color _kDigitNormal = Colors.white;
const Color _kDigitPressed = Color(0xFFFFD700); // egui GOLD
const Color _kDigitDisabled = Color(0xFF606060);
const Color _kOpNormal = Color(0xFF98C8FF); // egui LIGHT_BLUE
const Color _kOpPressed = Color(0xFFFF9090); // egui LIGHT_RED
const Color _kEquals = Color(0xFF8CDC8C); // egui LIGHT_GREEN
const Color _kBorder = Color(0xFF505050);
const Color _kAc = Color(0xFFFF4040);
const Color _kAcPressed = Color(0xFFFF8080);

typedef TokenTapHandler = void Function(CalcToken token);
typedef ArmedPredicate = bool Function(CalcToken token);
typedef SelectedPredicate = bool Function(CalcToken token);
typedef DisabledPredicate = bool Function(CalcToken token);

// ---------------------------------------------------------------------------
// Hoch-mode thresholds (in dp of available keypad height — i.e. screen height
// minus SafeArea, minus Padding, minus the display and its gap).
// ---------------------------------------------------------------------------

/// Below this keypad height the Hoch layout switches to a tight gap regime
/// to squeeze ~26 dp out of the inter-row spacing.
const double _kTightThreshold = 560.0;

/// Below this keypad height even the tight layout would push buttons below
/// the 44 dp touch-target floor. We fall back to a scrollable fixed-height
/// layout so no row is unreachable.
const double _kScrollThreshold = 480.0;

// ---------------------------------------------------------------------------
// Public entry point
// ---------------------------------------------------------------------------

class Keypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  /// Whether the Sets 6-10 overlay panel is currently active. Only meaningful
  /// in Hoch mode — Breit ignores it (all sets are always visible).
  final bool overlayOpen;

  const Keypad({
    super.key,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    this.overlayOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (isPortraitConstraints(constraints)) {
          return _HochKeypad(
            onTap: onTap,
            isArmed: isArmed,
            isSelected: isSelected,
            isDisabled: isDisabled,
            onInfoTap: onInfoTap,
            onHelpTap: onHelpTap,
            overlayOpen: overlayOpen,
          );
        }
        return _BreitKeypad(
          onTap: onTap,
          isArmed: isArmed,
          isSelected: isSelected,
          isDisabled: isDisabled,
          onInfoTap: onInfoTap,
          onHelpTap: onHelpTap,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Token catalogue
// ---------------------------------------------------------------------------

const List<List<DozenalDigit>> _digitGridRows = [
  [DozenalDigit.d10, DozenalDigit.d11, DozenalDigit.d0],
  [DozenalDigit.d7, DozenalDigit.d8, DozenalDigit.d9],
  [DozenalDigit.d4, DozenalDigit.d5, DozenalDigit.d6],
  [DozenalDigit.d1, DozenalDigit.d2, DozenalDigit.d3],
];

/// Op grid for Hoch mode, read row-by-row. Each column corresponds to a
/// vertical Set 1-4 in the tablet/Breit inline layout.
const List<List<CalcToken>> _hochOpRows = [
  [Add(), OplusBotLeft(), Sin(), ParenOpen()],
  [Sub(), ExpTopRight(), Cos(), ParenClose()],
  [Mul(), RootTopLeft(), Tan(), TriangleLeft()],
  [Div(), LogBotRight(), Cot(), TriangleRight()],
];

/// Sets 6-9 op rows for Hoch mode in their panel-swap layout.
const List<List<CalcToken>> _hochOverlayRows = [
  [Sto(), ConstPi(), Sinh(), Factorial()],
  [Rcl(), ConstE(), Cosh(), AbsVal()],
  [Mc(), ConstPhi(), Tanh(), Reciprocal()],
  [Ans(), ConstSqrt2(), Coth(), Mod()],
];

const List<CalcToken> _systemRow = [Ac(), Del(), Decimal(), Expand()];

/// Set 10 lives in the overlay-mode-row position. Close mirrors the Expand
/// slot from the system-row so the toggle target stays put across the swap.
const List<CalcToken> _set10Row = [Doz(), Dez(), Drg(), Close()];

// Breit-mode column data (one set per column).
const List<CalcToken> _set1 = [Add(), Sub(), Mul(), Div()];
const List<CalcToken> _set2 = [
  OplusBotLeft(),
  ExpTopRight(),
  RootTopLeft(),
  LogBotRight(),
];
const List<CalcToken> _set3 = [Sin(), Cos(), Tan(), Cot()];
const List<CalcToken> _set4 = [
  ParenOpen(),
  ParenClose(),
  TriangleLeft(),
  TriangleRight(),
];
const List<CalcToken> _set6 = [Sto(), Rcl(), Mc(), Ans()];
const List<CalcToken> _set7 = [
  ConstPi(),
  ConstE(),
  ConstPhi(),
  ConstSqrt2(),
];
const List<CalcToken> _set8 = [Sinh(), Cosh(), Tanh(), Coth()];
const List<CalcToken> _set9 = [
  Factorial(),
  AbsVal(),
  Reciprocal(),
  Mod(),
];
const List<CalcToken> _set10Column = [Doz(), Dez(), Drg()]; // Close dropped

// ---------------------------------------------------------------------------
// Hoch keypad — portrait. Flex Column with panel-swap.
// ---------------------------------------------------------------------------

class _HochKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;
  final bool overlayOpen;

  const _HochKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    required this.overlayOpen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final h = constraints.maxHeight;
        if (h.isFinite && h < _kScrollThreshold) {
          return SingleChildScrollView(
            child: _buildColumn(
              tight: true,
              fixedHeights: true,
              maxHeight: double.infinity,
            ),
          );
        }
        final tight = h.isFinite && h < _kTightThreshold;
        return _buildColumn(
          tight: tight,
          fixedHeights: false,
          maxHeight: h,
        );
      },
    );
  }

  /// Builds the keypad column. In flex mode the rows are Expanded(flex: N)
  /// so they share the available height proportionally. In fixed-heights
  /// mode every row gets `minTouchTarget`-tall sized boxes — used inside
  /// the scroll fallback where Expanded would be unbounded.
  Widget _buildColumn({
    required bool tight,
    required bool fixedHeights,
    required double maxHeight,
  }) {
    final rowGap = tight ? 6.0 : 10.0;
    final sectionGap = tight ? 8.0 : 14.0;
    final equalsGap = tight ? 8.0 : 12.0;

    Widget row(Widget child, {int flex = 8}) =>
        fixedHeights
            ? SizedBox(height: minTouchTarget, child: child)
            : Expanded(flex: flex, child: child);

    final children = <Widget>[
      for (var r = 0; r < _digitGridRows.length; r++) ...[
        if (r > 0) SizedBox(height: rowGap),
        row(_digitRow(_digitGridRows[r])),
      ],
      SizedBox(height: sectionGap),
      const Divider(color: Color(0xFF333333), height: 1, thickness: 1),
      SizedBox(height: sectionGap),
      // Middle section: panel-swap between main ops and overlay sets.
      // Both panels have identical internal flex structure so the
      // AnimatedSwitcher crossfade lands cleanly.
      if (fixedHeights)
        _MiddleSection(
          overlayOpen: overlayOpen,
          tight: tight,
          fixedHeights: true,
          onTap: onTap,
          isArmed: isArmed,
          isSelected: isSelected,
          isDisabled: isDisabled,
        )
      else
        Expanded(
          flex: 40, // 5 rows × 8 = 40
          child: _MiddleSection(
            overlayOpen: overlayOpen,
            tight: tight,
            fixedHeights: false,
            onTap: onTap,
            isArmed: isArmed,
            isSelected: isSelected,
            isDisabled: isDisabled,
          ),
        ),
      SizedBox(height: equalsGap),
      // Equals row — slightly taller than a normal button (flex 10 vs 8).
      if (fixedHeights)
        SizedBox(
          height: minTouchTarget * 1.2,
          child: _EqualsRow(
            onEquals: () => onTap(const Equals()),
            sideGap: rowGap,
            onInfoTap: onInfoTap,
            onHelpTap: onHelpTap,
          ),
        )
      else
        Expanded(
          flex: 10,
          child: _EqualsRow(
            onEquals: () => onTap(const Equals()),
            sideGap: rowGap,
            onInfoTap: onInfoTap,
            onHelpTap: onHelpTap,
          ),
        ),
    ];

    return Column(
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _digitRow(List<DozenalDigit> digits) {
    final cells = <Widget>[];
    for (var i = 0; i < digits.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: 8));
      final token = Digit(digits[i]);
      cells.add(
        Expanded(
          child: _DigitButton(
            digit: digits[i],
            onTap: () => onTap(token),
            disabled: isDisabled?.call(token) ?? false,
          ),
        ),
      );
    }
    return Row(children: cells);
  }
}

/// Middle section of the Hoch keypad — the AnimatedSwitcher between the
/// main op-grid panel (Sets 1-4 + system row) and the overlay panel
/// (Sets 6-9 + Set 10 mode row).
class _MiddleSection extends StatelessWidget {
  final bool overlayOpen;
  final bool tight;
  final bool fixedHeights;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;

  const _MiddleSection({
    required this.overlayOpen,
    required this.tight,
    required this.fixedHeights,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final mainPanel = _MainOpsPanel(
      key: const ValueKey('main'),
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
      isDisabled: isDisabled,
    );
    final overlayPanel = _OverlayPanel(
      key: const ValueKey('overlay'),
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: overlayOpen ? overlayPanel : mainPanel,
    );
  }
}

class _MainOpsPanel extends StatelessWidget {
  final bool tight;
  final bool fixedHeights;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;

  const _MainOpsPanel({
    super.key,
    required this.tight,
    required this.fixedHeights,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return _RowsPanel(
      opRows: _hochOpRows,
      bottomRow: _systemRow,
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
      isDisabled: isDisabled,
    );
  }
}

class _OverlayPanel extends StatelessWidget {
  final bool tight;
  final bool fixedHeights;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;

  const _OverlayPanel({
    super.key,
    required this.tight,
    required this.fixedHeights,
    required this.onTap,
    this.isArmed,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return _RowsPanel(
      opRows: _hochOverlayRows,
      bottomRow: _set10Row,
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
    );
  }
}

/// Shared 5-row layout used by both _MainOpsPanel and _OverlayPanel so the
/// AnimatedSwitcher children have identical structure.
class _RowsPanel extends StatelessWidget {
  final List<List<CalcToken>> opRows;
  final List<CalcToken> bottomRow;
  final bool tight;
  final bool fixedHeights;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;

  const _RowsPanel({
    required this.opRows,
    required this.bottomRow,
    required this.tight,
    required this.fixedHeights,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final rowGap = tight ? 6.0 : 8.0;
    final bottomGap = tight ? 8.0 : 12.0;

    Widget rowWrap(Widget child, {int flex = 8}) => fixedHeights
        ? SizedBox(height: minTouchTarget, child: child)
        : Expanded(flex: flex, child: child);

    final children = <Widget>[
      for (var r = 0; r < opRows.length; r++) ...[
        if (r > 0) SizedBox(height: rowGap),
        rowWrap(_tokenRow(opRows[r])),
      ],
      SizedBox(height: bottomGap),
      rowWrap(_tokenRow(bottomRow)),
    ];

    return Column(
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget _tokenRow(List<CalcToken> tokens) {
    final cells = <Widget>[];
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: 8));
      cells.add(
        Expanded(
          child: _TokenButton(
            token: tokens[i],
            onTap: () => onTap(tokens[i]),
            armed: isArmed?.call(tokens[i]) ?? false,
            selected: isSelected?.call(tokens[i]) ?? false,
          ),
        ),
      );
    }
    return Row(children: cells);
  }
}

// ---------------------------------------------------------------------------
// Breit keypad — landscape phone and tablet. Inline layout with all ten
// sets visible. Button size scales with available height.
// ---------------------------------------------------------------------------

class _BreitKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _BreitKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // Vertical budget: max(digit-grid, set-column) + set-gap + equals row.
        // Digit grid uses tabletDigitGap (10), set columns use tabletColGap
        // (8). We solve for the larger to avoid overflow:
        //   4·b + 3·tabletDigitGap + tabletSetGap + b = h
        //   5·b = h - 3·tabletDigitGap - tabletSetGap
        const setGap = tabletSetGap; // 18 dp
        final h = constraints.maxHeight;
        final raw = h.isFinite
            ? (h - 3 * tabletDigitGap - setGap) / 5
            : tabletButtonSize;
        final buttonSize = raw.clamp(minTouchTarget, tabletButtonSize);

        // Single content widget; if the natural width would overflow,
        // a horizontal scroll keeps every set reachable.
        final content = _buildBreitContent(buttonSize: buttonSize);

        // Center vertically so abundant height (tablet portrait) shows
        // empty space symmetrically above and below the keypad rather than
        // pinning everything to the top.
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Horizontal scroll keeps every set reachable when the natural
              // row width exceeds the available width (phone-landscape with
              // all ten sets visible may trigger this on narrow devices).
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: content,
              ),
              const SizedBox(height: setGap),
              SizedBox(
                height: buttonSize,
                child: _EqualsRow(
                  sideGap: setGap,
                  onEquals: () => onTap(const Equals()),
                  onInfoTap: onInfoTap,
                  onHelpTap: onHelpTap,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBreitContent({required double buttonSize}) {
    Widget digitGrid() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var r = 0; r < _digitGridRows.length; r++) ...[
            if (r > 0) const SizedBox(height: tabletDigitGap),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var col = 0; col < _digitGridRows[r].length; col++) ...[
                  if (col > 0) const SizedBox(width: tabletDigitGap),
                  SizedBox(
                    width: buttonSize,
                    height: buttonSize,
                    child: _DigitButton(
                      digit: _digitGridRows[r][col],
                      onTap: () => onTap(Digit(_digitGridRows[r][col])),
                      disabled:
                          isDisabled?.call(Digit(_digitGridRows[r][col])) ??
                              false,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      );
    }

    Widget opColumn(List<CalcToken> tokens) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < tokens.length; i++) ...[
            if (i > 0) const SizedBox(height: tabletColGap),
            SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: _TokenButton(
                token: tokens[i],
                onTap: () => onTap(tokens[i]),
                armed: isArmed?.call(tokens[i]) ?? false,
                selected: isSelected?.call(tokens[i]) ?? false,
              ),
            ),
          ],
        ],
      );
    }

    // System column: AC/Del/Decimal + empty slot where Expand would be
    // (no overlay in Breit mode, so the toggle button isn't needed).
    Widget systemColumn() {
      const tokens = <CalcToken>[Ac(), Del(), Decimal()];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < tokens.length; i++) ...[
            if (i > 0) const SizedBox(height: tabletColGap),
            SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: _TokenButton(
                token: tokens[i],
                onTap: () => onTap(tokens[i]),
                armed: isArmed?.call(tokens[i]) ?? false,
                selected: isSelected?.call(tokens[i]) ?? false,
              ),
            ),
          ],
          const SizedBox(height: tabletColGap),
          SizedBox(width: buttonSize, height: buttonSize),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        digitGrid(),
        const SizedBox(width: tabletSetGap),
        opColumn(_set1),
        const SizedBox(width: tabletSetGap),
        opColumn(_set2),
        const SizedBox(width: tabletSetGap),
        opColumn(_set3),
        const SizedBox(width: tabletSetGap),
        opColumn(_set4),
        const SizedBox(width: tabletSetGap),
        systemColumn(),
        const SizedBox(width: tabletSetGap),
        opColumn(_set6),
        const SizedBox(width: tabletSetGap),
        opColumn(_set7),
        const SizedBox(width: tabletSetGap),
        opColumn(_set8),
        const SizedBox(width: tabletSetGap),
        opColumn(_set9),
        const SizedBox(width: tabletSetGap),
        opColumn(_set10Column),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Button building blocks
// ---------------------------------------------------------------------------

class _PressableShell extends StatefulWidget {
  final VoidCallback onTap;
  final Widget Function(BuildContext, bool pressed) builder;
  final bool selected;
  final bool disabled;

  const _PressableShell({
    required this.onTap,
    required this.builder,
    this.selected = false,
    this.disabled = false,
  });

  @override
  State<_PressableShell> createState() => _PressableShellState();
}

class _PressableShellState extends State<_PressableShell> {
  bool _pressed = false;

  void _setPressed(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  void _handleTap() {
    if (widget.disabled) return;
    HapticFeedback.selectionClick();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.disabled ? null : (_) => _setPressed(true),
      onTapUp: widget.disabled ? null : (_) => _setPressed(false),
      onTapCancel: widget.disabled ? null : () => _setPressed(false),
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.selected
                ? _kOpNormal
                : (widget.disabled ? const Color(0xFF303030) : _kBorder),
            width: widget.selected ? 2 : 1,
          ),
        ),
        child: widget.builder(context, _pressed),
      ),
    );
  }
}

class _DigitButton extends StatelessWidget {
  final DozenalDigit digit;
  final VoidCallback onTap;
  final bool disabled;

  const _DigitButton({
    required this.digit,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: 'Ziffer ${digit.value}',
        excludeSemantics: true,
        enabled: !disabled,
        child: _PressableShell(
          onTap: onTap,
          disabled: disabled,
          builder: (ctx, pressed) => CustomPaint(
            size: Size.infinite,
            painter: _DigitPainter(
              digit: digit,
              color: disabled
                  ? _kDigitDisabled
                  : (pressed ? _kDigitPressed : _kDigitNormal),
            ),
          ),
        ),
      ),
    );
  }
}

class _DigitPainter extends CustomPainter {
  final DozenalDigit digit;
  final Color color;

  _DigitPainter({required this.digit, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final minEdge = math.min(size.width, size.height);
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
  bool shouldRepaint(covariant _DigitPainter old) =>
      old.digit != digit || old.color != color;
}

class _TokenButton extends StatelessWidget {
  final CalcToken token;
  final VoidCallback onTap;
  final bool armed;
  final bool selected;

  const _TokenButton({
    required this.token,
    required this.onTap,
    this.armed = false,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: _tokenSemanticLabel(token),
        excludeSemantics: true,
        child: _PressableShell(
          onTap: onTap,
          selected: selected,
          builder: (ctx, pressed) {
            final isAc = token is Ac;
            final normalColor = isAc ? _kAc : _kOpNormal;
            final pressedColor = isAc ? _kAcPressed : _kOpPressed;
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _TokenPainter(
                      token: token,
                      color: pressed ? pressedColor : normalColor,
                    ),
                  ),
                ),
                if (armed)
                  const Positioned(
                    right: 4,
                    top: 4,
                    child: _ArmedDot(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

String _tokenSemanticLabel(CalcToken t) {
  if (t is Add) return 'plus';
  if (t is Sub) return 'minus';
  if (t is Mul) return 'mal';
  if (t is Div) return 'geteilt durch';
  if (t is ExpTopRight) return 'hoch';
  if (t is RootTopLeft) return 'Wurzel';
  if (t is OplusBotLeft) return 'Paralleladdition';
  if (t is LogBotRight) return 'Logarithmus';
  if (t is Sin) return 'Sinus';
  if (t is Cos) return 'Kosinus';
  if (t is Tan) return 'Tangens';
  if (t is Cot) return 'Kotangens';
  if (t is ArcSin) return 'Arkussinus';
  if (t is ArcCos) return 'Arkuskosinus';
  if (t is ArcTan) return 'Arkustangens';
  if (t is ArcCot) return 'Arkuskotangens';
  if (t is Sinh) return 'Sinus hyperbolicus';
  if (t is Cosh) return 'Kosinus hyperbolicus';
  if (t is Tanh) return 'Tangens hyperbolicus';
  if (t is Coth) return 'Kotangens hyperbolicus';
  if (t is ArSinh) return 'Areasinus hyperbolicus';
  if (t is ArCosh) return 'Areakosinus hyperbolicus';
  if (t is ArTanh) return 'Areatangens hyperbolicus';
  if (t is ArCoth) return 'Areakotangens hyperbolicus';
  if (t is ParenOpen) return 'Klammer auf';
  if (t is ParenClose) return 'Klammer zu';
  if (t is TriangleLeft) return 'Cursor nach links';
  if (t is TriangleRight) return 'Cursor nach rechts';
  if (t is Ac) return 'Alles löschen';
  if (t is Del) return 'Zeichen löschen';
  if (t is Decimal) return 'Komma';
  if (t is Equals) return 'Gleich';
  if (t is Expand) return 'Erweiterungsfeld öffnen';
  if (t is Close) return 'Erweiterungsfeld schließen';
  if (t is Sto) return 'In Speicher';
  if (t is Rcl) return 'Aus Speicher';
  if (t is Mc) return 'Speicher löschen';
  if (t is Ans) return 'Letztes Ergebnis';
  if (t is ConstPi) return 'Pi';
  if (t is ConstE) return 'Eulersche Zahl';
  if (t is ConstPhi) return 'Goldener Schnitt';
  if (t is ConstSqrt2) return 'Wurzel zwei';
  if (t is Factorial) return 'Fakultät';
  if (t is AbsVal) return 'Betrag';
  if (t is Reciprocal) return 'Kehrwert';
  if (t is Mod) return 'Modulo';
  if (t is Doz) return 'Dozenal-Modus';
  if (t is Dez) return 'Dezimal-Modus';
  if (t is Drg) return 'Winkelmodus wechseln';
  if (t is Info) return 'Info';
  return '';
}

class _TokenPainter extends CustomPainter {
  final CalcToken token;
  final Color color;

  _TokenPainter({required this.token, required this.color});

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
  bool shouldRepaint(covariant _TokenPainter old) =>
      old.token != token || old.color != color;
}

class _ArmedDot extends StatelessWidget {
  const _ArmedDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD700), // GOLD
        shape: BoxShape.circle,
      ),
    );
  }
}

class _EqualsBar extends StatelessWidget {
  final VoidCallback onTap;
  final Color normalColor;

  const _EqualsBar({required this.onTap, required this.normalColor});

  @override
  Widget build(BuildContext context) {
    return _PressableShell(
      onTap: onTap,
      builder: (ctx, pressed) => CustomPaint(
        painter: _TokenPainter(
          token: const Equals(),
          color: pressed ? _kOpPressed : normalColor,
        ),
      ),
    );
  }
}

/// Equals row: the wide Equals bar flanked by two round side buttons —
/// (i) on the left opens the theory chapters, (?) on the right opens the
/// intro. Side buttons are hidden (placeholder) when their callback is null.
/// Sizes itself to the parent's height; no internal SizedBox.
class _EqualsRow extends StatelessWidget {
  final double sideGap;
  final VoidCallback onEquals;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _EqualsRow({
    required this.sideGap,
    required this.onEquals,
    this.onInfoTap,
    this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, c) {
        final h = c.maxHeight.isFinite ? c.maxHeight : minTouchTarget * 1.2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RoundIconButton(
              size: h,
              icon: Icons.info_outline,
              tooltip: 'Theoriekapitel',
              onPressed: onInfoTap,
            ),
            SizedBox(width: sideGap),
            Expanded(
              child: _EqualsBar(onTap: onEquals, normalColor: _kEquals),
            ),
            SizedBox(width: sideGap),
            _RoundIconButton(
              size: h,
              icon: Icons.help_outline,
              tooltip: 'Intro',
              onPressed: onHelpTap,
            ),
          ],
        );
      },
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _RoundIconButton({
    required this.size,
    required this.icon,
    this.tooltip,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final btn = Material(
      color: const Color(0xFF2A2A2A),
      shape: const CircleBorder(
        side: BorderSide(color: Color(0xFF555555)),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Center(
          child: Icon(
            icon,
            size: size * 0.5,
            color: const Color(0xFF64C8FF),
          ),
        ),
      ),
    );
    return SizedBox(
      width: size,
      height: size,
      child: tooltip != null ? Tooltip(message: tooltip!, child: btn) : btn,
    );
  }
}
