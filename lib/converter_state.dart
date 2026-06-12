// Orchestrator for the unit-converter mode (the second calculator). A
// ChangeNotifier analogous to DozenalCalcState, but self-contained.
//
// Design + interaction model: docs/unit-converter.md §4 / §4a / §7.
//   - met/imp = unit-system toggle (imperial ↔ metric); the numeral base
//     (12 ↔ 10) is decoupled and follows the global setting via setBase.
//   - tap a category → expand its magnitude ladder; tap again → collapse.
//   - Compound input: type a number, tap a magnitude → commits a term; repeat.
//     Terms combine to a total (default +; − explicit). `=` walks the total
//     through the ladder and, in the imperial world, a mixed-radix breakdown.
//   - × / ÷ extend the pending entry into a scalar expression ("3×2", folded
//     left to right at the magnitude commit); on a committed compound they
//     first collapse it into editable digits (total in the working unit).
//   - temp is affine → single-term (each magnitude tap replaces the term).
//   - Edit cursor (Variant 2): a caret sits either inside the pending number
//     (digit-level) or at a term boundary. Tapping repositions it; digits
//     insert at the caret; a magnitude commits a term at the cursor's slot;
//     Del removes at the caret / the term before a boundary.

import 'package:flutter/foundation.dart';

import 'logic/base_num.dart';
import 'logic/unit_data.dart';
import 'logic/unit_convert.dart';

/// One rendered display line: a number (or composed expression / breakdown
/// string), an optional trailing unit, and an optional { } cross-world bracket.
@immutable
class ConverterLine {
  final String number;
  final String? unit;
  final String? bracket; // already "value symbol", e.g. "43.89 m"

  /// World hue of the bracket content (colour code "die Klammer leuchtet in
  /// der Farbe der Welt, die sie zeigt"): true → Ten world (green), false →
  /// Twelve world (violet). Null when there is no bracket.
  final bool? bracketTenWorld;

  /// Char ranges of unit symbols inside [number] — the system hue's carrier.
  /// Non-empty for the expression line and the breakdown line, where symbols
  /// live inside the composed string; plain numbers have none.
  final List<(int, int)> unitRanges;

  const ConverterLine(
    this.number, {
    this.unit,
    this.bracket,
    this.bracketTenWorld,
    this.unitRanges = const [],
  });
}

/// A committed (number, unit) term plus the operator joining it to the previous
/// term (`subtract` = the gap before it is −; the first term's flag is ignored).
@immutable
class _Term {
  final double value;
  final Unit unit;
  final bool subtract;
  const _Term(this.value, this.unit, {this.subtract = false});
}

/// Rendered input text plus the char offsets the display needs: the caret
/// position, the pending number's char range, each term boundary's offset,
/// and the unit-symbol ranges (system-hue colouring).
class _InputLayout {
  final String text;
  final int caret;
  final int? pendingStart;
  final int? pendingEnd;
  final List<int> boundaries;
  final List<(int, int)> unitRanges;
  _InputLayout(
    this.text,
    this.caret,
    this.pendingStart,
    this.pendingEnd,
    this.boundaries,
    this.unitRanges,
  );
}

class ConverterState extends ChangeNotifier {
  UnitWorld _world = UnitWorld.imperial; // imperial system is the default
  int _base = 12; // dozenal is the default; synced from the global setting
  UnitCategory? _activeCategory;
  bool _magnitudesExpanded = false;
  bool _overlayOpen = false;

  List<_Term> _terms = const [];
  String _input = ''; // pending number being typed
  bool _pendingSubtract = false; // operator for the next committed term
  int _resultStep = -1; // index into the result views (units + breakdown)

  // Edit cursor. `_cursorTerm` is the term slot the cursor sits at (0..N): the
  // pending number, if any, is inserted there. `_inputCursor` is the caret
  // within the pending number (0.._input.length). With no pending number the
  // cursor is a term boundary at `_cursorTerm`.
  int _cursorTerm = 0;
  int _inputCursor = 0;

