// Orientation-driven keypad layout.
//
// Top-level Keypad dispatches to:
//   - _HochKeypad   (portrait, vertical stack + AnimatedSwitcher panel-swap
//                    between Sets 1-4 and Sets 6-10)
//   - _BreitKeypad  (landscape and tablet, inline layout with all ten sets
//                    side-by-side; the third group pages between Sets 6-10
//                    and the function keys via an edge arrow)
//
// Both layouts additionally honour the two settings-page preferences
// (lib/calc_prefs.dart):
//   - KeypadProfile.simple — digits + Sets 1-4 + AC/DEL/. only. No Expand,
//     no extended sets; Doz/Dez/DRG live in the settings page instead.
//   - KeypadMode.scroll    — extended sets reached by scrolling instead of
//     overlay pages: Hoch stacks every set in one vertical scroll column
//     (equals row stays pinned), Breit lays all columns inline and lets the
//     existing horizontal scroll absorb the overflow.
//
// Both modes derive button sizes from LayoutBuilder constraints. Each button
// is wrapped in a 44 dp minimum-touch-target floor. When the Hoch mode falls
// below the minimum viable layout, a SingleChildScrollView is used as a
// safety net so no row is unreachable.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_layout.dart';
import 'app_theme.dart';
import 'calc_prefs.dart' show KeypadMode, KeypadProfile;
import 'glyph_painter.dart';
import 'haptics.dart';
import 'keypad_parts.dart';
import 'l10n/app_localizations.dart';
import 'logic/glyph_style.dart';
import 'tokens.dart';

// Button colors (formerly file-level egui consts) live in AppColors
// (lib/app_theme.dart): digit/digitPressed/digitDisabled, op/opPressed,
// equals, keyBorder/keyBorderDisabled, ac/acPressed. Widgets read them via
// AppColors.of(context) — dark fallback without a ThemeScope keeps tests
// and golden tools on the historical palette.

typedef TokenTapHandler = void Function(CalcToken token);
typedef ArmedPredicate = bool Function(CalcToken token);
typedef SelectedPredicate = bool Function(CalcToken token);
typedef DisabledPredicate = bool Function(CalcToken token);

// Hoch-mode thresholds, the digit grid, the shared set columns, the key
// shell and the key painters live in keypad_parts.dart — one source of
// truth for both keypads.

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

  /// Settings-page preferences (see calc_prefs.dart). Defaults reproduce the
  /// pre-settings behaviour, so callers and tests that don't care are
  /// unaffected.
  final KeypadMode keypadMode;
  final KeypadProfile keypadProfile;

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
    this.keypadMode = KeypadMode.overlay,
    this.keypadProfile = KeypadProfile.full,
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
            mode: keypadMode,
            profile: keypadProfile,
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
          mode: keypadMode,
          profile: keypadProfile,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Token catalogue
// ---------------------------------------------------------------------------

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

/// Master switch for the function-key page (Hoch overlay page 1 / Breit
/// third-group page 1). Deactivated — its tokens moved into the long-press
/// popups (M+/M− under STO, x² under x^□, ln/log₁₂/eˣ under log_□, ± under −,
/// nCr/nPr under n!) and EXP into the Set-10 row. The page code is kept
/// intact behind this flag for a possible revival.
const bool _kFuncPageEnabled = false;

/// Function-key page (overlay page 1, #2–#4): memory accumulator, powers,
/// sign, logs, combinatorics, scientific notation. Nullable cells pad the
/// last (short) row so the columns stay aligned with the 4-wide grid.
const List<List<CalcToken?>> _hochFuncRows = [
  [MemPlus(), MemMinus(), Square(), PlusMinus()],
  [Ln(), ExpE(), Log12(), Sci()],
  [NCr(), NPr(), null, null],
];

