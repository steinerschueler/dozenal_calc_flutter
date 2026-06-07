// Keypad for the unit-converter mode (portrait / Hoch). Deliberately a
// separate widget from keypad.dart so the main calculator keypad — and its
// store screenshots — stay untouched. Reuses the public painters
// (glyph_painter, token_painter) and the egui colour palette for visual
// parity, but renders the category/magnitude swap that is unique to the
// converter.
//
// Layout mirrors _HochKeypad: digit grid → divider → panel-swap middle
// section (main ops / overlay) → equals row. Sets 3/4 (main) and 8/9
// (overlay) hold the unit categories; tapping one expands its magnitude
// ladder into the opposite column (plus the freed slots around the active
// tile). Design: docs/unit-converter.md §3-§4.
//
// Landscape/tablet (Breit) is a follow-up — this step targets portrait.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_layout.dart';
import 'converter_state.dart';
import 'glyph_painter.dart';
import 'logic/unit_data.dart';
import 'token_painter.dart';
import 'tokens.dart';

const Color _kDigit = Colors.white;
const Color _kDigitPressed = Color(0xFFFFD700);
const Color _kDigitDisabled = Color(0xFF606060);
const Color _kOp = Color(0xFF98C8FF);
const Color _kOpPressed = Color(0xFFFF9090);
const Color _kEquals = Color(0xFF8CDC8C);
const Color _kBorder = Color(0xFF505050);
const Color _kAc = Color(0xFFFF4040);
const Color _kAcPressed = Color(0xFFFF8080);
const Color _kGold = Color(0xFFFFD700);
const Color _kDisabled = Color(0xFF555555); // inert (not-yet-wired) op keys
const Color _kCategory = Color(0xFF98C8FF); // categories read like operators
const Color _kMagnitude = Color(0xFFE6C77A); // magnitudes read like values
const Color _kLabelPressed = Color(0xFFFF9090);

// Height regimes — mirror of keypad.dart's _kTightThreshold / _kScrollThreshold
// so the converter survives the same extreme Android aspect ratios as the main
// calculator (split-screen, foldable cover displays, short phones). Keep these
// in sync with keypad.dart.
const double _kTightThreshold = 560.0;
const double _kScrollThreshold = 480.0;

const List<List<DozenalDigit>> _digitGridRows = [
  [DozenalDigit.d10, DozenalDigit.d11, DozenalDigit.d0],
  [DozenalDigit.d7, DozenalDigit.d8, DozenalDigit.d9],
  [DozenalDigit.d4, DozenalDigit.d5, DozenalDigit.d6],
  [DozenalDigit.d1, DozenalDigit.d2, DozenalDigit.d3],
];

// Operator columns kept from the main calculator.
const List<CalcToken> _set1 = [Add(), Sub(), Mul(), Div()];
const List<CalcToken> _set2 = [
  OplusBotLeft(),
  ExpTopRight(),
  RootTopLeft(),
  LogBotRight(),
];
const List<CalcToken> _set6 = [Sto(), Rcl(), Mc(), Ans()];
const List<CalcToken> _set7 = [ConstPi(), ConstE(), ConstPhi(), ConstSqrt2()];

// Category columns.
const List<UnitCategory> _set3 = [
  UnitCategory.count,
  UnitCategory.dist,
  UnitCategory.area,
  UnitCategory.space,
];
const List<UnitCategory> _set4 = [
  UnitCategory.weight,
  UnitCategory.time,
  UnitCategory.angle,
  UnitCategory.price,
];
const List<UnitCategory> _set8 = [
  UnitCategory.temp,
  UnitCategory.press,
  UnitCategory.force,
  UnitCategory.work,
];
const List<UnitCategory> _set9 = [
  UnitCategory.power,
  UnitCategory.cook,
  UnitCategory.liquid,
  UnitCategory.moment,
];

const List<CalcToken> _systemRow = [Ac(), Del(), Decimal(), Expand()];

class ConverterKeypad extends StatelessWidget {
  final ConverterState state;
  final VoidCallback onBack;
  final VoidCallback onInfo;

  /// Resolves a category's localized label. Null → fall back to the English
  /// catalogue key (used by the preview harness, which has no localizations).
  final String Function(UnitCategory)? categoryLabelOf;

