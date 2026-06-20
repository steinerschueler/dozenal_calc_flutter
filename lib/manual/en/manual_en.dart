// en manual chapters. part of ../manual.dart.
// Grundbedienung migrated verbatim from the retired
// info_content_en.dart (legacy chapter 0). Teaching chapters are
// German-first and fall back until translated; the chapter title is the
// German placeholder until the manual translation pass.

part of '../manual.dart';

List<ManualChapter> _manualChaptersEn() => const [
  ManualChapter('Getting started', [
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
      'DEG → RAD → GRD → DEG. The current mode is shown at the '
      'top right of the display, directly above the Doz/Dez '
      'indicator. Default is DEG.',
    ),
  ]),
  ManualChapter('Exponents, Roots & Logarithms', [
    _H('Three questions about one relationship'),
    _P(
      'Raising to a power, taking a root and taking a logarithm look like three '
      'different operations. In truth they are three questions about one and the '
      'same relationship: b raised to e gives n, in short b^e = n. Here b is the '
      'base, e the exponent and n the result. If you know two of these three '
      'quantities you can find the third — and that is exactly what the three '
      'keys x^□, √ and log are for.',
    ),
    _P(
      'The power answers: the base and exponent are known, how large is the '
      'result? The root answers: the result and exponent are known, which base '
      'was it? The logarithm answers: the base and result are known, which '
      'exponent lies behind them? Root and logarithm are thus the two inverses '
      'of raising to a power.',
    ),
    PowerTriangleFigure(power: 'Power', base: 'Base', exponent: 'Exponent'),
    _H('Powers: repeated multiplication'),
    _P(
      'The power b^e means, to begin with, nothing more than multiplying b by '
      'itself exactly e times. So 2^3 = 2·2·2 = 8 and 3^2 = 3·3 = 9. Raising to '
      'a power condenses a multiplication, just as multiplication condenses an '
      'addition.',
    ),
    _P(
      'From this simple idea follow the laws of exponents, which you grasp at '
      'once by counting the factors. Multiplying two powers of the same base '
      'adds the exponents: b^m · b^n = b^(m+n) — you simply string the factors '
      'together. Raising a power to a power multiplies the exponents: '
      '(b^m)^n = b^(m·n).',
    ),
    _P(
      'Two special cases follow from the same rule. b^0 is always 1, because '
      'b^1 divided by b^1 gives both 1 and b^(1−1) = b^0. And a negative '
      'exponent means the reciprocal: b^(−n) = 1/b^n, since b^n · b^(−n) must '
      'give b^0 = 1.',
    ),
    _P(
      'Plotting the values of a power such as 2^x produces a curve that rises '
      'ever more steeply — the familiar picture of exponential growth.',
    ),
    ExpCurveFigure(),
    _H('The root — the first inverse'),
    _P(
      'The root undoes raising to a power when the exponent is known. The '
      'square root of 9 is 3, because 3^2 = 9; the cube root of 8 is 2, because '
      '2^3 = 8. On the calculator √ stands for the square root; type a number to '
      'its left and that number becomes the root index — 3√8 is the cube root '
      'of 8.',
    ),
    _P(
      'A root is nothing other than a power with a fractional exponent: the '
      'n-th root of x is x^(1/n). This is not mere notation but follows '
      'directly from the law of exponents — raise x^(1/n) to the power n and you '
      'get x^((1/n)·n) = x^1 = x. Draw y = x² and y = √x in the same picture and '
      'they are mirror images across the line y = x. That is the visible sign '
      'that one function inverts the other.',
    ),
    SquareRootFigure(),
    _H('The logarithm — the second inverse'),
    _P(
      'The logarithm undoes raising to a power when the base is known. It '
      'answers: with which exponent must I raise the base to obtain the result? '
      'One writes log_b(n) = e. So log_2(8) = 3, because 2^3 = 8. On the '
      'calculator you enter this as 8 log 2 — the argument on the left, the base '
      'on the right.',
    ),
    _P(
      'The logarithm too is a mirror image: y = log_2(x) arises from y = 2^x by '
      'reflection across the line y = x. Where the exponential curve climbs '
      'steeply, the logarithm grows only hesitantly — it turns enormous ranges '
      'into manageable numbers.',
    ),
    ExpLogFigure(),
    _H('The laws of logarithms'),
    _P(
      'Because the logarithm inverts powers, the laws of exponents turn into '
      'mirror-image laws of logarithms. A product becomes a sum: '
      'log(x·y) = log x + log y. A quotient becomes a difference: '
      'log(x/y) = log x − log y. And an exponent in the argument becomes a '
      'factor in front: log(x^k) = k · log x.',
    ),
    _P(
      'This conversion of multiplication into addition was for centuries the '
      'real purpose of logarithms: with logarithm tables, tedious '
      'multiplications could be replaced by simple look-up and addition. The '
      'same principle lies behind every logarithmic scale — from the decibel '
      'scale of sound to the magnitude of earthquakes.',
    ),
    _P(
      'The base of a logarithm is free to choose, and any base converts into '
      'any other: log_b(x) = log_c(x) / log_c(b). ln (base e), log to base 2 '
      'and log₁₂ are therefore not fundamentally different functions, but the '
      'same question on a different scale — they differ only by a fixed factor.',
    ),
    _H('The symbols on the keys'),
    _P(
      'This calculator carries no familiar signs like √ or "log". Instead each '
      'of these keys shows an x with a small square □ in one corner. The square '
      'is the placeholder for the number you supply — and which corner it sits '
      'in tells you the operation, because the position mirrors the usual '
      'mathematical notation.',
    ),
    KeyGlyphsFigure(
      square: 'Square',
      power: 'Power',
      root: 'Root',
      logarithm: 'Logarithm',
    ),
    _P(
      'Square at top right (x^□) means raising to a power — x to the □, just as '
      'the exponent sits at the top right in xⁿ. Square at top left (□√x) means '
      'taking a root — the □-th root of x, just as the root index sits at the '
      'top left in ⁿ√x. Square at bottom right (x_□) means logarithm — the '
      'logarithm of x to base □, just as the base sits at the bottom right in '
      'log_b. x² is simply the ready-made shorthand for "squared". (The fourth '
      'corner mark — a square at bottom left with a small + — is parallel '
      'addition ⊕, which has its own chapter.)',
    ),
    _H('On this calculator'),
    _P(
      'The three basic keys are in Set 2: x^□ (power), □√x (root) and x_□ '
      '(logarithm). x² in the long-press menu of the power key is the '
      'shorthand for "squared". A long press on log also gives you ln, log₁₂ and '
      'eˣ; these open a bracket straight away for you to type the argument into.',
    ),
    _P(
      'The power operator is right-associative: 2^2^3 means 2^(2^3) = 2^8, not '
      '(2^2)^3. Integer exponents and the scientific notation EXP '
      '(a EXP b = a·12^b) stay exact; roots and logarithms, by contrast, show a '
      '"≈" even when the result is a whole number — they run through the '
      'approximate evaluator.',
    ),
    _Pre(
      'Input          Result      (decimal)\n'
      '2^3        =   8\n'
      '3^2        =   9\n'
      '2^A        =   714        2¹⁰ = 1024\n'
      'B^2        =   A1         11² = 121\n'
      '5²         =   21         25\n'
      '3√8        ≈   2          cube root\n'
      '8 log 2    ≈   3          log to base 2\n'
      '2^−3       =   0.16       1/8\n'
      '5 EXP 2    =   500        5·144 = 720',
    ),
    _H('Powers of twelve and log₁₂'),
    _P(
      'In base twelve the powers of twelve are the round numbers, exactly as '
      'the powers of ten are in the decimal system: twelve is written "10", one '
      'hundred forty-four as "100", one thousand seven hundred twenty-eight as '
      '"1000". So when you read "100" in the calculator, you are thinking in a '
      'jump of 144, not of 100.',
    ),
    _P(
      'That is why log₁₂ is the natural digit-counter in the dozenal system — '
      'just as the base-ten logarithm is in the decimal system. For a power of '
      'twelve its value is exactly the number of digits minus one: '
      'log₁₂("10") = 1, log₁₂("100") = 2, log₁₂("1000") = 3.',
    ),
    _P(
      'Squares and cubes look unfamiliar in dozenal, but they are the same '
      'values — only written differently. 4² is "14" (sixteen), 5² is "21" '
      '(twenty-five), A² is "84" (one hundred), B² is "A1" (one hundred '
      'twenty-one). The mathematics never changes with the writing base; e and '
      'ln are base-independent too. Only the digit string changes, not the '
      'value.',
    ),
    _Pre(
      'n      n²       n³\n'
      '2      4        8\n'
      '3      9        23\n'
      '4      14       54\n'
      '5      21       A5\n'
      '10     100      1000',
    ),
    _H('What to watch out for'),
    _P(
      'Some inputs are undefined and lead to an error: the logarithm of zero or '
      'of a negative number, likewise the bases 0 and 1. Nor does the square '
      'root of a negative number exist in the reals. Negative and fractional '
      'exponents, by contrast, are allowed without restriction — 8^(−1/3) is '
      '1/2.',
    ),
    _P(
      'And once more on the "≈": it does not mean "inaccurate". Roots and '
      'logarithms always run through the floating-point evaluator and therefore '
      'carry this sign, even when the result is a clean whole number. The '
      'displayed value is correct — the sign only reveals the method.',
    ),
  ]),
  ManualChapter('Parallel addition (⊕)', [
    _H('A fifth operation'),
    _P(
      'Alongside the four basic operations the calculator carries a fifth, less '
      'familiar one: parallel addition, written with the sign ⊕. It is defined '
      'as a ⊕ b = (a·b)/(a+b). It owes its name to electrical engineering — it '
      'describes the total resistance of two resistors connected in parallel — '
      'yet the same formula appears everywhere that not the quantities '
      'themselves but their reciprocals add.',
    ),
    _H('Current takes the easier path'),
    _P(
      'Connect two resistors in parallel and they sit between the same two '
      'points; the same voltage is across both, and the current splits between '
      'the two paths. How much flows through each branch depends on its '
      'resistance — more flows through the lower-resistance path.',
    ),
    _P(
      'What matters is the conductance, the reciprocal of resistance (G = 1/R): '
      'it says how well a component lets current through. In a parallel '
      'connection the conductances add: 1/R = 1/R₁ + 1/R₂. Solve this for R and '
      'you get exactly parallel addition: R = (R₁·R₂)/(R₁+R₂) = R₁ ⊕ R₂.',
    ),
    ParallelCircuitFigure(),
    _H('Always smaller than the smallest'),
    _P(
      'The surprising result: the total resistance is always smaller than the '
      'smaller of the two individual resistances. A second path lets additional '
      'current through, no matter how high its resistance. Two equal resistors '
      'in parallel halve the value: 6 Ω ⊕ 6 Ω = 36/12 = 3 Ω. A 6 Ω and a 3 Ω '
      'resistor give 18/9 = 2 Ω — less than 3.',
    ),
    _P(
      'Intuitively: two doors side by side let more people through than one; '
      'opening a second checkout shortens the queue. More paths mean less '
      'resistance and higher throughput.',
    ),
    ParallelBarFigure(lessThanBoth: 'smaller than either value'),
    _H('Deriving the formula'),
    _P(
      'The starting point is the rule that the reciprocals add: '
      '1/(a⊕b) = 1/a + 1/b. Put the right-hand side over a common denominator '
      'and it becomes (a+b)/(a·b). The reciprocal of that is '
      'a ⊕ b = (a·b)/(a+b). There is nothing more to it — the whole operation '
      'is "add the reciprocals and take the reciprocal of the result".',
    ),
    _H('Properties'),
    _P(
      'The rules of calculation follow from the symmetry of the formula. ⊕ is '
      'commutative (a ⊕ b = b ⊕ a) and associative, so you can combine any '
      'number of values: with three terms, three reciprocals simply add, '
      '1/(a⊕b⊕c) = 1/a + 1/b + 1/c. Equal values simplify especially nicely — '
      'n equal numbers in parallel give a/n, so a ⊕ a = a/2 and '
      'a ⊕ a ⊕ a = a/3.',
    ),
    _P(
      'For positive numbers the result always lies below the smaller operand. '
      'Two limiting cases round out the picture: a ⊕ 0 = 0 — a path with no '
      'resistance, a short circuit, draws all the current. And the larger b '
      'becomes, the closer a ⊕ b approaches a; an infinitely large resistance, '
      'a break, contributes nothing. "Infinity" is thus the identity element of '
      'parallel addition — just as zero is the identity element of ordinary '
      'addition.',
    ),
    _H('Harmonic mean and duality'),
    _P(
      'Parallel addition is closely related to the harmonic mean: the harmonic '
      'mean of two numbers is 2·(a ⊕ b), and a ⊕ b is conversely half of it. Of '
      'the three classical means the harmonic always lies lowest — below the '
      'geometric and the arithmetic.',
    ),
    _P(
      'Seen more deeply, ⊕ is the mirror image of ordinary addition under the '
      'reciprocal map x → 1/x: add normally in reciprocal space and you add in '
      'parallel here, and vice versa. Series and parallel connection are dual to '
      'each other in this sense — the same relationship as between springs end '
      'to end and side by side.',
    ),
    _H('On this calculator'),
    _P(
      'The ⊕ key sits among the operator glyphs in Set 2, next to x^□, √ and '
      'log. You enter a ⊕ b like an ordinary calculation: first a, then ⊕, then '
      'b, then =. Unlike root and logarithm, ⊕ computes exactly — it runs on the '
      'fraction track with period detection and therefore shows no "≈".',
    ),
    _Pre(
      'Input           Result      (decimal)\n'
      '5 ⊕ 5       =   2.6        25/10 = 2.5\n'
      '6 ⊕ 3       =   2          18/9\n'
      '4 ⊕ 4       =   2          a⊕a = a/2\n'
      '1 ⊕ 1       =   0.6        1/2\n'
      '2 ⊕ 3       =   1.2497     6/5, period 2497\n'
      '6 ⊕ 6 ⊕ 6   =   2          a/3\n'
      '10 ⊕ 20     =   8          12·24 / 36 (Ω)',
    ),
    _P(
      'The last example shows the dozenal charm: "10" ⊕ "20" — that is, twelve '
      'in parallel with twenty-four ohms — gives a clean 8. And 2 ⊕ 3 is '
      'periodic in base twelve (1.2497… with an overline over 2497), yet still '
      'exact; in base ten the same result would simply be 1.2.',
    ),
    _H('When the sum becomes zero'),
    _P(
      'There is one case in which ⊕ fails: if a + b = 0, for instance 5 ⊕ (−5), '
      'there is a zero in the denominator, and the calculator reports a division '
      'by zero. After the error the expression can be edited directly — navigate '
      'into it with the arrow keys and correct the value; AC resets everything.',
    ),
  ]),
  ManualChapter('Trigonometry', [
    _H('Angles and their measures'),
    _P(
      'Trigonometry is the study of the relationships between angles and '
      'lengths. An angle describes a rotation — how far a ray must be turned '
      'about its endpoint. It is measured in three common units: in degrees (a '
      'full circle is 360°), in radians (a full circle is 2π) and in gradians or '
      'gon (a full circle is 400). Which measure you choose does not change the '
      'angle itself — only the number that describes it. The calculator switches '
      'between them with the DRG key.',
    ),
    _H('Sine, cosine, tangent in the triangle'),
    _P(
      'In a right triangle every acute angle θ has a fixed meaning. The longest '
      'side, opposite the right angle, is the hypotenuse. The side opposite θ is '
      'the opposite side, the one next to it the adjacent side.',
    ),
    _P(
      'From these three sides one forms three ratios that are always the same '
      'for a given angle — independent of the size of the triangle: '
      'sine = opposite/hypotenuse, cosine = adjacent/hypotenuse, '
      'tangent = opposite/adjacent = sin/cos. The cotangent is the reciprocal of '
      'the tangent. The mnemonic SOH-CAH-TOA sums up the first three.',
    ),
    RightTriangleFigure(
      adjacent: 'Adjacent',
      opposite: 'Opposite',
      hypotenuse: 'Hypotenuse',
      sinRatio: 'sin θ = Opp / Hyp',
      cosRatio: 'cos θ = Adj / Hyp',
      tanRatio: 'tan θ = Opp / Adj',
    ),
    _H('The unit circle'),
    _P(
      'Triangles only cover angles between 0° and 90°. The unit circle — a '
      'circle of radius 1 about the origin — extends the view to all angles. To '
      'every angle θ belongs a point on the circle: starting from the point '
      '(1, 0) you turn counter-clockwise by θ. Then the cosine is the '
      'x-coordinate of this point and the sine its y-coordinate.',
    ),
    _P(
      'In this way angles above 90° and negative angles also get a natural '
      'place. At 180° the point lies at (−1, 0): cos 180° = −1, sin 180° = 0. At '
      '270° at (0, −1). The tangent remains the ratio sin/cos and agrees with '
      'the triangle definition.',
    ),
    UnitCircleFigure(),
    _H('Pythagoras on the circle'),
    _P(
      'Because the unit circle has radius 1, every point on it satisfies '
      'x² + y² = 1. In trigonometric notation: cos²θ + sin²θ = 1. This is not a '
      'new formula but the theorem of Pythagoras on the unit circle. From it '
      'follows at once sin²θ = 1 − cos²θ — the basis of many transformations.',
    ),
    _H('Waves and periods'),
    _P(
      'After a full turn you are back at the starting point: sine and cosine '
      'repeat with a period of 360° (or 2π). Plot sin θ over the angle and the '
      'familiar sine wave appears, swinging between −1 and +1; the cosine is the '
      'same wave, only shifted by 90°. Such waves describe sound, light and '
      'alternating current — every oscillation.',
    ),
    _Pre(
      'θ      sin θ    cos θ    tan θ\n'
      '0°     0        1        0\n'
      '30°    1/2      √3/2     1/√3\n'
      '45°    √2/2     √2/2     1\n'
      '60°    √3/2     1/2      √3\n'
      '90°    1        0        —',
    ),
    SineWaveFigure(),
    _H('The inverse functions'),
    _P(
      'Sometimes you know the ratio and seek the angle. For that there are the '
      'inverse functions sin⁻¹, cos⁻¹, tan⁻¹ (the arc functions): from '
      'sin θ = 0.5 comes sin⁻¹(0.5) = 30°. Because sine and cosine are periodic, '
      'infinitely many angles belong to each ratio; the arc functions therefore '
      'return only one distinguished range — sin⁻¹ and tan⁻¹ from −90° to +90°, '
      'cos⁻¹ from 0° to 180°.',
    ),
    _H('On this calculator'),
    _P(
      'The four functions sin, cos, tan and cot are on the main keypad and open '
      'a bracket as soon as you press them (sin( with the cursor inside). A '
      'second tap on the same key switches to the inverse function — a golden '
      'dot shows that the next tap will invert. The DRG key changes the angle '
      'mode (DEG → RAD → GRD), shown at the top right; in the "Simple" profile '
      'this is done via Settings.',
    ),
    _P(
      'There is a dozenal trap to watch out for: the angle is entered in the '
      'active number system. In dozenal mode "90" is not ninety degrees but '
      '9·12 = 108. To compute sin(90°) you type "76" (since 7·12+6 = 90). Here '
      'are the common values:',
    ),
    _Pre(
      'Degrees (decimal)    Input (dozenal)\n'
      '30°                  26\n'
      '45°                  39\n'
      '60°                  50\n'
      '90°                  76\n'
      '180°                 130\n'
      '360°                 260',
    ),
    _P('And a few worked examples in DEG mode:'),
    _Pre(
      'Input          means         Result\n'
      'sin(76)        sin 90°       ≈1\n'
      'cos(76)        cos 90°       ≈0\n'
      'sin(26)        sin 30°       ≈0.6\n'
      'cos(50)        cos 60°       ≈0.6\n'
      'sin(39)        sin 45°       ≈0.859A…\n'
      'cos(26)        cos 30°       ≈0.A485…\n'
      'sin⁻¹(1)       angle for 1   ≈76  (= 90°)',
    ),
    _P(
      'All trigonometric results carry a "≈", because sin, cos and tan are in '
      'general irrational — even when the value is as clean as sin(90°) = 1. '
      'tan(90°) is undefined; the calculator shows a very large number there, '
      'because cos(90°) is computationally just barely not zero.',
    ),
    _H('Angles in base twelve'),
    _P(
      'Even the familiar full-circle values look foreign in dozenal: 360° is '
      'written "260" (2·144 + 6·12), 400 gradians "294". Only the radian escapes '
      'the question — 2π is a constant, independent of the number system; '
      'whoever works in RAD avoids the trap entirely.',
    ),
    _P(
      'That the full circle has 360 parts fits twelve well: 360 has very many '
      'divisors (two dozen of them), so the circle divides cleanly into halves, '
      'thirds, quarters, sixths and more — and 12·30 = 360, a twelfth of the '
      'circle is exactly 30°. As always: trigonometry itself is independent of '
      'the number system. sin(30°) is ½, whether you write the angle "30" in '
      'decimal or "26" in dozenal. Only the digits of the input change.',
    ),
  ]),
  ManualChapter('Storing & Recalling', [
    _P(
      'A calculator only becomes truly fast once you no longer have to retype '
      'numbers constantly. Four tools take this work off your hands: the last '
      'result (Ans), a named memory (STO/RCL), an accumulator (M+/M−) and the '
      'session history tape. They do not overlap but each covers a different '
      'situation.',
    ),
    _H('The last result: Ans'),
    _P(
      'After every calculation the calculator remembers the result under the '
      'name Ans. If you type straight on with an operator — say "× 2 =" right '
      'after a result — Ans is used automatically as the first operand, without '
      'touching the key at all. This is the most common move when calculating in '
      'a chain: the result of one step silently becomes the start of the next.',
    ),
    _P(
      'If you need the last result not at the start but in the middle of a new '
      'formula, you insert it explicitly with Ans. Important: Ans always holds '
      'the complete result — including a repeating fraction, not just the '
      'visible digits.',
    ),
    _H('The memory: STO, RCL, MC'),
    _P(
      'Ans has a weakness: the next "=" overwrites it. To hold a value across '
      'several independent calculations, store it with STO (from English store) '
      'in the memory. A small "M" at the top of the display then shows that '
      'something is held. RCL (recall) inserts the stored value back into the '
      'input at the cursor position — as often as you like. MC (memory clear) '
      'empties the memory, and the "M" goes out.',
    ),
    _P(
      'A typical scenario: you compute the radius of a circle and then need it '
      'for both the area and the circumference. The radius is stored once with '
      'STO; both formulas then recall it independently with RCL, without ever '
      'retyping it.',
    ),
    _H('The accumulator: M+ and M−'),
    _P(
      'Sometimes you do not want to hold a single value but build a running '
      'total — for instance when adding up many items. For that there are M+ and '
      'M−, reached by a long press on STO. M+ adds the last result to the stored '
      'value, M− subtracts it. The memory grows or shrinks with each hit, '
      'without you having to see or note the subtotal yourself. RCL shows the '
      'grand total at the end, MC resets the accumulator to zero.',
    ),
    MemoryFlowFigure(result: 'Result', store: 'Memory', input: 'Input'),
    _P(
      'The sketch sums up the paths: STO carries the result into the memory, RCL '
      'fetches it from there into the input. Ans takes the shortcut straight '
      'from the result to the input and bypasses the memory (dashed). M+/M− '
      'loops the result back into the memory and adds it there.',
    ),
    _H('Ans or memory — when which?'),
    _P(
      'The choice follows a simple rule of thumb. Take Ans when the result is '
      'needed immediately in the next step — quick and without preparation. Take '
      'the memory when a value should stand ready across several separate '
      'calculations or be safely protected from the next "=". M+ and M− sit one '
      'level above: they are not meant for recalling a single value but for '
      'summing many individual results into a total.',
    ),
    _H('Stored exactly — no rounding error'),
    _P(
      'Most calculators work internally with floating-point numbers of fixed '
      'precision. What they display is already rounded — and exactly this '
      'rounded value lands in the memory. Calculate on and you carry the error '
      'with you; after several steps a result that should be exactly 1 shows '
      '"0.9999…".',
    ),
    _P(
      'This calculator instead holds rational results as a true fraction of '
      'arbitrarily large integers — without rounding. And exactly this fraction '
      'goes into the memory: STO, RCL, Ans and the accumulator preserve '
      'numerator and denominator completely, not just the visible digits. An '
      'example: 1 ÷ 7 is periodic in dozenal (block 186A35). Store the result '
      'and multiply it later by 7, and exactly 1 comes out — because the '
      'calculator never carried anything other than 1/7. A device that stores '
      'only the displayed digits would arrive at "0.BBBB…".',
    ),
    _Pre(
      '1 ÷ 7 =        →  0.186A35   (period, with overline)\n'
      '… STO          →  "M" appears; stored: exactly 1/7\n'
      'AC\n'
      '… RCL × 7 =    →  1          (not 0.BBBB…)',
    ),
    _P(
      'The calculator stays honest at its limit: irrational results — roots, '
      'logarithms, trigonometry — it cannot hold as a fraction. They carry a '
      '"≈" and are stored as an approximation. The rule is easy to read off: if '
      'a "≈" precedes the value, what is stored is an approximation; if it is '
      'absent, it is exact.',
    ),
    _H('The history tape'),
    _P(
      'To use an earlier calculation again, swipe down on the display. That '
      'opens the history tape of the current session — the most recent '
      'calculation at the top, up to thirty entries. Even AC does not clear it; '
      'it is kept for the whole session. A tap on an entry brings its result '
      'value back into the input, just like Ans — only for any earlier step.',
    ),
    HistoryBandFigure(swipe: 'swipe', newCap: 'new', tap: 'tap'),
    _P(
      'The history tape is not a permanent store but a look-back: it keeps the '
      'thread of a session and lets you recover a value you computed but did not '
      'specifically store.',
    ),
    _H('On this calculator'),
    _P(
      'STO, RCL, MC and Ans are in the extension panel: open it with the "…" key '
      'and then tap the desired function. M+ and M− hide behind a long press on '
      'STO — the small corner at the bottom right of the key points to it; in '
      'the popup you choose M+ or M−. In the "Simple" profile there is no '
      'extension panel; the memory functions are not available there.',
    ),
    _P('Three worked examples (in dozenal mode):'),
    _Pre(
      'Store and insert later\n'
      '  8 × 9 =        →  60\n'
      '  … STO          →  "M" appears\n'
      '  AC\n'
      '  5 + … RCL =    →  65',
    ),
    _Pre(
      'Continue directly with Ans\n'
      '  7 × 8 =        →  48\n'
      '  × 2 =          →  94   (Ans = 48 automatically)',
    ),
    _Pre(
      'Sum up items with M+\n'
      '  … MC                   clear memory\n'
      '  5 =   … STO(hold) M+   →  memory 5\n'
      '  7 =   … STO(hold) M+   →  memory 10\n'
      '  3 =   … STO(hold) M+   →  memory 13\n'
      '  … RCL                  →  13',
    ),
    _P(
      'To check in decimal: 5 + 7 + 3 = 15, and 15 is dozenal "13" (1·12 + 3). '
      'All four tools — Ans, memory, accumulator and history tape — work on the '
      'same exact value; whoever knows them hardly needs to type a number by '
      'hand or keep a subtotal in their head.',
    ),
  ]),
  ManualChapter('Hyperbolic functions', [
    _P(
      'At school you learn sine and cosine as the coordinates of a point on the '
      'unit circle. Less well known, but equally fundamental, are their '
      'hyperbolic counterparts sinh and cosh. They arise when you replace the '
      'circle by a hyperbola — and the key to them is the exponential function '
      'eˣ.',
    ),
    _H('The even and odd halves of eˣ'),
    _P(
      'Every function can be split into an even part (symmetric about the '
      'y-axis) and an odd part (point-symmetric about the origin). For eˣ you '
      'can write both parts directly: cosh is the even one, sinh the odd one. '
      'Add them again and eˣ returns — for eˣ = cosh x + sinh x, and '
      'e⁻ˣ = cosh x − sinh x. This decomposition is not arbitrary but the only '
      'possible one.',
    ),
    _Pre(
      'sinh x = (eˣ − e⁻ˣ) / 2          arsinh x = ln(x + √(x²+1))\n'
      'cosh x = (eˣ + e⁻ˣ) / 2          arcosh x = ln(x + √(x²−1))\n'
      'tanh x = sinh x / cosh x         artanh x = ½·ln((1+x)/(1−x))\n'
      'coth x = cosh x / sinh x         arcoth x = ½·ln((x+1)/(x−1))',
    ),
    _P(
      'tanh is the quotient, coth its reciprocal (and therefore defined only for '
      'x ≠ 0). On the right are the inverses, which we return to shortly.',
    ),
    _H('The unit hyperbola'),
    _P(
      'On the unit circle every point (cos t, sin t) satisfies the equation '
      'x² + y² = 1. For the hyperbolic functions an almost identical, but '
      'crucially different, identity holds. Substitute the definitions and work '
      'out the difference of the squares, and the mixed terms cancel:',
    ),
    _Pre(
      'cosh²t − sinh²t\n'
      '  = ¼[(e²ᵗ + 2 + e⁻²ᵗ) − (e²ᵗ − 2 + e⁻²ᵗ)]\n'
      '  = ¼ · 4  =  1',
    ),
    _P(
      'So the point (cosh t, sinh t) always lies on the curve x² − y² = 1, the '
      'unit hyperbola. Because cosh t is never smaller than 1, the point always '
      'stays on the right branch. The identity cosh²t − sinh²t = 1 plays the '
      'same role in the hyperbolic world as cos²t + sin²t = 1 in the circular '
      'one — only the plus has become a minus.',
    ),
    UnitHyperbolaFigure(area: 'Area = t/2'),
    _H('The parameter: an area, not an angle'),
    _P(
      'Here lies the deepest difference from trigonometry. On the circle the '
      'parameter t is the angle in radians — and at the same time the arc length '
      'and twice the sector area; these three meanings happen to coincide there. '
      'On the hyperbola there is no such angle. What remains is the area: t is '
      'twice the area of the hyperbolic sector between the origin, the vertex '
      '(1, 0) and the point (cosh t, sinh t) — exactly the shaded area in the '
      'figure above.',
    ),
    _P(
      'Hence the name of the inverses. They are called area functions — arsinh, '
      'arcosh, artanh — from the Latin "area". The widespread "arcsinh" of some '
      'devices is strictly speaking wrong: it carries the arc prefix ("arc") '
      'over to a function where there is no arc at all. arsinh(y) is that '
      'parameter value t with sinh t = y — that is, an area, not an arc.',
    ),
    _H('The shape of the four curves'),
    _P(
      'cosh is an upward-opening, axially symmetric trough with its lowest point '
      'at (0, 1), since cosh 0 = 1; its value is never less than 1. sinh is '
      'point-symmetric, runs through the origin and grows without bound in both '
      'directions. For large x both approach the curve eˣ/2.',
    ),
    _P(
      'tanh is an S-shaped saturation curve: strictly increasing, through the '
      'origin, and it stays strictly between −1 and +1 — these bounds are '
      'approached, never reached. coth, finally, behaves like the reciprocal of '
      'tanh, but because sinh 0 = 0 it has a pole at x = 0 and stays outside '
      '[−1, 1].',
    ),
    HyperbolicCurvesFigure(),
    _H('Kinship with trigonometry'),
    _P(
      'Both families are woven from the same material: the exponential function. '
      'Euler\'s formula writes the circular functions quite analogously — '
      'cos t = (eⁱᵗ + e⁻ⁱᵗ)/2, sin t = (eⁱᵗ − e⁻ⁱᵗ)/(2i). The pattern is the '
      'same; only for the circular functions the exponential runs on the '
      'imaginary axis (argument i·t), for the hyperbolic ones on the real axis '
      '(argument x). If complex numbers are still unfamiliar, you may skip this '
      'thought — all that matters is: at its core it is the same function.',
    ),
    _P(
      'Geometrically it is the same construction — a point on a curve, '
      'parametrized by twice the sector area — only once on the circle, once on '
      'the hyperbola. From this follows the flipped sign: cos² + sin² = 1 versus '
      'cosh² − sinh² = 1. Substitute an imaginary argument and the families pass '
      'directly into each other: cos(i·x) = cosh x and sin(i·x) = i·sinh x. The '
      'hyperbolic functions are thus "the trigonometric functions with an '
      'imaginary argument".',
    ),
    _P(
      'The addition theorems run in parallel too: '
      'sinh(a+b) = sinh a·cosh b + cosh a·sinh b, exactly as for the sine. For '
      'the cosine, by contrast, a sign flips — cos(a+b) has a minus, cosh(a+b) a '
      'plus. This is Osborn\'s rule: every trigonometric identity becomes '
      'hyperbolic by replacing sin→sinh, cos→cosh and flipping the sign wherever '
      'a product of two sine factors appears. A wrong sign almost always sits at '
      'exactly this spot.',
    ),
    _H('Applications in the world'),
    _P(
      'The best known is the catenary. A rope hanging freely between two points '
      'does not form a parabola — even Galileo fell for this error — but the '
      'curve y = a·cosh(x/a). With a shallow sag the two look alike; with a deep '
      'one the difference becomes clear: the catenary grows faster than any '
      'parabola. Conversely — as a downward-opening cosh arch — it describes the '
      'ideal shape of a load-bearing vault that passes its load on purely '
      'through compression.',
    ),
    CatenaryFigure(catenary: 'Catenary', parabola: 'Parabola'),
    _P(
      'Fall with air resistance belongs here too: if the braking force grows '
      'with the square of the speed, the speed follows a tanh curve and '
      'approaches the terminal velocity gently, without ever exceeding it — the '
      'saturation of tanh is here the physics itself.',
    ),
    _P(
      'In relativity, finally, velocities near the speed of light do not simply '
      'add. Introduce the "rapidity" φ via v = c·tanh φ and the tangled addition '
      'formula becomes simple again: the rapidities add ordinarily '
      '(φ = φ₁ + φ₂), precisely because tanh has its addition theorem. What the '
      'radian is in plane geometry, the rapidity is in the geometry of '
      'spacetime.',
    ),
    _H('On this calculator'),
    _P(
      'The four functions are in Set 8, the extension panel: open it with the '
      '"…" key, then tap sinh, cosh, tanh or coth. Each opens a bracket straight '
      'away (sinh( with the cursor inside); if the closing one is missing, the '
      'calculator adds it at the "=". A second tap on the same key switches to '
      'the area function (sinh ↔ arsinh and so on) — a golden dot shows that the '
      'next tap will invert.',
    ),
    _P(
      'The most important difference from trigonometry: the argument is a pure '
      'number, not an angle. The angle mode (DEG/RAD/GRD) has no effect '
      'whatsoever on the hyperbolic functions — no degree conversion, no dozenal '
      'angle trap as with sin and cos. sinh(2) means the same in every mode. '
      'Because these functions are transcendental, their results always carry a '
      '"≈".',
    ),
    _P('Worked examples (all results ≈, dozenal abbreviated):'),
    _Pre(
      'Input         decimal     dozenal\n'
      'sinh(0)       0           0\n'
      'cosh(0)       1           1\n'
      'sinh(1)       1.1752      1.2128B7B6…\n'
      'cosh(1)       1.5431      1.66253A10…\n'
      'tanh(1)       0.7616      0.91804BB6…\n'
      'arsinh(1)     0.8814      0.A6B01B51…\n'
      'arcosh(2)     1.3170      1.397853260…',
    ),
    _P(
      'The basic identity can be checked directly: cosh(2)² − sinh(2)² gives ≈1. '
      'Mathematically it is exactly 1; the tiny floating-point remainder lies '
      'below the display threshold, and the calculator snaps it onto the clean '
      '1.',
    ),
    _P(
      'Outside their domain the functions report an error — you then have to '
      'reset with AC:',
    ),
    _Pre(
      'coth(0)       →  DIV BY ZERO\n'
      'arcosh(0.6)   →  DOMAIN ERROR   (0.6 = dec. 0.5 < 1)\n'
      'artanh(2)     →  DOMAIN ERROR   (|2| ≥ 1)',
    ),
    _P(
      'arsinh is defined for every number; arcosh requires x ≥ 1; artanh '
      'requires |x| < 1; arcoth lives exactly outside, at |x| > 1. Whoever keeps '
      'that in mind avoids the error messages from the start.',
    ),
  ]),
  ManualChapter('Set 9 & 10', [
    _P(
      'The last two panels of the extension field bundle what a scientific '
      'calculator otherwise needs: counting (factorial and combinatorics), '
      'three useful operators (absolute value, reciprocal, remainder) and '
      'scientific notation. Everything sits behind the "…" key.',
    ),
    _H('Factorial: the gateway to counting'),
    _P(
      'The factorial of a whole number n, written n!, is the product of all '
      'numbers from 1 to n: n! = 1·2·3·…·n. As a special case 0! = 1. The first '
      'values are harmless — 3! = 6, 4! = 20, 5! = A0 (= 120 decimal) — but then '
      'the sequence explodes: 10! (twelve factorial) is already 114500000 in '
      'base twelve, almost half a billion.',
    ),
    _P(
      'What for? n! counts arrangements. Five guests can be seated in a row in '
      '5! = A0 ways: five choices for the first seat, then four for the second, '
      'three for the third and so on. The factorial is the building block for '
      'everything that follows. On the calculator n! is exact — the result '
      'carries no "≈".',
    ),
    _H('Permutations: selection with order'),
    _P(
      'Often you do not arrange everything but choose r of n things — and order '
      'counts. A race with eight drivers: how many podiums (1st, 2nd, 3rd) are '
      'possible? Eight for gold, seven for silver, six for bronze: 8·7·6 = 240 '
      '(= 336 decimal). In general this is nPr (n permute r) = n!/(n−r)!. You '
      'divide by (n−r)! because the lower factors drop out.',
    ),
    _H('Combinations: selection without order'),
    _P(
      'Sometimes order is irrelevant — in a card hand, in the lottery, in a '
      'handshake. The number of unordered selections is called nCr ("n choose '
      'r") = n!/(r!·(n−r)!). The connection is simple: every unordered selection '
      'of r things can be arranged in r! ways, so nCr = nPr/r!. Three of six for '
      'a committee: 6 nCr 3 = 18 (= 20 decimal). The handshakes in a group of n '
      'people are n nCr 2 — with five people A (= 10), with a dozen already 56 '
      '(= 66 decimal).',
    ),
    _P(
      'A subtlety of these two: nCr and nPr are built from floating-point '
      'factorials and therefore always carry a "≈", even when the result — as it '
      'almost always is — is a whole number. In the number lottery (six from '
      '49), for instance, 49 nCr 6 gives ≈48245A0 — a good fourteen million '
      'possibilities for one ticket.',
    ),
    _H('Pascal\'s triangle'),
    _P(
      'Arrange the values nCr row by row and a pattern appears: in row n stand, '
      'one after another, n nCr 0, n nCr 1, …, n nCr n. Each number is the sum '
      'of the two above it — so the triangle grows entirely without factorials. '
      'The edges are all ones, and it is symmetric (n nCr r = n nCr (n−r)).',
    ),
    PascalTriangleFigure(title: 'Pascal\'s triangle'),
    _P(
      'In base twelve the triangle looks almost as usual — only in row 5 an "A" '
      'appears instead of ten. The same numbers are, by the way, the '
      'coefficients of (a+b)ⁿ: from row 4 (1, 4, 6, 4, 1) you read off '
      '(a+b)⁴ = a⁴ + 4a³b + 6a²b² + 4ab³ + b⁴ directly. This links combinatorics '
      'and algebra in a single picture.',
    ),
    _H('Absolute value and reciprocal'),
    _P(
      'The absolute value |x| is the distance of a number from zero — the sign '
      'is discarded, |−7| = 7. An input subtlety: the postfix operators (|x|, '
      'n!, 1/x) bind more tightly than a leading minus. "−5" followed by |x| '
      'therefore gives −(|5|) = −5; if you want the absolute value of the '
      'negative number, use brackets: (−5) then |x| gives 5.',
    ),
    _P(
      'The reciprocal 1/x is the multiplicative partner: x · (1/x) = 1, and the '
      'calculator holds it exactly as a fraction. Dozenal shows this especially '
      'nicely — 1/4 is a clean 0.3 (three twelfths are a quarter) and 1/3 is '
      '0.4, where base ten already runs into the repeating 0.333…. The '
      'reciprocal of zero is undefined.',
    ),
    _H('Modulo: remainders and cycles'),
    _P(
      'Seven divided by three is two, remainder one — and exactly this remainder '
      'is what "7 mod 3 = 1" gives. The most intuitive picture is the clock: '
      'after twelve the count starts over, "14:00" is "2 in the afternoon", '
      'because 14 mod 12 = 2. The clock counts in base twelve — no coincidence.',
    ),
    ModuloClockFigure(
      title: 'Modulo — clock arithmetic',
      wrap: 'wrap-around',
      note: '(= 17 dec., 17 mod 12 = 5)',
    ),
    _P(
      'Modulo is the natural tool for divisibility: a mod b = 0 means exactly '
      'that b divides a. Dozenal gives this special sharpness, because twelve '
      'has unusually many divisors — 1, 2, 3, 4, 6 and 12, against only 1, 2, 5, '
      '10 for ten. Divisibility by two, three, four or six can often be read off '
      'the last digits in dozenal.',
    ),
    _H('Scientific notation in powers of twelve'),
    _P(
      'Very large or small numbers are written compactly as a mantissa times a '
      'power of the base. In decimal "3 EXP 8" means the value 3 × 10⁸. This '
      'calculator carries the principle through consistently in base twelve: in '
      'dozenal mode "a EXP b" means not a × 10ᵇ but a × 12ᵇ. The exponent counts '
      'powers of twelve.',
    ),
    DozenalPowersScaleFigure(
      title: 'Powers of twelve — 1 EXP n',
      dozLabel: 'Doz.',
      decLabel: 'Dec.',
    ),
    _P(
      'These powers even have their own names: 12¹ = a dozen, 12² = 144 = a '
      'gross, 12³ = 1728 = a great gross. Written in dozenal these are exactly '
      'the round places 10, 100, 1000. So "1 EXP 2" gives the value 100 (= 144 '
      'decimal) and "1 EXP 3" the value 1000 (= 1728). For integer exponents the '
      'exact track computes; in decimal mode EXP counts in powers of ten again.',
    ),
    _H('Angle mode and closing'),
    _P(
      'Set 10 also holds DRG and Close. DRG cycles the angle mode '
      '(DEG → RAD → GRD) for the trigonometric functions — covered in detail in '
      'the trigonometry chapter; in the "Simple" profile it is set via Settings. '
      'Close folds the extension panel back in, the counterpart to the "…" key. '
      'The former Doz/Dez switch has moved from the keypad into Settings.',
    ),
    _H('On this calculator'),
    _P(
      'All these keys are reached through the "…" extension panel (in the '
      '"Simple" profile Set 9 and 10 are hidden). n!, |x| and 1/x act postfix — '
      'first the number, then the key; mod, nCr and nPr are binary (a mod b). A '
      'long press on n! opens the popup with nCr and nPr; the small corner at '
      'the bottom right of the key points to it.',
    ),
    _P('Worked examples (in dozenal mode):'),
    _Pre(
      'Input         means                 Result\n'
      '5!            5·4·3·2·1             A0      (= 120)\n'
      '4 → 1/x       reciprocal of 4       0.3     (exact)\n'
      '7 mod 3       remainder of 7 ÷ 3    1\n'
      '5 nCr 2       combinations          ≈A      (= 10)\n'
      '8 nPr 3       permutations          ≈240    (= 336)\n'
      '1 EXP 2       1 × 12²               100     (= 144)\n'
      '2 EXP 3       2 × 12³               2000    (= 3456)',
    ),
    _P(
      'Exact are n!, |x|, 1/x and mod (no "≈"); only nCr and nPr carry the '
      'approximation sign. Outside the valid range the functions report an '
      'error — then reset with AC:',
    ),
    _Pre(
      '0 → 1/x       reciprocal of zero    DIV BY ZERO\n'
      '7 mod 0       remainder by zero     DOMAIN ERROR\n'
      '(−4)!         factorial of negative DOMAIN ERROR',
    ),
    _P(
      'With that the toolbox is complete: from the simple digit press of the '
      'basics to combinatorics, modulo and dozenal order-of-magnitude notation, '
      'the calculator computes exactly wherever it can, and honestly with "≈" '
      'wherever only an approximation is possible.',
    ),
  ]),
];

