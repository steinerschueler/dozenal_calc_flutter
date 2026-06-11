// Orientation-driven keypad layout.
//
// Top-level Keypad dispatches to:
//   - _HochKeypad   (portrait, vertical stack + AnimatedSwitcher panel-swap
//                    between Sets 1-4 and Sets 6-10)
//   - _BreitKeypad  (landscape and tablet, inline layout with all ten sets
//                    side-by-side; the third group pages between Sets 6-10
//                    and the function keys via an edge arrow)
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
import 'haptics.dart';
import 'l10n/app_localizations.dart';
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

  /// Which extended-sets page is showing: 0 = Sets 6–10, 1 = function keys.
  /// In Hoch mode this selects the overlay page (visible while the overlay
  /// is open); in Breit mode it selects the third group's page (always
  /// visible). [onOverlayPageChanged] is fired by the edge arrows (both
  /// modes) and the horizontal swipe (Hoch only — in Breit a swipe must
  /// stay free for the horizontal scroll fallback on narrow devices).
  final int overlayPage;
  final ValueChanged<int>? onOverlayPageChanged;

  const Keypad({
    super.key,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    this.overlayOpen = false,
    this.overlayPage = 0,
    this.onOverlayPageChanged,
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
            overlayPage: overlayPage,
            onOverlayPageChanged: onOverlayPageChanged,
          );
        }
        return _BreitKeypad(
          onTap: onTap,
          isArmed: isArmed,
          isSelected: isSelected,
          isDisabled: isDisabled,
          onInfoTap: onInfoTap,
          onHelpTap: onHelpTap,
          page: overlayPage,
          onPageChanged: onOverlayPageChanged,
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

/// Function-key page (overlay page 1, #2–#4): memory accumulator, powers,
/// sign, logs, combinatorics, scientific notation. Nullable cells pad the
/// last (short) row so the columns stay aligned with the 4-wide grid.
const List<List<CalcToken?>> _hochFuncRows = [
  [MemPlus(), MemMinus(), Square(), PlusMinus()],
  [Ln(), ExpE(), Log12(), Sci()],
  [NCr(), NPr(), null, null],
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
const List<CalcToken> _set7 = [ConstPi(), ConstE(), ConstPhi(), ConstSqrt2()];
const List<CalcToken> _set8 = [Sinh(), Cosh(), Tanh(), Coth()];
const List<CalcToken> _set9 = [Factorial(), AbsVal(), Reciprocal(), Mod()];
const List<CalcToken> _set10Column = [Doz(), Dez(), Drg()]; // Close dropped

/// Function-key columns for the Breit third-group page 1 — the transpose of
/// _hochFuncRows, following the same row↔column convention as Sets 1-4 vs
/// _hochOpRows. Short columns are padded to four rows via padToFour.
const List<CalcToken> _funcCol1 = [MemPlus(), Ln(), NCr()];
const List<CalcToken> _funcCol2 = [MemMinus(), ExpE(), NPr()];
const List<CalcToken> _funcCol3 = [Square(), Log12()];
const List<CalcToken> _funcCol4 = [PlusMinus(), Sci()];

/// Edge-arrow geometry shared by the Hoch overlay pages and the Breit
/// third-group pages. The Breit width math accounts for
/// `_kPageArrowWidth + _kPageArrowMargin` so both pages render at the same
/// total row width.
const double _kPageArrowWidth = 22.0;
const double _kPageArrowMargin = 6.0;

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
  final int overlayPage;
  final ValueChanged<int>? onOverlayPageChanged;

  const _HochKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    required this.overlayOpen,
    required this.overlayPage,
    required this.onOverlayPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final h = constraints.maxHeight;
        if (h.isFinite && h < _kScrollThreshold) {
          return SingleChildScrollView(
            child: _buildColumn(tight: true, fixedHeights: true),
          );
        }
        final tight = h.isFinite && h < _kTightThreshold;
        return _buildColumn(tight: tight, fixedHeights: false);
      },
    );
  }

  /// Builds the keypad column. In flex mode the rows are Expanded(flex: N)
  /// so they share the available height proportionally. In fixed-heights
  /// mode every row gets `minTouchTarget`-tall sized boxes — used inside
  /// the scroll fallback where Expanded would be unbounded.
  Widget _buildColumn({required bool tight, required bool fixedHeights}) {
    final rowGap = tight ? 6.0 : 10.0;
    final sectionGap = tight ? 8.0 : 14.0;
    final equalsGap = tight ? 8.0 : 12.0;

    Widget row(Widget child, {int flex = 8}) => fixedHeights
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
          overlayPage: overlayPage,
          onOverlayPageChanged: onOverlayPageChanged,
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
            overlayPage: overlayPage,
            onOverlayPageChanged: onOverlayPageChanged,
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
  final int overlayPage;
  final ValueChanged<int>? onOverlayPageChanged;
  final bool tight;
  final bool fixedHeights;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;

  const _MiddleSection({
    required this.overlayOpen,
    required this.overlayPage,
    required this.onOverlayPageChanged,
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
      page: overlayPage,
      onPageChanged: onOverlayPageChanged,
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
  final int page;
  final ValueChanged<int>? onPageChanged;
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;

  const _OverlayPanel({
    super.key,
    required this.tight,
    required this.fixedHeights,
    required this.page,
    required this.onPageChanged,
    required this.onTap,
    this.isArmed,
    this.isSelected,
  });

  void _go(int p) => onPageChanged?.call(p);

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isFunc = page == 1;
    final panel = _RowsPanel(
      opRows: isFunc ? _hochFuncRows : _hochOverlayRows,
      bottomRow: _set10Row,
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
    );
    // Two overlay pages: OLL (page 0, Sets 6–10) shows a right-edge arrow to
    // OLR (page 1, function keys), which shows a left-edge arrow back. The
    // arrows make the second page discoverable; a horizontal swipe also flips.
    final gridRow = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFunc)
          _PageArrow(
            pointLeft: true,
            onTap: () => _go(0),
            label: l.a11yPageSets,
          ),
        Expanded(child: panel),
        if (!isFunc)
          _PageArrow(
            pointLeft: false,
            onTap: () => _go(1),
            label: l.a11yPageFunc,
          ),
      ],
    );
    final swipeable = GestureDetector(
      onHorizontalDragEnd: (d) {
        final v = d.primaryVelocity ?? 0;
        if (v < -80) {
          _go(1); // swipe left → function page
        } else if (v > 80) {
          _go(0); // swipe right → first page
        }
      },
      child: gridRow,
    );
    // Open-state affordance: a dezent "Erweiterungsfeld" header above the
    // extended sets. Only shown here — the closed main panel is untouched, so
    // the Store screenshot is identical.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      children: [
        _OverlayHeader(title: l.keypadOverlayTitle, tight: tight),
        if (fixedHeights) swipeable else Expanded(child: swipeable),
      ],
    );
  }
}

