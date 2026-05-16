// Step 8 of PORTING.md: keypad widget for Sets 1-5 + Equals bar.
// Renders the main keypad (no overlay yet — Sets 6-10 land in step 10).
// Tap handlers feed CalcToken into the supplied onTap callback; state
// management (handle_click) is wired up in step 9.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_layout.dart';
import 'glyph_painter.dart';
import 'token_painter.dart';
import 'tokens.dart';

const Color _kDigitNormal = Colors.white;
const Color _kDigitPressed = Color(0xFFFFD700); // egui GOLD
const Color _kDigitDisabled = Color(0xFF606060); // muted grey when locked out
const Color _kOpNormal = Color(0xFF98C8FF); // egui LIGHT_BLUE
const Color _kOpPressed = Color(0xFFFF9090); // egui LIGHT_RED
const Color _kEquals = Color(0xFF8CDC8C); // egui LIGHT_GREEN
const Color _kBorder = Color(0xFF505050);
const Color _kAc = Color(0xFFFF4040); // warning red for the AC clear key
const Color _kAcPressed = Color(0xFFFF8080);
const Color _kOverlayBtnBg = Color(0xFF1F1F1F); // solid fill behind overlay
                                                // buttons so they read as a
                                                // floating card over the dimly
                                                // visible main keypad behind.

typedef TokenTapHandler = void Function(CalcToken token);

/// Returns true when `token` should display the inverse-armed marker
/// (yellow corner dot). Wired up in step 9.
typedef ArmedPredicate = bool Function(CalcToken token);

/// Returns true when [token] represents the currently active mode (e.g. the
/// selected NumeralSystem or AngleMode) and should be drawn with an
/// emphasised outline.
typedef SelectedPredicate = bool Function(CalcToken token);

/// Returns true when [token] must not be tappable (e.g. A/B digit keys
/// while the calculator is in decimal mode).
typedef DisabledPredicate = bool Function(CalcToken token);

class Keypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const Keypad({
    super.key,
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobileScreen(context)) {
      return _MobileKeypad(
        onTap: onTap,
        isArmed: isArmed,
        isSelected: isSelected,
        isDisabled: isDisabled,
        onInfoTap: onInfoTap,
        onHelpTap: onHelpTap,
      );
    }
    if (isTabletScreen(context)) {
      return _TabletKeypad(
        onTap: onTap,
        isArmed: isArmed,
        isSelected: isSelected,
        isDisabled: isDisabled,
        onInfoTap: onInfoTap,
        onHelpTap: onHelpTap,
      );
    }
    return _DesktopKeypad(
      onTap: onTap,
      isArmed: isArmed,
      isSelected: isSelected,
      isDisabled: isDisabled,
      onInfoTap: onInfoTap,
      onHelpTap: onHelpTap,
    );
  }
}

// ---------------------------------------------------------------------------
// Layout content shared by mobile and desktop.
// ---------------------------------------------------------------------------

const List<List<DozenalDigit>> _digitGrid = [
  [DozenalDigit.d10, DozenalDigit.d11, DozenalDigit.d0],
  [DozenalDigit.d7, DozenalDigit.d8, DozenalDigit.d9],
  [DozenalDigit.d4, DozenalDigit.d5, DozenalDigit.d6],
  [DozenalDigit.d1, DozenalDigit.d2, DozenalDigit.d3],
];

// Mobile op grid is read row-by-row; each column corresponds to a Set 1-4.
const List<List<CalcToken>> _mobileOpGrid = [
  [Add(), OplusBotLeft(), Sin(), ParenOpen()],
  [Sub(), ExpTopRight(), Cos(), ParenClose()],
  [Mul(), RootTopLeft(), Tan(), TriangleLeft()],
  [Div(), LogBotRight(), Cot(), TriangleRight()],
];

const List<CalcToken> _systemRow = [Ac(), Del(), Decimal(), Expand()];

// Desktop sets each render as a vertical column of four buttons.
const List<CalcToken> _set1 = [Add(), Sub(), Mul(), Div()];
const List<CalcToken> _set2 = [
  OplusBotLeft(),
  ExpTopRight(),
  RootTopLeft(),
  LogBotRight()
];
const List<CalcToken> _set3 = [Sin(), Cos(), Tan(), Cot()];
const List<CalcToken> _set4 = [
  ParenOpen(),
  ParenClose(),
  TriangleLeft(),
  TriangleRight()
];