  const ConverterKeypad({
    super.key,
    required this.state,
    required this.onBack,
    required this.onInfo,
    this.categoryLabelOf,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (isPortraitConstraints(constraints)) return _buildPortrait(constraints);
        return _buildBreit(constraints);
      },
    );
  }

  // ── Hoch (portrait) ───────────────────────────────────────────────────────

  Widget _buildPortrait(BoxConstraints constraints) {
    final h = constraints.maxHeight;
    // Three height regimes, identical to _HochKeypad: scroll fallback below the
    // floor (fixed 44 dp rows so nothing is unreachable), tight gaps in the mid
    // band, flex layout above.
    if (h.isFinite && h < _kScrollThreshold) {
      return SingleChildScrollView(
        child: _buildColumn(tight: true, fixedHeights: true),
      );
    }
    final tight = h.isFinite && h < _kTightThreshold;
    return _buildColumn(tight: tight, fixedHeights: false);
  }

  Widget _buildColumn({required bool tight, required bool fixedHeights}) {
    final rowGap = tight ? 6.0 : 10.0;
    final sectionGap = tight ? 8.0 : 14.0;
    final equalsGap = tight ? 8.0 : 12.0;

    Widget row(Widget child, {int flex = 8}) => fixedHeights
        ? SizedBox(height: minTouchTarget, child: child)
        : Expanded(flex: flex, child: child);

    return Column(
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var r = 0; r < _digitGridRows.length; r++) ...[
          if (r > 0) SizedBox(height: rowGap),
          row(_digitRow(_digitGridRows[r])),
        ],
        SizedBox(height: sectionGap),
        const Divider(color: Color(0xFF333333), height: 1, thickness: 1),
        SizedBox(height: sectionGap),
        if (fixedHeights)
          _middleSection(tight: tight, fixedHeights: true)
        else
          Expanded(
            flex: 40, // 5 rows × 8
            child: _middleSection(tight: tight, fixedHeights: false),
          ),
        SizedBox(height: equalsGap),
        if (fixedHeights)
          SizedBox(height: minTouchTarget * 1.2, child: _equalsRow())
        else
          Expanded(flex: 10, child: _equalsRow()),
      ],
    );
  }

  // ── Panels ───────────────────────────────────────────────────────────────

  Widget _middleSection({required bool tight, required bool fixedHeights}) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: state.overlayOpen
          ? _panel(const ValueKey('overlay'), _set6, _set7, _set8, _set9,
              bottomRow: const [Doz(), Dez(), Drg(), Close()],
              tight: tight, fixedHeights: fixedHeights)
          : _panel(const ValueKey('main'), _set1, _set2, _set3, _set4,
              bottomRow: _systemRow, tight: tight, fixedHeights: fixedHeights),
    );
  }

  /// A 5-row panel: four op rows (opColA · opColB · catColA · catColB) plus a
  /// system/mode bottom row.
  Widget _panel(
    Key key,
    List<CalcToken> opColA,
    List<CalcToken> opColB,
    List<UnitCategory> catColA,
    List<UnitCategory> catColB, {
    required List<CalcToken> bottomRow,
    required bool tight,
    required bool fixedHeights,
  }) {
    final cols = _buildCategoryColumns(catColA, catColB);
    final cellsA = cols.$1;
    final cellsB = cols.$2;
    final rowGap = tight ? 6.0 : 8.0;
    final bottomGap = tight ? 8.0 : 12.0;

    Widget rowWrap(Widget child, {int flex = 8}) => fixedHeights
        ? SizedBox(height: minTouchTarget, child: child)
        : Expanded(flex: flex, child: child);

    Widget fourCellRow(List<Widget> cells) => Row(
          children: [
            for (var i = 0; i < cells.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              Expanded(child: cells[i]),
            ],
          ],
        );

    return Column(
      key: key,
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var r = 0; r < 4; r++) ...[
          if (r > 0) SizedBox(height: rowGap),
          rowWrap(fourCellRow([
            _opCell(opColA[r]),
            _opCell(opColB[r]),
            cellsA[r],
            cellsB[r],
          ])),
        ],
        SizedBox(height: bottomGap),
        rowWrap(fourCellRow([for (final t in bottomRow) _opCell(t)])),
      ],
    );
  }

  /// Builds the two category columns, swapping in magnitude buttons when the
  /// active category lives in this panel and is expanded.
  (List<Widget>, List<Widget>) _buildCategoryColumns(
    List<UnitCategory> catColA,
    List<UnitCategory> catColB,
  ) {
    final active = state.activeCategory;
    final inThisPanel =
        active != null && (catColA.contains(active) || catColB.contains(active));

    if (!inThisPanel || !state.magnitudesExpanded) {
      return (
        [for (final c in catColA) _categoryCell(c)],
        [for (final c in catColB) _categoryCell(c)],
      );
    }

    final mags = state.magnitudeUnits;
    final activeInA = catColA.contains(active);
    final activeCol = activeInA ? catColA : catColB;
    final activeIdx = activeCol.indexOf(active);

    // Opposite column: first four magnitudes.
    final oppCells = List<Widget>.generate(
      4,
      (i) => i < mags.length ? _magnitudeCell(mags[i]) : _emptyCell(),
    );

    // Active column: the active tile at its row, remaining magnitudes around it.
    var m = 4;
    final actCells = List<Widget>.generate(4, (i) {
      if (i == activeIdx) return _categoryCell(active, forceActive: true);
      if (m < mags.length) return _magnitudeCell(mags[m++]);
      return _emptyCell();
    });

    return activeInA ? (actCells, oppCells) : (oppCells, actCells);
  }

  // ── Cells ────────────────────────────────────────────────────────────────

  Widget _digitRow(List<DozenalDigit> digits) {
    return Row(
      children: [
        for (var i = 0; i < digits.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(child: _digitCell(digits[i])),
        ],
      ],
    );
  }

  Widget _digitCell(DozenalDigit digit) {
    final enabled = state.isDigitEnabled(digit.value);
    return Semantics(
      button: true,
      enabled: enabled,
      label: 'Ziffer ${digit.value}',
      excludeSemantics: true,
      child: _Shell(
        onTap: enabled ? () => state.inputDigit(digit.value) : null,
        pressedBuilder: (pressed) => CustomPaint(
          size: Size.infinite,
          painter: _DigitPainter(
            digit: digit,
            color: !enabled
                ? _kDigitDisabled
                : (pressed ? _kDigitPressed : _kDigit),
          ),
        ),
      ),
    );
  }

  Widget _opCell(CalcToken token) {
    final isAc = token is Ac;
    final active = _isActiveOp(token);
    final armed = token is Sub && state.subtractArmed;
    return Semantics(
      button: active,
      enabled: active,
      label: _opSemanticLabel(token),
      excludeSemantics: true,
      child: _Shell(
        onTap: active ? () => _handleToken(token) : null,
        gold: armed,
        pressedBuilder: (pressed) => CustomPaint(
          size: Size.infinite,
          painter: _OpPainter(
            token: token,
            color: !active
                ? _kDisabled
                : (pressed
                    ? (isAc ? _kAcPressed : _kOpPressed)
                    : (isAc ? _kAc : _kOp)),
          ),
        ),
      ),
    );
  }

  String _opSemanticLabel(CalcToken t) {
    if (t is Ac) return 'Alles löschen';
    if (t is Del) return 'Zeichen löschen';
    if (t is Decimal) return 'Komma';
    if (t is Expand) return 'Erweiterungsfeld öffnen';
    if (t is Close) return 'Erweiterungsfeld schließen';
    if (t is Doz) return 'Dozenal-Modus';
    if (t is Dez) return 'Dezimal-Modus';
    if (t is Add) return 'plus';
    if (t is Sub) return 'minus';
    return '';
  }

  Widget _categoryCell(UnitCategory cat, {bool forceActive = false}) {
    final active = forceActive || state.isCategoryActive(cat);
    return _LabelButton(
      label: categoryLabelOf?.call(cat) ?? kUnitCatalogue[cat]!.label,
      color: active ? _kGold : _kCategory,
      gold: active,
      onTap: () => state.tapCategory(cat),
    );
  }

  Widget _magnitudeCell(Unit unit) {
    final selected = state.inputUnit?.symbol == unit.symbol;
    return _LabelButton(
      label: unit.symbol,
      color: selected ? _kGold : _kMagnitude,
      gold: selected,
      onTap: () => state.tapMagnitude(unit),
    );
  }

  Widget _emptyCell() => const SizedBox.shrink();

  // ── Equals row ─────────────────────────────────────────────────────────

  Widget _equalsRow() {
    return LayoutBuilder(
      builder: (ctx, c) {
        final h = c.maxHeight.isFinite ? c.maxHeight : minTouchTarget * 1.2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RoundIcon(
              size: h,
              icon: Icons.info_outline,
              tooltip: 'Theorie',
              onPressed: onInfo,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Semantics(
                button: true,
                label: 'Gleich',
                excludeSemantics: true,
                child: _Shell(
                  onTap: state.equals,
                  pressedBuilder: (pressed) => CustomPaint(
                    painter: _OpPainter(
                      token: const Equals(),
                      color: pressed ? _kOpPressed : _kEquals,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            _RoundIcon(
              size: h,
              icon: Icons.calculate_outlined,
              tooltip: 'Zurück zum Rechner',
              onPressed: onBack,
            ),
          ],
        );
      },
    );
  }

  // ── Breit (landscape / tablet) — all sets inline, no overlay ──────────────

  Widget _buildBreit(BoxConstraints constraints) {
    const interBlockGap = tabletColGap; // 8
    const verticalContentGap = 18.0;
    const groupGapBase = interBlockGap + 10.0; // 18
    const maxGroupGap = 100.0;

    final h = constraints.maxHeight;
    final w = constraints.maxWidth;
    // 5 button-rows vertically; 13 button-columns horizontally (3 digit + 5 + 5)
    // with 10 inner gaps + 2 group gaps. Pick the tighter axis.
    final rawH = h.isFinite
        ? (h - 3 * interBlockGap - verticalContentGap) / 5
        : tabletButtonSize;
    final rawW = w.isFinite
        ? (w - 10 * interBlockGap - 2 * groupGapBase) / 13
        : tabletButtonSize;
    final buttonSize =
        math.min(rawH, rawW).clamp(breitMinTouchTarget, tabletButtonSize);

    final baseNaturalWidth =
        13 * buttonSize + 10 * interBlockGap + 2 * groupGapBase;
    final hSlack = w.isFinite ? math.max(0.0, w - baseNaturalWidth) : 0.0;
    final groupGap =
        (groupGapBase + hSlack / 2).clamp(groupGapBase, maxGroupGap);
    final contentWidth = 13 * buttonSize + 10 * interBlockGap + 2 * groupGap;

    final content = _buildBreitContent(
      buttonSize: buttonSize,
      interBlockGap: interBlockGap,
      groupGap: groupGap,
    );

    final body = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: w.isFinite ? math.max(w, contentWidth) : contentWidth,
            child: content,
          ),
        ),
        const SizedBox(height: verticalContentGap),
        SizedBox(height: buttonSize, child: _equalsRow()),
      ],
    );

    final naturalHeight =
        4 * buttonSize + 3 * interBlockGap + verticalContentGap + buttonSize;
    if (h.isFinite && h < naturalHeight) {
      return SingleChildScrollView(child: body);
    }
    return Center(child: body);
  }

  Widget _buildBreitContent({
    required double buttonSize,
    required double interBlockGap,
    required double groupGap,
  }) {
    Widget cell(Widget child) =>
        SizedBox(width: buttonSize, height: buttonSize, child: child);

    // A vertical block of (up to) four cells, padded to four for alignment.
    Widget column(List<Widget> children) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < 4; i++) ...[
              if (i > 0) const SizedBox(height: tabletColGap),
              cell(i < children.length ? children[i] : const SizedBox()),
            ],
          ],
        );

    Widget opColumn(List<CalcToken> tokens) =>
        column([for (final t in tokens) _opCell(t)]);

    Widget digitGrid() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var r = 0; r < _digitGridRows.length; r++) ...[
              if (r > 0) const SizedBox(height: tabletDigitGap),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var c = 0; c < _digitGridRows[r].length; c++) ...[
                    if (c > 0) const SizedBox(width: tabletDigitGap),
                    cell(_digitCell(_digitGridRows[r][c])),
                  ],
                ],
              ),
            ],
          ],
        );

    final cells34 = _buildCategoryColumns(_set3, _set4);
    final cells89 = _buildCategoryColumns(_set8, _set9);

    Widget gap() => const SizedBox(width: tabletColGap);
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        digitGrid(),
        bigGap(), // group break: digit pad → Sets 1-5
        opColumn(_set1),
        gap(),
        opColumn(_set2),
        gap(),
        column(cells34.$1),
        gap(),
        column(cells34.$2),
        gap(),
        opColumn(const [Ac(), Del(), Decimal()]), // system column
        bigGap(), // group break: Sets 1-5 → Sets 6-10
        opColumn(_set6),
        gap(),
        opColumn(_set7),
        gap(),
        column(cells89.$1),
        gap(),
        column(cells89.$2),
        gap(),
        opColumn(const [Doz(), Dez(), Drg()]), // Set 10 (no overlay in Breit)
      ],
    );
  }

  // ── Token dispatch ───────────────────────────────────────────────────────

  void _handleToken(CalcToken token) {
    switch (token) {
      case Ac():
        state.allClear();
      case Del():
        state.del();
      case Decimal():
        state.inputDecimal();
      case Expand():
      case Close():
        state.toggleOverlay();
      case Doz():
        state.setWorld(UnitWorld.imperial);
      case Dez():
        state.setWorld(UnitWorld.metric);
      case Add():
        state.setSubtract(false); // + : default; un-arms subtraction
      case Sub():
        state.setSubtract(true); // − : next term subtracts
      default:
        // Set 1/2 operators and Set 6/7 memory/constants are wired in a later
        // step; for now they are inert.
        break;
    }
  }
}

