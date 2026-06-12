// Step 11+13 of PORTING.md: live state, Info-modal navigation, polishing.
// Adds physical-keyboard input mapping (port of input.rs::handle_keyboard).

import 'dart:async';

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_layout.dart';
import 'app_theme.dart';
import 'calc_prefs.dart';
import 'calc_scope.dart';
import 'converter_page.dart';
import 'converter_state.dart';
import 'display.dart';
import 'haptics.dart';
import 'info_pages.dart';
import 'intro_pages.dart';
import 'keypad.dart';
import 'l10n/app_localizations.dart';
import 'locale_notifier.dart';
import 'logic/base_num.dart';
import 'logic/dozenal_digit.dart';
import 'logic/glyph_style.dart';
import 'state.dart';
import 'tokens.dart';

/// SharedPreferences key for the "user has seen the intro" flag. Bump the
/// version suffix when the intro changes substantially enough to warrant
/// showing it again to existing users.
const String _kIntroSeenFlag = 'intro_seen_v3';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Edge-to-edge AND icon-brightness are now driven entirely by MainActivity.java
  // (EdgeToEdge.enable + WindowInsetsControllerCompat). We intentionally do NOT
  // call SystemChrome.setEnabledSystemUIMode / setSystemUIOverlayStyle here —
  // both routed through Flutter's PlatformPlugin, whose compiled methods still
  // statically reference Window.setStatusBarColor / setNavigationBarColor /
  // setNavigationBarDividerColor. Play Console's pre-launch scanner reads the
  // DEX statically, so any Dart call into these channels keeps PlatformPlugin
  // alive and the deprecated-API references with it — even when only brightness
  // flags are passed at runtime. The native path is purely WindowInsetsController
  // and leaves no deprecated references behind.
  runApp(const DozenalCalcApp());
}

class DozenalCalcApp extends StatefulWidget {
  const DozenalCalcApp({super.key});

  @override
  State<DozenalCalcApp> createState() => _DozenalCalcAppState();
}