// Overlay sets 6-10 — same column-per-set structure as the desktop main keypad.
const List<CalcToken> _set6 = [Sto(), Rcl(), Mc(), Ans()];
const List<CalcToken> _set7 = [
  ConstPi(),
  ConstE(),
  ConstPhi(),
  ConstSqrt2()
];
const List<CalcToken> _set8 = [Sinh(), Cosh(), Tanh(), Coth()];
const List<CalcToken> _set9 = [
  Factorial(),
  AbsVal(),
  Reciprocal(),
  Mod()
];
const List<CalcToken> _set10 = [Doz(), Dez(), Drg(), Close()];

// ---------------------------------------------------------------------------
// Mobile layout: digit grid stacked above 4×4 op grid + system row + Equals.
// ---------------------------------------------------------------------------

class _MobileKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _MobileKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
  });

  Widget _digitRow(List<DozenalDigit> digits) {
    final cells = <Widget>[];
    for (var i = 0; i < digits.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: mobileSpacing));
      final token = Digit(digits[i]);
      cells.add(
        Expanded(
          child: SizedBox(
            height: mobileButtonHeight,
            child: _DigitButton(
              digit: digits[i],
              onTap: () => onTap(token),
              disabled: isDisabled?.call(token) ?? false,
            ),
          ),
        ),
      );
    }
    return Row(children: cells);
  }

  Widget _tokenRow(List<CalcToken> tokens) {
    final cells = <Widget>[];
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: mobileSpacing));
      cells.add(
        Expanded(
          child: SizedBox(
            height: mobileButtonHeight,
            child: _TokenButton(
              token: tokens[i],
              onTap: () => onTap(tokens[i]),
              armed: isArmed?.call(tokens[i]) ?? false,
              selected: isSelected?.call(tokens[i]) ?? false,
            ),
          ),
        ),
      );
    }
    return Row(children: cells);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < _digitGrid.length; i++) ...[
          if (i > 0) const SizedBox(height: mobileNumSpacingY),
          _digitRow(_digitGrid[i]),
        ],
        const SizedBox(height: 14),
        const Divider(color: Color(0xFF333333), height: 1),
        const SizedBox(height: 14),
        for (var i = 0; i < _mobileOpGrid.length; i++) ...[
          if (i > 0) const SizedBox(height: mobileSpacing),
          _tokenRow(_mobileOpGrid[i]),
        ],
        const SizedBox(height: 12),
        _tokenRow(_systemRow),
        const SizedBox(height: 12),
        _EqualsRow(
          height: mobileEqualsHeight,
          sideGap: mobileSpacing,
          onEquals: () => onTap(const Equals()),
          onInfoTap: onInfoTap,
          onHelpTap: onHelpTap,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Desktop layout: numpad + 5 op columns side-by-side, Equals below.
// ---------------------------------------------------------------------------

class _DesktopKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _DesktopKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
  });

  Widget _digitGridWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var r = 0; r < _digitGrid.length; r++) ...[
          if (r > 0) const SizedBox(height: desktopDigitGap),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var col = 0; col < _digitGrid[r].length; col++) ...[
                if (col > 0) const SizedBox(width: desktopDigitGap),
                SizedBox(
                  width: desktopButtonSize,
                  height: desktopButtonSize,
                  child: _DigitButton(
                    digit: _digitGrid[r][col],
                    onTap: () => onTap(Digit(_digitGrid[r][col])),
                    disabled:
                        isDisabled?.call(Digit(_digitGrid[r][col])) ?? false,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }

  Widget _opColumn(List<CalcToken> tokens) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < tokens.length; i++) ...[
          if (i > 0) const SizedBox(height: desktopColGap),
          SizedBox(
            width: desktopButtonSize,
            height: desktopButtonSize,
            child: _TokenButton(
              token: tokens[i],
              onTap: () => onTap(tokens[i]),
              armed: isArmed?.call(tokens[i]) ?? false,
              selected: isSelected?.call(tokens[i]) ?? false,
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _digitGridWidget(),
            const SizedBox(width: desktopSetGap),
            _opColumn(_set1),
            const SizedBox(width: desktopSetGap),
            _opColumn(_set2),
            const SizedBox(width: desktopSetGap),
            _opColumn(_set3),
            const SizedBox(width: desktopSetGap),
            _opColumn(_set4),
            const SizedBox(width: desktopSetGap),
            _opColumn(_systemRow),
          ],
        ),
        const SizedBox(height: desktopSetGap),
        _EqualsRow(
          height: desktopButtonSize,
          sideGap: desktopSetGap,
          onEquals: () => onTap(const Equals()),
          onInfoTap: onInfoTap,
          onHelpTap: onHelpTap,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Tablet layout: like desktop, but with all 10 sets inline (no overlay) +
// bigger buttons. The Expand button becomes a borderless arrow indicator
// that visually points to the freshly inlined sets 6-10. Close is dropped
// from set 10 since there is no overlay to close.
// ---------------------------------------------------------------------------

class _TabletKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;
  final DisabledPredicate? isDisabled;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _TabletKeypad({
    required this.onTap,
    this.isArmed,
    this.isSelected,
    this.isDisabled,
    this.onInfoTap,
    this.onHelpTap,
  });

  Widget _digitGridWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var r = 0; r < _digitGrid.length; r++) ...[
          if (r > 0) const SizedBox(height: tabletDigitGap),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var col = 0; col < _digitGrid[r].length; col++) ...[
                if (col > 0) const SizedBox(width: tabletDigitGap),
                SizedBox(
                  width: tabletButtonSize,
                  height: tabletButtonSize,
                  child: _DigitButton(
                    digit: _digitGrid[r][col],
                    onTap: () => onTap(Digit(_digitGrid[r][col])),
                    disabled:
                        isDisabled?.call(Digit(_digitGrid[r][col])) ?? false,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }

  Widget _opColumn(List<CalcToken> tokens, {CalcToken? skip}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < tokens.length; i++) ...[
          if (i > 0) const SizedBox(height: tabletColGap),
          if (tokens[i] == skip)
            const SizedBox(
              width: tabletButtonSize,
              height: tabletButtonSize,
            )
          else
            SizedBox(
              width: tabletButtonSize,
              height: tabletButtonSize,
              child: _TokenButton(
                token: tokens[i],
                onTap: () => onTap(tokens[i]),
                armed: isArmed?.call(tokens[i]) ?? false,
                selected: isSelected?.call(tokens[i]) ?? false,
              ),
            ),
        ],
      ],
    );
  }

  /// System column [Ac, Del, Decimal, _empty]. The Expand-button slot stays
  /// blank on tablet since sets 6-10 are already inline to the right.
  Widget _systemColumn() {
    const tokens = <CalcToken>[Ac(), Del(), Decimal()];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < tokens.length; i++) ...[
          if (i > 0) const SizedBox(height: tabletColGap),
          SizedBox(
            width: tabletButtonSize,
            height: tabletButtonSize,
            child: _TokenButton(
              token: tokens[i],
              onTap: () => onTap(tokens[i]),
              armed: isArmed?.call(tokens[i]) ?? false,
              selected: isSelected?.call(tokens[i]) ?? false,
            ),
          ),
        ],
        const SizedBox(height: tabletColGap),
        const SizedBox(
          width: tabletButtonSize,
          height: tabletButtonSize,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _digitGridWidget(),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set1),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set2),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set3),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set4),
            const SizedBox(width: tabletSetGap),
            _systemColumn(),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set6),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set7),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set8),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set9),
            const SizedBox(width: tabletSetGap),
            _opColumn(_set10, skip: const Close()),
          ],
        ),
        const SizedBox(height: tabletSetGap),
        _EqualsRow(
          height: tabletButtonSize,
          sideGap: tabletSetGap,
          onEquals: () => onTap(const Equals()),
          onInfoTap: onInfoTap,
          onHelpTap: onHelpTap,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Overlay (Sets 6-10). One-level depth, no = bar; Close lives at 10.4.
// Same dispatch contract as Keypad — both feed the same handleClick.
// ---------------------------------------------------------------------------

class OverlayKeypad extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;

  const OverlayKeypad({
    super.key,
    required this.onTap,
    this.isArmed,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isMobileScreen(context)
        ? _MobileOverlay(
            onTap: onTap, isArmed: isArmed, isSelected: isSelected)
        : _DesktopOverlay(
            onTap: onTap, isArmed: isArmed, isSelected: isSelected);
  }
}

Widget _overlayTokenButton({
  required CalcToken token,
  required TokenTapHandler onTap,
  required ArmedPredicate? isArmed,
  required SelectedPredicate? isSelected,
  required double height,
  double? width,
}) {
  final btn = SizedBox(
    width: width,
    height: height,
    child: _TokenButton(
      token: token,
      onTap: () => onTap(token),
      armed: isArmed?.call(token) ?? false,
      selected: isSelected?.call(token) ?? false,
      backgroundColor: _kOverlayBtnBg,
    ),
  );
  return btn;
}

class _MobileOverlay extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;

  const _MobileOverlay({
    required this.onTap,
    this.isArmed,
    this.isSelected,
  });

  Widget _setColumn(List<CalcToken> tokens) {
    final cells = <Widget>[];
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) cells.add(const SizedBox(height: overlayMobileSpacing));
      cells.add(
        Expanded(
          child: _overlayTokenButton(
            token: tokens[i],
            onTap: onTap,
            isArmed: isArmed,
            isSelected: isSelected,
            height: overlayBtnHeight,
          ),
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cells,
    );
  }

  Widget _bottomRow() {
    final cells = <Widget>[];
    for (var i = 0; i < _set10.length; i++) {
      if (i > 0) cells.add(const SizedBox(width: overlayMobileSpacing));
      cells.add(
        Expanded(
          child: _overlayTokenButton(
            token: _set10[i],
            onTap: onTap,
            isArmed: isArmed,
            isSelected: isSelected,
            height: overlayBtnHeight,
          ),
        ),
      );
    }
    return SizedBox(height: overlayBtnHeight, child: Row(children: cells));
  }

  @override
  Widget build(BuildContext context) {
    // Each overlay row is mobileButtonHeight tall — same as the function
    // keys it floats over — so the main 4×4 grid lines up visually with
    // the op-grid behind it. mainAxisSize.min lets the Column take its
    // natural height; the parent in main.dart anchors the top to
    // mobileOpGridTopY so the alignment is exact.
    return Padding(
      padding: const EdgeInsets.all(overlayMobileSpacing),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: mobileButtonHeight * 4 + mobileSpacing * 3,
            child: Row(
              children: [
                Expanded(child: _setColumn(_set6)),
                const SizedBox(width: overlayMobileSpacing),
                Expanded(child: _setColumn(_set7)),
                const SizedBox(width: overlayMobileSpacing),
                Expanded(child: _setColumn(_set8)),
                const SizedBox(width: overlayMobileSpacing),
                Expanded(child: _setColumn(_set9)),
              ],
            ),
          ),
          const SizedBox(height: mobileSpacing),
          _bottomRow(),
        ],
      ),
    );
  }
}

