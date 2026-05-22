// Step 11+13 of PORTING.md: live state, Info-modal navigation, polishing.
// Adds physical-keyboard input mapping (port of input.rs::handle_keyboard).

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_layout.dart';
import 'display.dart';
import 'info_pages.dart';
import 'intro_pages.dart';
import 'keypad.dart';
import 'logic/dozenal_digit.dart';
import 'state.dart';
import 'tokens.dart';

/// SharedPreferences key for the "user has seen the intro" flag. Bump the
/// version suffix when the intro changes substantially enough to warrant
/// showing it again to existing users.
const String _kIntroSeenFlag = 'intro_seen_v2';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Edge-to-edge so the app's dark background paints under the nav bar
  // instead of leaving a bright gutter. SafeArea inside each scaffold keeps
  // the actual content above the nav bar. The transparent system-bar
  // backgrounds themselves are now set natively via enableEdgeToEdge() in
  // MainActivity.kt — that path uses WindowInsetsControllerCompat instead
  // of the SDK-35-deprecated Window.setStatusBarColor()/setNavigationBarColor(),
  // which is what Play Console flagged. We only keep the Dart call here
  // because it primes Flutter's own SystemChrome state and forwards the
  // icon-brightness preferences below.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Icon-brightness only — no bar-colour settings (those would re-trigger the
  // deprecated APIs inside Flutter's platform channel). Light icons on dark
  // app background; the actual transparent bars are handled natively.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const DozenalCalcApp());
}

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
  ',': Decimal(), // German keyboards use ',' as the decimal separator.
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
  // Digit fall-throughs: on Linux, `character` is sometimes empty for
  // top-row digits depending on keyboard layout, so we map logical keys
  // explicitly for every digit, both top-row and numpad.
  LogicalKeyboardKey.digit0: const Digit(DozenalDigit.d0),
  LogicalKeyboardKey.digit1: const Digit(DozenalDigit.d1),
  LogicalKeyboardKey.digit2: const Digit(DozenalDigit.d2),
  LogicalKeyboardKey.digit3: const Digit(DozenalDigit.d3),
  LogicalKeyboardKey.digit4: const Digit(DozenalDigit.d4),
  LogicalKeyboardKey.digit5: const Digit(DozenalDigit.d5),
  LogicalKeyboardKey.digit6: const Digit(DozenalDigit.d6),
  LogicalKeyboardKey.digit7: const Digit(DozenalDigit.d7),
  LogicalKeyboardKey.digit8: const Digit(DozenalDigit.d8),
  LogicalKeyboardKey.digit9: const Digit(DozenalDigit.d9),
  LogicalKeyboardKey.numpad0: const Digit(DozenalDigit.d0),
  LogicalKeyboardKey.numpad1: const Digit(DozenalDigit.d1),
  LogicalKeyboardKey.numpad2: const Digit(DozenalDigit.d2),
  LogicalKeyboardKey.numpad3: const Digit(DozenalDigit.d3),
  LogicalKeyboardKey.numpad4: const Digit(DozenalDigit.d4),
  LogicalKeyboardKey.numpad5: const Digit(DozenalDigit.d5),
  LogicalKeyboardKey.numpad6: const Digit(DozenalDigit.d6),
  LogicalKeyboardKey.numpad7: const Digit(DozenalDigit.d7),
  LogicalKeyboardKey.numpad8: const Digit(DozenalDigit.d8),
  LogicalKeyboardKey.numpad9: const Digit(DozenalDigit.d9),
  // Numpad operator fall-throughs in case the platform doesn't emit `character`.
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowIntro());
  }

  Future<void> _maybeShowIntro() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_kIntroSeenFlag) ?? false) return;
    if (!mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const IntroPage()),
    );
    await prefs.setBool(_kIntroSeenFlag, true);
    if (mounted) _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _state.removeListener(_onStateChanged);
    _focusNode.dispose();
    _state.dispose();
    super.dispose();
  }

  bool _isModeSelected(CalcToken token) {
    if (token is Doz) return _state.numeralSystem == NumeralSystem.doz;
    if (token is Dez) return _state.numeralSystem == NumeralSystem.dez;
    return false;
  }

  bool _isTokenDisabled(CalcToken token) {
    if (_state.numeralSystem != NumeralSystem.dez) return false;
    if (token is Digit) {
      return token.value == DozenalDigit.d10 ||
          token.value == DozenalDigit.d11;
    }
    return false;
  }

  void _openIntro() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const IntroPage()),
    ).then((_) {
      if (mounted) _focusNode.requestFocus();
    });
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
        body: ListenableBuilder(
          listenable: _state,
          builder: (ctx, _) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LayoutBuilder(
                builder: (innerCtx, constraints) {
                  // Display sizes itself proportionally (20 % of body height,
                  // clamped to [60, 170] dp). Keypad fills the rest via
                  // Expanded — no fixed pixel allocations.
                  final bodyH = constraints.maxHeight;
                  final displayH = displayHeightFor(bodyH);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: displayH,
                        child: TwoLineDisplay(
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
                          numeralSystemLabel:
                              _state.numeralSystem == NumeralSystem.doz
                                  ? 'DOZ'
                                  : 'DEZ',
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: Keypad(
                          onTap: _state.handleClick,
                          isArmed: _state.isArmed,
                          isSelected: _isModeSelected,
                          isDisabled: _isTokenDisabled,
                          onInfoTap: () => _state.handleClick(const Info()),
                          onHelpTap: _openIntro,
                          overlayOpen: _state.overlayOpen,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