/// Tall, slim, tappable edge arrow that flips between the two extended-sets
/// pages and signals that a second page exists next to the current one.
/// Used by the Hoch overlay (OLL/OLR) and the Breit third group.
class _PageArrow extends StatelessWidget {
  final bool pointLeft;
  final VoidCallback onTap;
  final String label;
  const _PageArrow({
    required this.pointLeft,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: _kPageArrowWidth,
          margin: EdgeInsets.only(
            left: pointLeft ? 0 : _kPageArrowMargin,
            right: pointLeft ? _kPageArrowMargin : 0,
          ),
          decoration: BoxDecoration(
            color: const Color(0x14FFFFFF),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFF333333)),
          ),
          child: Icon(
            pointLeft ? Icons.chevron_left : Icons.chevron_right,
            size: 20,
            color: const Color(0xFFB0B0B0),
          ),
        ),
      ),
    );
  }
}

/// Shared 5-row layout used by both _MainOpsPanel and _OverlayPanel so the
/// Slim, dezent header shown at the top of the open overlay panel (Hoch mode)
/// to label the extended sets. Rendered only while the overlay is open, so the
/// closed keypad — the Play-Store screenshot — is unaffected.
class _OverlayHeader extends StatelessWidget {
  final String title;
  final bool tight;
  const _OverlayHeader({required this.title, required this.tight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: tight ? 4 : 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.more_horiz, size: 13, color: Color(0xFF6E6E6E)),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8C8C8C),
            ),
          ),
        ],
      ),
    );
  }
}

