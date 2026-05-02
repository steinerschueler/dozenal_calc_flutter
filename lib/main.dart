// Step 11+13 of PORTING.md: live state, Info-modal navigation, polishing.
// Adds physical-keyboard input mapping (port of input.rs::handle_keyboard).

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'display.dart';
import 'info_pages.dart';
import 'keypad.dart';
import 'logic/dozenal_digit.dart';
import 'logic/expression.dart';
import 'state.dart';
import 'tokens.dart';

void main() => runApp(const DozenalCalcApp());

class DozenalCalcApp extends StatelessWidget {
  const DozenalCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dozenal Calc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        // Custom press-color feedback already covers tap state — disable
        // the Material splash to avoid double feedback.
        splashFactory: NoSplash.splashFactory,
      ),
      home: const _CalcScaffold(),
    );
  }
}

// ---------------------------------------------------------------------------
// Keyboard mapping (port of src/input.rs::handle_keyboard).
// Character-based keys handle the locale-aware `+`, `-`, etc. (e.g. Shift+= → +).
// Logical keys cover non-character keys (Enter, Backspace, arrows, …).
// ---------------------------------------------------------------------------

const Map<String, CalcToken> _charKeyMap = {
  '0': Digit(DozenalDigit.d0),
  '1': Digit(DozenalDigit.d1),
  '2': Digit(DozenalDigit.d2),
  '3': Digit(DozenalDigit.d3),
  '4': Digit(DozenalDigit.d4),
  '5': Digit(DozenalDigit.d5),
  '6': Digit(DozenalDigit.d6),
  '7': Digit(DozenalDigit.d7),
  '8': Digit(DozenalDigit.d8),
  '9': Digit(DozenalDigit.d9),
  'a': Digit(DozenalDigit.d10),
  'A': Digit(DozenalDigit.d10),
  'b': Digit(DozenalDigit.d11),
  'B': Digit(DozenalDigit.d11),
  '+': Add(),
  '-': Sub(),
  '*': Mul(),
  '/': Div(),
  '^': ExpTopRight(),
  '.': Decimal(),
  '=': Equals(),
  '(': ParenOpen(),
  ')': ParenClose(),
};

final Map<LogicalKeyboardKey, CalcToken> _logicalKeyMap = {
  LogicalKeyboardKey.enter: const Equals(),
  LogicalKeyboardKey.numpadEnter: const Equals(),
  LogicalKeyboardKey.numpadEqual: const Equals(),
  LogicalKeyboardKey.backspace: const Del(),
  LogicalKeyboardKey.escape: const Ac(),
  LogicalKeyboardKey.arrowLeft: const TriangleLeft(),
  LogicalKeyboardKey.arrowRight: const TriangleRight(),
  // Numpad fall-throughs in case the platform doesn't emit `character`.
  LogicalKeyboardKey.numpadAdd: const Add(),
  LogicalKeyboardKey.numpadSubtract: const Sub(),
  LogicalKeyboardKey.numpadMultiply: const Mul(),
  LogicalKeyboardKey.numpadDivide: const Div(),
  LogicalKeyboardKey.numpadDecimal: const Decimal(),
};

CalcToken? _tokenForKey(KeyEvent event) {
  final ch = event.character;
  if (ch != null) {
    final t = _charKeyMap[ch];
    if (t != null) return t;
  }
  return _logicalKeyMap[event.logicalKey];
}

class _CalcScaffold extends StatefulWidget {
  const _CalcScaffold();

  @override
  State<_CalcScaffold> createState() => _CalcScaffoldState();
}

class _CalcScaffoldState extends State<_CalcScaffold> {
  final DozenalCalcState _state = DozenalCalcState();
  final FocusNode _focusNode = FocusNode(debugLabel: 'calc-keyboard');

  @override
  void initState() {
    super.initState();
    _state.addListener(_onStateChanged);
  }

  @override
  void dispose() {
    _state.removeListener(_onStateChanged);
    _focusNode.dispose();
    _state.dispose();
    super.dispose();
  }

  /// When handle_click sets `infoState` to InfoList, reset it locally and
  /// push the Info route. The Navigator drives all further list/detail/back
  /// transitions; state.infoState stays Closed.
  void _onStateChanged() {
    if (_state.infoState is! InfoClosed) {
      _state.infoState = const InfoClosed();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const InfoListPage()),
      ).then((_) {
        // After returning from Info, refocus so the keyboard listener is live again.
        if (mounted) _focusNode.requestFocus();
      });
    }
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final token = _tokenForKey(event);
    if (token == null) return KeyEventResult.ignored;
    _state.handleClick(token);
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListenableBuilder(
              listenable: _state,
              builder: (ctx, _) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TwoLineDisplay(
                      inputBuffer: _state.inputBuffer,
                      cursorPos: _state.cursorPos,
                      resultBuffer: _state.resultBuffer,
                      resultCursorPos: _state.resultCursorPos,
                      resultFieldActive: _state.resultFieldActive,
                      resultPeriodStart: _state.resultPeriodStart,
                      resultPeriodLen: _state.resultPeriodLen,
                      resultPeriodCapped: _state.resultPeriodCapped,
                      isF64Fallback: _state.isF64Fallback,
                      errorMsg: _state.errorMsg,
                      memoryActive: _state.memory.isNotEmpty,
                      angleModeLabel: _state.angleMode.label,
                      decimalDisplay: _state.displayDec
                          ? formatDecimalResult(
                              _state.lastAns?.toDouble() ??
                                  _state.lastResultF64)
                          : null,
                    ),
                    const SizedBox(height: 14),
                    Stack(
                      children: [
                        IgnorePointer(
                          ignoring: _state.overlayOpen,
                          child: Keypad(
                            onTap: _state.handleClick,
                            isArmed: _state.isArmed,
                          ),
                        ),
                        if (_state.overlayOpen)
                          Positioned.fill(
                            child: ColoredBox(
                              color: const Color.fromRGBO(0, 0, 0, 0.7),
                              child: OverlayKeypad(
                                onTap: _state.handleClick,
                                isArmed: _state.isArmed,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