class _DesktopOverlay extends StatelessWidget {
  final TokenTapHandler onTap;
  final ArmedPredicate? isArmed;
  final SelectedPredicate? isSelected;

  const _DesktopOverlay({
    required this.onTap,
    this.isArmed,
    this.isSelected,
  });

  Widget _setColumn(List<CalcToken> tokens) {
    final cells = <Widget>[];
    for (var i = 0; i < tokens.length; i++) {
      if (i > 0) cells.add(const SizedBox(height: desktopColGap));
      cells.add(_overlayTokenButton(
        token: tokens[i],
        onTap: onTap,
        isArmed: isArmed,
        isSelected: isSelected,
        height: desktopButtonSize,
        width: desktopButtonSize,
      ));
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: cells,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(desktopSetGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _setColumn(_set6),
          const SizedBox(width: desktopSetGap),
          _setColumn(_set7),
          const SizedBox(width: desktopSetGap),
          _setColumn(_set8),
          const SizedBox(width: desktopSetGap),
          _setColumn(_set9),
          const SizedBox(width: desktopSetGap),
          _setColumn(_set10),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Button building blocks.
// ---------------------------------------------------------------------------

class _PressableShell extends StatefulWidget {
  final VoidCallback onTap;
  final Widget Function(BuildContext, bool pressed) builder;
  final bool selected;
  final bool disabled;
  final Color? backgroundColor;

  const _PressableShell({
    required this.onTap,
    required this.builder,
    this.selected = false,
    this.disabled = false,
    this.backgroundColor,
  });

  @override
  State<_PressableShell> createState() => _PressableShellState();
}

class _PressableShellState extends State<_PressableShell> {
  bool _pressed = false;

  void _setPressed(bool v) {
    if (_pressed != v) setState(() => _pressed = v);
  }

  void _handleTap() {
    if (widget.disabled) return;
    // Haptic feedback fires the moment the action commits — silent no-op on
    // platforms without a haptic engine (web, desktop). Selection-click is
    // the right intensity for keypad-style UIs.
    HapticFeedback.selectionClick();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.disabled ? null : (_) => _setPressed(true),
      onTapUp: widget.disabled ? null : (_) => _setPressed(false),
      onTapCancel: widget.disabled ? null : () => _setPressed(false),
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.selected
                ? _kOpNormal
                : (widget.disabled
                    ? const Color(0xFF303030)
                    : _kBorder),
            width: widget.selected ? 2 : 1,
          ),
        ),
        child: widget.builder(context, _pressed),
      ),
    );
  }
}

