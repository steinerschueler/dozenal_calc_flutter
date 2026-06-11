// Step 9 of PORTING.md: state management.
// Port of DozenalCalcApp (struct + handle_click + calculate_result + is_armed)
// from src/tokens.rs, src/input.rs, and src/eval.rs.
//
// This is the orchestrator: it owns the buffers, dispatches taps to the
// right pipeline (logic/, expression.dart, rat_parser.dart), and tells
// listeners to repaint via ChangeNotifier.notifyListeners.
//
// All list mutations create fresh instances so CustomPainter.shouldRepaint
// (compared via listEquals) detects the change.

import 'package:flutter/foundation.dart';

import 'logic/dozenal_converter.dart';
import 'logic/dozenal_digit.dart';
import 'logic/expression.dart';
import 'logic/rat_parser.dart';
import 'logic/rational.dart';
import 'logic/result_format.dart';
import 'tokens.dart';

/// One past calculation kept on the session history tape (#1). Stores enough
/// to re-render the expression + result faithfully (via [TwoLineDisplay]) and
/// to recall the value like `Ans` — the exact [ans] when the rational track
/// held, else the formatted [result] tokens.
class HistoryEntry {
  final List<CalcToken> input;
  final List<CalcToken> result;
  final int? periodStart;
  final int periodLen;
  final bool periodCapped;
  final Rational? ans;
  final double f64;
  final bool isF64;
  const HistoryEntry({
    required this.input,
    required this.result,
    required this.periodStart,
    required this.periodLen,
    required this.periodCapped,
    required this.ans,
    required this.f64,
    required this.isF64,
  });
}

class DozenalCalcState extends ChangeNotifier {
  List<CalcToken> inputBuffer = const [];
  List<CalcToken> resultBuffer = const [Digit(DozenalDigit.d0)];

  int? resultPeriodStart;
  int resultPeriodLen = 0;
  bool resultPeriodCapped = false;

  int cursorPos = 0;
  int resultCursorPos = 0;
  bool resultFieldActive = false;

  List<CalcToken> memory = const [];
  Rational? memoryRational;

  Rational? lastAns;
  double lastResultF64 = 0.0;

  /// Session history tape (#1): past calculations, newest last, capped at 30.
  /// Survives AC (tape character); not persisted across app restarts.
  final List<HistoryEntry> history = [];

  /// Set by `calculateResult` when the rational track collapsed and the f64
  /// path was used instead. Drives the "≈"-suffix on the display. Replaces
  /// an older buffer-sniff (`resultBuffer.any(Decimal)`) that missed
  /// whole-number f64 fallbacks like `log(1) = 0`.
  bool _ratCollapsed = false;

  /// True when [resultBuffer] holds a live computed result (set by
  /// [calculateResult]) rather than the cleared "0" sentinel (set by AC).
  /// Gates [_reformatResultInBase] so a Doz↔Dez switch after AC doesn't
  /// resurrect the last computed value onto a screen that already reads 0.
  bool _resultLive = false;

  String? errorMsg;
  bool overlayOpen = false;

  /// Which overlay page is showing in Hoch mode: 0 = Sets 6–10 (memory,
  /// constants, hyperbolic, extended), 1 = function keys (#2–#4). Swipe
  /// left/right on the open overlay flips it; opening always resets to 0.
  int overlayPage = 0;

  AngleMode angleMode = AngleMode.deg;
  NumeralSystem numeralSystem = NumeralSystem.doz;
  InfoState infoState = const InfoClosed();

  /// True when the display should show the State-B "≈"-suffix.
  bool get isF64Fallback => errorMsg == null && _ratCollapsed;

  /// The current result as a plain 0-9/A/B string — digits, decimal point,
  /// leading minus — for the clipboard copy and the cross-base comparison.
  /// See [resultBufferToString].
  String get resultText => resultBufferToString(resultBuffer);

