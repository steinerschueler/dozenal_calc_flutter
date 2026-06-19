// Orchestrator for the asset-converter mode (the third calculator: precious
// metals & currencies). A ChangeNotifier closely analogous to ConverterState,
// but with THREE hierarchies — Klasse → Gattung → Einheit — instead of two.
//
// Exact layer (Phase 1):
//   - metal genera share one troy/avoirdupois weight ladder; the genus is
//     inert for pure weight (it gains meaning via the value mode).
//   - currency genera each carry their own exact denomination ladder.
//
// Value layer (Phase 2, here): value mode converts the committed quantity into
// a chosen target currency via the injected [rates] (RateStore), shown as an
// "≈" value line. Cross-currency and metal-spot valuation live here; the
// historical price curve (Phase 3) does not.
//
// Interaction model mirrors ConverterState (compound terms, scalar-entry
// operators, an edit caret, the `=` ladder/breakdown cycle, the met/imp world
// toggle and the decoupled numeral base). The structural additions are the
// drill-down (tap a class → its genera; a genus → its unit ladder; a unit →
// commit; the active header steps back) and the value mode + target picker.
//
// Design + roadmap: docs/asset-converter.md.

import 'package:flutter/foundation.dart';

import 'converter_state.dart' show ConverterLine;
import 'logic/asset_convert.dart';
import 'logic/asset_data.dart';
import 'logic/base_num.dart';
import 'logic/unit_data.dart';
import 'rate_store.dart';

/// Which tier of the drill-down the keypad should show. In value mode the drill
/// area becomes a currency target picker ([valueTargets]).
enum AssetDrillLevel { classes, genera, units, valueTargets }

/// A committed (number, unit) term plus the operator joining it to the
/// previous one. Same model as ConverterState's private term.
@immutable
class _Term {
  final double value;
  final Unit unit;
  final bool subtract;
  const _Term(this.value, this.unit, {this.subtract = false});
}

/// Rendered input text plus the char offsets the display needs.
class _InputLayout {
  final String text;
  final int caret;
  final int? pendingStart;
  final int? pendingEnd;
  final List<int> boundaries;
  final List<(int, int)> unitRanges;
  _InputLayout(this.text, this.caret, this.pendingStart, this.pendingEnd,
      this.boundaries, this.unitRanges);
}

class AssetState extends ChangeNotifier {
  UnitWorld _world = UnitWorld.imperial; // imperial (troy) is the default
  int _base = 12;
  AssetClass? _activeClass;
  AssetGenus? _activeGenus;
  bool _genusExpanded = false;
  bool _overlayOpen = false;

  /// Rate table for value mode (Phase 2). Injected by the calc scaffold; null
  /// when the calculator runs standalone (the value key then stays inert).
  RateStore? rates;

  /// Value mode: the result line shows the committed quantity converted into a
  /// chosen target currency (≈, rate-based) instead of the exact ladder.
  bool _valueMode = false;
  String? _valueTarget; // currency genus key

  List<_Term> _terms = const [];
  String _input = '';
  bool _pendingSubtract = false;
  int _resultStep = -1;
  Unit? _heldUnit;
  int _cursorTerm = 0;
  int _inputCursor = 0;

  /// Phase-2 bridge hook (the main calculator's last answer). Null in v1 →
  /// the Ans key stays inert.
  double? Function()? calcAnsProvider;
  bool get calcAnsAvailable => _canInsertValue(calcAnsProvider?.call());

  double? _memory;
  bool get memoryAvailable => _memory != null;
  bool get canMemStore => ansForBridge != null || _input.isNotEmpty;
  bool get canMemRecall => _canInsertValue(_memory);

  void memStore() {
    final v =
        ansForBridge ?? (_input.isEmpty ? null : parseScalarEntry(_input, base));
    if (v == null || !v.isFinite) return;
    _memory = v;
    _overlayOpen = false;
    notifyListeners();
  }

  void memRecall() {
    final v = _memory;
    if (v == null) return;
    insertValueEntry(v);
  }