class _DigitButton extends StatelessWidget {
  final DozenalDigit digit;
  final VoidCallback onTap;
  final bool disabled;

  const _DigitButton({
    required this.digit,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Ziffer ${digit.value}',
      excludeSemantics: true,
      enabled: !disabled,
      child: _PressableShell(
        onTap: onTap,
        disabled: disabled,
        builder: (ctx, pressed) => CustomPaint(
          size: Size.infinite,
          painter: _DigitPainter(
            digit: digit,
            color: disabled
                ? _kDigitDisabled
                : (pressed ? _kDigitPressed : _kDigitNormal),
          ),
        ),
      ),
    );
  }
}

class _DigitPainter extends CustomPainter {
  final DozenalDigit digit;
  final Color color;

  _DigitPainter({required this.digit, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final minEdge = math.min(size.width, size.height);
    final q = minEdge / 4;
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

class _TokenButton extends StatelessWidget {
  final CalcToken token;
  final VoidCallback onTap;
  final bool armed;
  final bool selected;
  final Color? backgroundColor;

  const _TokenButton({
    required this.token,
    required this.onTap,
    this.armed = false,
    this.selected = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: _tokenSemanticLabel(token),
      excludeSemantics: true,
      child: _PressableShell(
        onTap: onTap,
        selected: selected,
        backgroundColor: backgroundColor,
        builder: (ctx, pressed) {
          final isAc = token is Ac;
          final normalColor = isAc ? _kAc : _kOpNormal;
          final pressedColor = isAc ? _kAcPressed : _kOpPressed;
          return Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _TokenPainter(
                    token: token,
                    color: pressed ? pressedColor : normalColor,
                  ),
                ),
              ),
              if (armed)
                const Positioned(
                  right: 4,
                  top: 4,
                  child: _ArmedDot(),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// German screen-reader label for a non-digit CalcToken. The keypad's visual
/// glyphs (×, ÷, ⊕, …) don't read well via TTS, so we provide spoken-friendly
/// names for the icon-style and abbreviated tokens.
String _tokenSemanticLabel(CalcToken t) {
  if (t is Add) return 'plus';
  if (t is Sub) return 'minus';
  if (t is Mul) return 'mal';
  if (t is Div) return 'geteilt durch';
  if (t is ExpTopRight) return 'hoch';
  if (t is RootTopLeft) return 'Wurzel';
  if (t is OplusBotLeft) return 'Paralleladdition';
  if (t is LogBotRight) return 'Logarithmus';
  if (t is Sin) return 'Sinus';
  if (t is Cos) return 'Kosinus';
  if (t is Tan) return 'Tangens';
  if (t is Cot) return 'Kotangens';
  if (t is ArcSin) return 'Arkussinus';
  if (t is ArcCos) return 'Arkuskosinus';
  if (t is ArcTan) return 'Arkustangens';
  if (t is ArcCot) return 'Arkuskotangens';
  if (t is Sinh) return 'Sinus hyperbolicus';
  if (t is Cosh) return 'Kosinus hyperbolicus';
  if (t is Tanh) return 'Tangens hyperbolicus';
  if (t is Coth) return 'Kotangens hyperbolicus';
  if (t is ArSinh) return 'Areasinus hyperbolicus';
  if (t is ArCosh) return 'Areakosinus hyperbolicus';
  if (t is ArTanh) return 'Areatangens hyperbolicus';
  if (t is ArCoth) return 'Areakotangens hyperbolicus';
  if (t is ParenOpen) return 'Klammer auf';
  if (t is ParenClose) return 'Klammer zu';
  if (t is TriangleLeft) return 'Cursor nach links';
  if (t is TriangleRight) return 'Cursor nach rechts';
  if (t is Ac) return 'Alles löschen';
  if (t is Del) return 'Zeichen löschen';
  if (t is Decimal) return 'Komma';
  if (t is Equals) return 'Gleich';
  if (t is Expand) return 'Erweiterungsfeld öffnen';
  if (t is Close) return 'Erweiterungsfeld schließen';
  if (t is Sto) return 'In Speicher';
  if (t is Rcl) return 'Aus Speicher';
  if (t is Mc) return 'Speicher löschen';
  if (t is Ans) return 'Letztes Ergebnis';
  if (t is ConstPi) return 'Pi';
  if (t is ConstE) return 'Eulersche Zahl';
  if (t is ConstPhi) return 'Goldener Schnitt';
  if (t is ConstSqrt2) return 'Wurzel zwei';
  if (t is Factorial) return 'Fakultät';
  if (t is AbsVal) return 'Betrag';
  if (t is Reciprocal) return 'Kehrwert';
  if (t is Mod) return 'Modulo';
  if (t is Doz) return 'Dozenal-Modus';
  if (t is Dez) return 'Dezimal-Modus';
  if (t is Drg) return 'Winkelmodus wechseln';
  if (t is Info) return 'Info';
  return '';
}

class _TokenPainter extends CustomPainter {
  final CalcToken token;
  final Color color;

  _TokenPainter({required this.token, required this.color});

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
  bool shouldRepaint(covariant _TokenPainter old) =>
      old.token != token || old.color != color;
}

class _ArmedDot extends StatelessWidget {
  const _ArmedDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD700), // GOLD
        shape: BoxShape.circle,
      ),
    );
  }
}

class _EqualsBar extends StatelessWidget {
  final VoidCallback onTap;
  final Color normalColor;

  const _EqualsBar({required this.onTap, required this.normalColor});

  @override
  Widget build(BuildContext context) {
    return _PressableShell(
      onTap: onTap,
      builder: (ctx, pressed) => CustomPaint(
        painter: _TokenPainter(
          token: const Equals(),
          color: pressed ? _kOpPressed : normalColor,
        ),
      ),
    );
  }
}

/// Row containing the wide Equals bar flanked by two round side buttons:
/// (i) on the left → opens the theory chapters; (?) on the right → opens
/// the how-to-use intro. Side buttons are hidden (placeholder) when the
/// corresponding callback is null.
class _EqualsRow extends StatelessWidget {
  final double height;
  final double sideGap;
  final VoidCallback onEquals;
  final VoidCallback? onInfoTap;
  final VoidCallback? onHelpTap;

  const _EqualsRow({
    required this.height,
    required this.sideGap,
    required this.onEquals,
    this.onInfoTap,
    this.onHelpTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        // Stretch so flex children (the EqualsBar) get tight height
        // constraints; without this CustomPaint inside collapses to zero.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _RoundIconButton(
            size: height,
            icon: Icons.info_outline,
            tooltip: 'Theoriekapitel',
            onPressed: onInfoTap,
          ),
          SizedBox(width: sideGap),
          Expanded(
            child: _EqualsBar(
              onTap: onEquals,
              normalColor: _kEquals,
            ),
          ),
          SizedBox(width: sideGap),
          _RoundIconButton(
            size: height,
            icon: Icons.help_outline,
            tooltip: 'Intro',
            onPressed: onHelpTap,
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final double size;
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _RoundIconButton({
    required this.size,
    required this.icon,
    this.tooltip,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final btn = Material(
      color: const Color(0xFF2A2A2A),
      shape: const CircleBorder(
        side: BorderSide(color: Color(0xFF555555)),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Center(
          child: Icon(
            icon,
            size: size * 0.5,
            color: const Color(0xFF64C8FF),
          ),
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