  /// The current result expressed in the *other* numeral system, as a compact
  /// 0-9AB string for the small "{…}" reference on the result line — a dozenal
  /// `A` reads `10`, a dozenal `10` reads `12`. Null when there's no live
  /// result, on error, or when both systems render the value identically
  /// (integers below ten / zero), so the bracket only shows when it adds
  /// information. Lets a learner read a dozenal value in decimal — and vice
  /// versa — without switching modes.
  String? get resultCrossBracket {
    if (!_resultLive || errorMsg != null) return null;
    final otherBase = numeralSystem == NumeralSystem.doz ? 10 : 12;
    final cross = lastAns != null
        ? compactRationalString(lastAns!, otherBase)
        : compactF64String(lastResultF64, otherBase);
    return cross == resultText ? null : cross;
  }

  // --------------------------------------------------------------------
  /// Tap-to-position the input cursor (the fine red line). [pos] is a gap
  /// index into the input buffer. Switches focus to the input line and, like
  /// the arrow keys, preserves any error message as context.
  void moveCursorTo(int pos) {
    final clamped = pos.clamp(0, inputBuffer.length);
    if (resultFieldActive == false && cursorPos == clamped) return;
    resultFieldActive = false;
    cursorPos = clamped;
    notifyListeners();
  }

  /// Flip the extended-sets page (0 = Sets 6-10, 1 = function keys). Fired
  /// by the edge arrows and the Hoch overlay swipe. Deliberately NOT gated
  /// on [overlayOpen]: in Breit mode the third group pages while no overlay
  /// exists (overlayOpen stays false there — it's a Hoch-only concept).
  /// No-op when already on page [p].
  void setOverlayPage(int p) {
    if (overlayPage == p) return;
    overlayPage = p;
    notifyListeners();
  }

  /// Direct angle-mode set from the settings page. The keypad's DRG key
  /// cycles deg → rad → grad via [handleClick] instead; this setter exists
  /// because a three-segment toggle addresses one specific mode. No-op when
  /// already in [m].
  void setAngleMode(AngleMode m) {
    if (angleMode == m) return;
    angleMode = m;
    notifyListeners();
  }

  // Click handling — 1:1 port of input.rs::handle_click.
  // --------------------------------------------------------------------

  void handleClick(CalcToken token) {
    // Error guard:
    //   - AC: full clear (handled by `token is! Ac` skipping this block).
    //   - Mode/memory/info tokens: blocked until AC (`_isErrorBlocked`).
    //   - Arrow keys: preserve error display + input + cursor, just move
    //     the cursor. Lets the user navigate inside the failing input to
    //     find the issue, with the error message still visible as context.
    //   - Anything else (Del, Digit, operators, Equals, …): clear the
    //     error message but keep input + cursor, then dispatch normally
    //     so the user can fix the syntax in place and re-evaluate.
    if (errorMsg != null && token is! Ac) {
      if (_isErrorBlocked(token)) return;
      if (token is! TriangleLeft && token is! TriangleRight) {
        errorMsg = null;
        _ratCollapsed = false;
      }
    }

    final isOperator =
        token is Add ||
        token is Sub ||
        token is Mul ||
        token is Div ||
        token is ExpTopRight ||
        token is RootTopLeft ||
        token is OplusBotLeft ||
        token is LogBotRight;

    // After =, a new expression starts when most tokens arrive. Mode/overlay
    // controls and = itself are transparent.
    final startsNewExpr =
        resultFieldActive && !_isTransparentAfterEquals(token);

    if (startsNewExpr) {
      inputBuffer = const [];
      cursorPos = 0;
      if (isOperator) {
        if (lastAns != null) {
          inputBuffer = [RatLit(lastAns!)];
        } else {
          inputBuffer = List.of(resultBuffer);
        }
        cursorPos = inputBuffer.length;
      }
    }

    if (token is! TriangleLeft && token is! TriangleRight) {
      resultFieldActive = false;
    }

    _dispatch(token);

    notifyListeners();
  }