// ---------------------------------------------------------------------------
// Using the unit converter — the second manual section, translated from the
// German reference at the end of manual_de.dart.
// ---------------------------------------------------------------------------

List<ManualChapter> _converterManualChaptersEn() => const [
  ManualChapter('The second calculator', [
    _P(
      'Behind the main calculator lies a fully fledged unit converter: it '
      'converts lengths, weights, times, temperatures and a dozen further '
      'categories between the metric and the imperial system — in dozenal '
      'or decimal digits, as you choose.',
    ),
    _H('Switching back and forth'),
    _P(
      'Swipe left on the main calculator and the unit converter appears. '
      'Swipe right on the unit converter and you are back. During the '
      'switch two translucent cards briefly show which page you are on — '
      'the gold-framed card is the active page.',
    ),
    _P(
      'Both calculators keep their input across the switch: you can swipe '
      'to the main calculator in the middle of a conversion, work something '
      'out there and carry on seamlessly.',
    ),
  ]),
  ManualChapter('Category, number, unit', [
    _P(
      'A conversion consists of three taps: choose a category, type a '
      'number, tap a unit.',
    ),
    _H('The category'),
    _P(
      'The two right-hand key columns show the categories (Length, Weight, '
      'Time, …; more in the "…" extension panel). A tap on a category '
      'unfolds its unit ladder — the keys around the gold-framed category '
      'now show its units. A second tap folds the ladder up again.',
    ),
    _H('Number and unit'),
    _P(
      'Type a number and then a unit key: "144" and "ft" gives 144 feet. '
      'The result line immediately shows the same quantity in another '
      'unit, and the curly brace beside it the value in the other system.',
    ),
    _H('The = key'),
    _P(
      'Every press of = shows the next unit of the ladder — so you walk '
      'through all representations of the same quantity. In the imperial '
      'world the mixed notation follows at the end, such as '
      '"1 yd 2 ft 3 in", before the cycle starts over.',
    ),
    _P(
      'If you switch to another category, the finished terms are '
      'discarded — but a number you have already typed stays, so you can '
      'choose the number first and the category second.',
    ),
  ]),
  ManualChapter('Metric, imperial and the colours', [
    _H('The two round keys'),
    _P(
      'To the left and right of the = key sit "met" (green) and "imp" '
      '(violet). They switch between the metric and the imperial unit '
      'system — the value stays physically the same: 144 ft becomes '
      '43.89 m, not 144 m. The active side carries a ring in its colour.',
    ),
    _H('The colour system'),
    _P(
      'Throughout the app, green stands for the world of ten: metric '
      'units and decimal digits. Violet stands for the world of twelve: '
      'imperial units and dozenal digits. Unit symbols such as "m" or '
      '"ft" appear in their system colour, the DOZ/DEZ indicator at the '
      'bottom right in its base colour — and the curly brace always glows '
      'in the colour of the world it shows.',
    ),
    _H('Dozenal or decimal'),
    _P(
      'The digit base is independent of the unit system and is shared by '
      'both calculators. You switch it under Settings → Number base — '
      'even in the middle of a conversion, the values are preserved. So '
      'you can read metric units in dozenal or imperial ones in decimal.',
    ),
  ]),
  ManualChapter('Several terms: + and −', [
    _P(
      'Within a category you can chain quantities: "5" "ft" "3" "in" '
      'gives 5 feet plus 3 inches. The plus stays invisible as long as '
      'the units differ; with equal units ("3 h + 2 h") it is shown.',
    ),
    _P(
      'The − key subtracts the next term: "5" "ft" "−" "3" "in" gives '
      '5 feet minus 3 inches. The minus is always visible, and the − key '
      'carries a golden frame while it is armed.',
    ),
    _H('Correcting'),
    _P(
      'Tap the input line to place the red cursor — in the middle of a '
      'number or between two terms. Digits appear at the cursor, Del '
      'removes the character before it; if the cursor sits at a term '
      'boundary, Del removes the whole term before it. AC clears '
      'everything.',
    ),
  ]),
  ManualChapter('Calculating in the input: × ÷ ⊕ ^ √ ㏒', [
    _P(
      'The typed number may itself be a small calculation: "3 × 2" and '
      'then "ft" gives 6 feet. It is evaluated strictly from left to '
      'right, at the tap on the unit.',
    ),
    _P(
      'If you press an arithmetic operator while a finished expression '
      'already stands there, the expression is first turned into editable '
      'digits — the total value in the unit last used. "5 ft 3 in" and '
      '"×" thus becomes a number times …, which you complete with "2" '
      'and a unit.',
    ),
    _H('The special operators'),
    _P(
      'For root and logarithm the degree or the base stands on the left: '
      '"2 √ 9" is the square root of 9, i.e. 3; "2 ㏒ 8" is the logarithm '
      'of 8 to base 2, i.e. 3. The ⊕ forms the parallel sum a·b/(a+b), '
      'familiar from resistors in parallel.',
    ),
    _P(
      'Each segment of the calculation may carry its own decimal point '
      '("1.6 × 0.6"). When the digit base is switched, all numbers in '
      'the calculation are converted individually.',
    ),
  ]),
  ManualChapter('Memory, constants and the bridge', [
    _H('The memory'),
    _P(
      'The "…" extension panel holds STO, RCL and MC: STO remembers the '
      'number on the result line — or, if no unit has been chosen yet, '
      'the typed input. RCL inserts the remembered value again, MC '
      'clears it. If RCL and MC are grey, the memory is empty.',
    ),
    _H('The constants'),
    _P(
      'π, e, φ and √2 put their value as digits in place of the number '
      'at the cursor — handy for circumferences and ratios: "3" "×" "π" '
      '"ft" gives the circumference of a circle 3 feet in diameter.',
    ),
    _H('The bridge to the main calculator'),
    _P(
      'The Ans key fetches the last result of the main calculator into '
      'the input — work something out there, swipe over and give the '
      'value a unit. Conversely, the CONV key in the extension panel of '
      'the main calculator fetches the number from the result line of '
      'the unit converter. Values travel as a number and appear '
      'automatically in the base of the destination page.',
    ),
  ]),
];