  /// Bridge to the main calculator (the Ans key in Set 6): pulls the main
  /// calculator's last answer. Injected by the calc scaffold; null when the
  /// converter runs standalone (tests, preview) — Ans then stays inert/grey.
  double? Function()? calcAnsProvider;

  /// Whether the Ans key has something to insert AND the entry can take it
  /// (see [insertValueEntry]'s segment/sign rules).
  bool get calcAnsAvailable => _canInsertValue(calcAnsProvider?.call());

  /// Converter-local memory register (STO/RCL/MC in Set 6). Holds a plain
  /// number — the result-line value at store time. In-memory only, like the
  /// main calculator's register; survives AC and category switches.
  double? _memory;

  bool get memoryAvailable => _memory != null;

  /// STO takes the result-line value when terms are committed, otherwise
  /// the pending entry's value — "store what I typed" works without a unit.
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

  /// Numeral base, decoupled from the unit system since the colour rebuild:
  /// the global "Zahlensystem" setting drives it (synced by the calc
  /// scaffold), while [world] only selects imperial ↔ metric units. All four
  /// combinations are valid.
  int get base => _base;
  UnitCategory? get activeCategory => _activeCategory;
  bool get magnitudesExpanded => _magnitudesExpanded;
  bool get overlayOpen => _overlayOpen;

  /// Last committed unit — used by the keypad to gold-mark the working unit.
  Unit? get inputUnit => _terms.isEmpty ? null : _terms.last.unit;

  /// Whether `−` is armed for the next term (keypad indicator).
  bool get subtractArmed => _pendingSubtract;

  // Cursor read model (for the display caret + hit-testing).
  int get cursorTerm => _cursorTerm;
  int get inputCursor => _inputCursor;
  String get pendingInput => _input;

  CategoryDef? get _def =>
      _activeCategory == null ? null : kUnitCatalogue[_activeCategory];

  List<Unit> get currentLadder => _def?.ladderFor(_world) ?? const [];

  List<Unit> get magnitudeUnits =>
      _magnitudesExpanded ? currentLadder : const [];

  bool isCategoryActive(UnitCategory c) => _activeCategory == c;
  bool isDigitEnabled(int value) => value < base;

  bool get hasResult => _terms.isNotEmpty && _resultStep >= 0;
  int get termCount => _terms.length;

  /// Total of all committed terms, in SI base units.
  double get totalSi {
    var sum = 0.0;
    for (final t in _terms) {
      final v = t.unit.toBase(t.value);
      sum += t.subtract ? -v : v;
    }
    return sum;
  }

