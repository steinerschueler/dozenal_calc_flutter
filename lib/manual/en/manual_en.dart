// en manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_en.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersEn() => const [
  ManualChapter('Grundbedienung', [
    _H('The digits'),
    _P(
      'This calculator uses its own symbols for all twelve digits. '
      'Four anchor digits are stylised arrowheads pointing in the '
      'four cardinal directions — 1 (up), 4 (left), 7 (right), '
      'A (down). They split the number circle into four groups of '
      'three, like the hours 12, 3, 6, and 9 on a clock face.',
    ),
    _P(
      'All digits in between are built from semicircles and full '
      'circles. Zero is a simple circle, B (= eleven) a semicircle above a full circle.',
    ),
    _DigitLegend(),
    _H('Basic operation'),
    _P(
      'Tap numbers and operators as on an ordinary pocket calculator. '
      'Press the wide = key at the bottom edge to compute the result. '
      'AC (in warning red) clears the entire input and result; Del '
      'removes the character to the left of the cursor.',
    ),
    _H('Help and theory'),
    _P(
      'To the left and right of the = key sit two round buttons: '
      '(i) opens these twelve theory chapters, (?) replays the '
      'operating tour with the red highlight markers. The tour '
      'opens automatically on first launch.',
    ),
    _H('Cursor and navigation'),
    _P(
      'The red bar in the input field is the cursor. Use ◀ and ▶ '
      'to move it, inserting or deleting characters in the middle '
      'of a formula. After a calculation, the cursor moves into '
      'the result field — the arrows then move the result cursor. '
      'As soon as you start a new input, the cursor jumps back '
      'to the input field.',
    ),
    _H('Continuing a calculation'),
    _P(
      'After a calculation you can continue directly with an '
      'operator. Tap + 5 =, for example, and the calculator '
      'automatically uses the last result as the first operand. '
      'To start a completely new calculation instead, press AC first.',
    ),
    _H('Double-tap for inverse functions'),
    _P(
      'A second tap on a function key turns it into its inverse: '
      'sin becomes sin⁻¹, cos becomes cos⁻¹, and so on. The same '
      'applies to the hyperbolic functions in the extension panel. '
      'A small golden dot on the key signals that the next tap '
      'will invert.',
    ),
    _H('Hold for more'),
    _P(
      'Keys with a small corner mark at the bottom right offer '
      'related functions on a long press: x□ holds x², log holds '
      'ln, log₁₂ and eˣ, − holds ±, STO holds M+ and M−, n! holds '
      'nCr and nPr. To choose, slide your finger onto the desired '
      'option and release — or release and tap the option. A tap '
      'outside closes the popup.',
    ),
    _H('Special operators'),
    _P(
      'x² squares the preceding number. √ computes the square root; '
      'if a number stands to its left, that number is the root degree: '
      '3√8 yields the cube root of 8, i.e. 2. log computes a logarithm '
      'where the number on the left is the argument and the one on the '
      'right is the base: 8 log 2 is the logarithm of 8 to base 2, i.e. '
      '3. ⊕ computes the parallel sum: a ⊕ b = (a·b)/(a+b), '
      'useful for resistors in parallel.',
    ),
    _H('Extension panel'),
    _P(
      'The … key at the bottom right opens the extension panel '
      'with more functions: memory, constants (π, e, φ, √2), '
      'hyperbolic functions, advanced operators, plus EXP and DRG. '
      'The same key closes it, or a tap outside the panel. On '
      'tablets all sets sit side by side anyway — there is no '
      'overlay.',
    ),
    _Pre(
      '  6 — Memory:       STO   RCL   MC    Ans\n'
      '  7 — Constants:    π     e     φ     √2\n'
      '  8 — Hyperbolic:   sinh  cosh  tanh  coth\n'
      '  9 — Advanced:     n!    |x|   1/x   mod\n'
      '  10 — Modes:       EXP   DRG   …',
    ),
    _H('Memory'),
    _P(
      'STO stores the current result, RCL inserts the stored '
      'value into the input, MC clears the memory. A small M in '
      'the display signals that something is stored. Ans inserts '
      'the result of the last calculation — exact rational values '
      'are stored in full, periodicity is preserved.',
    ),
    _H('Repeating-digit bar'),
    _P(
      'When the result is a repeating fraction, the calculator '
      'marks the repeating digits with a bar above them. Example: '
      '1/5 yields 0.2497 with a bar over all four digits. For '
      'periods longer than five digits, only the first five are '
      'shown, followed by …',
    ),
    _H('Number system: Doz / Dez'),
    _P(
      'You switch the number base in the settings, reached via '
      'the (i) key: dozenal computes in base 12 (default), decimal '
      'in base 10. The active system is shown at the top right of '
      'the display.',
    ),
    _P(
      'When switching, the currently visible number is automatically '
      'converted into the other system. "10" in Doz becomes "12" '
      'in Dez. In Dez mode the symbols for 10 and 11 become '
      'inactive (greyed), since they do not exist as single digits '
      'in base 10 — when you need Doz, simply switch back.',
    ),
    _H('Angle mode'),
    _P(
      'DRG cycles the angle mode for trigonometric functions: '
      'DEG → RAD → GRAD → DEG. The current mode is shown at the '
      'top right of the display, directly above the Doz/Dez '
      'indicator. Default is DEG.',
    ),
  ]),
];