List<ManualChapter> _assetManualChaptersEn() => const [
  ManualChapter('The third calculator', [
    _P(
      'Behind the unit converter lies a third calculator: the value '
      'calculator. It converts weights of precious metals and '
      'denominations of currencies exactly, estimates their worth in a '
      'lead currency and compares how that worth has held up over the '
      'centuries.',
    ),
    _H('There and back'),
    _P(
      'Swipe left twice on the main calculator — past the unit '
      'converter — and the value calculator appears. Swiping right takes '
      'you back step by step. The two translucent cards during the '
      'switch again show which page you are on; the gold-framed one is '
      'the active page.',
    ),
    _P(
      'Like the other calculators, the value calculator keeps its input '
      'across the switch. The look is the same as the unit converter\'s — '
      'only the right-hand key columns lead one level deeper.',
    ),
  ]),
  ManualChapter('Class, genus, unit', [
    _P(
      'Where the unit converter has two levels (category and unit), the '
      'value calculator has three: class, genus and unit. You tap your '
      'way through a conversion from top to bottom.',
    ),
    _H('The three levels'),
    _P(
      'The two right-hand key columns first show the classes: precious '
      'metal and currency. Tap one and its genera appear — for precious '
      'metal that is Gold, Silver, Platinum and Palladium; for currency '
      'the currency codes. Tap a genus and its units appear. A tap on a '
      'unit adopts it as a term.',
    ),
    _H('Back one level'),
    _P(
      'The chosen class or genus stays at the top of the right-hand '
      'column — gold-framed — and serves as the way back: a tap on it '
      'leads one level higher. So nothing jumps around, and you always '
      'see where you are.',
    ),
    _H('The = key'),
    _P(
      'As in the unit converter, every press of = shows the same '
      'quantity in the next unit; for the troy weights the mixed '
      'notation follows at the end (such as "1 lb t 2 oz t 3 dwt"). A '
      'change of class or genus discards the finished terms, but a '
      'number you have already typed stays.',
    ),
  ]),
  ManualChapter('Metric and imperial at once', [
    _H('Both systems at once'),
    _P(
      'The value calculator has no met/imp keys. As soon as you tap into '
      'a metal genus, both systems stand there at the same time: the '
      'imperial troy units (gr, dwt, oz t, lb t) in one column, the '
      'metric ones (g, kg) in the other. You simply tap the one you want '
      '— the working world follows whichever unit you last entered in.',
    ),
    _H('The colours'),
    _P(
      'The colour code is the same as in the unit converter: violet '
      'stands for the world of twelve (imperial units and dozenal '
      'digits), green for the world of ten (metric units and decimal '
      'digits). The unit symbol carries the colour of its system, the '
      'curly brace shows the same value in the other system in that '
      'system\'s colour, the DOZ/DEZ indicator the colour of the base. '
      'Currencies have no world axis — their symbols stay violet.',
    ),
    _H('Dozenal or decimal'),
    _P(
      'You switch the digit base, as with the other calculators, under '
      'Settings → Number base; it applies to all three calculators '
      'together and is independent of the unit system.',
    ),
  ]),
  ManualChapter('Memory and the remaining keys', [
    _H('The memory'),
    _P(
      'As long as no class is chosen yet, the left of the two right-hand '
      'columns holds the memory keys STO, RCL, MC and Ans. Once you '
      'choose a class, the genera take their place there — the memory '
      'shares the space with the drill. STO remembers the value on the '
      'result line, RCL inserts it, MC clears it; Ans fetches the last '
      'result of the main calculator over. Grey means empty or nothing '
      'available.',
    ),
    _H('Value, calculating and clearing'),
    _P(
      'The Value key sits fixed in the system row and arms as soon as a '
      'term stands there (see the next chapter). The scalar operators '
      '(× ÷ ⊕ ^ √ ㏒) let the typed number itself be a small '
      'calculation, just as in the unit converter. AC clears everything, '
      'Del the character before it.',
    ),
  ]),
  ManualChapter('Value: converting into a currency', [
    _P(
      'Beyond the exact weight conversion, the value calculator can '
      'estimate an approximate monetary worth.',
    ),
    _H('Value mode'),
    _P(
      'Type an amount and adopt it as a unit — say "5" and "oz t" of '
      'gold. Now the Value key turns blue. A tap on it turns the drill '
      'into a choice of destination currencies; tap one and the result '
      'line shows the worth with a "≈" in front and a small, dated note '
      'below it.',
    ),
    _H('The rates'),
    _P(
      'The underlying rates are rough, dated reference figures. The '
      'Rates key at the bottom right opens an editor in which you can '
      'override any rate; a reset restores the built-in values.',
    ),
    _H('No network'),
    _P(
      'The app fetches nothing from the internet — the "≈" means "rough, '
      'rate-based", never "live". You keep the rates current yourself, '
      'for instance from Kitco for metals or the ECB for currencies.',
    ),
  ]),
  ManualChapter('Curve: the historical comparison', [
    _P(
      'The Curve key — the left circle next to the equals bar — replaces '
      'the keypad with a chart; the × at the top closes it again.',
    ),
    _H('The three rows'),
    _P(
      'Everything is measured against gold: silver in gold, grain in '
      'gold and gold in grain — that is, the purchasing power of gold in '
      'food. Each row is referenced to its oldest known value; that '
      'value lies as a bold zero line in the middle. Above the line '
      'means dearer, below it cheaper, each relative to gold.',
    ),
    _H('Reading and moving'),
    _P(
      'Dragging shifts the view, pinching zooms, the button on the right '
      'zooms all the way out into antiquity. By default the curve shows '
      'the last hundred years or so. The shaded band around the '
      'antiquity points is the estimated range — antiquity consists of '
      'individual rings (orders of magnitude only), no line runs across '
      'a gap. The sources line lists the dataset.',
    ),
  ]),
];
