part of 'info_content.dart';

List<Widget> _chapterEn(int chapter, AppLocalizations l) {
  switch (chapter) {
    case 0:
      return [
        const _H('The digits'),
        const _P(
          'This calculator uses its own symbols for all twelve digits. '
          'Four anchor digits are stylised arrowheads pointing in the '
          'four cardinal directions — 1 (up), 4 (left), 7 (right), '
          'A (down). They split the number circle into four groups of '
          'three, like the hours 12, 3, 6, and 9 on a clock face.',
        ),
        const _P(
          'All digits in between are built from semicircles and full '
          'circles. Zero is a simple circle, B (= eleven) a semicircle above a full circle.',
        ),
        const _DigitLegend(),
        const _H('Basic operation'),
        const _P(
          'Tap numbers and operators as on an ordinary pocket calculator. '
          'Press the wide = key at the bottom edge to compute the result. '
          'AC (in warning red) clears the entire input and result; Del '
          'removes the character to the left of the cursor.',
        ),
        const _H('Help and theory'),
        const _P(
          'To the left and right of the = key sit two round buttons: '
          '(i) opens these twelve theory chapters, (?) replays the '
          'operating tour with the red highlight markers. The tour '
          'opens automatically on first launch.',
        ),
        const _H('Cursor and navigation'),
        const _P(
          'The red bar in the input field is the cursor. Use ◀ and ▶ '
          'to move it, inserting or deleting characters in the middle '
          'of a formula. After a calculation, the cursor moves into '
          'the result field — the arrows then move the result cursor. '
          'As soon as you start a new input, the cursor jumps back '
          'to the input field.',
        ),
        const _H('Continuing a calculation'),
        const _P(
          'After a calculation you can continue directly with an '
          'operator. Tap + 5 =, for example, and the calculator '
          'automatically uses the last result as the first operand. '
          'To start a completely new calculation instead, press AC first.',
        ),
        const _H('Double-tap for inverse functions'),
        const _P(
          'A second tap on a function key turns it into its inverse: '
          'sin becomes sin⁻¹, cos becomes cos⁻¹, and so on. The same '
          'applies to the hyperbolic functions in the extension panel. '
          'A small golden dot on the key signals that the next tap '
          'will invert.',
        ),
        const _H('Special operators'),
        const _P(
          'x² squares the preceding number. √ computes the square root; '
          'if a number stands to its left, that number is the root degree: '
          '3√8 yields the cube root of 8, i.e. 2. log computes a logarithm '
          'where the number on the left is the argument and the one on the '
          'right is the base: 8 log 2 is the logarithm of 8 to base 2, i.e. '
          '3. ⊕ computes the parallel sum: a ⊕ b = (a·b)/(a+b), '
          'useful for resistors in parallel.',
        ),
        const _H('Extension panel'),
        const _P(
          'The … key at the bottom right opens the extension panel '
          'with more functions: memory, constants (π, e, φ, √2), '
          'hyperbolic functions, advanced operators, and settings. '
          'The same key closes it, or a tap outside the panel. On '
          'tablets all sets sit side by side anyway — there is no '
          'overlay.',
        ),
        const _Pre(
          '  6 — Memory:       STO   RCL   MC    Ans\n'
          '  7 — Constants:    π     e     φ     √2\n'
          '  8 — Hyperbolic:   sinh  cosh  tanh  coth\n'
          '  9 — Advanced:     n!    |x|   1/x   mod\n'
          '  10 — Modes:       Doz   Dez   DRG   …',
        ),
        const _H('Memory'),
        const _P(
          'STO stores the current result, RCL inserts the stored '
          'value into the input, MC clears the memory. A small M in '
          'the display signals that something is stored. Ans inserts '
          'the result of the last calculation — exact rational values '
          'are stored in full, periodicity is preserved.',
        ),
        const _H('Repeating-digit bar'),
        const _P(
          'When the result is a repeating fraction, the calculator '
          'marks the repeating digits with a bar above them. Example: '
          '1/5 yields 0.2497 with a bar over all four digits. For '
          'periods longer than five digits, only the first five are '
          'shown, followed by …',
        ),
        const _H('Number system: Doz / Dez'),
        const _P(
          'In the extension panel two keys Doz and Dez sit next to '
          'each other. Exactly one of them is always active (outlined) '
          'and the active system is shown at the top right of the '
          'display. In Doz mode the calculator computes in base 12 '
          '(default); in Dez mode in base 10.',
        ),
        const _P(
          'When switching, the currently visible number is automatically '
          'converted into the other system. "10" in Doz becomes "12" '
          'in Dez. In Dez mode the symbols for 10 and 11 become '
          'inactive (greyed), since they do not exist as single digits '
          'in base 10 — when you need Doz, simply switch back.',
        ),
        const _H('Angle mode'),
        const _P(
          'DRG cycles the angle mode for trigonometric functions: '
          'DEG → RAD → GRAD → DEG. The current mode is shown at the '
          'top right of the display, directly above the Doz/Dez '
          'indicator. Default is DEG.',
        ),
      ];
    case 1:
      return [
        const _H('The principle'),
        const _P(
          'In the decimal system each place has ten times the value '
          'of the place to its right: ones, tens, hundreds. In the '
          'dozenal system the base is not ten but twelve. The place '
          'values are powers of 12: ones, twelves, one-hundred-forty-'
          'fours. The number "100" here does not mean ten times ten '
          'but twelve times twelve — that is, 144 in decimal.',
        ),
        const _P(
          'This requires twelve digits instead of ten. Two new ones '
          'are added for the values ten and eleven, which this '
          'calculator gives their own symbols (A = ten, B = eleven). '
          'Example: 2B (dozenal) = 2·12 + 11 = 35 (decimal).',
        ),
        const _H('How do you pronounce dozenal numbers?'),
        const _P(
          'The units 0–9 stay as you know them: zero, one, two … nine. '
          'The new glyphs A and B are read ten and eleven — same '
          'magnitude as the familiar words, no new vocabulary needed. '
          'Twelve itself — written as "10" — is read dozen. To keep '
          'decimal and dozenal numbers from getting confused in this '
          'chapter, a small prefix e marks the decimal reading and a '
          'small o the dozenal: e144 = o100, both are the same value.',
        ),
        const _P(
          'The word order follows ordinary English logic: largest '
          'magnitude first, smaller after. Within the sub-quader range '
          '(dozens + units) the form is hyphenated like English '
          '"twenty-three": o11 reads dozen-one, o23 reads two dozen-'
          'three. Multipliers 2 through B prefix the dozen as a '
          'separate word: two dozen (o20 = e24), three dozen, …, nine '
          'dozen (o90 = e108). With A or B in the dozens place the '
          'rule holds: ten dozen (oA0 = e120), eleven dozen (oB0 = e132). '
          'A multiplier of 1 is implicit, so o10 reads simply dozen, '
          'not "one dozen".',
        ),
        const _Pre(
          'Decimal  Dozenal  Pronunciation\n'
          '     10        A  ten\n'
          '     11        B  eleven\n'
          '     12       10  dozen\n'
          '     13       11  dozen-one\n'
          '     14       12  dozen-two\n'
          '     20       18  dozen-eight\n'
          '     22       1A  dozen-ten\n'
          '     23       1B  dozen-eleven\n'
          '     24       20  two dozen\n'
          '     36       30  three dozen\n'
          '     48       40  four dozen\n'
          '     60       50  five dozen\n'
          '     72       60  six dozen\n'
          '     84       70  seven dozen\n'
          '     96       80  eight dozen\n'
          '    101       85  eight dozen-five\n'
          '    108       90  nine dozen\n'
          '    120       A0  ten dozen\n'
          '    132       B0  eleven dozen\n'
          '    143       BB  eleven dozen-eleven\n'
          '    ...      ...  and so on…',
        ),
        const _H('The higher magnitudes'),
        const _P(
          'Above the dozen follows a sequence of geometrically '
          'motivated magnitudes — one per dozenal place, one per '
          'dimension. Quader denotes the 2D square (12² = e144), '
          'cuber the classical cube (12³ = e1728), tesser the four-'
          'dimensional tesseract (12⁴), and from there the Greek-'
          'numbered hypercubes: penter (12⁵), hexer (12⁶), hepter '
          '(12⁷). Each step is one dimension higher and exactly one '
          'dozenal place further.',
        ),
        const _Pre(
          ' Decimal   Dozenal  Pronunciation\n'
          '     144       100  quader   (12²)\n'
          '    1728      1000  cuber    (12³)\n'
          '   20736     10000  tesser   (12⁴)\n'
          '  248832    100000  penter   (12⁵)\n'
          ' 2985984   1000000  hexer    (12⁶)\n'
          '35831808  10000000  hepter   (12⁷)\n'
          '     ...       ...  and so on…',
        ),
        const _P(
          'In English the magnitudes stack space-separated, and the '
          'connective "and" appears once, before the final non-empty '
          'sub-quader chunk — just like in everyday number reading: '
          '"one hundred and twenty-three" or "one thousand and one". '
          'So o101 reads quader and one, o1001 reads cuber and one, '
          'o10000001 reads hepter and one. When magnitudes follow '
          'each other directly, they sit side by side without a '
          'connective: o1100 = cuber quader, o1101 = cuber quader and '
          'dozen-one. Empty magnitudes are skipped — o1001 is not '
          '"cuber zero quader and one" but simply "cuber and one".',
        ),
        const _H('Why twelve in particular?'),
        const _P(
          'The reason is divisibility. Twelve has six divisors: 1, 2, '
          '3, 4, 6, and 12. Ten has only four: 1, 2, 5, and 10. That '
          'sounds like a small difference, but the effect on everyday '
          'calculation is considerable — especially with fractions.',
        ),
        const _H('Unit fractions compared'),
        const _Pre(
          '  Fraction   Base 10    Base 12\n'
          '  1/2        0.5        0.6\n'
          '  1/3        0.333…     0.4\n'
          '  1/4        0.25       0.3\n'
          '  1/5        0.2        0.2497…\n'
          '  1/6        0.166…     0.2\n'
          '  1/8        0.125      0.16\n'
          '  1/9        0.111…     0.14\n'
          '  1/10       0.1        0.1249…\n'
          '  1/12       0.0833…    0.1',
        ),
        const _P(
          'In base 10, thirds and sixths are infinite repeating '
          'fractions. In base 12 they are short and exact. In exchange, '
          'fifths and tenths become repeating — a fair trade when you '
          'consider how much more often one divides by three and four '
          'than by five.',
        ),
        const _H('The rule behind it'),
        const _P(
          'Which fractions terminate and which become repeating follows '
          'a simple law: a fraction 1/n has a terminating representation '
          'in base b exactly when every prime factor of n is also a '
          'prime factor of b. The prime factors of 12 are 2 and 3. So '
          'every fraction whose denominator is composed only of twos '
          'and threes terminates. Everything else — denominators with '
          'a 5, 7, or 11 — becomes repeating. The calculator marks '
          'this periodicity with a bar above the repeating digits.',
        ),
        const _H('Traces through history'),
        const _P(
          'Twelve as an ordering quantity is older than any number '
          'system. The Babylonians computed in base 60 but organised '
          'their digits in groups of 12. In trade, things were counted '
          'in dozens (12) and grosses (144 = 12²). The day has 2×12 '
          'hours, the year 12 months, the full circle 360 = 30×12 '
          'degrees.',
        ),
        const _P(
          'The Dozenal Society of America (founded 1944, today with '
          'sister societies elsewhere) works to make the advantages '
          'of base 12 better known. This calculator stands in that '
          'tradition — not as a demand for a system change, but as a '
          'tool for exploration and wonder.',
        ),
      ];
    case 2:
      return [
        const _H('144 — where two worlds meet'),
        const _P(
          'The Fibonacci sequence begins with 1, 1, and each further '
          'number is the sum of the two preceding: 1, 1, 2, 3, 5, 8, '
          '13, 21, 34, 55, 89, 144, … It grows exponentially. The '
          'square numbers — 1, 4, 9, 16, 25, 36, … — grow only '
          'quadratically. Two such different sequences have almost '
          'no reason ever to meet. And yet they do: the twelfth '
          'Fibonacci number is 144, and 144 = 12².',
        ),
        const _P(
          'J. H. E. Cohn proved in 1964 that this is not coincidence '
          'but a unique event: aside from F(1) = F(2) = 1, no other '
          'Fibonacci number is simultaneously a perfect square. '
          'Twelve stands at a one-of-a-kind crossing of two fundamental '
          'number sequences.',
        ),
        const _H('The golden ratio'),
        const _P(
          'φ = (1+√5)/2 ≈ 1.618 is the limit of the ratio of successive '
          'Fibonacci numbers: F(n+1)/F(n) → φ. In base 12: φ ≈ '
          '1.74BB677… — the calculator has φ as a constant in the '
          'extension panel.',
        ),
        const _P(
          'Tapping φ² = reveals that the result is exactly φ+1 — the '
          'defining property of the golden ratio. This identity makes '
          'φ an algebraically unique constant.',
        ),
        const _H('12 = 2² × 3 — a prime factorisation with consequences'),
        const _P(
          'Twelve is a highly composite number: it has more divisors '
          'than any smaller natural number. The divisors of 12 are 1, '
          '2, 3, 4, 6, 12 — six in total. Srinivasa Ramanujan defined '
          'and studied this class of numbers in a famous 1915 paper '
          'in the Proceedings of the London Mathematical Society.',
        ),
        const _P(
          'Twelve is also the smallest abundant number: the sum of '
          'its proper divisors (1+2+3+4+6 = 16) exceeds the number '
          'itself. For most small numbers the reverse holds — for 10, '
          '1+2+5 = 8, which is less than 10. Twelve is the first '
          'number where the divisors "overflow".',
        ),
        const _H("Plato's ideal city"),
        const _P(
          'In his "Laws" (Book V), Plato asks how many citizens an '
          'ideal city should have. His answer: 5040. The argument is '
          'not mystical but practical: a city must continually divide '
          'its citizens into equally sized groups. 5040 is divisible '
          'by every number from 1 to 12 (with the single exception '
          'of 11).',
        ),
        const _P(
          'What Plato describes intuitively is the same insight that '
          'underlies the dozenal system: in everyday life the small '
          'divisors are the important ones. 5040 = 7! is the big '
          'sister of twelve — the same divisibility philosophy '
          'applied to an entire urban population.',
        ),
      ];
    case 3:
      return [
        const _H('What is a regular dodecagon?'),
        const _P(
          'A regular dodecagon is a polygon with twelve equal sides '
          'and twelve equal interior angles. Each interior angle '
          'measures 150° — or, expressed in dozenal, 106°. It is one '
          'of the oldest and most frequently used geometric shapes: '
          'you find it on clock faces, coins, architectural ornaments, '
          'and paving patterns.',
        ),
        const _H('The Swiss army knife of polygons'),
        const _P(
          'What makes the dodecagon unique is not its shape as such '
          'but everything tucked inside it. Connect every fourth '
          'vertex and you get an equilateral triangle — exact, not '
          'approximate. Every third vertex yields a square. Every '
          'second vertex yields a regular hexagon. All three figures '
          'sit perfectly within the same circle that circumscribes '
          'the dodecagon.',
        ),
        const _P(
          'This means the dodecagon contains the three fundamental '
          'regular polygons of geometry as exact subfigures. No other '
          'polygon with so few vertices can claim this. A direct '
          'consequence of the divisibility of 12 by 2, 3, 4, and 6.',
        ),
        const _H('Constructible with compass and straightedge'),
        const _P(
          'Not every regular polygon can be exactly constructed with '
          'compass and straightedge. The dodecagon can: start with a '
          'circle, divide it into six equal parts (the hexagon being '
          'constructible), then bisect each arc, and you have twelve '
          'evenly spaced points on the circle.',
        ),
        const _P(
          'The mathematical basis: a regular n-gon is constructible '
          'exactly when n is a product of a power of two and distinct '
          'Fermat primes (Gauss, 1796). For 12 = 2² × 3 this holds, '
          'because 3 is a Fermat prime.',
        ),
        const _H('Symmetry'),
        const _P(
          'The regular dodecagon has 24 symmetries: 12 rotations (by '
          '0°, 30°, 60°, …, 330°) and 12 reflections (6 through '
          'opposite vertices, 6 through opposite mid-edges). In the '
          'language of algebra these 24 symmetries form the dihedral '
          'group D₁₂. Every regular n-gon has exactly 2n symmetries.',
        ),
        const Chapter4Illustration(),
      ];
    case 4:
      return [
        const _H('54 diagonals'),
        const _P(
          'A diagonal connects two non-adjacent vertices of a polygon. '
          'The formula n(n−3)/2 gives the dodecagon 12×9/2 = 54 '
          'diagonals. That sounds like an unwieldy mesh — but the '
          'structure is remarkably orderly.',
        ),
        const _H('Six different lengths'),
        const _P(
          'Every diagonal skips a certain number of vertices. Because '
          'the dodecagon is symmetric, all diagonals that skip the '
          'same number of vertices share the same length. There are '
          'five possible skip widths (1 to 5 vertices), plus the '
          'diameter spanning 6 — six length types in all. For side '
          'length s = 1:',
        ),
        const _Pre(
          '  Type        Skips         Length (exact)     Approx\n'
          '  s (side)    —             1                  1.000\n'
          '  d₂          1 vertex      √(2+√3)            1.932\n'
          '  d₃          2 vertices    1+√3               2.732\n'
          '  d₄          3 vertices    (3√2+√6)/2         3.346\n'
          '  d₅          4 vertices    2+√3               3.732\n'
          '  d₆ (⌀)      5 vertices    √6+√2              3.864',
        ),
        const _H('Hidden patterns'),
        const _P(
          'The third and fifth diagonals differ by exactly 1: d₃ = '
          '1+√3 and d₅ = 2+√3. The difference equals the side length '
          'itself — a geometric fact, not a computational one.',
        ),
        const _P(
          'The diameter d₆ is exactly twice the shortest diagonal '
          'd₂: √6+√2 = 2·√(2+√3). Diameter and shortest diagonal '
          'stand in the ratio 2:1 — the same proportion as the octave '
          'in music.',
        ),
        const _H('The 15-degree grid'),
        const _P(
          'All angles occurring in the dodecagon — between sides, '
          'between diagonals — are multiples of 15°. This is because '
          'the twelve vertices divide the full circle into twelve '
          'sectors of 30° each. 15° = 1/24 of the full circle. In '
          'dozenal: 15° = 13°doz, and 30° = 26°doz. All occurring '
          'angles can be written in dozenal as integer multiples of '
          '13°.',
        ),
        const Chapter5Illustration(),
      ];
    case 5:
      return [
        const _H('The area of the dodecagon'),
        const _P(
          'A regular dodecagon with side length s has area A = '
          '3s²(2+√3). The derivation is intuitive: cut the dodecagon '
          'from its centre into 12 congruent isosceles triangles, '
          'compute the area of a single triangle, and multiply by 12.',
        ),
        const _P(
          'For s = 1 this gives A ≈ 11.196 (decimal). For comparison: '
          'the circumscribed circle has area πR² ≈ 11.725. The '
          'dodecagon fills its circumscribed circle to more than 95% '
          '— markedly better than a hexagon (83%) and far better than '
          'a square (64%) or triangle (41%).',
        ),
        const _H('3/π — an elegant ratio'),
        const _P(
          'The ratio of dodecagon area to circumscribed-circle area '
          'simplifies to 3/π. The derivation uses sin²(15°) = '
          '(2−√3)/4, which cancels the factor (2+√3)(2−√3) to 1 in '
          'the ratio, leaving exactly 3/π.',
        ),
        const _P(
          '3/π ≈ 0.9549 (decimal) — the dodecagon captures 95.5% of '
          "the circle's area. Tap 3 / π = in the calculator to verify.",
        ),
        const _H('Four polygons compared'),
        const _P(
          'All figures below share the same circumscribed circle. '
          'Formula: A = (n/2)·R²·sin(2π/n).',
        ),
        const _Pre(
          '  Figure         Share     Formula\n'
          '  Triangle       41.3%     3√3/(4π)\n'
          '  Square         63.7%     2/π\n'
          '  Hexagon        82.7%     3√3/(2π)\n'
          '  Dodecagon      95.5%     3/π',
        ),
        const _P(
          'The hexagon has exactly twice the area of the triangle '
          '(both contain the factor 3√3). And every step delivers a '
          'larger area gain, because the vertices hug the circle '
          'more tightly.',
        ),
        const _H('Archimedes and π'),
        const _P(
          'Archimedes computed π via polygons. He used a 96-gon — '
          '96 = 12×8 = 12×2³. He began with the hexagon (trivially '
          'constructible) and doubled the vertex count three times: '
          '6→12→24→48→96. The starting point of his method was '
          'therefore the dodecagon.',
        ),
        const _P(
          'His result: 3 + 10/71 < π < 3 + 1/7. A 96-gon fills the '
          "circumscribed circle to 99.93%. From the dodecagon's 95.5% "
          'to 99.93% is only three doubling steps — a remarkable '
          'rate of convergence.',
        ),
      ];
    case 6:
      return [
        const _H('Twelve faces'),
        const _P(
          'The dodecahedron is a solid built from twelve regular '
          'pentagons. Every face is identical, every edge equal in '
          'length, and exactly three pentagons meet at every vertex. '
          'In total it has 12 faces, 30 edges, and 20 vertices. It '
          'is one of the five Platonic solids — the only convex '
          'solids whose faces consist exclusively of identical '
          'regular polygons.',
        ),
        const _H('The five Platonic solids'),
        const _Pre(
          '  Solid           Faces  Vertices  Edges  Shape\n'
          '  Tetrahedron        4      4         6   Triangles\n'
          '  Cube               6      8        12   Squares\n'
          '  Octahedron         8      6        12   Triangles\n'
          '  Dodecahedron      12     20        30   Pentagons\n'
          '  Icosahedron       20     12        30   Triangles',
        ),
        const _P(
          'The dodecahedron is the only Platonic solid with pentagonal '
          'faces. In his cosmology Plato assigned the four other '
          'solids to the elements — and the dodecahedron to the '
          'cosmos itself.',
        ),
        const _H('What does it look like?'),
        const _P(
          'Anyone who plays role-playing games knows it as the D12 — '
          'the twelve-sided die. It sits comfortably in the hand and '
          'reliably comes to rest on one face. The football is not a '
          'dodecahedron: it is a truncated icosahedron of 12 pentagons '
          'and 20 hexagons.',
        ),
        const _H('Gallo-Roman pentagonal dodecahedra'),
        const _P(
          'Over a hundred small bronze objects shaped like dodecahedra '
          'have been found in northern Europe, dated to the 2nd–4th '
          'centuries CE. They have twelve pentagonal faces with '
          'round holes of varying size. Nobody knows for certain '
          'what they were used for. Hypotheses range from candle '
          'holders through surveying instruments to religious '
          'objects. The riddle remains unsolved.',
        ),
        const _H("Euler's polyhedron formula"),
        const _P(
          'For every convex polyhedron a simple relation holds: '
          'vertices minus edges plus faces always equals two. '
          'Leonhard Euler formulated this law in 1758. For the '
          'dodecahedron: 20 − 30 + 12 = 2. The formula holds for '
          'all five Platonic solids, for every prism, for every '
          'pyramid, for every convex polyhedron whatsoever.',
        ),
      ];
    case 7:
      return [
        const _H('The golden ratio in the dodecahedron'),
        const _P(
          'Every face of the dodecahedron is a regular pentagon — '
          'and the regular pentagon is the home of the golden ratio. '
          'The diagonal of such a pentagon is to its side exactly as '
          'φ = (1+√5)/2 ≈ 1.618 (decimal) is to 1. This proportion '
          'permeates the entire solid.',
        ),
        const _Pre(
          '  Quantity         Formula             Decimal\n'
          '  Volume           (15+7√5)/4          ≈ 7.663\n'
          '  Surface area     3√(25+10√5)         ≈ 20.646\n'
          '  Circumradius     √3·φ/2              ≈ 1.401\n'
          '  Inradius         √(25+11√5)/(2√10)   ≈ 1.114',
        ),
        const _P(
          'Tap φ² = in the calculator and you get φ+1. That is the '
          'defining property of the golden ratio — and the reason φ '
          "appears in so many of the dodecahedron's formulas.",
        ),
        const _H('Duality — the mirror of the icosahedron'),
        const _P(
          'Every Platonic solid has a dual solid: replace each face '
          'with a vertex (at the centre of the face) and connect '
          'adjacent new vertices with edges. For the dodecahedron '
          'this produces the icosahedron — and vice versa:',
        ),
        const _Pre(
          '                Dodecahedron   Icosahedron\n'
          '  Faces             12             20\n'
          '  Edges             30             30\n'
          '  Vertices          20             12',
        ),
        const _P(
          'Faces and vertices swap places; the edge count stays the '
          'same. The number 12 appears in both solids — once as the '
          'face count, once as the vertex count.',
        ),
        const _H('120 symmetries'),
        const _P(
          'The dodecahedron possesses the richest symmetry among the '
          'Platonic solids: the icosahedral group Iₕ with 120 '
          'elements — 60 rotations and 60 rotation-reflections. For '
          'comparison: the cube has only 48 symmetries, the '
          'tetrahedron 24.',
        ),
        const _P(
          '120 = 5! = 2³×3×5. The three prime factors 2, 3, and 5 '
          "are exactly those that converge in the dodecahedron's "
          'faces (pentagons) and in the divisibility of 12 (= 2²×3).',
        ),
      ];
    case 8:
      return [
        const _H('360 degrees and the Babylonians'),
        const _P(
          'That a full circle has 360 degrees is no natural constant '
          '— it is a human convention, going back to the Babylonians. '
          'Babylonian mathematics used base 60, and 360 = 6×60. But '
          '360 can also be written as 12×30, and that is exactly how '
          'the Babylonians divided the sky: the apparent path of the '
          'sun (the ecliptic) was split into 12 equal sections of '
          '30° each. Each section was assigned a constellation — the '
          'twelve zodiac signs.',
        ),
        const _P(
          'The choice of 12 was no accident. The Babylonians organised '
          'their base-60 system internally into groups of 12, since '
          '60 = 12×5. For them twelve was a natural sub-unit — in '
          'time-keeping, in the calendar, in astronomy.',
        ),
        const _H('The moon and the twelve'),
        const _P(
          'Why twelve sky-sections in particular? Because nature '
          'itself suggests a twelve-fold division: one solar year '
          'contains almost exactly 12 lunar cycles. A synodic month '
          'lasts about 29.53 days. 12 lunar cycles yield 354.4 days '
          '— only 11 days short of a solar year of 365.24 days. This '
          'near-coincidence made twelve the obvious division of the '
          'year.',
        ),
        const _H('Order in the sky'),
        const _P(
          'The twelve-fold division of the sky was far more than a '
          'coordinate system to ancient cultures. A fascinating '
          "detail: the vernal point drifts slowly through the "
          "constellations because the earth's axis wobbles like a "
          'top (precession, period roughly 25,800 years). The '
          'constellations through which the vernal point drifts are '
          'therefore also called ages. Here too the twelve structures '
          'time: twelve constellations, twelve ages, one great circle.',
        ),
        const _H('Twelve elsewhere in the heavens'),
        const _P(
          'The ancient Egyptians divided day and night into 12 hours '
          'each — hence our 24-hour day. The Chinese zodiac likewise '
          'counts twelve signs in 12-year cycles, derived from the '
          '12-year orbit of Jupiter. Both traditions arose '
          'independently. The convergence on the number 12 is '
          'remarkable.',
        ),
      ];
    case 9:
      return [
        const _H("Pyrite — the fool's dodecahedron"),
        const _P(
          'Pyrite (FeS₂), known as "fool\'s gold" for its golden '
          'lustre, often crystallises in a form deceptively similar '
          'to the Platonic dodecahedron: the pyritohedron. It has '
          'twelve pentagonal faces, 20 vertices, and 30 edges — the '
          'same topology as the regular dodecahedron from chapter 7. '
          'But on close inspection the pentagons are not regular. In '
          'crystallography, true five-fold rotational symmetry is '
          'impossible for periodic crystals — only symmetries of '
          'orders 1, 2, 3, 4, and 6 are allowed. The pyritohedron '
          'sneaks past this rule with irregular pentagons.',
        ),
        const _H('Garnet — another twelve-faced solid'),
        const _P(
          'The minerals of the garnet group preferentially crystallise '
          'as rhombic dodecahedra — also a solid with twelve faces, '
          'but of an entirely different nature: the faces are rhombi, '
          'not pentagons. The rhombic dodecahedron has 14 vertices '
          'and 24 edges and belongs to the cubic crystal system. It '
          'tiles space without gaps — the three-dimensional '
          'counterpart of the honeycomb.',
        ),
        const _P(
          'Nature uses the number 12 as face count for two utterly '
          'different crystal forms — pentagons in pyrite, rhombi in '
          'garnet. Twelve is not bound to a particular geometry.',
        ),
        const _H('Radiolarians — skeletons of glass'),
        const _P(
          'Radiolarians are single-celled marine organisms, barely a '
          'tenth of a millimetre across, that build filigree skeletons '
          'of silica. Some species form skeletons with icosahedral '
          'symmetry — the symmetry of the icosahedron, the dual of '
          'the dodecahedron. The German biologist Ernst Haeckel drew '
          'these organisms in 1904 in his work "Art Forms of Nature" '
          'with a detail that still impresses today.',
        ),
        const _H('Quasicrystals — the exception that proves the rule'),
        const _P(
          'In 1982 Dan Shechtman discovered a pattern with icosahedral '
          'symmetry in an aluminium-manganese alloy — symmetry that '
          'is forbidden in ordinary crystals. The expert community '
          'initially reacted with rejection. But the observation '
          'held, and in 2011 Shechtman received the Nobel Prize in '
          'Chemistry. These quasicrystals have icosahedral symmetry, '
          'which contains both dodecahedral and icosahedral geometry. '
          'Naturally occurring quasicrystals — the mineral icosahedrite '
          '— were discovered in 2009 in a meteorite in Kamchatka.',
        ),
      ];
    case 10:
      return [
        const _H('Twelve on one hand'),
        const _P(
          'Hold a hand in front of you, thumb stretched out, and '
          'look at the four fingers. Each finger has three segments '
          '(phalanges), separated by visible joints. Four fingers '
          'times three segments — that is twelve. The thumb can '
          'serve as a pointer: it touches each segment of the four '
          'fingers in turn and counts from one to twelve.',
        ),
        const _P(
          'This method is no modern invention. In parts of southeast '
          'Asia, India, and the Near East, it has been used for '
          'centuries. It has a decisive advantage over Western '
          'finger-counting: it uses one hand for twelve units instead '
          'of for five.',
        ),
        const _H('From twelve to sixty'),
        const _P(
          'The second hand counts the complete passes. Every time '
          'the first hand has finished a round of twelve, the second '
          'hand extends a finger. Five fingers times twelve — that '
          'yields sixty. With two hands you can count to 60, without '
          'any aid.',
        ),
        const _P(
          'The connection between 12 and 60 is probably no accident: '
          'the Babylonian sexagesimal system (base 60) may well have '
          'its origin in precisely this counting method. 60 = 12×5 '
          '— an elegant fusion of anatomy and arithmetic.',
        ),
        const _H('More twelves in human anatomy'),
        const _Pre(
          '  — 12 rib pairs (standard anatomy)\n'
          '  — 12 cranial nerve pairs (I Olfactory through XII Hypoglossal)\n'
          '  — 12 thoracic vertebrae (linked to the 12 rib pairs)',
        ),
        const _P(
          'Anatomical variations occur (11 or 13 rib pairs are '
          'rarely possible).',
        ),
        const _H('Did the hand shape the number system?'),
        const _P(
          'Whether finger-joint anatomy influenced the emergence of '
          'dozenal number systems, or vice versa, cannot be settled '
          'with historical certainty. It may have been mutual '
          'reinforcement: people began counting on finger joints '
          'because twelve was already important in their culture. '
          'What is certain: the human hand offers a natural physical '
          'basis for twelve.',
        ),
      ];
    case 11:
      return [
        const _H('Twelves in everyday life'),
        const _Pre(
          '  12 inches  = 1 foot\n'
          '  12 ounces  = 1 troy pound (precious metals)\n'
          '  12 pence   = 1 shilling (British currency until 1971)\n'
          '  12 pieces  = 1 dozen\n'
          '  144        = 12² = 1 gross',
        ),
        const _P(
          'These divisions are no historical accidents — they were '
          'chosen because they make sharing easy. A foot splits into '
          'two equal parts (6 inches each), into three (4 inches '
          'each), into four (3 inches each), and into six (2 inches '
          'each). Every one of these divisions comes out exact.',
        ),
        const _P(
          'A metre, by contrast, splits into two equal parts (50 cm '
          'each) and into five (20 cm each), but a third of a metre '
          'is 33.333… cm — an infinite fraction as soon as you take '
          'it exactly. In trades where one continually thirds and '
          'quarters, twelve is more practical than ten.',
        ),
        const _H('The metric system — and its blind spot'),
        const _P(
          'The metric system has great strengths: it is coherent '
          '(all units fit together), it scales decimally (kilo, '
          'mega, milli, micro), and it is internationally '
          'standardised. These advantages are real and weighty. No '
          'sensible person would propose abolishing SI.',
        ),
        const _P(
          'But the metric system inherits the weakness of its base. '
          'In base 10 a third is an infinite fraction: 0.333… In a '
          'dozenal metric system 1/3 would be 0.4 — exact, short, '
          'free of remainder. The elegance of the metric principle '
          'would be preserved — only the base would be better.',
        ),
        const _H("Tom Pendlebury's TGM"),
        const _P(
          'Tom Pendlebury, a member of the Dozenal Society of Great '
          'Britain, followed this thought to its conclusion. His '
          'system is called TGM — named after its three base units '
          'Tim (time), Grafut (length), Maz (mass). Pendlebury '
          'started not with length but with time: he divided the '
          'hour into 12⁴ equal parts. From the Tim he derived the '
          "Grafut via the earth's gravitational acceleration "
          '(≈ 29.6 cm), and the mass unit Maz from the volume of a '
          'cubic Grafut of water.',
        ),
        const _P(
          'The result is a fully coherent system of units, in which '
          'all conversions are powers of 12. TGM has never been '
          'adopted beyond enthusiast circles, but demonstrates that '
          'a dozenal metric system would not just be possible — in '
          'some respects it would be superior to the decimal one.',
        ),
        const _H('What this calculator shows'),
        const _P(
          'Tap 1 / 3 = and see 0.4 — short, exact, without a '
          'repeating-digit bar — and you grasp in a second what '
          'pages of arguments cannot convey. The question "dozenal '
          'or decimal?" will never be settled in practice. But the '
          'mathematical advantages of base 12 are objective and '
          'measurable, and this calculator makes them perceivable.',
        ),
        const _P(
          'Tip: the info menu has an «Imperial-12 conversions» tool '
          'that decomposes any value across these unit ladders — '
          'items/dozens/gross, inches/feet/yards/miles, troy ounces '
          'through long tons, pence/shillings/pounds, time, and angle. '
          'Type a number and watch the same value fall apart into the '
          'ladder of each domain.',
        ),
      ];
    default:
      return [_P(l.chapterNotFound)];
  }
}