/// Long-press popup options per host key — the smartphone-keyboard accent
/// pattern that replaced the function page. Each host key offers its
/// mathematically related secondary functions: x^□ the x² shortcut, log_□
/// its special cases ln/log₁₂ and the inverse eˣ, − the sign toggle, STO the
/// memory accumulators, n! the combinatorics built on factorials. Empty for
/// keys without a popup. Public for the widget tests.
List<CalcToken> longPressOptionsFor(CalcToken token) => switch (token) {
  ExpTopRight() => const [Square()],
  LogBotRight() => const [Ln(), Log12(), ExpE()],
  Sub() => const [PlusMinus()],
  Sto() => const [MemPlus(), MemMinus()],
  Factorial() => const [NCr(), NPr()],
  _ => const [],
};

const List<CalcToken> _systemRow = [Ac(), Del(), Decimal(), Expand()];

/// System row without the Expand toggle — used by the simple profile (no
/// extended sets to expand to) and the Hoch scroll mode (the sets are
/// reached by scrolling, not by a panel swap). The null slot keeps the
/// 4-wide grid alignment.
const List<CalcToken?> _systemRowNoExpand = [Ac(), Del(), Decimal(), null];

/// Set 10 lives in the overlay-mode-row position. Close mirrors the Expand
/// slot from the system-row so the toggle target stays put across the swap.
/// Doz/Dez moved to the settings page (written-out, value-preserving base
/// switch); EXP (Sci) took the freed slot when the function page was folded
/// into the long-press popups. CONV (the unit-converter bridge) fills the
/// remaining slot: it inserts the converter's current result as digits.
const List<CalcToken?> _set10Row = [Sci(), Drg(), ConvAns(), Close()];

/// Set 10 for the Hoch scroll mode: Close dropped (there is no overlay to
/// close when everything is one scrolling column).
const List<CalcToken?> _set10RowNoClose = [Sci(), Drg(), ConvAns(), null];

/// Extended rows for the Hoch scroll mode: Sets 6-9, followed by the
/// function-key rows while the function page is active.
const List<List<CalcToken?>> _hochScrollExtendedRows = [
  ..._hochOverlayRows,
  if (_kFuncPageEnabled) ..._hochFuncRows,
];