class _DozenalCalcAppState extends State<DozenalCalcApp>
    with WidgetsBindingObserver {
  final LocaleNotifier _localeNotifier = LocaleNotifier();
  final GlyphStyleNotifier _glyphStyleNotifier = GlyphStyleNotifier();
  final HapticsNotifier _hapticsNotifier = HapticsNotifier();
  final CalcPrefsNotifier _calcPrefs = CalcPrefsNotifier();
  final ThemeNotifier _themeNotifier = ThemeNotifier();

  /// Native channel into MainActivity.java for the status/navigation-bar
  /// icon brightness. Deliberately NOT SystemChrome (see the comment in
  /// main()): our own channel ends in WindowInsetsControllerCompat and
  /// leaves no deprecated Window.* references in the DEX.
  static const MethodChannel _systemBars = MethodChannel(
    'app.weltanschauung.dozenal/system_bars',
  );

  /// Last value sent over [_systemBars]; avoids redundant platform calls on
  /// every theme notification.
  bool? _sentLightBars;

  // Owned here (not in _CalcScaffold) so it sits above the Navigator: the
  // settings page — pushed as a route — drives the live numeral system and
  // angle mode through CalcStateScope.
  final DozenalCalcState _calcState = DozenalCalcState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _themeNotifier.updatePlatformBrightness(
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
    _themeNotifier.addListener(_syncSystemBars);
    _localeNotifier.load();
    _glyphStyleNotifier.load();
    _hapticsNotifier.load();
    _themeNotifier.load();
    _calcPrefs.load().then((_) => _applyStartupPrefs());
    _calcState.addListener(_syncPrefsFromState);
  }

  @override
  void didChangePlatformBrightness() {
    _themeNotifier.updatePlatformBrightness(
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
  }

  /// Mirrors the resolved theme into the Android system-bar icon brightness.
  /// "Light bars" = light background = dark icons. No-op off Android (iOS/
  /// macOS/web have no such channel registered) and resilient in tests.
  Future<void> _syncSystemBars() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
    final lightBars = !_themeNotifier.colors.isDark;
    if (lightBars == _sentLightBars) return;
    _sentLightBars = lightBars;
    try {
      await _systemBars.invokeMethod<void>('setLight', lightBars);
    } on MissingPluginException {
      // Widget tests / platforms without the channel: ignore.
    }
  }

  /// One-time apply of the persisted numeral system / angle mode after the
  /// prefs finish loading. handleClick(Doz/Dez) runs the same buffer
  /// conversion path as the keypad keys — a no-op on the empty startup
  /// buffers, correct in the unlikely case the user already typed.
  void _applyStartupPrefs() {
    if (_calcPrefs.numeralSystem != _calcState.numeralSystem) {
      _calcState.handleClick(
        _calcPrefs.numeralSystem == NumeralSystem.dez
            ? const Dez()
            : const Doz(),
      );
    }
    _calcState.setAngleMode(_calcPrefs.angleMode);
  }

  /// After startup the calc state is the source of truth: every Doz/Dez/DRG
  /// change (keypad keys or settings toggles) flows through the state, and
  /// this listener mirrors it into the persisted prefs. The setters no-op on
  /// equal values, so ordinary keystrokes never touch disk.
  void _syncPrefsFromState() {
    if (!_calcPrefs.loaded) return;
    _calcPrefs.setNumeralSystem(_calcState.numeralSystem);
    _calcPrefs.setAngleMode(_calcState.angleMode);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _themeNotifier.removeListener(_syncSystemBars);
    _calcState.removeListener(_syncPrefsFromState);
    _localeNotifier.dispose();
    _glyphStyleNotifier.dispose();
    _hapticsNotifier.dispose();
    _themeNotifier.dispose();
    _calcPrefs.dispose();
    _calcState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      notifier: _localeNotifier,
      child: ThemeScope(
        notifier: _themeNotifier,
        child: GlyphStyleScope(
          notifier: _glyphStyleNotifier,
          child: HapticsScope(
            notifier: _hapticsNotifier,
            child: CalcPrefsScope(
              notifier: _calcPrefs,
              child: CalcStateScope(
                notifier: _calcState,
                child: ListenableBuilder(
                  listenable: Listenable.merge([
                    _localeNotifier,
                    _themeNotifier,
                  ]),
                  builder: (context, _) {
                    final colors = _themeNotifier.colors;
                    return MaterialApp(
                      onGenerateTitle: (ctx) =>
                          AppLocalizations.of(ctx).appTitle,
                      debugShowCheckedModeBanner: false,
                      locale: _localeNotifier.override,
                      supportedLocales: AppLocalizations.supportedLocales,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      localeResolutionCallback: resolveLocale,
                      // Thin ThemeData derived from the semantic palette so
                      // plain Material widgets (AppBar, Switch, dialogs,
                      // snackbars) follow without per-widget colors.
                      theme: ThemeData(
                        brightness: colors.brightness,
                        scaffoldBackgroundColor: colors.scaffoldBg,
                        appBarTheme: AppBarTheme(
                          backgroundColor: colors.appBarBg,
                          foregroundColor: colors.textPrimary,
                        ),
                        // Custom press-color feedback already covers tap
                        // state — disable the Material splash to avoid
                        // double feedback.
                        splashFactory: NoSplash.splashFactory,
                      ),
                      home: _CalcScaffold(state: _calcState),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
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
  const _CalcScaffold({required this.state});

  /// Owned by _DozenalCalcAppState (above the Navigator) so the settings
  /// page can reach it via CalcStateScope; the scaffold only listens.
  final DozenalCalcState state;

  @override
  State<_CalcScaffold> createState() => _CalcScaffoldState();
}

class _CalcScaffoldState extends State<_CalcScaffold> {
  DozenalCalcState get _state => widget.state;
  final FocusNode _focusNode = FocusNode(debugLabel: 'calc-keyboard');

  /// The unit converter is page 2 of a horizontal pager (swipe left from the
  /// main calculator, swipe right to come back). Its state lives here — not
  /// in the page widget — so compound input survives page swipes, and so the
  /// Ans/CONV result bridge below can reach both calculators.
  final ConverterState _converterState = ConverterState();
  final PageController _pageController = PageController();

  /// Currently visible pager page (0 = main calculator, 1 = converter);
  /// routes physical-keyboard input to the right state.
  int _page = 0;

  // Page-peek indicator: two translucent rectangles (the current page
  // centred + outlined, the neighbour clipped by the screen edge) that pulse
  // briefly on every landing/swipe to make the horizontal pager
  // discoverable. [_pagePeekMounted] keeps the overlay in the tree only
  // while it is visible or fading, so the hidden state leaves no invisible
  // hit-test/semantics/finder surface behind.
  bool _pagePeekVisible = false;
  bool _pagePeekMounted = false;
  Timer? _pagePeekTimer;

  /// Show the page-peek indicator briefly (restarting the clock if it is
  /// already up). Fired on boot, on closing the intro, on returning from
  /// "Theory and More", and on every page change.
  void _pulsePagePeek() {
    _pagePeekTimer?.cancel();
    setState(() {
      _pagePeekMounted = true;
      _pagePeekVisible = true;
    });
    _pagePeekTimer = Timer(const Duration(milliseconds: 1050), () {
      if (mounted) setState(() => _pagePeekVisible = false);
    });
  }

  @override
  void initState() {
    super.initState();
    _state.addListener(_onStateChanged);
    // Result bridge: each calculator's "answer" key pulls the OTHER
    // calculator's current result (converter Ans ← calc answer; calc CONV ←
    // converter total). Values travel as doubles; each side formats them in
    // its own active base.
    _converterState.calcAnsProvider = () => _state.ansForBridge;
    _state.convAnsProvider = () => _converterState.ansForBridge;
    // Base/system decoupling: the global "Zahlensystem" (held by the calc
    // state, persisted via the settings page) drives the converter's digit
    // base too — initial value here, every later change via _onStateChanged.
    // The unit system stays converter-local (met/imp keys).
    _converterState.setBase(_state.activeBase);
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowIntro());
  }

  Future<void> _maybeShowIntro() async {
    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool(_kIntroSeenFlag) ?? false)) {
      if (!mounted) return;
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const IntroPage()));
      await prefs.setBool(_kIntroSeenFlag, true);
      if (mounted) _focusNode.requestFocus();
    }
    // Landing on the main calculator — first boot (after the intro closes)
    // or any later start: hint at the swipeable second page.
    if (mounted) _pulsePagePeek();
  }

  @override
  void dispose() {
    // The state itself is owned and disposed by _DozenalCalcAppState; the
    // bridge provider must not dangle into the disposed converter state.
    _state.convAnsProvider = null;
    _state.removeListener(_onStateChanged);
    _pagePeekTimer?.cancel();
    _converterState.dispose();
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Animate the pager to [page] (0 = main calculator, 1 = converter). Used
  /// by the info-list converter entry; the swipe gesture itself is handled
  /// by the PageView.
  void _goToPage(int page) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );
  }

  bool _isModeSelected(CalcToken token) {
    if (token is Doz) return _state.numeralSystem == NumeralSystem.doz;
    if (token is Dez) return _state.numeralSystem == NumeralSystem.dez;
    return false;
  }

  bool _isTokenDisabled(CalcToken token) {
    // CONV (the converter bridge) greys out while the converter holds no
    // result to pull — same affordance as the converter's Ans key.
    if (token is ConvAns) return _state.convAnsValue == null;
    if (_state.numeralSystem != NumeralSystem.dez) return false;
    if (token is Digit) {
      return token.value == DozenalDigit.d10 || token.value == DozenalDigit.d11;
    }
    return false;
  }

  /// Long-press on the display copies the current result (as a plain 0-9/A/B
  /// string) to the clipboard and confirms with a brief SnackBar. No-op while
  /// an error is shown, since the result line then displays the error message
  /// rather than a value.
  void _copyResult() {
    if (_state.errorMsg != null) return;
    final text = _state.resultText;
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).resultCopied(text)),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void _openIntro() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const IntroPage())).then((_) {
      if (mounted) {
        _focusNode.requestFocus();
        _pulsePagePeek(); // closing the intro lands on the main calculator
      }
    });
  }

  /// Result-history tape (#1), opened by swiping down on the display. Lists the
  /// session's past calculations (newest first), each rendered with the same
  /// TwoLineDisplay as the main screen; tapping one recalls its value into the
  /// input (exact when available) and closes the sheet.
  void _showHistory() {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    final entries = _state.history.reversed.toList();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: t.appBarBg,
      showDragHandle: true,
      builder: (sheetCtx) => SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(sheetCtx).size.height * 0.6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    l.historyTitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: t.textTertiary,
                    ),
                  ),
                ),
              ),
              if (entries.isEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                  child: Text(
                    l.historyEmpty,
                    style: TextStyle(fontSize: 14, color: t.textFaint),
                  ),
                )
              else
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    itemCount: entries.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (c, i) {
                      final e = entries[i];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _state.recallHistory(e);
                          Navigator.of(sheetCtx).pop();
                        },
                        child: SizedBox(
                          height: 70,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TwoLineDisplay(
                              inputBuffer: e.input,
                              resultBuffer: e.result,
                              resultPeriodStart: e.periodStart,
                              resultPeriodLen: e.periodLen,
                              resultPeriodCapped: e.periodCapped,
                              isF64Fallback: e.isF64,
                              showCursor: false,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// When handle_click sets `infoState` to InfoList, reset it locally and
  /// push the Info route. The Navigator drives all further list/detail/back
  /// transitions; state.infoState stays Closed. The converterRequested flag
  /// follows the same request/reset pattern: the info list's converter entry
  /// pops itself and asks the pager to swipe over.
  void _onStateChanged() {
    if (_state.infoState is! InfoClosed) {
      _state.infoState = const InfoClosed();
      _openInfo();
    }
    if (_state.converterRequested) {
      _state.converterRequested = false;
      _goToPage(1);
    }
    // Mirror the global numeral system into the converter's digit base
    // (no-op on equal values, so ordinary keystrokes cost nothing).
    _converterState.setBase(_state.activeBase);
  }

  void _openInfo() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const InfoListPage())).then((_) {
      // After returning from Info, refocus so the keyboard listener is live
      // again — and re-hint the pager (landing moment).
      if (mounted) {
        _focusNode.requestFocus();
        _pulsePagePeek();
      }
    });
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final token = _tokenForKey(event);
    if (token == null) return KeyEventResult.ignored;
    // While the converter page is showing, physical keys drive the converter
    // — never the hidden main calculator.
    if (_page == 1) {
      _handleConverterKey(token);
      return KeyEventResult.handled;
    }
    // Respect the same disable rule as the on-screen keypad: in Dez mode the
    // physical keys 'a'/'b' would otherwise inject base-12 digits (A/B) into a
    // base-10 literal, producing a silently malformed value. Swallow them so
    // the hardware keyboard and the (greyed-out) touch buttons behave alike.
    if (_isTokenDisabled(token)) return KeyEventResult.handled;
    _state.handleClick(token);
    return KeyEventResult.handled;
  }

  /// Maps the calc-token keyboard layer onto the converter's own handlers:
  /// digits, decimal point, the +/− term operators, the ×/÷ scalar-entry
  /// operators, =, Del, AC (Escape) and the caret arrows. Unmapped tokens
  /// are swallowed.
  void _handleConverterKey(CalcToken token) {
    final s = _converterState;
    switch (token) {
      case Digit():
        s.inputDigit(token.value.value);
      case Decimal():
        s.inputDecimal();
      case Add():
        s.setSubtract(false);
      case Sub():
        s.setSubtract(true);
      case Mul():
        s.inputScalarOp(kScalarTimes);
      case Div():
        s.inputScalarOp(kScalarDivide);
      case ExpTopRight():
        s.inputScalarOp(kScalarPower); // physical '^'
      case Equals():
        s.equals();
      case Del():
        s.del();
      case Ac():
        s.allClear();
      case TriangleLeft():
        s.moveCaretLeft();
      case TriangleRight():
        s.moveCaretRight();
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final prefs = CalcPrefsScope.of(context);
    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKey,
      child: Scaffold(
        body: SafeArea(
          // Force LTR for the calc UI itself — math notation flows
          // left-to-right universally (a Persian or Arabic reader
          // still writes `2 + 3 = 5` left-to-right with Western
          // digits), and the keypad layout / display cursor
          // direction must stay consistent regardless of the active
          // app locale. Text-heavy screens (info list, chapter
          // pages, intro, feedback, legal pages) keep the locale's
          // natural direction because they sit outside this wrap.
          // The wrap also pins the pager's page order physically:
          // the converter is always the LEFT swipe, even in RTL
          // locales.
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    _page = i;
                    _pulsePagePeek(); // every swipe re-shows the indicator
                  },
                  children: [
                    _calcPage(prefs),
                    ConverterBody(state: _converterState),
                  ],
                ),
                // Page-peek indicator: transient, never blocks input, and
                // unmounts entirely after the fade so it leaves no invisible
                // surfaces (hit tests, semantics, test finders) behind.
                if (_pagePeekMounted)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: ExcludeSemantics(
                        child: AnimatedOpacity(
                          opacity: _pagePeekVisible ? 1.0 : 0.0,
                          duration: Duration(
                            milliseconds: _pagePeekVisible ? 160 : 420,
                          ),
                          onEnd: () {
                            if (!_pagePeekVisible && mounted) {
                              setState(() => _pagePeekMounted = false);
                            }
                          },
                          child: _PagePeekOverlay(page: _page),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Page 0: the main calculator (display over keypad). Also listens to the
  /// converter state so the CONV key's enabled state stays fresh while both
  /// pages are visible mid-swipe.
  Widget _calcPage(CalcPrefsNotifier prefs) {
    return ListenableBuilder(
      listenable: Listenable.merge([_state, _converterState]),
      builder: (ctx, _) => Padding(
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
                    crossBaseBracket: _state.resultCrossBracket,
                    onInputCursorTap: _state.moveCursorTo,
                    onLongPress: _copyResult,
                    onSwipeDown: _showHistory,
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
                    overlayPage: _state.overlayPage,
                    onOverlayPageChanged: _state.setOverlayPage,
                    keypadMode: prefs.mode,
                    keypadProfile: prefs.profile,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// The page-peek indicator content: a translucent rectangle per pager page,
/// the current one centred with an outline, the neighbour offset past the
/// screen edge (clipped) — a minimap of the swipeable pages, with faint page
/// names. The host wraps it in IgnorePointer + ExcludeSemantics and fades it
/// in/out; this widget is purely visual.
class _PagePeekOverlay extends StatelessWidget {
  const _PagePeekOverlay({required this.page});

  /// The settled pager page (0 = main calculator, 1 = converter).
  final int page;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = AppColors.of(context);
    return LayoutBuilder(
      builder: (ctx, c) {
        final w = c.maxWidth;
        final h = c.maxHeight;
        // The cards are miniatures of the page itself — card aspect = body
        // aspect, so a portrait screen shows upright cards and a landscape
        // screen wide ones. Everything scales with the width, keeping the
        // same composition (center card, gap, neighbour clipped ~40 %) at
        // every size.
        final rectW = w * 0.38;
        final rectH = rectW * h / w;
        final gap = w * 0.08;
        final top = (h - rectH) / 2;
        final centerLeft = (w - rectW) / 2;

        Widget card(String label, {required bool current}) => Container(
              width: rectW,
              height: rectH,
              decoration: BoxDecoration(
                color: (t.isDark ? Colors.black : Colors.white)
                    .withValues(alpha: 0.40),
                borderRadius: BorderRadius.circular(6),
                border: current
                    ? Border.all(
                        color: t.accentGold.withValues(alpha: 0.70),
                        width: 2,
                      )
                    : null,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: t.textSecondary.withValues(alpha: 0.85),
                  ),
                ),
              ),
            );

        // Main calc card: centred on page 0, clipped off the left edge on
        // page 1; converter card mirrors that to the right. The Stack's
        // default hard-edge clip cuts the off-screen neighbour.
        final mainLeft =
            page == 0 ? centerLeft : centerLeft - gap - rectW;
        final convLeft =
            page == 0 ? centerLeft + rectW + gap : centerLeft;
        return Stack(
          children: [
            Positioned(
              top: top,
              left: mainLeft,
              child: card(l.pagerLabelMain, current: page == 0),
            ),
            Positioned(
              top: top,
              left: convLeft,
              child: card(l.infoListConverterEntry, current: page == 1),
            ),
          ],
        );
      },
    );
  }
}