  void _dispatch(CalcToken token) {
    if (token is Digit) {
      _insertAtCursor(token);
      return;
    }
    if (token is Equals) {
      calculateResult();
      return;
    }
    if (token is Ac) {
      inputBuffer = const [];
      resultBuffer = const [Digit(DozenalDigit.d0)];
      resultPeriodStart = null;
      resultPeriodLen = 0;
      resultPeriodCapped = false;
      cursorPos = 0;
      errorMsg = null;
      _ratCollapsed = false;
      _resultLive = false;
      return;
    }
    if (token is Del) {
      if (cursorPos > 0) {
        inputBuffer = List.of(inputBuffer)..removeAt(cursorPos - 1);
        cursorPos--;
      }
      return;
    }
    if (token is TriangleLeft) {
      if (resultFieldActive) {
        if (resultCursorPos > 0) resultCursorPos--;
      } else if (cursorPos > 0) {
        cursorPos--;
      }
      return;
    }
    if (token is TriangleRight) {
      if (resultFieldActive) {
        if (resultCursorPos < resultBuffer.length) resultCursorPos++;
      } else if (cursorPos < inputBuffer.length) {
        cursorPos++;
      }
      return;
    }
    if (token is Expand) {
      // Toggle: in the panel-swap UX a second Expand press closes the overlay,
      // since "tap outside to close" no longer applies without the floating
      // scrim. The Close token still works (Set 10 button) and any Sets 6-9
      // selection auto-closes via the per-token branches below.
      overlayOpen = !overlayOpen;
      if (overlayOpen) overlayPage = 0; // always open on the first page
      return;
    }
    if (token is Close) {
      overlayOpen = false;
      return;
    }
    // Set 6 — Memory
    if (token is Sto) {
      memory = List.of(resultBuffer);
      memoryRational = lastAns;
      overlayOpen = false;
      return;
    }
    if (token is Rcl) {
      if (memory.isNotEmpty) {
        if (memoryRational != null) {
          _insertAtCursor(RatLit(memoryRational!, label: 'M'));
        } else {
          for (final m in memory) {
            _insertAtCursor(m);
          }
        }
      }
      overlayOpen = false;
      return;
    }
    if (token is Mc) {
      memory = const [];
      memoryRational = null;
      overlayOpen = false;
      return;
    }
    if (token is Ans) {
      if (lastAns != null) {
        _insertAtCursor(RatLit(lastAns!));
      } else {
        for (final m in resultBuffer) {
          _insertAtCursor(m);
        }
      }
      overlayOpen = false;
      return;
    }
    // Set 7 — Constants (overlay)
    if (token.isIrrationalConstant) {
      _insertAtCursor(token);
      overlayOpen = false;
      return;
    }
    // Set 9 — Mod (overlay)
    if (token is Mod) {
      _insertAtCursor(token);
      overlayOpen = false;
      return;
    }
    // Function keys (#2-#4, overlay page 2).
    if (token is MemPlus || token is MemMinus) {
      // Accumulate the last result into the memory register, exactly (BigInt).
      final delta = lastAns;
      if (delta != null) {
        final cur = memoryRational ?? Rational.tryNew(BigInt.zero, BigInt.one)!;
        memoryRational = token is MemPlus ? cur.add(delta) : cur.sub(delta);
        memory = formatRationalResult(memoryRational!, base: activeBase).buf;
      }
      overlayOpen = false;
      return;
    }
    if (token is Square) {
      // x² is the `^2` shortcut: square the preceding value.
      _insertAtCursor(const ExpTopRight());
      _insertAtCursor(const Digit(DozenalDigit.d2));
      overlayOpen = false;
      return;
    }
    if (token is PlusMinus) {
      _toggleSignOfCurrentLiteral();
      overlayOpen = false;
      return;
    }
    if (token is Ln ||
        token is ExpE ||
        token is Log12 ||
        token is NCr ||
        token is NPr ||
        token is Sci) {
      _insertAtCursor(token);
      overlayOpen = false;
      return;
    }
    // Mode keys — never inserted
    if (token is Drg) {
      angleMode = angleMode.next;
      overlayOpen = false;
      return;
    }
    if (token is Doz) {
      if (numeralSystem != NumeralSystem.doz) {
        _convertBufferBase(from: 10, to: 12);
        numeralSystem = NumeralSystem.doz;
        _reformatResultInBase(12);
      }
      overlayOpen = false;
      return;
    }
    if (token is Dez) {
      if (numeralSystem != NumeralSystem.dez) {
        _convertBufferBase(from: 12, to: 10);
        numeralSystem = NumeralSystem.dez;
        _reformatResultInBase(10);
      }
      overlayOpen = false;
      return;
    }
    if (token is Info) {
      infoState = const InfoList();
      overlayOpen = false;
      return;
    }

    // Everything else: trig/hyperbolic functions (and their inverses), plus
    // Factorial / AbsVal / Reciprocal. Try the double-tap inverse toggle;
    // otherwise insert. Overlay tokens close the overlay after insertion.
    final toggled = _tryInverseToggle(token);
    if (!toggled) {
      _insertAtCursor(token);
    }
    if (token is Sinh ||
        token is Cosh ||
        token is Tanh ||
        token is Coth ||
        token is ArSinh ||
        token is ArCosh ||
        token is ArTanh ||
        token is ArCoth ||
        token is Factorial ||
        token is AbsVal ||
        token is Reciprocal) {
      overlayOpen = false;
    }
  }