/// Op-keys that do something in the converter. + and − are term operators;
/// everything else routed through _opCell that is not listed (× ÷, Set 2,
/// Set 6/7 memory + constants, Drg) is not wired yet and renders greyed-out.
bool _isActiveOp(CalcToken t) =>
    t is Ac ||
    t is Del ||
    t is Decimal ||
    t is Expand ||
    t is Close ||
    t is Doz ||
    t is Dez ||
    t is Add ||
    t is Sub;

// ── Building blocks ─────────────────────────────────────────────────────────

class _Shell extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget Function(bool pressed) pressedBuilder;
  final bool gold; // gold border, e.g. armed − operator

  const _Shell({this.onTap, required this.pressedBuilder, this.gold = false});

  @override
  State<_Shell> createState() => _ShellState();
}

class _ShellState extends State<_Shell> {
  bool _pressed = false;

  void _set(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onTap == null;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: disabled ? null : (_) => _set(true),
      onTapUp: disabled ? null : (_) => _set(false),
      onTapCancel: disabled ? null : () => _set(false),
      onTap: disabled
          ? null
          : () {
              HapticFeedback.selectionClick();
              widget.onTap!();
            },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: minTouchTarget),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.gold
                  ? _kGold
                  : (disabled ? const Color(0xFF303030) : _kBorder),
              width: widget.gold ? 2 : 1,
            ),
          ),
          child: widget.pressedBuilder(_pressed),
        ),
      ),
    );
  }
}