  void memClear() {
    if (_memory == null) return;
    _memory = null;
    _overlayOpen = false;
    notifyListeners();
  }

  // ── Public read model ──────────────────────────────────────────────────

  UnitWorld get world => _world;
  int get base => _base;
  AssetClass? get activeClass => _activeClass;
  AssetGenus? get activeGenus => _activeGenus;
  bool get genusExpanded => _genusExpanded;
  bool get overlayOpen => _overlayOpen;

  /// Which drill tier the keypad renders.
  AssetDrillLevel get drillLevel {
    if (_valueMode) return AssetDrillLevel.valueTargets;
    if (_activeClass == null) return AssetDrillLevel.classes;
    if (_activeGenus == null || !_genusExpanded) return AssetDrillLevel.genera;
    return AssetDrillLevel.units;
  }

  // ── Value mode (Phase 2) ───────────────────────────────────────────────

  bool get valueMode => _valueMode;
  String? get valueTarget => _valueTarget;

  /// Whether the value key can act: a live result and an injected rate table.
  bool get canEnterValueMode => hasResult && rates != null;

  /// The snapshot's `asOf` date label (for the "Stand: …" note), or null
  /// without rates.
  String? get rateAsOf => rates?.asOf;

  void enterValueMode() {
    if (!canEnterValueMode) return;
    _valueMode = true;
    // Re-validate the (sticky) target: a target left over from a previous
    // quantity must not equal the current currency source — that would be a
    // meaningless self-conversion. A null target also gets the default.
    if (_valueTarget == null ||
        (_activeClass == AssetClass.currency &&
            _valueTarget == _activeGenus?.key)) {
      _valueTarget = _defaultValueTarget();
    }
    notifyListeners();
  }

  void exitValueMode() {
    if (!_valueMode) return;
    _valueMode = false;
    notifyListeners();
  }

  void toggleValueMode() => _valueMode ? exitValueMode() : enterValueMode();

  // ── Historical price chart (Phase 3) ───────────────────────────────────

  bool _chartOpen = false;

  /// Whether the price chart replaces the keypad. Toggled by the keypad's
  /// "Kurve" key (on) and the chart's close button (off).
  bool get chartOpen => _chartOpen;

  void toggleChart() {
    _chartOpen = !_chartOpen;
    if (_chartOpen) _valueMode = false; // chart is its own full view
    notifyListeners();
  }

  void setValueTarget(String currencyKey) {
    // Refuse the source currency itself — valuing a currency in itself is a
    // meaningless identity (the source tile is also hidden in the picker).
    if (_activeClass == AssetClass.currency &&
        currencyKey == _activeGenus?.key) {
      return;
    }
    _valueTarget = currencyKey;
    notifyListeners();
  }

  /// Clears value mode without notifying — called by the source-editing
  /// handlers so any edit drops back to the live exact result.
  void _leaveValueMode() {
    _valueMode = false;
  }

  String _defaultValueTarget() {
    final src =
        _activeClass == AssetClass.currency ? _activeGenus?.key : null;
    final currencies = generaOf(AssetClass.currency);
    for (final g in currencies) {
      if (g.key != src) return g.key;
    }
    return currencies.first.key;
  }

  /// The ≈ value line shown in value mode: the committed quantity converted to
  /// [_valueTarget]. Null when value mode is off, no target/rate, or the
  /// result is non-finite. Always approximate (rate-based) — the display
  /// renders it with the "≈" prefix.
  ConverterLine? get valueLine {
    final r = rates;
    final g = _activeGenus;
    final target = _valueTarget;
    if (!_valueMode || r == null || g == null || target == null ||
        _terms.isEmpty) {
      return null;
    }
    final double pivot;
    switch (_activeClass) {
      case AssetClass.currency:
        pivot = r.pivotOfCurrency(totalBase, g.key);
      case AssetClass.metal:
        pivot = r.pivotOfMetalKg(totalBase, g.key);
      case null:
        return null;
    }
    final value = r.currencyFromPivot(pivot, target);
    if (!value.isFinite) return null;
    return ConverterLine(formatBaseNum(value, base),
        unit: currencySymbol(target));
  }