  /// Returns the inverse counterpart for a function token, or null.
  CalcToken? _inverseSwap(CalcToken token, CalcToken prev) {
    if (token is Sin && prev is Sin) return const ArcSin();
    if (token is Sin && prev is ArcSin) return const Sin();
    if (token is Cos && prev is Cos) return const ArcCos();
    if (token is Cos && prev is ArcCos) return const Cos();
    if (token is Tan && prev is Tan) return const ArcTan();
    if (token is Tan && prev is ArcTan) return const Tan();
    if (token is Cot && prev is Cot) return const ArcCot();
    if (token is Cot && prev is ArcCot) return const Cot();
    if (token is Sinh && prev is Sinh) return const ArSinh();
    if (token is Sinh && prev is ArSinh) return const Sinh();
    if (token is Cosh && prev is Cosh) return const ArCosh();
    if (token is Cosh && prev is ArCosh) return const Cosh();
    if (token is Tanh && prev is Tanh) return const ArTanh();
    if (token is Tanh && prev is ArTanh) return const Tanh();
    if (token is Coth && prev is Coth) return const ArCoth();
    if (token is Coth && prev is ArCoth) return const Coth();
    return null;
  }

  bool _tryInverseToggle(CalcToken token) {
    if (cursorPos == 0) return false;
    final prev = inputBuffer[cursorPos - 1];
    final swap = _inverseSwap(token, prev);
    if (swap == null) return false;
    final newBuf = List.of(inputBuffer);
    newBuf[cursorPos - 1] = swap;
    inputBuffer = newBuf;
    return true;
  }

  void _insertAtCursor(CalcToken token) {
    if (token is Decimal && _hasDecimalInCurrentLiteral()) return;
    inputBuffer = List.of(inputBuffer)..insert(cursorPos, token);
    cursorPos++;
  }

  /// ± — toggle the sign of the number literal at/just before the cursor by
  /// adding or removing a unary minus in front of it.
  void _toggleSignOfCurrentLiteral() {
    var start = cursorPos;
    while (start > 0) {
      final prev = inputBuffer[start - 1];
      if (prev is Digit || prev is Decimal || prev is RatLit) {
        start--;
      } else {
        break;
      }
    }
    // A leading minus counts as unary when it sits at the start or right after
    // an operator / open paren (rather than acting as binary subtraction).
    final hasUnaryMinus =
        start > 0 &&
        inputBuffer[start - 1] is Sub &&
        (start - 1 == 0 || _isOperatorOrOpen(inputBuffer[start - 2]));
    if (hasUnaryMinus) {
      inputBuffer = List.of(inputBuffer)..removeAt(start - 1);
      if (cursorPos >= start) cursorPos--;
    } else {
      inputBuffer = List.of(inputBuffer)..insert(start, const Sub());
      if (cursorPos >= start) cursorPos++;
    }
  }

