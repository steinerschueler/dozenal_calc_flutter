// Keypad for the asset-converter mode (metals & currencies). A separate widget
// tree from converter_keypad.dart (same convention: identical-looking keys,
// different semantics) but built from the same shared parts (keypad_parts.dart:
// PressableShell, DigitKeyPainter, TokenKeyPainter, LabelButton, SystemKey,
// showUnitInfoBox) and laid out like converter_keypad.
//
// The one structural difference is the THREE-level drill-down. The two
// right-hand tile columns (eight cells) host a navigator:
//   classes : [Edelmetall] [Währung]
//   genera  : [<class header>] [Gold] [Silber] …      (tap header → back)
//   units   : [<genus header>] [oz t] [g] [kg] …       (tap header → back)
// Tapping a unit commits it as a term. The op columns (Set 1/2), the system
// row and the met/imp equals row are unchanged from the converter. Design:
// docs/asset-converter.md.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'app_layout.dart';
import 'app_theme.dart';
import 'asset_state.dart';
import 'keypad_parts.dart';
import 'logic/asset_data.dart';
import 'logic/base_num.dart';
import 'logic/dozenal_digit.dart';
import 'logic/glyph_style.dart';
import 'logic/unit_data.dart';
import 'tokens.dart';

const List<CalcToken> _systemRow = [Ac(), Del(), Decimal(), Expand()];

class AssetKeypad extends StatelessWidget {
  final AssetState state;

  /// Localized class label (Edelmetall/Währung). Null → English key fallback
  /// (preview harness without localizations).
  final String Function(AssetClass)? classLabelOf;

  /// Localized genus label (metal name, or currency ISO code). Null → key.
  final String Function(AssetGenus)? genusLabelOf;

  /// Hint inside the equals bar (repeated taps cycle the unit).
  final String? equalsHint;

  /// Long-press note on a genus tile. Null → no long-press box.
  final String? valueHint;

  /// "Wert" / "Kurse" key labels and the rates-page opener (Phase 2). Null
  /// labels fall back to the German defaults; a null [onRatesTap] makes the
  /// rates key inert.
  final String? valueLabel;
  final String? ratesLabel;
  final VoidCallback? onRatesTap;