  /// True when the met/imp keys do anything: only a non-single-world genus
  /// (i.e. a metal) has a metric ↔ imperial axis. Currencies disable them.
  bool get worldToggleEnabled =>
      _activeGenus != null && !_activeGenus!.singleWorld;

  Unit? get inputUnit =>
      _heldUnit ?? (_terms.isEmpty ? null : _terms.last.unit);

  bool get subtractArmed => _pendingSubtract;

  int get cursorTerm => _cursorTerm;
  int get inputCursor => _inputCursor;
  String get pendingInput => _input;

  List<Unit> get currentLadder => _activeGenus?.ladderFor(_world) ?? const [];
  List<Unit> get magnitudeUnits =>
      _genusExpanded ? currentLadder : const [];

  bool isClassActive(AssetClass c) => _activeClass == c;
  bool isGenusActive(AssetGenus g) => _activeGenus?.key == g.key;
  bool isDigitEnabled(int value) => value < base;

  bool get hasResult => _terms.isNotEmpty && _resultStep >= 0;
  int get termCount => _terms.length;

  /// Total of all committed terms in the genus's base value.
  double get totalBase {
    var sum = 0.0;
    for (final t in _terms) {
      final v = t.unit.toBase(t.value);
      sum += t.subtract ? -v : v;
    }
    return sum;
  }

  bool get _breakdownAvailable {
    final g = _activeGenus;
    return g != null &&
        g.hasBreakdown &&
        _terms.isNotEmpty &&
        (g.singleWorld || _world == UnitWorld.imperial);
  }

  int get _resultViewCount {
    final n = currentLadder.length;
    if (n == 0) return 0;
    return n + (_breakdownAvailable ? 1 : 0);
  }

  ConverterLine get topLine {
    final l = _buildInputLayout();
    final b = _terms.isEmpty ? null : _totalBracketInfo();
    return ConverterLine(
      l.text,
      bracket: b?.$1,
      bracketTenWorld: b?.$2,
      unitRanges: l.unitRanges,
    );
  }

  ConverterLine? get resultLine {
    if (!hasResult) return null;
    final ladder = currentLadder;
    if (_breakdownAvailable && _resultStep == ladder.length) {
      return _breakdownLine();
    }
    final unit = ladder[_resultStep.clamp(0, ladder.length - 1)];
    final value = unit.fromBase(totalBase);
    final b = _bracketInfo(unit, value);
    return ConverterLine(
      formatBaseNum(value, base),
      unit: unit.symbol,
      bracket: b?.$1,
      bracketTenWorld: b?.$2,
    );
  }

  /// Phase-2 bridge value (the result-line number). Exposed now so the bridge
  /// wiring can land without touching this class later.
  double? get ansForBridge {
    if (_terms.isEmpty) return null;
    final ladder = currentLadder;
    if (_resultStep >= 0 && _resultStep < ladder.length) {
      return ladder[_resultStep].fromBase(totalBase);
    }
    return _terms.last.unit.fromBase(totalBase);
  }

  ({String text, int caret}) get inputLayout {
    final l = _buildInputLayout();
    return (text: l.text, caret: l.caret);
  }

  // ── Input handlers (identical model to ConverterState) ─────────────────

  void inputDigit(int value) {
    if (value >= base) return;
    _leaveValueMode();
    _input = _input.substring(0, _inputCursor) +
        _digitChar(value) +
        _input.substring(_inputCursor);
    _inputCursor++;
    notifyListeners();
  }

  void inputDecimal() {
    _leaveValueMode();
    var segStart = _inputCursor;
    while (segStart > 0 && !isScalarOpChar(_input[segStart - 1])) {
      segStart--;
    }
    var segEnd = _inputCursor;
    while (segEnd < _input.length && !isScalarOpChar(_input[segEnd])) {
      segEnd++;
    }
    if (_input.substring(segStart, segEnd).contains('.')) return;
    if (_inputCursor == segStart) {
      _input = '${_input.substring(0, _inputCursor)}0.'
          '${_input.substring(_inputCursor)}';
      _inputCursor += 2;
    } else {
      _input = '${_input.substring(0, _inputCursor)}.'
          '${_input.substring(_inputCursor)}';
      _inputCursor++;
    }
    notifyListeners();
  }