  bool _isOperatorOrOpen(CalcToken t) =>
      t is Add ||
      t is Sub ||
      t is Mul ||
      t is Div ||
      t is ExpTopRight ||
      t is RootTopLeft ||
      t is OplusBotLeft ||
      t is LogBotRight ||
      t is ParenOpen;

  /// True when the number literal under the cursor already contains a
  /// decimal point — used to prevent `1.2.3` style double-decimal input.
  /// Walks both directions through contiguous Digit/Decimal tokens until it
  /// hits an operator, paren, or function (which ends the current literal).
  /// Both directions are needed: with the cursor mid-literal a Decimal can
  /// sit on either side, and a single backward walk misses the case where
  /// the user navigated past the existing dot.
  bool _hasDecimalInCurrentLiteral() {
    for (var i = cursorPos - 1; i >= 0; i--) {
      final t = inputBuffer[i];
      if (t is Decimal) return true;
      if (t is! Digit) return false;
    }
    for (var i = cursorPos; i < inputBuffer.length; i++) {
      final t = inputBuffer[i];
      if (t is Decimal) return true;
      if (t is! Digit) return false;
    }
    return false;
  }

  bool _isErrorBlocked(CalcToken token) =>
      token is Drg ||
      token is Doz ||
      token is Dez ||
      token is Info ||
      token is Expand ||
      token is Close ||
      // Memory ops too: otherwise Sto/Rcl/Mc/Ans after an error would clear
      // the error and dispatch with stale `lastAns`, mixing pre-error
      // memory state into the post-error buffer. User must AC first.
      token is Sto ||
      token is Rcl ||
      token is Mc ||
      token is Ans ||
      token is MemPlus ||
      token is MemMinus;

  bool _isTransparentAfterEquals(CalcToken token) =>
      token is TriangleLeft ||
      token is TriangleRight ||
      token is Ac ||
      token is Equals ||
      token is Drg ||
      token is Doz ||
      token is Dez ||
      token is Info ||
      token is Expand ||
      token is Close ||
      token is Sto ||
      token is Mc;

  // --------------------------------------------------------------------
  // Calculation — 1:1 port of eval.rs::calculate_result.
  // --------------------------------------------------------------------

  /// Numeric base currently active (12 for dozenal, 10 for decimal).
  int get activeBase => numeralSystem == NumeralSystem.doz ? 12 : 10;

  void calculateResult() {
    final base = activeBase;
    // Empty buffer — typically after AC — should produce 0, not an
    // error: pressing = on nothing is a no-op rather than a syntax fault.
    if (inputBuffer.isEmpty) {
      errorMsg = null;
      lastAns = Rational.tryNew(BigInt.zero, BigInt.one);
      lastResultF64 = 0.0;
      _ratCollapsed = false;
      resultBuffer = const [Digit(DozenalDigit.d0)];
      resultPeriodStart = null;
      resultPeriodLen = 0;
      resultPeriodCapped = false;
      resultCursorPos = 0;
      resultFieldActive = true;
      _resultLive = true;
      return;
    }
    // Reorder postfix invocations (n!, |x|, 1/x) into prefix shape so
    // they evaluate as the button labels suggest. Both tracks see the
    // normalised form; prefix-style entry is untouched.
    final normalized = resolvePostfix(inputBuffer);
    final expanded = withImplicitMuls(normalized);
    final mathString = buildMevalString(expanded, base: base);
    final ratExprs = buildRatExpr(expanded, base: base);
    final ratResult = ratExprs == null ? null : evalRational(ratExprs);

    final f64 = evalF64(mathString, angleMode);
    if (f64 == null) {
      _failWithError('SYNTAX ERROR');
      return;
    }
    if (f64.isNaN) {
      _failWithError('DOMAIN ERROR');
      return;
    }
    if (f64.isInfinite) {
      _failWithError('DIV BY ZERO');
      return;
    }

    errorMsg = null;
    lastAns = ratResult;
    lastResultF64 = f64;
    _ratCollapsed = (ratResult == null);

    if (ratResult != null) {
      final r = formatRationalResult(ratResult, base: base);
      resultBuffer = r.buf;
      resultPeriodStart = r.meta.start;
      resultPeriodLen = r.meta.len;
      resultPeriodCapped = r.meta.capped;
    } else {
      resultBuffer = formatF64Result(f64, base: base);
      resultPeriodStart = null;
      resultPeriodLen = 0;
      resultPeriodCapped = false;
    }

    resultCursorPos = 0;
    resultFieldActive = true;
    _resultLive = true;

    // History tape (#1): record newest-last, cap 30, dedup a repeated `=`
    // on identical input so re-pressing equals doesn't spam the tape.
    if (history.isEmpty || !listEquals(history.last.input, inputBuffer)) {
      history.add(
        HistoryEntry(
          input: List.of(inputBuffer),
          result: List.of(resultBuffer),
          periodStart: resultPeriodStart,
          periodLen: resultPeriodLen,
          periodCapped: resultPeriodCapped,
          ans: lastAns,
          f64: lastResultF64,
          isF64: _ratCollapsed,
        ),
      );
      if (history.length > 30) history.removeAt(0);
    }
  }

