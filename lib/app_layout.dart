// Centralised layout constants for tablet/desktop reference sizes and the
// adaptive helpers for the orientation-driven mobile layout.
//
// The mobile layout (both portrait Hoch- and landscape Breit-mode) is sized
// dynamically from LayoutBuilder constraints — see keypad.dart. This file
// keeps only the constants that don't depend on runtime layout: the
// tablet/desktop button sizes (used as reference proportions inside the Breit
// flex layout) and the orientation-independent display-sizing formula.

import 'package:flutter/widgets.dart';

// ---------------------------------------------------------------------------
// Display
// ---------------------------------------------------------------------------

/// Hard upper bound on display height (dp). On very tall screens the display
/// stops growing here so it doesn't dominate the layout.
const double displayMaxHeightCap = 170;

/// Hard lower bound on display height (dp). Below this two lines of text
/// would be unreadable; the scroll fallback in `_HochKeypad` kicks in first.
const double displayMinHeight = 60;

/// Display height for a given app body height: 20 % of the available height,
/// and more on low (landscape phone) screens, whose keypad rows close up to
/// leave the display readable. Clamped to [60, 170] dp.
///
/// Behaviour:
///   - Phone portrait (~800 dp body) → 160 dp.
///   - Phone landscape (~330 dp body) → about 118 dp.
///   - Tablet portrait (~1200 dp body) → 170 dp (hard cap).
///   - Tablet landscape (~800 dp body) → 160 dp.
double displayHeightFor(double bodyHeight) =>
    (bodyHeight * (bodyHeight < _lowBodyHeight ? _lowBodyDisplayShare : 0.20))
        .clamp(displayMinHeight, displayMaxHeightCap);

/// Height of a two-row display on a low screen.
double lowDisplayHeightFor(double bodyHeight) =>
    (bodyHeight * _lowTwoRowDisplayShare).clamp(
      displayMinHeight,
      displayMaxHeightCap,
    );

const double _lowTwoRowDisplayShare = 0.24;
const double _lowBodyHeight = 450;
const double _lowBodyDisplayShare = 0.36;

/// True on a screen so low that each calculator page saves every spare dp.
bool isLowScreen(BuildContext context) =>
    MediaQuery.sizeOf(context).height < _lowBodyHeight;

/// Padding around a calculator page.
EdgeInsets calculatorPagePadding(BuildContext context) => isLowScreen(context)
    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
    : const EdgeInsets.all(12);

/// Gap between a calculator page's display and its keypad.
double calculatorDisplayGap(BuildContext context) =>
    isLowScreen(context) ? 2 : 14;

// ---------------------------------------------------------------------------
// Touch-target floor (Material 48 dp / iOS 44 pt → take the lower for headroom)
// ---------------------------------------------------------------------------

const double minTouchTarget = 44;

/// Touch-target floor for `_BreitKeypad`. Lower than the Hoch-mode 44 dp
/// because in landscape phones are cradled two-handed with both thumbs at
/// the screen — smaller targets remain comfortable. Critical so the keypad
/// can actually shrink to fit the viewport on compact 360-dp-tall phones:
/// at 44 dp the 5-row stack and 13-col row
/// would both overflow, forcing scroll on both axes. Below ~28 dp tap
/// accuracy collapses; the existing scroll fallback handles those cases.
const double breitMinTouchTarget = 36;

// ---------------------------------------------------------------------------
// Tablet/Desktop reference sizes — used by _BreitKeypad as proportions inside
// its flex layout. They're no longer hardcoded button sizes; the actual sizes
// are computed at runtime from available width.
// ---------------------------------------------------------------------------

/// Reference button edge length on tablet-class screens (used to compute
/// proportional gap-to-button ratios in the Breit layout).
const double tabletButtonSize = 70;

/// Reference horizontal gap between sets in the Breit layout.
const double tabletSetGap = 18;

/// Inner-block gap (between rows of the digit grid and between rows of an
/// op column). Same value in both axes so the digit pad and the op columns
/// breathe identically. Matches the 8 dp gap used throughout _HochKeypad.
const double tabletDigitGap = 8;

/// Alias kept for clarity at op-column call sites — same value as
/// tabletDigitGap so all inner-block spacing stays consistent.
const double tabletColGap = 8;

// ---------------------------------------------------------------------------
// Orientation helper
// ---------------------------------------------------------------------------

/// True when the constraints describe a portrait-shaped area. Used by
/// `Keypad.build` to switch between the vertical (Hoch) and inline (Breit)
/// layouts. We compare the box constraints rather than `MediaQuery.orientation`
/// so the decision works correctly inside split-screen, foldables, and
/// resizeable desktop windows.
bool isPortraitConstraints(BoxConstraints c) => c.maxHeight > c.maxWidth;