  void inputScalarOp(String op) {
    assert(isScalarOpChar(op), 'not a scalar operator: $op');
    _leaveValueMode();
    final ch = op;
    if (_input.isEmpty) {
      if (_terms.isEmpty) return;
      final unit = _terms.last.unit;
      _input = formatBaseNum(unit.fromBase(totalBase), base);
      _terms = const [];
      _cursorTerm = 0;
      _pendingSubtract = false;
      _resultStep = -1;
      _inputCursor = _input.length;
    }
    final prev = _inputCursor > 0 ? _input[_inputCursor - 1] : null;
    final next = _inputCursor < _input.length ? _input[_inputCursor] : null;
    if (prev == null || isScalarOpChar(prev) || prev == '-') return;
    if (next != null && isScalarOpChar(next)) return;
    _input = _input.substring(0, _inputCursor) +
        ch +
        _input.substring(_inputCursor);
    _inputCursor++;
    notifyListeners();
  }

  void del() {
    _leaveValueMode();
    if (_input.isNotEmpty && _inputCursor > 0) {
      _input = _input.substring(0, _inputCursor - 1) +
          _input.substring(_inputCursor);
      _inputCursor--;
    } else if (_input.isEmpty && _heldUnit != null) {
      _heldUnit = null;
      _pendingSubtract = false;
    } else if (_input.isEmpty &&
        _cursorTerm == _terms.length &&
        _terms.isNotEmpty) {
      final t = _terms[_cursorTerm - 1];
      _heldUnit = t.unit;
      _pendingSubtract = t.subtract;
      _removeTermAt(_cursorTerm - 1);
      _input = formatBaseNum(t.value, base);
      if (_input.isNotEmpty) {
        _input = _input.substring(0, _input.length - 1);
      }
      _inputCursor = _input.length;
    } else if (_input.isEmpty && _cursorTerm > 0) {
      _removeTermAt(_cursorTerm - 1);
    } else if (_input.isNotEmpty && _inputCursor == 0 && _cursorTerm > 0) {
      _removeTermAt(_cursorTerm - 1);
    } else {
      return;
    }
    notifyListeners();
  }

  void allClear() {
    _terms = const [];
    _input = '';
    _inputCursor = 0;
    _cursorTerm = 0;
    _pendingSubtract = false;
    _heldUnit = null;
    _activeClass = null;
    _activeGenus = null;
    _genusExpanded = false;
    _resultStep = -1;
    _valueMode = false;
    _valueTarget = null;
    notifyListeners();
  }

  void setSubtract(bool subtract) {
    if (_pendingSubtract == subtract) return;
    _leaveValueMode();
    _pendingSubtract = subtract;
    notifyListeners();
  }

  void insertCalcAns() {
    final v = calcAnsProvider?.call();
    if (v == null) return;
    insertValueEntry(v);
  }

  bool _canInsertValue(double? v) {
    if (v == null || !v.isFinite) return false;
    if (v < -1e-9) {
      final (s, e) = _segmentBoundsAtCaret();
      return s == 0 && e == _input.length;
    }
    return true;
  }

  (int, int) _segmentBoundsAtCaret() {
    var s = _inputCursor;
    while (s > 0 && !isScalarOpChar(_input[s - 1])) {
      s--;
    }
    var e = _inputCursor;
    while (e < _input.length && !isScalarOpChar(_input[e])) {
      e++;
    }
    return (s, e);
  }

