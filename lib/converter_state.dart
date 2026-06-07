// Orchestrator for the unit-converter mode (the second calculator). A
// ChangeNotifier analogous to DozenalCalcState, but self-contained.
//
// Design + interaction model: docs/unit-converter.md §4 / §4a / §7.
//   - Doz/Dez = world toggle (imperial ↔ metric, base 12 ↔ 10).
//   - tap a category → expand its magnitude ladder; tap again → collapse.
//   - Compound input: type a number, tap a magnitude → commits a term; repeat.
//     Terms combine to a total (default +; − explicit). `=` walks the total
//     through the ladder and, in the imperial world, a mixed-radix breakdown.
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

  const ConverterLine(this.number, {this.unit, this.bracket});
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
/// position, the pending number's char range, and each term boundary's offset.
class _InputLayout {
  final String text;
  final int caret;
  final int? pendingStart;
  final int? pendingEnd;
  final List<int> boundaries;
  _InputLayout(
    this.text,
    this.caret,
    this.pendingStart,
    this.pendingEnd,
    this.boundaries,
  );
}

class ConverterState extends ChangeNotifier {
  UnitWorld _world = UnitWorld.imperial; // Doz world is the default
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

  // ── Public read model ──────────────────────────────────────────────────

  UnitWorld get world => _world;
  int get base => _world == UnitWorld.imperial ? 12 : 10;
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

  ConverterLine get topLine => ConverterLine(
        _expressionText,
        bracket: _terms.isEmpty ? null : _totalBracket(),
      );

  ConverterLine? get resultLine {
    if (!hasResult) return null;
    final ladder = currentLadder;
    if (_breakdownAvailable && _resultStep == ladder.length) {
      return _breakdownLine();
    }
    final unit = ladder[_resultStep.clamp(0, ladder.length - 1)];
    final value = unit.fromBase(totalSi);
    return ConverterLine(
      formatBaseNum(value, base),
      unit: unit.symbol,
      bracket: _bracketString(unit, value),
    );
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
    if (_input.contains('.')) return;
    if (_input.isEmpty) {
      _input = '0.';
      _inputCursor = 2;
    } else {
      _input = '${_input.substring(0, _inputCursor)}.'
          '${_input.substring(_inputCursor)}';
      _inputCursor++;
    }
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

  // ── Category / magnitude / equals ──────────────────────────────────────

  void tapCategory(UnitCategory category) {
    if (_activeCategory == category) {
      _magnitudesExpanded = !_magnitudesExpanded;
    } else {
      _activeCategory = category;
      _magnitudesExpanded = true;
      _terms = const [];
      _input = '';
      _inputCursor = 0;
      _cursorTerm = 0;
      _pendingSubtract = false;
      _resultStep = -1;
    }
    notifyListeners();
  }

  /// Commit the pending number as a term in [unit], inserted at the cursor's
  /// slot. Requires a pending number.
  void tapMagnitude(Unit unit) {
    if (_input.isEmpty) return;
    final ladder = currentLadder;
    final i = ladder.indexWhere((u) => u.symbol == unit.symbol);
    if (i < 0) return;
    final term = _Term(parseBaseNum(_input, base), unit,
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

  // ── World toggle (Doz/Dez) ─────────────────────────────────────────────

  void setWorld(UnitWorld w) {
    if (w == _world) return;
    final oldBase = base;
    final def = _def;
    final hadTerms = _terms.isNotEmpty;
    final total = hadTerms ? totalSi : 0.0;
    final ref = hadTerms ? _terms.last.unit : null;
    final pendingVal = _input.isEmpty ? null : parseBaseNum(_input, oldBase);

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
    // singleWorld (time): units are world-agnostic — terms stay; only the digit
    // base changes.

    if (pendingVal != null) {
      _input = formatBaseNum(pendingVal, base);
      _inputCursor = _input.length;
    }
    notifyListeners();
  }

  void toggleWorld() => setWorld(
      _world == UnitWorld.imperial ? UnitWorld.metric : UnitWorld.imperial);

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

  String get _expressionText => _buildInputLayout().text;

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
        emit('${formatBaseNum(t.value, base)} ${t.unit.symbol}');
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
    return _InputLayout(text, caret, pendingStart, pendingEnd, boundaries);
  }

  ConverterLine _breakdownLine() {
    final b = breakdown(_activeCategory!, totalSi);
    final parts = b.parts;
    var start = 0;
    while (start < parts.length - 1 && parts[start].$2 == 0) {
      start++;
    }
    final sb = StringBuffer();
    if (b.negative) sb.write('−');
    for (var i = start; i < parts.length; i++) {
      if (i > start) sb.write(' ');
      final (unit, value) = parts[i];
      sb.write('${formatBaseNum(value, base)} ${unit.symbol}');
    }
    return ConverterLine(sb.toString(), bracket: _totalBracket());
  }

  String? _totalBracket() {
    if (_terms.isEmpty) return null;
    final ref = _terms.last.unit;
    final total = totalSi;
    final cat = _activeCategory!;
    if (cat == UnitCategory.time) {
      final otherBase = base == 12 ? 10 : 12;
      return '${formatBaseNum(ref.fromBase(total), otherBase)} ${ref.symbol}';
    }
    final partner = bracketPartner(cat, ref);
    if (partner == null) return null;
    return '${formatBaseNum(partner.fromBase(total), base)} ${partner.symbol}';
  }

  String? _bracketString(Unit unit, double value) {
    final cat = _activeCategory;
    if (cat == null) return null;
    if (cat == UnitCategory.time) {
      final otherBase = base == 12 ? 10 : 12;
      return '${formatBaseNum(value, otherBase)} ${unit.symbol}';
    }
    final partner = bracketPartner(cat, unit);
    if (partner == null) return null;
    final bval = convert(value, unit, partner);
    return '${formatBaseNum(bval, base)} ${partner.symbol}';
  }
}