// Breit-mode column data (one set per column); Sets 1/2/6/7 are the shared
// kSet* columns from keypad_parts.dart.
const List<CalcToken> _set3 = [Sin(), Cos(), Tan(), Cot()];
const List<CalcToken> _set4 = [
  ParenOpen(),
  ParenClose(),
  TriangleLeft(),
  TriangleRight(),
];
const List<CalcToken> _set8 = [Sinh(), Cosh(), Tanh(), Coth()];
const List<CalcToken> _set9 = [Factorial(), AbsVal(), Reciprocal(), Mod()];
// Close dropped; Doz/Dez live in the settings page, EXP (Sci) moved in,
// CONV (unit-converter bridge) appended like in the Hoch Set-10 row.
const List<CalcToken> _set10Column = [Sci(), Drg(), ConvAns()];

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
  final KeypadMode mode;
  final KeypadProfile profile;

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
    required this.mode,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    // Scroll mode (full profile only — the simple profile has nothing to
    // scroll to): one fixed-height column with every set, wrapped in a
    // scroll view, equals row pinned below. Replaces the overlay swap.
    if (mode == KeypadMode.scroll && profile == KeypadProfile.full) {
      return _buildScrollMode(context);
    }
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final h = constraints.maxHeight;
        if (h.isFinite && h < kKeypadScrollThreshold) {
          return SingleChildScrollView(
            child: _buildColumn(ctx, tight: true, fixedHeights: true),
          );
        }
        final tight = h.isFinite && h < kKeypadTightThreshold;
        return _buildColumn(ctx, tight: tight, fixedHeights: false);
      },
    );
  }

  /// Scroll-mode layout: digits, Sets 1-4 + AC/DEL/., then the extended
  /// sets (6-9, function keys, Doz/Dez/DRG) in one vertically scrolling
  /// column of fixed-height rows. The equals row stays pinned at the bottom
  /// so `=` never has to be scrolled to.
  Widget _buildScrollMode(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    const sectionGap = 10.0;

    final scrollContent = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var r = 0; r < kDigitGridRows.length; r++) ...[
          if (r > 0) const SizedBox(height: 8),
          SizedBox(height: minTouchTarget, child: _digitRow(kDigitGridRows[r])),
        ],
        const SizedBox(height: sectionGap),
        Divider(color: t.hairline, height: 1, thickness: 1),
        const SizedBox(height: sectionGap),
        _RowsPanel(
          opRows: _hochOpRows,
          bottomRow: _systemRowNoExpand,
          tight: false,
          fixedHeights: true,
          onTap: onTap,
          isArmed: isArmed,
          isSelected: isSelected,
          isDisabled: isDisabled,
        ),
        const SizedBox(height: sectionGap),
        Divider(color: t.hairline, height: 1, thickness: 1),
        const SizedBox(height: sectionGap),
        _OverlayHeader(title: l.keypadOverlayTitle, tight: false),
        _RowsPanel(
          opRows: _hochScrollExtendedRows,
          bottomRow: _set10RowNoClose,
          tight: false,
          fixedHeights: true,
          onTap: onTap,
          isArmed: isArmed,
          isSelected: isSelected,
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: SingleChildScrollView(child: scrollContent)),
        const SizedBox(height: 12),
        SizedBox(
          height: minTouchTarget * 1.2,
          child: _EqualsRow(
            onEquals: () => onTap(const Equals()),
            sideGap: 10,
            onInfoTap: onInfoTap,
            onHelpTap: onHelpTap,
          ),
        ),
      ],
    );
  }

  /// Builds the keypad column. In flex mode the rows are Expanded(flex: N)
  /// so they share the available height proportionally. In fixed-heights
  /// mode every row gets `minTouchTarget`-tall sized boxes — used inside
  /// the scroll fallback where Expanded would be unbounded.
  Widget _buildColumn(
    BuildContext context, {
    required bool tight,
    required bool fixedHeights,
  }) {
    final t = AppColors.of(context);
    final rowGap = tight ? 6.0 : 10.0;
    final sectionGap = tight ? 8.0 : 14.0;
    final equalsGap = tight ? 8.0 : 12.0;

    Widget row(Widget child, {int flex = 8}) => fixedHeights
        ? SizedBox(height: minTouchTarget, child: child)
        : Expanded(flex: flex, child: child);

    final children = <Widget>[
      for (var r = 0; r < kDigitGridRows.length; r++) ...[
        if (r > 0) SizedBox(height: rowGap),
        row(_digitRow(kDigitGridRows[r])),
      ],
      SizedBox(height: sectionGap),
      Divider(color: t.hairline, height: 1, thickness: 1),
      SizedBox(height: sectionGap),
      // Middle section: panel-swap between main ops and overlay sets.
      // Both panels have identical internal flex structure so the
      // AnimatedSwitcher crossfade lands cleanly. The simple profile skips
      // the switcher entirely — just Sets 1-4 plus AC/DEL/. (no Expand,
      // nothing to expand to).
      if (fixedHeights)
        _middleSection(tight: tight, fixedHeights: true)
      else
        Expanded(
          flex: 40, // 5 rows × 8 = 40
          child: _middleSection(tight: tight, fixedHeights: false),
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

  /// The middle five rows: simple profile renders Sets 1-4 + AC/DEL/.
  /// directly, the full profile keeps the overlay panel-swap.
  Widget _middleSection({required bool tight, required bool fixedHeights}) {
    if (profile == KeypadProfile.simple) {
      return _RowsPanel(
        opRows: _hochOpRows,
        bottomRow: _systemRowNoExpand,
        tight: tight,
        fixedHeights: fixedHeights,
        onTap: onTap,
        isArmed: isArmed,
        isSelected: isSelected,
        isDisabled: isDisabled,
      );
    }
    return _MiddleSection(
      overlayOpen: overlayOpen,
      overlayPage: overlayPage,
      onOverlayPageChanged: onOverlayPageChanged,
      tight: tight,
      fixedHeights: fixedHeights,
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
      isDisabled: isDisabled,
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
    final isFunc = _kFuncPageEnabled && page == 1;
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
    // arrows make the second page discoverable; a horizontal swipe also
    // flips. With the function page deactivated (_kFuncPageEnabled) there is
    // only OLL — no arrows, and swipes are ignored.
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
        if (_kFuncPageEnabled && !isFunc)
          _PageArrow(
            pointLeft: false,
            onTap: () => _go(1),
            label: l.a11yPageFunc,
          ),
      ],
    );
    final swipeable = !_kFuncPageEnabled
        ? gridRow
        : GestureDetector(
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
            color: AppColors.of(context).expandHintBg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.of(context).hairline),
          ),
          child: Icon(
            pointLeft ? Icons.chevron_left : Icons.chevron_right,
            size: 20,
            color: AppColors.of(context).textTertiary,
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
    final t = AppColors.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: tight ? 4 : 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.more_horiz, size: 13, color: t.dotsIcon),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: t.textFaint,
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
                  onTokenTap: onTap,
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
  /// for the scroll fallback on narrow devices). Only meaningful in the
  /// default overlay mode — scroll mode lays both pages inline, the simple
  /// profile has no third group at all.
  final int page;
  final ValueChanged<int>? onPageChanged;
  final KeypadMode mode;
  final KeypadProfile profile;

  const _BreitKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
    required this.page,
    required this.onPageChanged,
    required this.mode,
    required this.profile,
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

        // Column configuration per settings profile/mode:
        //   simple        — digits + Sets 1-4 + system column, one group gap,
        //                   no third group, no arrow.
        //   full+overlay  — the default 13-column layout with the paged
        //                   third group and one edge arrow.
        //   full+scroll   — every column inline (Sets 6-10 AND the function
        //                   keys), no arrow; width overflow is handled by the
        //                   existing horizontal scroll view, so buttonSize
        //                   derives from height alone.
        final simple = profile == KeypadProfile.simple;
        final scrollAll = !simple && mode == KeypadMode.scroll;
        // With the function page off, scroll mode loses its four function
        // columns (17→13) and overlay mode loses the page arrow.
        final cols = simple ? 8 : (scrollAll && _kFuncPageEnabled ? 17 : 13);
        final innerGaps = simple
            ? 6
            : (scrollAll && _kFuncPageEnabled ? 14 : 10);
        final nGroupGaps = simple ? 1 : 2;
        final arrowExtent = (!simple && !scrollAll && _kFuncPageEnabled)
            ? pageArrowExtent
            : 0.0;

        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        final rawH = h.isFinite
            ? (h - 3 * interBlockGap - verticalContentGap) / 5
            : tabletButtonSize;
        final rawW = w.isFinite
            ? (w -
                      innerGaps * interBlockGap -
                      nGroupGaps * groupGapBase -
                      arrowExtent) /
                  cols
            : tabletButtonSize;
        final raw = scrollAll ? rawH : math.min(rawH, rawW);
        final buttonSize = raw.clamp(breitMinTouchTarget, tabletButtonSize);

        final baseNaturalWidth =
            cols * buttonSize +
            innerGaps * interBlockGap +
            nGroupGaps * groupGapBase +
            arrowExtent;
        final hSlack = w.isFinite ? math.max(0.0, w - baseNaturalWidth) : 0.0;
        final groupGap = (groupGapBase + hSlack / nGroupGaps).clamp(
          groupGapBase,
          maxGroupGap,
        );
        final contentWidth =
            cols * buttonSize +
            innerGaps * interBlockGap +
            nGroupGaps * groupGap +
            arrowExtent;

        final content = _buildBreitContent(
          buttonSize: buttonSize,
          interBlockGap: interBlockGap,
          groupGap: groupGap,
          l: AppLocalizations.of(ctx),
          t: AppColors.of(ctx),
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
    required AppColors t,
  }) {
    Widget digitGrid() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var r = 0; r < kDigitGridRows.length; r++) ...[
            if (r > 0) const SizedBox(height: tabletDigitGap),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var col = 0; col < kDigitGridRows[r].length; col++) ...[
                  if (col > 0) const SizedBox(width: tabletDigitGap),
                  SizedBox(
                    width: buttonSize,
                    height: buttonSize,
                    child: _DigitButton(
                      digit: kDigitGridRows[r][col],
                      onTap: () => onTap(Digit(kDigitGridRows[r][col])),
                      disabled:
                          isDisabled?.call(Digit(kDigitGridRows[r][col])) ??
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
                onTokenTap: onTap,
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
        child: Container(width: 1, height: dividerHeight, color: t.hairline),
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
    final simple = profile == KeypadProfile.simple;
    final scrollAll = !simple && mode == KeypadMode.scroll;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        digitGrid(),
        bigGap(), // group break: digit pad → Sets 1-5
        opColumn(kSet1),
        gap(),
        opColumn(kSet2),
        gap(),
        opColumn(_set3),
        gap(),
        opColumn(_set4),
        gap(),
        systemColumn(),
        // Third group — by settings profile/mode:
        //   simple:      absent (digits + Sets 1-4 + system column only).
        //   full+scroll: Sets 6-10 AND function columns inline, no arrow;
        //                the horizontal scroll view absorbs the overflow.
        //   full+overlay (default): paged. Page 0: Sets 6-10 + right-edge
        //                arrow to the function keys. Page 1: function-key
        //                columns (transpose of _hochFuncRows) + left-edge
        //                arrow back. A trailing empty column keeps page 1
        //                at the same total width as page 0.
        // With the function page off (_kFuncPageEnabled) the func columns
        // and arrows vanish in every configuration — Sets 6-10 only.
        if (!simple) ...[
          bigGap(), // group break: Sets 1-5 → third group
          if (scrollAll) ...[
            opColumn(kSet6),
            gap(),
            opColumn(kSet7),
            gap(),
            opColumn(_set8),
            gap(),
            opColumn(_set9),
            gap(),
            opColumn(_set10Column, padToFour: true),
            if (_kFuncPageEnabled) ...[
              gap(),
              opColumn(_funcCol1, padToFour: true),
              gap(),
              opColumn(_funcCol2, padToFour: true),
              gap(),
              opColumn(_funcCol3, padToFour: true),
              gap(),
              opColumn(_funcCol4, padToFour: true),
            ],
          ] else if (!_kFuncPageEnabled || page == 0) ...[
            opColumn(kSet6),
            gap(),
            opColumn(kSet7),
            gap(),
            opColumn(_set8),
            gap(),
            opColumn(_set9),
            gap(),
            opColumn(_set10Column, padToFour: true),
            if (_kFuncPageEnabled) ...[
              gap(),
              pageArrow(pointLeft: false, target: 1, label: l.a11yPageFunc),
            ],
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
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Button building blocks
// ---------------------------------------------------------------------------

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
    // Subscribing read — flips between custom glyphs and conventional
    // 0-9/A-B when the settings-page "keypad digits" toggle changes.
    final style = GlyphStyleScope.keypadStyleOf(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: l.a11yDigit(digit.value),
        excludeSemantics: true,
        enabled: !disabled,
        child: PressableShell(
          onTap: onTap,
          disabled: disabled,
          builder: (ctx, pressed) {
            final t = AppColors.of(ctx);
            return CustomPaint(
              size: Size.infinite,
              painter: DigitKeyPainter(
                digit: digit,
                style: style,
                color: disabled
                    ? t.digitDisabled
                    : (pressed ? t.digitPressed : t.digit),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TokenButton extends StatefulWidget {
  final CalcToken token;
  final VoidCallback onTap;

  /// Dispatch channel for long-press popup selections. The popup only
  /// activates when this is set AND [longPressOptionsFor] yields options
  /// for [token]; plain keys (and call sites without the handler) keep
  /// the exact previous behavior.
  final TokenTapHandler? onTokenTap;
  final bool armed;
  final bool selected;

  const _TokenButton({
    required this.token,
    required this.onTap,
    this.onTokenTap,
    this.armed = false,
    this.selected = false,
  });

  @override
  State<_TokenButton> createState() => _TokenButtonState();
}

class _TokenButtonState extends State<_TokenButton> {
  // Long-press popup state. Geometry is captured in global coordinates at
  // open time so the slide gesture (owned by the key's own recognizer, not
  // the overlay) can hit-test option cells mathematically.
  OverlayEntry? _popup;
  final ValueNotifier<int?> _hover = ValueNotifier<int?>(null);
  List<CalcToken> _options = const [];
  Rect _cellsRect = Rect.zero;
  double _cellW = 0;

  static const double _cellGap = 4.0;
  static const double _popupPad = 4.0;
  static const double _popupBorder = 1.0;
  static const double _popupOffset = 6.0;

  /// Tolerance around the option row during the slide — smartphone-keyboard
  /// popups accept slightly sloppy fingers.
  static const double _hitSlop = 12.0;

  @override
  void dispose() {
    _removePopup();
    _hover.dispose();
    super.dispose();
  }

  void _removePopup() {
    _popup?.remove();
    _popup = null;
  }

  bool get _haptics => HapticsScope.enabledOf(context);

  void _onLongPressStart(LongPressStartDetails d) {
    if (_popup != null) return;
    _options = longPressOptionsFor(widget.token);
    if (_options.isEmpty) return;

    final box = context.findRenderObject()! as RenderBox;
    final origin = box.localToGlobal(Offset.zero);
    final keySize = box.size;
    final screen = MediaQuery.sizeOf(context);
    // Option cells mirror the host key's size (visual continuity, like
    // keyboard accent popups), floored at the touch-target minimum.
    final cellW = math.max(keySize.width, minTouchTarget);
    final cellH = math.max(keySize.height, minTouchTarget);
    final n = _options.length;
    // Frame = padding + the 1 dp card border (the border draws inside the
    // Container, so it must be part of the width math or the row overflows).
    const frame = _popupPad + _popupBorder;
    final cellsW = n * cellW + (n - 1) * _cellGap;
    final popupW = cellsW + 2 * frame;
    final popupH = cellH + 2 * frame;
    var left = origin.dx + keySize.width / 2 - popupW / 2;
    left = left.clamp(8.0, math.max(8.0, screen.width - popupW - 8.0));
    // Above the key; below it when the key sits too close to the top edge.
    var top = origin.dy - popupH - _popupOffset;
    if (top < MediaQuery.paddingOf(context).top + 8.0) {
      top = origin.dy + keySize.height + _popupOffset;
    }
    _cellW = cellW;
    _cellsRect = Rect.fromLTWH(left + frame, top + frame, cellsW, cellH);
    _hover.value = null;

    if (_haptics) HapticFeedback.lightImpact();
    final entry = OverlayEntry(
      builder: (ctx) {
        final t = AppColors.of(ctx);
        return Stack(
          children: [
            // Barrier: any pointer-down outside the option row closes the
            // popup. A Listener (not a GestureDetector) with translucent
            // hit-testing stays out of the gesture arena, so the same tap
            // continues to whatever lies beneath — tapping another key while
            // the popup is open types that key instead of being swallowed,
            // exactly like smartphone-keyboard accent popups.
            Positioned.fill(
              child: Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (_) => _removePopup(),
              ),
            ),
            Positioned(
              left: left,
              top: top,
              width: popupW,
              height: popupH,
              child: ValueListenableBuilder<int?>(
                valueListenable: _hover,
                builder: (_, hover, _) => Container(
                  padding: const EdgeInsets.all(_popupPad),
                  decoration: BoxDecoration(
                    color: t.cardFill,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: t.keyBorder),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      for (var i = 0; i < _options.length; i++) ...[
                        if (i > 0) const SizedBox(width: _cellGap),
                        SizedBox(
                          width: cellW,
                          height: cellH,
                          child: _PopupOption(
                            token: _options[i],
                            highlighted: hover == i,
                            onTap: () => _select(i),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(entry);
    _popup = entry;
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails d) {
    if (_popup == null) return;
    final next = _hitIndex(d.globalPosition);
    if (next != _hover.value) {
      if (next != null && _haptics) HapticFeedback.lightImpact();
      _hover.value = next;
    }
  }

  void _onLongPressEnd(LongPressEndDetails d) {
    if (_popup == null) return;
    final i = _hitIndex(d.globalPosition);
    if (i != null) {
      // Slide-and-release selection.
      _select(i);
    }
    // Released elsewhere: the popup stays open for the tap mode; the
    // barrier closes it when the tap lands outside the options.
  }

  int? _hitIndex(Offset p) {
    if (!_cellsRect.inflate(_hitSlop).contains(p)) return null;
    final dx = p.dx - _cellsRect.left;
    return (dx / (_cellW + _cellGap)).floor().clamp(0, _options.length - 1);
  }

  void _select(int i) {
    final tok = _options[i];
    _removePopup();
    if (_haptics) HapticFeedback.lightImpact();
    widget.onTokenTap?.call(tok);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final hasPopup = widget.onTokenTap != null &&
        longPressOptionsFor(widget.token).isNotEmpty;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minTouchTarget),
      child: Semantics(
        button: true,
        label: _tokenSemanticLabel(widget.token, l),
        hint: hasPopup ? l.a11yHoldMore : null,
        excludeSemantics: true,
        child: PressableShell(
          onTap: widget.onTap,
          selected: widget.selected,
          onLongPressStart: hasPopup ? _onLongPressStart : null,
          onLongPressMoveUpdate: hasPopup ? _onLongPressMoveUpdate : null,
          onLongPressEnd: hasPopup ? _onLongPressEnd : null,
          builder: (ctx, pressed) {
            final t = AppColors.of(ctx);
            final isAc = widget.token is Ac;
            final normalColor = isAc ? t.ac : t.op;
            final pressedColor = isAc ? t.acPressed : t.opPressed;
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: TokenKeyPainter(
                      token: widget.token,
                      color: pressed ? pressedColor : normalColor,
                    ),
                  ),
                ),
                // Discoverability: host keys carry a small corner wedge,
                // clear of the armed dot in the opposite corner.
                if (hasPopup)
                  Positioned(
                    right: 3,
                    bottom: 3,
                    child: CustomPaint(
                      size: const Size(6, 6),
                      painter: _CornerMarkPainter(color: t.textMuted),
                    ),
                  ),
                if (widget.armed)
                  const Positioned(right: 4, top: 4, child: _ArmedDot()),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// One cell inside the long-press popup: rendered with the same token
/// painter and palette as a real key, tappable for the release-then-tap
/// mode, highlighted while the slide gesture hovers it.
class _PopupOption extends StatelessWidget {
  final CalcToken token;
  final bool highlighted;
  final VoidCallback onTap;

  const _PopupOption({
    required this.token,
    required this.highlighted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return Semantics(
      button: true,
      label: _tokenSemanticLabel(token, l),
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: highlighted ? t.op : t.keyBorder,
              width: highlighted ? 2 : 1,
            ),
          ),
          child: CustomPaint(
            size: Size.infinite,
            painter: TokenKeyPainter(token: token, color: t.op),
          ),
        ),
      ),
    );
  }
}

/// Tiny filled wedge in the bottom-right key corner marking a long-press
/// host (same discoverability idea as the "…" corner glyphs on smartphone
/// keyboards).
class _CornerMarkPainter extends CustomPainter {
  final Color color;

  _CornerMarkPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _CornerMarkPainter old) => old.color != color;
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
  ConvAns() => l.a11yConvAns,
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

class _ArmedDot extends StatelessWidget {
  const _ArmedDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.of(context).accentGold,
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
    return PressableShell(
      onTap: onTap,
      builder: (ctx, pressed) => CustomPaint(
        painter: TokenKeyPainter(
          token: const Equals(),
          color: pressed ? AppColors.of(ctx).opPressed : normalColor,
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
              child: _EqualsBar(
                onTap: onEquals,
                normalColor: AppColors.of(context).equals,
              ),
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
    final t = AppColors.of(context);
    final btn = Material(
      color: t.pagerFill,
      shape: CircleBorder(side: BorderSide(color: t.pagerBorder)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Center(child: Icon(icon, size: size * 0.5, color: t.link)),
      ),
    );
    return SizedBox(
      width: size,
      height: size,
      child: tooltip != null ? Tooltip(message: tooltip!, child: btn) : btn,
    );
  }
}