  void insertValueEntry(double v) {
    if (!_canInsertValue(v)) return;
    _leaveValueMode();
    final x = v.abs() < 1e-9 ? 0.0 : v;
    final (s, e) = _segmentBoundsAtCaret();
    if (x < 0) {
      _pendingSubtract = true;
      _input = formatBaseNum(x.abs(), base);
      _inputCursor = _input.length;
    } else {
      final digits = formatBaseNum(x, base);
      _input = _input.substring(0, s) + digits + _input.substring(e);
      _inputCursor = s + digits.length;
    }
    _overlayOpen = false;
    notifyListeners();
  }

  // ── Drill-down: class → genus → unit ───────────────────────────────────

  /// Tap a class tile. The same class (its header tile) steps back to the
  /// class level; a different class selects it and shows its genera. The
  /// pending number survives (it is unit-less); committed terms are dropped.
  void tapClass(AssetClass c) {
    _leaveValueMode();
    if (_activeClass == c) {
      _activeClass = null;
      _activeGenus = null;
      _genusExpanded = false;
    } else {
      _activeClass = c;
      _activeGenus = null;
      _genusExpanded = false;
      _terms = const [];
      _heldUnit = null;
      _cursorTerm = 0;
      _resultStep = -1;
    }
    notifyListeners();
  }

  /// Tap a genus tile. The active genus's header steps back to the genus
  /// level (collapse); a different genus selects it and expands its ladder.
  void tapGenus(AssetGenus g) {
    _leaveValueMode();
    if (_activeGenus?.key == g.key) {
      _genusExpanded = !_genusExpanded;
    } else {
      _activeGenus = g;
      _activeClass = g.assetClass;
      _genusExpanded = true;
      _terms = const [];
      _heldUnit = null;
      _cursorTerm = 0;
      _resultStep = -1;
    }
    notifyListeners();
  }

  /// Commit the pending entry as a term in [unit] (scalar expressions collapse
  /// to their value here), or re-label a held/last unit when nothing is typed.
  void tapMagnitude(Unit unit) {
    _leaveValueMode();
    final ladder = currentLadder;
    final i = ladder.indexWhere((u) => u.symbol == unit.symbol);
    if (i < 0) return;

    if (_input.isEmpty) {
      if (_heldUnit != null) {
        if (_heldUnit!.symbol != unit.symbol) {
          _heldUnit = unit;
          notifyListeners();
        }
        return;
      }
      if (_cursorTerm == _terms.length && _terms.isNotEmpty) {
        final idx = _cursorTerm - 1;
        final old = _terms[idx];
        if (old.unit.symbol == unit.symbol) return;
        _terms = [
          ..._terms.sublist(0, idx),
          _Term(old.value, unit, subtract: old.subtract),
          ..._terms.sublist(idx + 1),
        ];
        _resultStep = i;
        notifyListeners();
      }
      return;
    }

    final term = _Term(parseScalarEntry(_input, base), unit,
        subtract: _pendingSubtract);
    _terms = [
      ..._terms.sublist(0, _cursorTerm),
      term,
      ..._terms.sublist(_cursorTerm),
    ];
    _cursorTerm++;
    _pendingSubtract = false;
    _heldUnit = null;
    _input = '';
    _inputCursor = 0;
    _resultStep = i;
    notifyListeners();
  }

  void equals() {
    // In value mode the result line shows the ≈ value, not the ladder, so `=`
    // is inert (it must not silently cycle the hidden exact-result step).
    if (_valueMode) return;
    final count = _resultViewCount;
    if (_terms.isEmpty || count <= 0) return;
    _resultStep = (_resultStep < 0 ? 0 : (_resultStep + 1) % count);
    notifyListeners();
  }

  // ── Cursor (tap-to-position) ───────────────────────────────────────────

  void moveCursorToTermBoundary(int boundary) {
    _input = '';
    _inputCursor = 0;
    _heldUnit = null;
    _cursorTerm = boundary.clamp(0, _terms.length);
    notifyListeners();
  }

  void moveInputCaret(int caret) {
    if (_input.isEmpty) return;
    _inputCursor = caret.clamp(0, _input.length);
    notifyListeners();
  }