class _LabelButton extends StatefulWidget {
  final String label;
  final Color color;
  final bool gold;
  final VoidCallback onTap;

  const _LabelButton({
    required this.label,
    required this.color,
    required this.gold,
    required this.onTap,
  });

  @override
  State<_LabelButton> createState() => _LabelButtonState();
}

class _LabelButtonState extends State<_LabelButton> {
  bool _pressed = false;

  void _set(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _set(true),
      onTapUp: (_) => _set(false),
      onTapCancel: () => _set(false),
      onTap: () {
        HapticFeedback.selectionClick();
        widget.onTap();
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: minTouchTarget),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: widget.gold ? _kGold : _kBorder,
              width: widget.gold ? 2 : 1,
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
                color: _pressed ? _kLabelPressed : widget.color,
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

class _RoundIcon extends StatelessWidget {
  final double size;
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _RoundIcon({
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

class _DigitPainter extends CustomPainter {
  final DozenalDigit digit;
  final Color color;

  _DigitPainter({required this.digit, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final q = (size.shortestSide) / 4;
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

class _OpPainter extends CustomPainter {
  final CalcToken token;
  final Color color;

  _OpPainter({required this.token, required this.color});

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
  bool shouldRepaint(covariant _OpPainter old) =>
      old.token != token || old.color != color;
}