  /// Recall a value from the history tape into the input — like `Ans`, but for
  /// a specific past result. Exact values return as an exact `RatLit`; f64
  /// fallbacks return as their formatted digits. Clears any error and, when a
  /// result is on screen, starts a fresh expression (same as typing a number).
  void recallHistory(HistoryEntry e) {
    if (errorMsg != null) {
      errorMsg = null;
      _ratCollapsed = false;
    }
    if (resultFieldActive) {
      inputBuffer = const [];
      cursorPos = 0;
    }
    resultFieldActive = false;
    if (e.ans != null) {
      _insertAtCursor(RatLit(e.ans!));
    } else {
      for (final m in e.result) {
        _insertAtCursor(m);
      }
    }
    notifyListeners();
  }

  /// Invariant on error: clear lastAns so subsequent Ans / Rcl don't insert
  /// stale values from before the failure.
  void _failWithError(String msg) {
    errorMsg = msg;
    lastAns = null;
    lastResultF64 = 0.0;
    _ratCollapsed = false;
    _resultLive = false;
  }

  /// Re-renders the result line from the stored result value in [base].
  /// Called after a Doz↔Dez switch so the displayed result follows the active
  /// numeral system instead of lingering in the old base's glyphs (e.g. the
  /// dozenal `A` would otherwise still show under a `DEZ` badge until the next
  /// `=`). Prefers the exact `lastAns`; falls back to the f64 result when the
  /// rational track had collapsed. Periodicity is recomputed for the new base,
  /// so an exact value can gain or lose its overline across the switch.
  void _reformatResultInBase(int base) {
    // Nothing to reformat when the screen shows the cleared "0" sentinel
    // (post-AC) rather than a live result — otherwise the stale lastAns /
    // lastResultF64 would be resurrected onto a display that reads 0.
    if (!_resultLive) return;
    if (lastAns != null) {
      final r = formatRationalResult(lastAns!, base: base);
      resultBuffer = r.buf;
      resultPeriodStart = r.meta.start;
      resultPeriodLen = r.meta.len;
      resultPeriodCapped = r.meta.capped;
    } else {
      resultBuffer = formatF64Result(lastResultF64, base: base);
      resultPeriodStart = null;
      resultPeriodLen = 0;
      resultPeriodCapped = false;
    }
  }

  // --------------------------------------------------------------------
  // Armed-marker query for the keypad.
  // --------------------------------------------------------------------

  /// True when a tap on `token` would toggle the previous buffer token to
  /// its inverse. Delegates to `_inverseSwap` so the armed-dot indicator
  /// stays consistent with the actual toggle behaviour — including the
  /// post-toggle state where the buffer holds the inverse (e.g. ArcSin)
  /// and another tap on Sin would toggle back.
  bool isArmed(CalcToken token) {
    if (cursorPos == 0) return false;
    return _inverseSwap(token, inputBuffer[cursorPos - 1]) != null;
  }