  void moveCaretLeft() {
    if (_input.isNotEmpty || _heldUnit != null) {
      if (_inputCursor > 0) {
        _inputCursor--;
        notifyListeners();
      }
    } else if (_cursorTerm > 0) {
      _cursorTerm--;
      notifyListeners();
    }
  }

  void moveCaretRight() {
    if (_input.isNotEmpty || _heldUnit != null) {
      if (_inputCursor < _input.length) {
        _inputCursor++;
        notifyListeners();
      }
    } else if (_cursorTerm < _terms.length) {
      _cursorTerm++;
      notifyListeners();
    }
  }

  // ── World / base ───────────────────────────────────────────────────────

  /// Switch the unit system (imperial ↔ metric) — value-preserving. No-op for
  /// single-world genera (currencies). Mirrors ConverterState.setWorld.
  void setWorld(UnitWorld w) {
    if (w == _world) return;
    _leaveValueMode();
    final g = _activeGenus;
    if (g != null && g.singleWorld) {
      _world = w; // harmless; the ladder is world-agnostic
      notifyListeners();
      return;
    }
    final hadTerms = _terms.isNotEmpty;
    final total = hadTerms ? totalBase : 0.0;
    final ref = hadTerms ? _terms.last.unit : null;

    _world = w;
    _heldUnit = null;

    if (hadTerms && g != null) {
      final partner = assetBracketPartner(g, ref!);
      if (partner != null) {
        _terms = [_Term(partner.fromBase(total), partner)];
        _cursorTerm = 1;
        final idx = currentLadder.indexWhere((u) => u.symbol == partner.symbol);
        _resultStep = idx < 0 ? 0 : idx;
      }
    }
    notifyListeners();
  }

  void toggleWorld() => setWorld(
      _world == UnitWorld.imperial ? UnitWorld.metric : UnitWorld.imperial);

  /// Switch the numeral base (12 ↔ 10) — value-preserving. Driven by the
  /// global "Zahlensystem" setting via the calc scaffold.
  void setBase(int b) {
    if (b == _base) return;
    final from = _base;
    _base = b;
    if (_input.isNotEmpty) {
      _input = reformatScalarEntry(_input, from, b);
      _inputCursor = _input.length;
    }
    notifyListeners();
  }

  void toggleOverlay() {
    _overlayOpen = !_overlayOpen;
    notifyListeners();
  }

  // ── Composition helpers ────────────────────────────────────────────────

  void _removeTermAt(int index) {
    _terms = [..._terms.sublist(0, index), ..._terms.sublist(index + 1)];
    if (_cursorTerm > index) _cursorTerm--;
    if (index == 0 && _terms.isNotEmpty && _terms.first.subtract) {
      _terms = [
        _Term(_terms.first.value, _terms.first.unit),
        ..._terms.sublist(1),
      ];
    }
    _resultStep =
        _terms.isEmpty ? -1 : _resultStep.clamp(0, _resultViewCount - 1);
  }

  String _digitChar(int v) =>
      v < 10 ? String.fromCharCode(0x30 + v) : (v == 10 ? 'A' : 'B');

  void handleInputTapAtChar(int off) {
    final l = _buildInputLayout();
    final ps = l.pendingStart;
    final pe = l.pendingEnd;
    if (ps != null && pe != null && off >= ps && off <= pe) {
      moveInputCaret(off - ps);
      return;
    }
    var best = 0;
    var bestDist = (off - l.boundaries[0]).abs();
    for (var k = 1; k < l.boundaries.length; k++) {
      final d = (off - l.boundaries[k]).abs();
      if (d < bestDist) {
        bestDist = d;
        best = k;
      }
    }
    moveCursorToTermBoundary(best);
  }

