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
import 'tokens.dart';

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

  /// Set by `calculateResult` when the rational track collapsed and the f64
  /// path was used instead. Drives the "≈"-suffix on the display. Replaces
  /// an older buffer-sniff (`resultBuffer.any(Decimal)`) that missed
  /// whole-number f64 fallbacks like `log(1) = 0`.
  bool _ratCollapsed = false;

  String? errorMsg;
  bool overlayOpen = false;
  AngleMode angleMode = AngleMode.deg;
  NumeralSystem numeralSystem = NumeralSystem.doz;
  InfoState infoState = const InfoClosed();

  /// True when the display should show the State-B "≈"-suffix.
  bool get isF64Fallback => errorMsg == null && _ratCollapsed;

  // --------------------------------------------------------------------
  // Click handling — 1:1 port of input.rs::handle_click.
  // --------------------------------------------------------------------

  void handleClick(CalcToken token) {
    // Error guard: only AC clears immediately; any input token also clears
    // and proceeds, but mode/navigation keys stay blocked until AC.
    if (errorMsg != null && token is! Ac) {
      if (_isErrorBlocked(token)) return;
      errorMsg = null;
      inputBuffer = const [];
      resultBuffer = const [Digit(DozenalDigit.d0)];
      resultPeriodStart = null;
      resultPeriodLen = 0;
      resultPeriodCapped = false;
      cursorPos = 0;
      resultFieldActive = false;
      _ratCollapsed = false;
    }

    final isOperator = token is Add ||
        token is Sub ||
        token is Mul ||
        token is Div ||
        token is ExpTopRight ||
        token is RootTopLeft ||
        token is OplusBotLeft ||
        token is LogBotRight;

    // After =, a new expression starts when most tokens arrive. Mode/overlay
    // controls and = itself are transparent.
    final startsNewExpr = resultFieldActive && !_isTransparentAfterEquals(token);

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
    if (token is ConstPi || token is ConstE || token is ConstPhi || token is ConstSqrt2) {
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
      }
      overlayOpen = false;
      return;
    }
    if (token is Dez) {
      if (numeralSystem != NumeralSystem.dez) {
        _convertBufferBase(from: 12, to: 10);
        numeralSystem = NumeralSystem.dez;
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
      token is TriangleLeft ||
      token is TriangleRight ||
      token is Expand ||
      token is Close ||
      // Memory ops too: otherwise Sto/Rcl/Mc/Ans after an error would clear
      // the error and dispatch with stale `lastAns`, mixing pre-error
      // memory state into the post-error buffer. User must AC first.
      token is Sto ||
      token is Rcl ||
      token is Mc ||
      token is Ans;

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
  }

  /// Invariant on error: clear lastAns so subsequent Ans / Rcl don't insert
  /// stale values from before the failure.
  void _failWithError(String msg) {
    errorMsg = msg;
    lastAns = null;
    lastResultF64 = 0.0;
    _ratCollapsed = false;
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
      final fracBudgetEnd =
          dec.intDigits.length + 1 + _bufferFracMaxDigits;
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