  // --------------------------------------------------------------------
  // Buffer-base conversion (Doz ↔ Dez switch).
  //
  // Walks the input buffer, re-interpreting each contiguous number literal
  // (Digit/Decimal sequence) from [from]-base to [to]-base. Operators,
  // functions, parens, and other non-numeric tokens are preserved
  // unchanged. Periodic fractions that don't terminate in the target base
  // are truncated to [_bufferFracMaxDigits] fractional digits — exact
  // round-trip is only guaranteed for values whose fraction is finite in
  // both bases. cursorPos is moved to the end of the rewritten buffer.
  // --------------------------------------------------------------------

  static const int _bufferFracMaxDigits = 12;

  void _convertBufferBase({required int from, required int to}) {
    final out = <CalcToken>[];
    var i = 0;
    while (i < inputBuffer.length) {
      final t = inputBuffer[i];
      if (t is Digit || t is Decimal) {
        final intD = <DozenalDigit>[];
        final fracD = <DozenalDigit>[];
        var inFrac = false;
        while (i < inputBuffer.length) {
          final tt = inputBuffer[i];
          if (tt is Digit) {
            if (inFrac) {
              fracD.add(tt.value);
            } else {
              intD.add(tt.value);
            }
            i++;
          } else if (tt is Decimal && !inFrac) {
            inFrac = true;
            i++;
          } else {
            break;
          }
        }
        out.addAll(_literalAsBase(intD, fracD, from: from, to: to));
      } else {
        out.add(t);
        i++;
      }
    }
    inputBuffer = out;
    cursorPos = inputBuffer.length;
  }

  /// Converts one number literal (split into integer + fractional digit
  /// lists, both in [from]-base) into a fresh CalcToken sequence in
  /// [to]-base. Non-terminating fractions are truncated.
  List<CalcToken> _literalAsBase(
    List<DozenalDigit> intDigits,
    List<DozenalDigit> fracDigits, {
    required int from,
    required int to,
  }) {
    if (intDigits.isEmpty && fracDigits.isEmpty) {
      return const <CalcToken>[];
    }
    final intVal = DozenalConverter.toDecimalExact(intDigits, base: from);
    Rational rat = Rational.tryNew(intVal, BigInt.one)!;
    if (fracDigits.isNotEmpty) {
      final fracNum = DozenalConverter.toDecimalExact(fracDigits, base: from);
      final fracDen = BigInt.from(from).pow(fracDigits.length);
      final fracRat = Rational.tryNew(fracNum, fracDen)!;
      rat = rat.add(fracRat);
    }
    final dec = rat.toDozenalPeriodic(base: to);
    final out = <CalcToken>[];
    // dec.intDigits is non-empty by construction (fromBigInt(0) returns [d0]).
    for (final d in dec.intDigits) {
      out.add(Digit(d));
    }
    if (dec.preDigits.isNotEmpty || dec.period.isNotEmpty) {
      out.add(const Decimal());
      // Cap is on the *fractional* digit count, computed in the target base
      // (dec.intDigits). The old check used the source-base intDigits.length
      // which is the wrong dimension after a base conversion.
      final fracBudgetEnd = dec.intDigits.length + 1 + _bufferFracMaxDigits;
      var fracEmitted = 0;
      for (final d in dec.preDigits) {
        if (out.length >= fracBudgetEnd) break;
        out.add(Digit(d));
        fracEmitted++;
      }
      // Period digits get inlined (no overline in the input buffer), capped
      // at the per-buffer digit budget. This is intentionally lossy.
      var p = 0;
      while (fracEmitted < _bufferFracMaxDigits && dec.period.isNotEmpty) {
        out.add(Digit(dec.period[p % dec.period.length]));
        p++;
        fracEmitted++;
      }
    }
    return out;
  }
}
