// Step 12 of PORTING.md: centralised layout constants.
// One source of truth for breakpoints, spacings, and button sizes used by
// display.dart, keypad.dart (main keypad + overlay), and main.dart.
//
// Values are taken from PORTING.md "Layout-Konstanten (numerisch)":
// originally scattered through src/layout.rs. Slight deviations from the
// Rust numbers are allowed per the porting spec — the goal is to preserve
// the layout *feel*, not pixel-exact reproduction.

import 'package:flutter/widgets.dart';

// ---------------------------------------------------------------------------
// Mobile/Desktop breakpoint
// ---------------------------------------------------------------------------

/// Screen width below which the app uses its compact mobile layout.
const double mobileBreakpointPx = 500.0;

/// Returns true when the current MediaQuery width is below the mobile
/// breakpoint. Use at the screen level. Nested widgets with their own
/// constraints can still use LayoutBuilder, but the app's main keypad/
/// overlay/display switch is driven by this helper.
bool isMobileScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < mobileBreakpointPx;

// ---------------------------------------------------------------------------
// Two-line display
// ---------------------------------------------------------------------------

/// Height of one display line (input or result).
const double displayLineH = 80.0;

/// Vertical gap between the input and result lines.
const double displayGap = 10.0;

/// Combined display widget height (both lines plus the gap).
const double displayHeight = displayLineH * 2 + displayGap;

// ---------------------------------------------------------------------------
// Desktop layout
// ---------------------------------------------------------------------------

/// Edge length of every desktop button (digits + tokens).
const double desktopButtonSize = 50.0;

/// Horizontal gap between two adjacent sets in the desktop keypad.
const double desktopSetGap = 15.0;

/// Spacing inside the desktop digit grid (between rows and columns).
const double desktopDigitGap = 10.0;

/// Vertical gap between two adjacent buttons in a desktop op column.
const double desktopColGap = 6.0;

// ---------------------------------------------------------------------------
// Mobile layout — main keypad
// ---------------------------------------------------------------------------

/// Horizontal/vertical spacing between op buttons in the mobile grid.
const double mobileSpacing = 8.0;

/// Vertical spacing between digit rows in the mobile numpad.
const double mobileNumSpacingY = 10.0;

/// Standard mobile button height for digits and op buttons.
const double mobileButtonHeight = 50.0;

/// The Equals bar is a touch taller for visual prominence.
const double mobileEqualsHeight = mobileButtonHeight * 1.2;

// ---------------------------------------------------------------------------
// Overlay (Sets 6-10) — sized to mirror the main keypad area
// ---------------------------------------------------------------------------

const double overlayBtnHeight = 50.0;
const double overlayMobileSpacing = 6.0;

/// Extra gap between the Sets 6-9 grid and the Set 10 bottom row on mobile.
const double overlayMobileExtraGap = 12.0;