  bool get _breakdownAvailable =>
      _world == UnitWorld.imperial &&
      _def != null &&
      _def!.hasBreakdown &&
      _terms.isNotEmpty;

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
    final value = unit.fromBase(totalSi);
    final b = _bracketInfo(unit, value);
    return ConverterLine(
      formatBaseNum(value, base),
      unit: unit.symbol,
      bracket: b?.$1,
      bracketTenWorld: b?.$2,
    );
  }

  /// What this converter offers to the main calculator's CONV key: the
  /// number currently shown on the result line (the total in the `=`-cycled
  /// unit). While the breakdown view is showing — or before the first
  /// result step — the total in the working unit (the last committed one).
  /// Null when nothing has been committed yet.
  double? get ansForBridge {
    if (_terms.isEmpty) return null;
    final ladder = currentLadder;
    if (_resultStep >= 0 && _resultStep < ladder.length) {
      return ladder[_resultStep].fromBase(totalSi);
    }
    return _terms.last.unit.fromBase(totalSi);
  }

  // ── Input handlers ─────────────────────────────────────────────────────

  void inputDigit(int value) {
    if (value >= base) return; // A/B not valid in base 10
    _input = _input.substring(0, _inputCursor) +
        _digitChar(value) +
        _input.substring(_inputCursor);
    _inputCursor++;
    notifyListeners();
  }

  void inputDecimal() {
    // One dot per scalar SEGMENT (the pending entry may hold "1.5×2.5"):
    // walk the current segment around the caret, bounded by × / ÷.
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
      // Segment start (entry start or right after an operator): seed "0.".
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

  /// Scalar operators inside the pending entry (× ÷ ⊕ ^ √ ㏒): "3×2",
  /// folded left to right when a magnitude commits it — a quantity combined
  /// with unitless numbers stays in its category, so no unit algebra is
  /// needed. On an empty pending entry with committed terms, the compound
  /// first collapses into editable digits — the total in the working unit,
  /// same idiom as the world switch — so `3 ft → × → 2 → ft` works as
  /// naturally as `3 × 2 → ft`.
  void inputScalarOp(String op) {
    assert(isScalarOpChar(op), 'not a scalar operator: $op');
    final ch = op;
    if (_input.isEmpty) {
      if (_terms.isEmpty) return;
      final unit = _terms.last.unit;
      _input = formatBaseNum(unit.fromBase(totalSi), base);
      _terms = const [];
      _cursorTerm = 0;
      _pendingSubtract = false;
      _resultStep = -1;
      _inputCursor = _input.length;
    }
    // Insert at the caret, refusing positions that would create a leading,
    // doubled, or sign-adjacent operator.
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
    if (_input.isNotEmpty && _inputCursor > 0) {
      _input = _input.substring(0, _inputCursor - 1) +
          _input.substring(_inputCursor);
      _inputCursor--;
    } else if (_input.isEmpty && _cursorTerm > 0) {
      _removeTermAt(_cursorTerm - 1);
    } else if (_input.isNotEmpty && _inputCursor == 0 && _cursorTerm > 0) {
      // caret at the very start of the pending number → delete the term before
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
    _activeCategory = null;
    _magnitudesExpanded = false;
    _resultStep = -1;
    notifyListeners();
  }

  /// Set the operator for the next term. + is the default; − is explicit.
  void setSubtract(bool subtract) {
    if (_pendingSubtract == subtract) return;
    _pendingSubtract = subtract;
    notifyListeners();
  }

  /// Ans (Set 6): insert the main calculator's last answer into the pending
  /// entry via [insertValueEntry] — the carried value then awaits a
  /// magnitude tap exactly like a typed one, and composes with the scalar
  /// operators (`3×Ans`).
  void insertCalcAns() {
    final v = calcAnsProvider?.call();
    if (v == null) return;
    insertValueEntry(v);
  }

  /// Whether [insertValueEntry] would accept [v] right now. Positive values
  /// always fit (they replace the caret's segment); negative values need
  /// the replacement to cover the WHOLE entry — their sign lives on the
  /// term gap, which is correct for the whole term but not factorable
  /// through ^/√/㏒ mid-entry.
  bool _canInsertValue(double? v) {
    if (v == null || !v.isFinite) return false;
    if (v < -1e-9) {
      final (s, e) = _segmentBoundsAtCaret();
      return s == 0 && e == _input.length;
    }
    return true;
  }

  /// The scalar segment the caret sits in, bounded by × ÷ ⊕ ^ √ ㏒.
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

  /// Insert a plain value (a constant, the memory register, the main
  /// calculator's answer) as digits, REPLACING the scalar segment the caret
  /// sits in ("4|×2" + π → "3.184809×2"; an empty segment is a plain
  /// insert). Value keys thus always act visibly and never splice digits
  /// into a half-typed number. A negative value must cover the whole entry
  /// and arms the − term operator (the converter's sign model keeps signs
  /// on the term gaps).
  void insertValueEntry(double v) {
    if (!_canInsertValue(v)) return;
    // Snap f64 noise (e.g. −1e−16) to zero so it can't arm a spurious −.
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
    _overlayOpen = false; // value keys live in the overlay — close like main
    notifyListeners();
  }

  // ── Category / magnitude / equals ──────────────────────────────────────

  void tapCategory(UnitCategory category) {
    if (_activeCategory == category) {
      _magnitudesExpanded = !_magnitudesExpanded;
    } else {
      _activeCategory = category;
      _magnitudesExpanded = true;
      _terms = const [];
      // The pending number (and an armed −) survives the switch: it is
      // unit-less, so "type first, then choose the category" works — and so
      // does the Ans bridge's insert-then-categorise flow. Committed terms
      // must go (their units belong to the old category).
      _cursorTerm = 0;
      _resultStep = -1;
    }
    notifyListeners();
  }

  /// Commit the pending entry as a term in [unit], inserted at the cursor's
  /// slot. Requires a pending entry; scalar expressions ("3×2") collapse to
  /// their value here.
  void tapMagnitude(Unit unit) {
    if (_input.isEmpty) return;
    final ladder = currentLadder;
    final i = ladder.indexWhere((u) => u.symbol == unit.symbol);
    if (i < 0) return;
    final term = _Term(parseScalarEntry(_input, base), unit,
        subtract: _pendingSubtract);
    if (_def!.affine) {
      _terms = [term]; // temperature: single term
      _cursorTerm = 1;
    } else {
      _terms = [
        ..._terms.sublist(0, _cursorTerm),
        term,
        ..._terms.sublist(_cursorTerm),
      ];
      _cursorTerm++;
    }
    _pendingSubtract = false;
    _input = '';
    _inputCursor = 0;
    _resultStep = i;
    notifyListeners();
  }

  /// `=` advances through the result views (each ladder unit, then the
  /// breakdown), wrapping at the end.
  void equals() {
    final count = _resultViewCount;
    if (_terms.isEmpty || count <= 0) return;
    _resultStep = (_resultStep < 0 ? 0 : (_resultStep + 1) % count);
    notifyListeners();
  }

  // ── Cursor (tap-to-position) ────────────────────────────────────────────

  /// Place the cursor at a term boundary (0..N). Discards an incomplete pending
  /// number (it has no unit yet, so it can't become a term).
  void moveCursorToTermBoundary(int boundary) {
    _input = '';
    _inputCursor = 0;
    _cursorTerm = boundary.clamp(0, _terms.length);
    notifyListeners();
  }

  /// Move the caret within the pending number. No-op if nothing is pending.
  void moveInputCaret(int caret) {
    if (_input.isEmpty) return;
    _inputCursor = caret.clamp(0, _input.length);
    notifyListeners();
  }

  /// Arrow-key navigation (physical keyboard): step the caret within the
  /// pending number, or — with nothing pending — the cursor across term
  /// boundaries. Never discards the pending number (unlike a boundary tap):
  /// at its edge the key simply stops.
  void moveCaretLeft() {
    if (_input.isNotEmpty) {
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
    if (_input.isNotEmpty) {
      if (_inputCursor < _input.length) {
        _inputCursor++;
        notifyListeners();
      }
    } else if (_cursorTerm < _terms.length) {
      _cursorTerm++;
      notifyListeners();
    }
  }

  // ── World toggle (Doz/Dez) ─────────────────────────────────────────────

  /// Switch the unit system (imperial ↔ metric) — value-preserving: committed
  /// terms collapse to the partner unit of the working one. The numeral base
  /// is NOT touched (decoupled; see [setBase]).
  void setWorld(UnitWorld w) {
    if (w == _world) return;
    final def = _def;
    final hadTerms = _terms.isNotEmpty;
    final total = hadTerms ? totalSi : 0.0;
    final ref = hadTerms ? _terms.last.unit : null;

    _world = w;

    if (hadTerms && def != null && !def.singleWorld) {
      final partner = bracketPartner(_activeCategory!, ref!);
      if (partner != null) {
        _terms = [_Term(partner.fromBase(total), partner)];
        _cursorTerm = 1;
        final i = currentLadder.indexWhere((u) => u.symbol == partner.symbol);
        _resultStep = i < 0 ? 0 : i;
      }
    }
    // singleWorld (time): units are world-agnostic — terms stay unchanged.

    notifyListeners();
  }

  void toggleWorld() => setWorld(
      _world == UnitWorld.imperial ? UnitWorld.metric : UnitWorld.imperial);

  /// Switch the numeral base (12 ↔ 10) — value-preserving: the pending
  /// number's digits are re-rendered in the new base; committed terms store
  /// plain doubles and merely format differently. Driven by the global
  /// "Zahlensystem" setting via the calc scaffold; the converter has no own
  /// base keys anymore.
  void setBase(int b) {
    if (b == _base) return;
    final from = _base;
    _base = b;
    if (_input.isNotEmpty) {
      // Re-render number for number; × / ÷ operators stay in place.
      _input = reformatScalarEntry(_input, from, b);
      _inputCursor = _input.length;
    }
    notifyListeners();
  }

  void toggleOverlay() {
    _overlayOpen = !_overlayOpen;
    notifyListeners();
  }

  // ── Composition helpers ─────────────────────────────────────────────────

  void _removeTermAt(int index) {
    _terms = [..._terms.sublist(0, index), ..._terms.sublist(index + 1)];
    if (_cursorTerm > index) _cursorTerm--;
    _resultStep =
        _terms.isEmpty ? -1 : _resultStep.clamp(0, _resultViewCount - 1);
  }

  String _digitChar(int v) =>
      v < 10 ? String.fromCharCode(0x30 + v) : (v == 10 ? 'A' : 'B');

  /// Display read model for the input line: the rendered text and the caret's
  /// character offset within it. The display measures pixels↔chars; the state
  /// owns chars↔cursor (see [handleInputTapAtChar]).
  ({String text, int caret}) get inputLayout {
    final l = _buildInputLayout();
    return (text: l.text, caret: l.caret);
  }

  /// Map a tapped character offset in the rendered input text to a cursor move:
  /// inside the pending number → caret; otherwise → nearest term boundary.
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

  /// Builds the rendered input text (committed terms + pending number at the
  /// cursor slot) together with the char offsets needed for the caret and
  /// tap mapping. `+` is hidden unless ambiguous (same magnitude); `−` shown.
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
    for (var i = 0; i <= _terms.length; i++) {
      if (i == _cursorTerm && _input.isNotEmpty) {
        emit(opStr(_pendingSubtract, null));
        pendingStart = len;
        emit(_input);
        pendingEnd = len;
        rendered++;
        prevUnit = null;
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
    final b = breakdown(_activeCategory!, totalSi);
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

  // Bracket helpers return (text, tenWorld): the colour code paints every
  // { } in the hue of the world it shows — the partner SYSTEM normally, the
  // other BASE for the world-agnostic time category.

  (String, bool)? _totalBracketInfo() {
    if (_terms.isEmpty) return null;
    final ref = _terms.last.unit;
    final total = totalSi;
    final cat = _activeCategory!;
    if (cat == UnitCategory.time) {
      final otherBase = base == 12 ? 10 : 12;
      return (
        '${formatBaseNum(ref.fromBase(total), otherBase)} ${ref.symbol}',
        otherBase == 10,
      );
    }
    final partner = bracketPartner(cat, ref);
    if (partner == null) return null;
    return (
      '${formatBaseNum(partner.fromBase(total), base)} ${partner.symbol}',
      _world == UnitWorld.imperial, // partner system is the metric/Ten world
    );
  }

  (String, bool)? _bracketInfo(Unit unit, double value) {
    final cat = _activeCategory;
    if (cat == null) return null;
    if (cat == UnitCategory.time) {
      final otherBase = base == 12 ? 10 : 12;
      return (
        '${formatBaseNum(value, otherBase)} ${unit.symbol}',
        otherBase == 10,
      );
    }
    final partner = bracketPartner(cat, unit);
    if (partner == null) return null;
    final bval = convert(value, unit, partner);
    return (
      '${formatBaseNum(bval, base)} ${partner.symbol}',
      _world == UnitWorld.imperial,
    );
  }
}