  _InputLayout _buildInputLayout() {
    final sb = StringBuffer();
    var len = 0;
    var rendered = 0;
    Unit? prevUnit;
    final boundaries = List<int>.filled(_terms.length + 1, 0);
    int? pendingStart;
    int? pendingEnd;

    void emit(String s) {
      sb.write(s);
      len += s.length;
    }

    String opStr(bool subtract, Unit? thisUnit) {
      if (rendered == 0) return subtract ? '−' : '';
      if (subtract) return ' − ';
      if (prevUnit != null &&
          thisUnit != null &&
          prevUnit.symbol == thisUnit.symbol) {
        return ' + ';
      }
      return ' ';
    }

    final unitRanges = <(int, int)>[];
    final hasPending = _input.isNotEmpty || _heldUnit != null;
    for (var i = 0; i <= _terms.length; i++) {
      if (i == _cursorTerm && hasPending) {
        emit(opStr(_pendingSubtract, _heldUnit));
        pendingStart = len;
        emit(_input);
        pendingEnd = len;
        if (_heldUnit != null) {
          if (_input.isNotEmpty) emit(' ');
          final unitStart = len;
          emit(_heldUnit!.symbol);
          unitRanges.add((unitStart, len));
        }
        rendered++;
        prevUnit = _heldUnit;
      }
      if (i < _terms.length) {
        final t = _terms[i];
        emit(opStr(t.subtract, t.unit));
        boundaries[i] = len;
        emit('${formatBaseNum(t.value, base)} ');
        final unitStart = len;
        emit(t.unit.symbol);
        unitRanges.add((unitStart, len));
        rendered++;
        prevUnit = t.unit;
      } else {
        boundaries[i] = len;
      }
    }

    var text = sb.toString();
    int caret;
    if (pendingStart != null) {
      caret = pendingStart + _inputCursor;
    } else {
      caret = boundaries[_cursorTerm.clamp(0, _terms.length)];
    }
    if (text.isEmpty) {
      text = '0';
      caret = 0;
    }
    return _InputLayout(
        text, caret, pendingStart, pendingEnd, boundaries, unitRanges);
  }

  ConverterLine _breakdownLine() {
    final b = assetBreakdown(_activeGenus!, totalBase);
    final parts = b.parts;
    var start = 0;
    while (start < parts.length - 1 && parts[start].$2 == 0) {
      start++;
    }
    final sb = StringBuffer();
    final unitRanges = <(int, int)>[];
    if (b.negative) sb.write('−');
    for (var i = start; i < parts.length; i++) {
      if (i > start) sb.write(' ');
      final (unit, value) = parts[i];
      sb.write('${formatBaseNum(value, base)} ');
      final unitStart = sb.length;
      sb.write(unit.symbol);
      unitRanges.add((unitStart, sb.length));
    }
    final tb = _totalBracketInfo();
    return ConverterLine(
      sb.toString(),
      bracket: tb?.$1,
      bracketTenWorld: tb?.$2,
      unitRanges: unitRanges,
    );
  }

  // Bracket helpers return (text, tenWorld). Single-world genera (currencies)
  // show the value in the OTHER numeral base (like the time category); metals
  // show the magnitude-nearest partner in the other system.

  (String, bool)? _totalBracketInfo() {
    if (_terms.isEmpty) return null;
    final g = _activeGenus;
    if (g == null) return null;
    final ref = _terms.last.unit;
    final total = totalBase;
    if (g.singleWorld) {
      final otherBase = base == 12 ? 10 : 12;
      return (
        '${formatBaseNum(ref.fromBase(total), otherBase)} ${ref.symbol}',
        otherBase == 10,
      );
    }
    final partner = assetBracketPartner(g, ref);
    if (partner == null) return null;
    return (
      '${formatBaseNum(partner.fromBase(total), base)} ${partner.symbol}',
      _world == UnitWorld.imperial,
    );
  }

  (String, bool)? _bracketInfo(Unit unit, double value) {
    final g = _activeGenus;
    if (g == null) return null;
    if (g.singleWorld) {
      final otherBase = base == 12 ? 10 : 12;
      return (
        '${formatBaseNum(value, otherBase)} ${unit.symbol}',
        otherBase == 10,
      );
    }
    final partner = assetBracketPartner(g, unit);
    if (partner == null) return null;
    final bval = convert(value, unit, partner);
    return (
      '${formatBaseNum(bval, base)} ${partner.symbol}',
      _world == UnitWorld.imperial,
    );
  }
}