  const AssetKeypad({
    super.key,
    required this.state,
    this.classLabelOf,
    this.genusLabelOf,
    this.equalsHint,
    this.valueHint,
    this.valueLabel,
    this.ratesLabel,
    this.onRatesTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        if (isPortraitConstraints(constraints)) {
          return _buildPortrait(ctx, constraints);
        }
        return _buildBreit(ctx, constraints);
      },
    );
  }

  // ── Hoch (portrait) ───────────────────────────────────────────────────────

  Widget _buildPortrait(BuildContext context, BoxConstraints constraints) {
    final h = constraints.maxHeight;
    if (h.isFinite && h < kKeypadScrollThreshold) {
      return SingleChildScrollView(
        child: _buildColumn(context, tight: true, fixedHeights: true),
      );
    }
    final tight = h.isFinite && h < kKeypadTightThreshold;
    return _buildColumn(context, tight: tight, fixedHeights: false);
  }

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

    return Column(
      mainAxisSize: fixedHeights ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var r = 0; r < kDigitGridRows.length; r++) ...[
          if (r > 0) SizedBox(height: rowGap),
          row(_digitRow(kDigitGridRows[r])),
        ],
        SizedBox(height: sectionGap),
        Divider(color: t.hairline, height: 1, thickness: 1),
        SizedBox(height: sectionGap),
        if (fixedHeights)
          _middleSection(tight: tight, fixedHeights: true)
        else
          Expanded(
            flex: 40,
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
          ? _panel(const ValueKey('overlay'), kSet6, kSet7,
              bottomCells: [
                _valueCell(),
                _ratesCell(),
                _emptyCell(),
                _opCell(const Close()),
              ],
              tight: tight, fixedHeights: fixedHeights)
          : _panel(const ValueKey('main'), kSet1, kSet2,
              bottomCells: [for (final tk in _systemRow) _opCell(tk)],
              tight: tight, fixedHeights: fixedHeights),
    );
  }

  /// A 5-row panel: four op rows (opColA · opColB · drillColA · drillColB)
  /// plus a system/mode bottom row.
  Widget _panel(
    Key key,
    List<CalcToken> opColA,
    List<CalcToken> opColB, {
    required List<Widget> bottomCells,
    required bool tight,
    required bool fixedHeights,
  }) {
    final (drillA, drillB) = _drillColumns();
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
            drillA[r],
            drillB[r],
          ])),
        ],
        SizedBox(height: bottomGap),
        rowWrap(fourCellRow(bottomCells)),
      ],
    );
  }

  /// The eight-cell drill area, distributed top-to-bottom over two columns
  /// (left = cells 0..3, right = cells 4..7), padded with empties.
  (List<Widget>, List<Widget>) _drillColumns() {
    final cells = <Widget>[];
    switch (state.drillLevel) {
      case AssetDrillLevel.classes:
        for (final c in AssetClass.values) {
          cells.add(_classCell(c));
        }
      case AssetDrillLevel.genera:
        final c = state.activeClass!;
        cells.add(_classCell(c, header: true));
        for (final g in generaOf(c)) {
          cells.add(_genusCell(g));
        }
      case AssetDrillLevel.units:
        cells.add(_genusCell(state.activeGenus!, header: true));
        for (final u in state.currentLadder) {
          cells.add(_unitCell(u));
        }
      case AssetDrillLevel.valueTargets:
        // Value mode: the drill area becomes a currency target picker. The
        // source currency itself is excluded — valuing it in itself is a
        // meaningless identity (the state also rejects it).
        final srcKey = state.activeClass == AssetClass.currency
            ? state.activeGenus?.key
            : null;
        for (final g in generaOf(AssetClass.currency)) {
          if (g.key == srcKey) continue;
          cells.add(_targetCell(g));
        }
    }
    final colA = <Widget>[];
    final colB = <Widget>[];
    for (var i = 0; i < 8; i++) {
      final w = i < cells.length ? cells[i] : _emptyCell();
      (i < 4 ? colA : colB).add(w);
    }
    return (colA, colB);
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
      child: PressableShell(
        onTap: enabled ? () => state.inputDigit(digit.value) : null,
        builder: (ctx, pressed) {
          final t = AppColors.of(ctx);
          final style = GlyphStyleScope.keypadStyleOf(ctx);
          return CustomPaint(
            size: Size.infinite,
            painter: DigitKeyPainter(
              digit: digit,
              style: style,
              color: !enabled
                  ? t.digitDisabled
                  : (pressed ? t.digitPressed : t.digit),
            ),
          );
        },
      ),
    );
  }

  /// Op-key enablement. Operators/constants are always active (a grey reads as
  /// "not wired"); Ans needs the (Phase-2) bridge, STO/RCL/MC the register.
  bool _opActive(CalcToken t) {
    if (t is Ans) return state.calcAnsAvailable;
    if (t is Sto) return state.canMemStore;
    if (t is Rcl) return state.canMemRecall;
    if (t is Mc) return state.memoryAvailable;
    if (t.isIrrationalConstant) return true;
    return _isActiveOp(t);
  }

  Widget _opCell(CalcToken token) {
    final isAc = token is Ac;
    final active = _opActive(token);
    final armed = token is Sub && state.subtractArmed;
    return Semantics(
      button: active,
      enabled: active,
      label: _opSemanticLabel(token),
      excludeSemantics: true,
      child: PressableShell(
        onTap: active ? () => _handleToken(token) : null,
        gold: armed,
        builder: (ctx, pressed) {
          final t = AppColors.of(ctx);
          return CustomPaint(
            size: Size.infinite,
            painter: TokenKeyPainter(
              token: token,
              color: !active
                  ? t.inertKey
                  : (pressed
                      ? (isAc ? t.acPressed : t.opPressed)
                      : (isAc ? t.ac : t.op)),
            ),
          );
        },
      ),
    );
  }

  String _opSemanticLabel(CalcToken t) {
    if (t is Ac) return 'Alles löschen';
    if (t is Del) return 'Zeichen löschen';
    if (t is Decimal) return 'Komma';
    if (t is Ans) return 'Ergebnis des Rechners einfügen';
    if (t is Expand) return 'Erweiterungsfeld öffnen';
    if (t is Close) return 'Erweiterungsfeld schließen';
    if (t is Add) return 'plus';
    if (t is Sub) return 'minus';
    if (t is Mul) return 'mal';
    if (t is Div) return 'geteilt';
    if (t is OplusBotLeft) return 'parallel addiert';
    if (t is ExpTopRight) return 'hoch';
    if (t is RootTopLeft) return 'Wurzel';
    if (t is LogBotRight) return 'Logarithmus zur Basis';
    if (t is Sto) return 'Ergebnis speichern';
    if (t is Rcl) return 'Speicher einfügen';
    if (t is Mc) return 'Speicher löschen';
    if (t is ConstPi) return 'Pi';
    if (t is ConstE) return 'Eulersche Zahl';
    if (t is ConstPhi) return 'Goldener Schnitt';
    if (t is ConstSqrt2) return 'Wurzel aus zwei';
    return '';
  }

  Widget _classCell(AssetClass c, {bool header = false}) {
    final active = header || state.isClassActive(c);
    return LabelButton(
      label: classLabelOf?.call(c) ?? c.name,
      colorOf: (t) => active ? t.accentGold : t.op,
      gold: active,
      onTap: () => state.tapClass(c),
    );
  }

  Widget _genusCell(AssetGenus g, {bool header = false}) {
    final selected = state.isGenusActive(g);
    return LabelButton(
      label: genusLabelOf?.call(g) ?? g.key,
      colorOf: (t) => (header || selected) ? t.accentGold : t.op,
      gold: header,
      softGold: !header && selected,
      onTap: () => state.tapGenus(g),
      // Long-press note: v1 has no prices yet.
      info: (header || valueHint == null) ? null : (desc: valueHint!, more: ''),
    );
  }

  Widget _unitCell(Unit unit) {
    final selected = state.inputUnit?.symbol == unit.symbol;
    return LabelButton(
      label: unit.symbol,
      colorOf: (t) => selected ? t.accentGold : t.magnitude,
      softGold: selected,
      onTap: () => state.tapMagnitude(unit),
    );
  }

  /// A currency target tile shown in value mode (drill level valueTargets).
  Widget _targetCell(AssetGenus g) {
    final active = state.valueTarget == g.key;
    return LabelButton(
      label: genusLabelOf?.call(g) ?? g.key.toUpperCase(),
      colorOf: (t) => active ? t.accentGold : t.op,
      gold: active,
      onTap: () => state.setValueTarget(g.key),
    );
  }

  /// "Wert" key — toggles value mode. Greyed (inert no-op) until a result is
  /// live and a rate table is present.
  Widget _valueCell() {
    final active = state.valueMode;
    final enabled = active || state.canEnterValueMode;
    return LabelButton(
      label: valueLabel ?? 'Wert',
      colorOf: (t) => active ? t.accentGold : (enabled ? t.op : t.inertKey),
      gold: active,
      enabled: enabled,
      onTap: state.toggleValueMode,
    );
  }

  /// "Kurse" key — opens the rate editor.
  Widget _ratesCell() {
    final enabled = onRatesTap != null;
    return LabelButton(
      label: ratesLabel ?? 'Kurse',
      colorOf: (t) => enabled ? t.op : t.inertKey,
      enabled: enabled,
      onTap: () => onRatesTap?.call(),
    );
  }

  Widget _emptyCell() => const SizedBox.shrink();

  // ── Equals row ─────────────────────────────────────────────────────────

  Widget _equalsRow() {
    final worldEnabled = state.worldToggleEnabled;
    return LayoutBuilder(
      builder: (ctx, c) {
        final h = c.maxHeight.isFinite ? c.maxHeight : minTouchTarget * 1.2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: h,
              child: SystemKey(
                label: 'met',
                semanticLabel: 'Metrisches System',
                tenWorld: true,
                enabled: worldEnabled,
                active: worldEnabled && state.world == UnitWorld.metric,
                onTap: () => state.setWorld(UnitWorld.metric),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Semantics(
                button: true,
                label: 'Gleich',
                hint: equalsHint,
                excludeSemantics: true,
                child: PressableShell(
                  onTap: state.equals,
                  builder: (ctx, pressed) {
                    final t = AppColors.of(ctx);
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: CustomPaint(
                            painter: TokenKeyPainter(
                              token: const Equals(),
                              color: pressed ? t.opPressed : t.equals,
                            ),
                          ),
                        ),
                        if (equalsHint != null)
                          Positioned(
                            left: 8,
                            right: 8,
                            bottom: 3,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                equalsHint!,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 9.5, color: t.textFaint),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: h,
              child: SystemKey(
                label: 'imp',
                semanticLabel: 'Imperiales System',
                tenWorld: false,
                enabled: worldEnabled,
                active: worldEnabled && state.world == UnitWorld.imperial,
                onTap: () => state.setWorld(UnitWorld.imperial),
              ),
            ),
          ],
        );
      },
    );
  }

  // ── Breit (landscape / tablet) — all sets inline, no overlay ──────────────

  Widget _buildBreit(BuildContext context, BoxConstraints constraints) {
    const interBlockGap = tabletColGap; // 8
    const verticalContentGap = 18.0;
    const groupGapBase = interBlockGap + 10.0; // 18
    const maxGroupGap = 100.0;

    final h = constraints.maxHeight;
    final w = constraints.maxWidth;
    // 11 button-columns horizontally (3 digit + Set1/Set2/drillA/drillB/system
    // + Set6/Set7/value-rates = 3 + 8), with 8 inner (interBlockGap) gaps + 2
    // group gaps. (The asset keypad is one block shorter than the converter's.)
    final rawH = h.isFinite
        ? (h - 3 * interBlockGap - verticalContentGap) / 5
        : tabletButtonSize;
    final rawW = w.isFinite
        ? (w - 8 * interBlockGap - 2 * groupGapBase) / 11
        : tabletButtonSize;
    final buttonSize =
        math.min(rawH, rawW).clamp(breitMinTouchTarget, tabletButtonSize);

    final baseNaturalWidth =
        11 * buttonSize + 8 * interBlockGap + 2 * groupGapBase;
    final hSlack = w.isFinite ? math.max(0.0, w - baseNaturalWidth) : 0.0;
    final groupGap =
        (groupGapBase + hSlack / 2).clamp(groupGapBase, maxGroupGap);
    final contentWidth = 11 * buttonSize + 8 * interBlockGap + 2 * groupGap;

    final content = _buildBreitContent(
      buttonSize: buttonSize,
      interBlockGap: interBlockGap,
      groupGap: groupGap,
      t: AppColors.of(context),
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
    required AppColors t,
  }) {
    Widget cell(Widget child) =>
        SizedBox(width: buttonSize, height: buttonSize, child: child);

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
        column([for (final tk in tokens) _opCell(tk)]);

    Widget digitGrid() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var r = 0; r < kDigitGridRows.length; r++) ...[
              if (r > 0) const SizedBox(height: tabletDigitGap),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var c = 0; c < kDigitGridRows[r].length; c++) ...[
                    if (c > 0) const SizedBox(width: tabletDigitGap),
                    cell(_digitCell(kDigitGridRows[r][c])),
                  ],
                ],
              ),
            ],
          ],
        );

    final (drillA, drillB) = _drillColumns();

    Widget gap() => const SizedBox(width: tabletColGap);
    final dividerHeight = 4 * buttonSize + 3 * interBlockGap;
    Widget bigGap() => SizedBox(
          width: groupGap,
          child: Center(
            child: Container(width: 1, height: dividerHeight, color: t.hairline),
          ),
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        digitGrid(),
        bigGap(),
        opColumn(kSet1),
        gap(),
        opColumn(kSet2),
        gap(),
        column(drillA),
        gap(),
        column(drillB),
        gap(),
        opColumn(const [Ac(), Del(), Decimal()]),
        bigGap(),
        opColumn(kSet6),
        gap(),
        opColumn(kSet7),
        gap(),
        column([_valueCell(), _ratesCell()]),
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
      case Add():
        state.setSubtract(false);
      case Sub():
        state.setSubtract(true);
      case Mul():
        state.inputScalarOp(kScalarTimes);
      case Div():
        state.inputScalarOp(kScalarDivide);
      case OplusBotLeft():
        state.inputScalarOp(kScalarParallel);
      case ExpTopRight():
        state.inputScalarOp(kScalarPower);
      case RootTopLeft():
        state.inputScalarOp(kScalarRoot);
      case LogBotRight():
        state.inputScalarOp(kScalarLog);
      case Ans():
        state.insertCalcAns();
      case Sto():
        state.memStore();
      case Rcl():
        state.memRecall();
      case Mc():
        state.memClear();
      case ConstPi():
        state.insertValueEntry(math.pi);
      case ConstE():
        state.insertValueEntry(math.e);
      case ConstPhi():
        state.insertValueEntry((1 + math.sqrt(5)) / 2);
      case ConstSqrt2():
        state.insertValueEntry(math.sqrt2);
      default:
        break;
    }
  }
}

/// Statically wired op-keys (always enabled). State-bound keys (Ans, STO/RCL/MC)
/// are decided in _opActive.
bool _isActiveOp(CalcToken t) =>
    t is Ac ||
    t is Del ||
    t is Decimal ||
    t is Expand ||
    t is Close ||
    t is Add ||
    t is Sub ||
    t is Mul ||
    t is Div ||
    t is OplusBotLeft ||
    t is ExpTopRight ||
    t is RootTopLeft ||
    t is LogBotRight;