/// AnimatedSwitcher children have identical structure.
class _RowsPanel extends StatelessWidget {
  // Nullable cells: a null slot renders as an empty gap (used to pad the
  // function-key page where the last row isn't full).
  final List<List<CalcToken?>> opRows;
  final List<CalcToken?> bottomRow;
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

  Widget _tokenRow(List<CalcToken?> tokens) {
    final cells = <Widget>[];
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: 8));
      final tok = tokens[i];
      cells.add(
        Expanded(
          child: tok == null
              ? const SizedBox.shrink()
              : _TokenButton(
                  token: tok,
                  onTap: () => onTap(tok),
                  armed: isArmed?.call(tok) ?? false,
                  selected: isSelected?.call(tok) ?? false,
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

  /// Third-group page: 0 = Sets 6-10, 1 = function keys. Flipped by the
  /// tall edge arrow (no swipe in Breit — horizontal drags must stay free
  /// for the scroll fallback on narrow devices).
  final int page;
  final ValueChanged<int>? onPageChanged;

  const _BreitKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    required this.page,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // The Breit layout has two tightening constraints:
        //   vertical:   4·b + 3·tabletDigitGap + setGap + b ≤ h
        //   horizontal: 3·b + 2·tabletDigitGap + 10·b + 10·setGap ≤ w
        //
        // We pick buttonSize from the tighter axis so neither dimension is
        // cut off. When the height is the tighter axis (typical phone-
        // landscape), horizontal slack remains; we absorb it by growing the
        // inter-set gap up to a cap so the row fills the viewport instead
        // of leaving a band of whitespace on the right. Any slack beyond
        // the cap (very wide tablets) lands as symmetric outer margins
        // via the SizedBox + MainAxisAlignment.center pair below.
        // Single inner-block gap used everywhere inside a block (digit grid
        // h+v, op-column v, between-set h). Keeping these identical means
        // each block "breathes" consistently in both axes — the user-visible
        // contract is that within-block spacing reads as one rhythm.
        const interBlockGap = tabletColGap; // 8 dp
        const verticalContentGap = 18.0; // gap between top content and equals
        // Group gap (between digit pad / Sets 1-5 / Sets 6-10) starts at a
        // comfortable visual baseline and absorbs horizontal slack so the
        // viewport fills. Capped so wide tablets don't end up with groups
        // drifting hundreds of dp apart — the remainder lands as symmetric
        // outer margins via the SizedBox + MainAxisAlignment.center pair.
        const groupGapBase = interBlockGap + 10.0; // 18 dp
        const maxGroupGap = 100.0;
        // Width consumed by the third-group page arrow: arrow + its margin
        // + the extra inter-block gap next to it. Both pages carry exactly
        // one arrow (right edge on page 0, left edge on page 1), so the row
        // width is page-independent and the fit math holds for both.
        const pageArrowExtent =
            _kPageArrowWidth + _kPageArrowMargin + interBlockGap;

        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        final rawH = h.isFinite
            ? (h - 3 * interBlockGap - verticalContentGap) / 5
            : tabletButtonSize;
        final rawW = w.isFinite
            ? (w - 10 * interBlockGap - 2 * groupGapBase - pageArrowExtent) / 13
            : tabletButtonSize;
        final raw = math.min(rawH, rawW);
        final buttonSize = raw.clamp(breitMinTouchTarget, tabletButtonSize);

        final baseNaturalWidth =
            13 * buttonSize +
            10 * interBlockGap +
            2 * groupGapBase +
            pageArrowExtent;
        final hSlack = w.isFinite ? math.max(0.0, w - baseNaturalWidth) : 0.0;
        final groupGap = (groupGapBase + hSlack / 2).clamp(
          groupGapBase,
          maxGroupGap,
        );
        final contentWidth =
            13 * buttonSize +
            10 * interBlockGap +
            2 * groupGap +
            pageArrowExtent;

        final content = _buildBreitContent(
          buttonSize: buttonSize,
          interBlockGap: interBlockGap,
          groupGap: groupGap,
          l: AppLocalizations.of(ctx),
        );

        final body = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Outer SizedBox: when content fits, we force row width = viewport
            // width so MainAxisAlignment.center yields symmetric margins.
            // When content overflows (very narrow devices clamped to 44 dp),
            // the row stays at its natural width and the scroll-view scrolls.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: w.isFinite ? math.max(w, contentWidth) : contentWidth,
                child: content,
              ),
            ),
            const SizedBox(height: verticalContentGap),
            SizedBox(
              height: buttonSize,
              child: _EqualsRow(
                sideGap: verticalContentGap,
                onEquals: () => onTap(const Equals()),
                onInfoTap: onInfoTap,
                onHelpTap: onHelpTap,
              ),
            ),
          ],
        );

        // Vertical safety net: if buttonSize clamped at the 44 dp floor but
        // the available height still can't fit all rows (split-screen
        // landscape, foldable cover display), allow vertical scroll so no
        // row is unreachable. Otherwise center for abundant height (tablet).
        final naturalHeight =
            4 * buttonSize +
            3 * interBlockGap +
            verticalContentGap +
            buttonSize;
        if (h.isFinite && h < naturalHeight) {
          return SingleChildScrollView(child: body);
        }
        return Center(child: body);
      },
    );
  }

  Widget _buildBreitContent({
    required double buttonSize,
    required double interBlockGap,
    required double groupGap,
    required AppLocalizations l,
  }) {
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

    Widget opColumn(List<CalcToken> tokens, {bool padToFour = false}) {
      final padCount = padToFour ? math.max(0, 4 - tokens.length) : 0;
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
          // Empty trailing slots so columns shorter than 4 rows stay top-
          // aligned with the digit grid (otherwise CrossAxisAlignment.center
          // in the parent Row would float them downward).
          for (var j = 0; j < padCount; j++) ...[
            const SizedBox(height: tabletColGap),
            SizedBox(width: buttonSize, height: buttonSize),
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

    Widget gap() => SizedBox(width: interBlockGap);
    // Mirror of the horizontal divider in _HochKeypad (between digit grid
    // and the operator panels): a 1 dp line in the same colour, centred in
    // each inter-group gap. Height matches the digit grid so the line spans
    // the full top section but doesn't bleed into the equals row below.
    final dividerHeight = 4 * buttonSize + 3 * interBlockGap;
    Widget bigGap() => SizedBox(
      width: groupGap,
      child: Center(
        child: Container(
          width: 1,
          height: dividerHeight,
          color: const Color(0xFF333333),
        ),
      ),
    );
    // Tall edge arrow flipping the third group between its two pages.
    // Sized to the four-row block height so it reads as a page edge, not
    // a button.
    Widget pageArrow({
      required bool pointLeft,
      required int target,
      required String label,
    }) => SizedBox(
      height: dividerHeight,
      child: _PageArrow(
        pointLeft: pointLeft,
        onTap: () => onPageChanged?.call(target),
        label: label,
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        digitGrid(),
        bigGap(), // group break: digit pad → Sets 1-5
        opColumn(_set1),
        gap(),
        opColumn(_set2),
        gap(),
        opColumn(_set3),
        gap(),
        opColumn(_set4),
        gap(),
        systemColumn(),
        bigGap(), // group break: Sets 1-5 → third group (paged)
        // Third group, page 0: Sets 6-10 + right-edge arrow to the function
        // keys. Page 1: function-key columns (transpose of _hochFuncRows)
        // + left-edge arrow back. A trailing empty column keeps page 1 at
        // the same total width as page 0 (5 columns + 5 gaps + arrow).
        if (page == 0) ...[
          opColumn(_set6),
          gap(),
          opColumn(_set7),
          gap(),
          opColumn(_set8),
          gap(),
          opColumn(_set9),
          gap(),
          opColumn(_set10Column, padToFour: true),
          gap(),
          pageArrow(pointLeft: false, target: 1, label: l.a11yPageFunc),
        ] else ...[
          pageArrow(pointLeft: true, target: 0, label: l.a11yPageSets),
          gap(),
          opColumn(_funcCol1, padToFour: true),
          gap(),
          opColumn(_funcCol2, padToFour: true),
          gap(),
          opColumn(_funcCol3, padToFour: true),
          gap(),
          opColumn(_funcCol4, padToFour: true),
          gap(),
          SizedBox(width: buttonSize),
        ],
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
    if (HapticsScope.enabledOf(context)) HapticFeedback.selectionClick();
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
    final l = AppLocalizations.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: l.a11yDigit(digit.value),
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
    final l = AppLocalizations.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: _tokenSemanticLabel(token, l),
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
                  const Positioned(right: 4, top: 4, child: _ArmedDot()),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Localized accessibility (screen-reader) label for a keypad token.
/// Exhaustive over the sealed CalcToken (no default) so a new keypad token
/// can't ship without a spoken label. Strings come from the ARB so the label
/// follows the active app language instead of being hard-coded German.
String _tokenSemanticLabel(CalcToken t, AppLocalizations l) => switch (t) {
  Add() => l.a11yPlus,
  Sub() => l.a11yMinus,
  Mul() => l.a11yTimes,
  Div() => l.a11yDividedBy,
  ExpTopRight() => l.a11yPower,
  RootTopLeft() => l.a11yRoot,
  OplusBotLeft() => l.a11yParallelAdd,
  LogBotRight() => l.a11yLogarithm,
  Sin() => l.a11ySine,
  Cos() => l.a11yCosine,
  Tan() => l.a11yTangent,
  Cot() => l.a11yCotangent,
  ArcSin() => l.a11yArcsine,
  ArcCos() => l.a11yArccosine,
  ArcTan() => l.a11yArctangent,
  ArcCot() => l.a11yArccotangent,
  Sinh() => l.a11ySinh,
  Cosh() => l.a11yCosh,
  Tanh() => l.a11yTanh,
  Coth() => l.a11yCoth,
  ArSinh() => l.a11yArsinh,
  ArCosh() => l.a11yArcosh,
  ArTanh() => l.a11yArtanh,
  ArCoth() => l.a11yArcoth,
  ParenOpen() => l.a11yParenOpen,
  ParenClose() => l.a11yParenClose,
  TriangleLeft() => l.a11yCursorLeft,
  TriangleRight() => l.a11yCursorRight,
  Ac() => l.a11yAllClear,
  Del() => l.a11yDelete,
  Decimal() => l.a11yDecimalPoint,
  Equals() => l.a11yEquals,
  Expand() => l.a11yExpandPanel,
  Close() => l.a11yClosePanel,
  Sto() => l.a11yMemoryStore,
  Rcl() => l.a11yMemoryRecall,
  Mc() => l.a11yMemoryClear,
  Ans() => l.a11yLastAnswer,
  ConstPi() => l.a11yPi,
  ConstE() => l.a11yEuler,
  ConstPhi() => l.a11yGoldenRatio,
  ConstSqrt2() => l.a11ySqrt2,
  Factorial() => l.a11yFactorial,
  AbsVal() => l.a11yAbsolute,
  Reciprocal() => l.a11yReciprocal,
  Mod() => l.a11yModulo,
  Doz() => l.a11yDozenalMode,
  Dez() => l.a11yDecimalMode,
  Drg() => l.a11yAngleMode,
  Info() => l.a11yInfo,
  MemPlus() => l.a11yMemPlus,
  MemMinus() => l.a11yMemMinus,
  Square() => l.a11ySquare,
  PlusMinus() => l.a11yPlusMinus,
  Ln() => l.a11yLn,
  ExpE() => l.a11yExp,
  Log12() => l.a11yLog12,
  NCr() => l.a11yNcr,
  NPr() => l.a11yNpr,
  Sci() => l.a11ySci,
  // Never rendered as a keypad button (digits use _DigitButton; Negate and
  // RatLit only ever live in buffers).
  Digit() || Negate() || RatLit() => '',
};

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
    final l = AppLocalizations.of(context);
    return LayoutBuilder(
      builder: (ctx, c) {
        final h = c.maxHeight.isFinite ? c.maxHeight : minTouchTarget * 1.2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RoundIconButton(
              size: h,
              icon: Icons.info_outline,
              tooltip: l.a11yTheoryChapters,
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
              tooltip: l.a11yIntro,
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
      shape: const CircleBorder(side: BorderSide(color: Color(0xFF555555))),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Center(
          child: Icon(icon, size: size * 0.5, color: const Color(0xFF64C8FF)),
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
