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
const double displayMaxHeightCap = 170.0;

/// Hard lower bound on display height (dp). Below this two lines of text
/// would be unreadable; the scroll fallback in `_HochKeypad` kicks in first.
const double displayMinHeight = 60.0;

/// Display height for a given app body height. One formula for both
/// orientations: 20 % of available height, clamped to [60, 170] dp.
///
/// Behaviour:
///   - Phone portrait (~800 dp body) → 160 dp.
///   - Phone landscape (~400 dp body) → 80 dp.
///   - Tablet portrait (~1200 dp body) → 170 dp (hard cap).
///   - Tablet landscape (~800 dp body) → 160 dp.
double displayHeightFor(double bodyHeight) =>
    (bodyHeight * 0.20).clamp(displayMinHeight, displayMaxHeightCap);

// ---------------------------------------------------------------------------
// Touch-target floor (Material 48 dp / iOS 44 pt → take the lower for headroom)
// ---------------------------------------------------------------------------

const double minTouchTarget = 44.0;

// ---------------------------------------------------------------------------
// Tablet/Desktop reference sizes — used by _BreitKeypad as proportions inside
// its flex layout. They're no longer hardcoded button sizes; the actual sizes
// are computed at runtime from available width.
// ---------------------------------------------------------------------------

/// Reference button edge length on tablet-class screens (used to compute
/// proportional gap-to-button ratios in the Breit layout).
const double tabletButtonSize = 70.0;

/// Reference horizontal gap between sets in the Breit layout.
const double tabletSetGap = 18.0;

/// Reference inter-row gap in the Breit layout.
const double tabletDigitGap = 10.0;

/// Reference inter-row gap inside an op column in the Breit layout.
const double tabletColGap = 8.0;

// ---------------------------------------------------------------------------
// Orientation helper
// ---------------------------------------------------------------------------

/// True when the constraints describe a portrait-shaped area. Used by
/// `Keypad.build` to switch between the vertical (Hoch) and inline (Breit)
/// layouts. We compare the box constraints rather than `MediaQuery.orientation`
/// so the decision works correctly inside split-screen, foldables, and
/// resizeable desktop windows.
bool isPortraitConstraints(BoxConstraints c) => c.maxHeight > c.maxWidth;
