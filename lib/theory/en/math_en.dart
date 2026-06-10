// English prose for the "Dozenal Mathematics" chapters. part of
// ../math_theory.dart. Simple, clear sentences (easier to translate) for
// complex topics. The app-internals chapter is written from the source
// (logic/rational.dart, logic/expression.dart, state.dart); the maths/history
// chapters are distilled from docs/research/math_*.md.
//
// Order convention: the maths and history chapters come first; the
// app-internals chapter ("How this calculator computes") stays last.

part of '../math_theory.dart';

List<ProseChapter> _mathChaptersEn() => const [
  ProseChapter(
    'Divisors, Fractions, and Repeating Digits',
    [
      ProseSection(
        'Why Twelve Is So Divisible',
        'In base twelve we write twelve digits: 0 through 9, plus A for ten '
            'and B for eleven. So here "10" means twelve.\n\n'
            'Twelve divides evenly by an unusually large set of numbers: 1, '
            '2, 3, 4, 6, and 12. Ten, by contrast, only by 1, 2, 5, and 10. The '
            'reason lies in how the numbers are built: ten is two times five, twelve '
            'is two times two times three. Twelve puts its building blocks into the '
            'small, common divisors 2 and 3 — and is therefore divisible by 3 and '
            'by 4, where ten fails. Size is not what matters: 16 is larger, but '
            'divisible only by powers of two.',
      ),
      ProseSection(
        'Which Fractions Come Out Even',
        'Whether a fraction yields a finite expansion comes down to one simple '
            'rule: it terminates exactly when the denominator consists only of '
            'prime factors of the base.\n\n'
            'Because twelve contains three, many everyday fractions come out even in '
            'base twelve: one half = 0.6; one third = 0.4; one quarter '
            '= 0.3; one sixth = 0.2; one ninth = 0.14; one twelfth = 0.1. '
            'In base ten, by contrast, thirds, sixths, and ninths run on '
            'forever. The price of twelve: fractions with five in the denominator come out '
            'awkward — one fifth is 0.2497 in base twelve, repeating.',
      ),
      ProseSection(
        'When It Repeats',
        'If a fraction does not terminate, a fixed group of digits repeats from '
            'some point on — the period. How long it is follows a clear '
            'rule from number theory and depends on the base and the denominator.\n\n'
            'Some things are equally unwieldy in both worlds: one seventh has, in '
            'base ten (0.142857) as in base twelve (0.186A35), a '
            'six-digit period. Overall, among the small denominators, '
            'base twelve has somewhat fewer repeating fractions than base ten '
            '— but in return the periods, when they do occur, can run a bit longer.',
      ),
      ProseSection(
        'Divisibility at a Glance',
        'In practice, the strength of twelve shows in the divisibility rules. '
            'Whether a number is divisible by 2, 3, 4, or 6 is revealed in base '
            'twelve by the last digit alone. In base ten that works only for 2, '
            '5, and 10.\n\n'
            'For eleven (B) there is a digit-sum rule — just like the '
            'familiar casting-out-nines in base ten, because twelve is one above eleven. '
            'Only seven has, as in base ten too, no '
            'simple test.',
      ),
      ProseSection(
        'No Base Wins Everywhere',
        'So twelve has a real advantage at thirds and quarters — '
            'and a real disadvantage at fifths, which matter for percentages and money. '
            'It trades one for the other.\n\n'
            'More divisors are not endlessly better either: otherwise sixty would '
            'have the edge, since it is divisible by even more numbers — yet '
            'it would need sixty digits and an enormous multiplication table. The '
            'dozenal societies see twelve as a good middle ground: only '
            'two extra symbols, a small multiplication table, but the divisors 2, 3, and '
            '4. That is their judgment call, not a proof.',
      ),
    ],
    sources: [
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2',
        'A1',
      ),
      Source(
        'Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html',
        'R1',
        'A2',
      ),
      Source(
        'Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'The Number Bases Compared',
    [
      ProseSection(
        'What a Base Is',
        'A place-value system gives each digit a value according to its '
            'position. The base tells you how many digits there are and by what '
            'factor each place grows. Base ten uses ten digits, base '
            'twelve uses twelve (0–9, A, B), base two only two (0 and 1).\n\n'
            'The same number looks different depending on the base, but means the same thing. '
            'A small base needs many places (binary gets very long), '
            'a large base needs many different symbols.',
      ),
      ProseSection(
        'Six Bases at a Glance',
        '• Base 2 (binary): the language of computers — a switch is on '
            'or off.\n'
            '• Base 8 (octal): a niche today, for instance file permissions under '
            'Unix.\n'
            '• Base 10 (decimal): our everyday life and the metric system.\n'
            '• Base 12 (dozenal): the dozen, the clock, and the inch — and the cause of the '
            'dozenal movement.\n'
            '• Base 16 (hexadecimal): a compact notation for '
            'computer data.\n'
            '• Base 60 (sexagesimal): time and angles, a legacy of Babylon.',
      ),
      ProseSection(
        'Converting Between the Bases',
        'Numbers move from one base to another by fixed procedures. '
            'For the whole part you divide repeatedly by the target base and read '
            'the remainders from bottom to top. For the fractional part you multiply '
            'repeatedly by the target base and read the whole-number parts from top '
            'to bottom.\n\n'
            'Example: 0.5 becomes 0.6 in base twelve; 0.125 becomes 0.16. '
            'Between related bases it is even simpler: because sixteen '
            'is a power of two, one hex digit corresponds to exactly four '
            'binary places — you only have to group them.',
      ),
      ProseSection(
        'Where Each Base Is at Home',
        'Computers compute in binary, because a transistor knows only two states. '
            'Hexadecimal is the handy shorthand for it — it appears in '
            'memory addresses, web colors like #FF00FF, and Unicode numbers. Time '
            'and angles follow sixty: sixty minutes, 360 degrees, easily '
            'divisible into thirds and quarters. Everyday life and almost all '
            'of science run in decimal — mostly out of habit and because '
            'the metric system is built on it.\n\n'
            'Twelve lives on in the dozen, the gross, the clock, and the inch. Since the 18th '
            'century there have been advocates of a genuine twelve-based arithmetic — '
            'from Buffon through Isaac Pitman to Frank Emerson Andrews, who in 1935 '
            'wrote the first book on the subject. Dedicated societies have kept the '
            'idea alive to this day; more on this in the section "The Dozenal Society".',
      ),
      ProseSection(
        'No Base Is the Best Everywhere',
        'Every base has its purpose. Two and sixteen are not "better for '
            'humans" but ideal for machines. Ten is familiar and firmly '
            'entrenched. Twelve divides nicely into thirds and quarters, but loses '
            'out at the fifth. Sixty divides best, but with sixty symbols '
            'it is too large for everyday use.\n\n'
            'With systems of measurement, what counts in the end is less the base itself than the '
            'consistency with which you stick to a single base: the '
            'metric system wins because everything runs on the same ten — '
            'a mixed system of mile, yard, foot, and inch would gain that '
            'advantage in no base at all.',
      ),
    ],
    sources: [
      Source(
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
        'R2',
        'A1',
      ),
      Source(
        'Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal',
        'R2',
        'A1',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Octal — Wikipedia',
        'https://en.wikipedia.org/wiki/Octal',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'A Short History of Place-Value Systems',
    [
      ProseSection(
        'Before Place Value',
        'For a long time people wrote numbers by adding up symbols. The Roman '
            'numerals are such a system: XVII means ten plus five plus one '
            'plus one. That is fine for reading, but laborious for calculating, and '
            'large numbers get unwieldy.\n\n'
            'The great leap was the place-value system: the same digit '
            'means something different depending on its position. Only this makes '
            'written calculation with arbitrarily large numbers easy — and '
            'requires a digit for "nothing in this place": zero.',
      ),
      ProseSection(
        'Babylon and Sixty',
        'The first true place-value system arose among the Sumerians and '
            'Babylonians, more than four thousand years ago, in base sixty. It '
            'is regarded as their greatest mathematical achievement.\n\n'
            'But they did not yet have a full zero: they knew a '
            'placeholder symbol for empty places in the middle, but never at '
            'the end of a number. Their legacy is with us to this day — in the sixty '
            'minutes of the hour and the 360 degrees of the circle.',
      ),
      ProseSection(
        'The Indian Invention of Zero',
        'Today\'s base-ten system with zero comes from India. Aryabhata '
            'used place-value notation in the 5th century; Brahmagupta '
            'in 628 treated zero for the first time as a number in its own right with its own '
            'rules of arithmetic, not merely as a gap.\n\n'
            'From there Arabic and Persian scholars took it up — '
            'al-Khwarizmi wrote about it around 825 —, and through them it reached '
            'Europe. That is why our digits are still called "Arabic '
            'numerals" to this day, although the idea comes from India.',
      ),
      ProseSection(
        'The Bases of the Machines',
        'With the calculating machines came new bases. Gottfried Wilhelm Leibniz '
            'published the binary system of just 0 and 1 in 1703 — he even saw '
            'in it the ancient hexagrams of the Chinese I Ching '
            'reflected back.\n\n'
            'Today computers compute in binary but mostly write it '
            'in hexadecimal: with the 8-bit byte of the IBM System/360 in the 1960s, '
            'base sixteen took hold, because two hex digits make '
            'exactly one byte. Each base thus found its place — not '
            'because it is "the best," but because it suits its task.',
      ),
    ],
    sources: [
      Source(
        'Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2',
        'A1',
      ),
      Source(
        'Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal',
        'R2',
        'A1',
      ),
      Source(
        'History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2',
        'A2',
      ),
      Source(
        'Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number',
        'R3',
        'A2',
      ),
      Source(
        'Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal',
        'R2',
        'A1',
      ),
      Source(
        'IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter('How This Calculator Computes', [
    ProseSection(
      'Two Calculators in One',
      'When you press the equals key, the app does not calculate once '
          'but twice — with two entirely different machines.\n\n'
          'The first is an exact fraction calculator. It computes without any '
          'rounding, with arbitrarily large whole numbers. The second is a '
          'fast decimal calculator, the kind almost every pocket calculator has — '
          'it computes with limited precision, but handles everything, including '
          'sine, square root, and logarithm. Both start up at every '
          'equals sign.',
    ),
    ProseSection(
      'The Exact Fraction',
      'The fraction calculator holds numbers as a ratio of two whole numbers. '
          'One third really stays one third, not 0.333… Only '
          'for display does it turn the fraction into dozenal decimal places.\n\n'
          'In doing so it detects when the decimal places repeat. One '
          'third in base twelve is a clean 0.4. One fifth, by contrast, runs '
          'periodically: 0.2497 2497 2497 … The app shows this with a bar '
          'over the repeating group and a dot marking the '
          'start of the period. The result thus stays exact, instead of being '
          'quietly rounded.',
    ),
    ProseSection(
      'When the Fraction Is Not Enough',
      'Some calculations cannot be written as a fraction. As soon as a '
          'sine, a square root, a logarithm, or a similar function '
          'appears — or a division by zero occurs — the fraction calculator '
          'gives up.\n\n'
          'Then the decimal calculator steps in. Its result is only '
          'approximate, so the app puts a "≈" sign in front of it: '
          '"approximately." If both paths work out, the exact fraction always wins. '
          'So the "≈" appears only where a true approximation is needed.',
    ),
    ProseSection(
      'Long Periods and the Display',
      'Exact results can get very long. Some fractions have '
          'periods of over a hundred digits — far more than fits on one line.\n\n'
          'So that nothing runs off the display, the app drops, from the right, as '
          'many of the rearmost (least significant) places as it takes until the rest '
          'fits on the line, and sets a "…" as a sign that there '
          'is more to come. The period marking is cleanly '
          'shortened along with it. The number thus stays honest: what is cut off '
          'is shown visibly, not hidden.',
    ),
  ]),
  ProseChapter(
    'Fibonacci, square numbers, and curiosities',
    [
      ProseSection(
        '144 — where two worlds meet',
        'The Fibonacci sequence begins with 1, 1, and each subsequent number '
            'is the sum of the two before it: 1, 1, 2, 3, 5, 8, 13, 21, 34, '
            '55, 89, 144, … It grows exponentially — the terms rapidly become '
            'very large. The square numbers 1, 4, 9, 16, 25, 36, … grow only '
            'quadratically, and therefore much more slowly. Two sequences '
            'growing so differently have almost no reason ever to meet.\n\n'
            'And yet they do: the twelfth Fibonacci number is 144, and '
            '144 = 12² is a perfect square. We write this term briefly as '
            'F₁₂ = 144. In base 12, 144 is at the same time "100", the first '
            'three-digit number, and in trade the gross — a dozen dozens. Three '
            'properties coincide in a single number.\n\n'
            'That this is no mere accident but a unique case was proved by '
            'J. H. E. Cohn in 1964: apart from 0, 1, and 144 there is no '
            'further number in the entire infinite Fibonacci sequence that is '
            'simultaneously a perfect square. His proof is elementary but not '
            'simple; it uses the closely related Lucas sequence and divisibility '
            'arguments. Twelve stands at a proven, unique crossing of two '
            'fundamental number sequences — a special fact, not mysticism.\n\n'
            'An even stronger theorem from 2006 (Bugeaud, Mignotte, and Siksek) '
            'goes further: the only perfect powers at all in the Fibonacci '
            'sequence are 0, 1, 8 = 2³, and 144 = 12². Cohn\'s statement about '
            'square numbers is the special case of that.',
      ),
      ProseSection(
        'The golden ratio',
        'If you divide a Fibonacci number by its predecessor, these ratios '
            'converge ever more closely to a fixed number: the golden ratio '
            'φ = (1+√5)/2 ≈ 1.618. Formally F(n+1)/F(n) → φ. Johannes Kepler '
            'noticed this convergence as early as 1611. In base 12, '
            'φ ≈ 1;74BB677…; the calculator carries φ as a constant in the '
            'extended panel.\n\n'
            'φ has a simple defining property: φ² = φ + 1. It is the only '
            'positive number whose square is exactly 1 more than itself. '
            'Entering φ² = in the calculator gives exactly φ + 1 — the '
            'identity becomes immediately visible.\n\n'
            'In nature φ does genuinely appear where leaves and seeds grow '
            'offset by the "golden angle"; the spiral counts of sunflowers or '
            'pine cones are then often adjacent Fibonacci numbers. Much else '
            'attributed to φ does not hold up to scrutiny, however: the Nautilus '
            'spiral does not follow φ, and a deliberate use in the Parthenon or '
            'by da Vinci is not documented. φ is real in mathematics and in '
            'phyllotaxis — not everywhere.',
      ),
      ProseSection(
        'Twelve as a highly composite number',
        'Number theory knows several precise ways to describe a number as '
            '"rich in divisors" — and twelve appears in some of them. Twelve is '
            'highly composite: it has more divisors than any smaller number. Its '
            'divisors are 1, 2, 3, 4, 6, 12 — six of them; no number below 12 '
            'has as many. Srinivasa Ramanujan studied this class in 1915 in a '
            'celebrated paper in the Proceedings of the London Mathematical '
            'Society.\n\n'
            'Twelve is also the smallest abundant number: the sum of its proper '
            'divisors, 1+2+3+4+6 = 16, exceeds the number itself. For smaller '
            'numbers the reverse holds — for 10 one gets 1+2+5 = 8, less than '
            '10. Twelve is the first number at which the divisors "overflow."\n\n'
            'A rarer property: twelve is a sublime number. That means two key '
            'figures of its divisors are themselves perfect numbers. The count '
            'of divisors is 6 (and 6 = 1+2+3 is perfect). The sum of all '
            'divisors is 1+2+3+4+6+12 = 28 (and 28 = 1+2+4+7+14 is likewise '
            'perfect). To this day only two sublime numbers are known — twelve '
            'and a 76-digit number. The term comes from recreational mathematics '
            'and is narrowly constructed, though; its rarity is therefore no '
            'proof of cosmic significance, but a consequence of a specific '
            'definition.',
      ),
      ProseSection(
        'A pyramid of cannonballs',
        'Stack cannonballs into a pyramid with a square base and the n-th '
            'pyramid contains 1² + 2² + … + n² balls. Thomas Harriot derived '
            'this summation formula around 1587, when Sir Walter Raleigh wanted '
            'to know how to count stacked cannonballs.\n\n'
            'A harder question is: when is such a pyramid also a perfect square '
            'arrangement of balls? There is only one non-trivial case, and it is '
            'beautiful: 1² + 2² + … + 24² = 4900 = 70². The same 4900 balls '
            'can therefore be laid out as a pyramid with 24 layers or as a '
            '70×70 square. Édouard Lucas conjectured in 1875 that this is the '
            'only solution; a complete proof came only in 1918 from '
            'G. N. Watson — the problem was genuinely hard.\n\n'
            'The number 24 is exactly twice 12. That is a pleasing observation '
            '— but honestly not a documented reason: 24 appears here because '
            'the underlying equation happens to have that solution, not because '
            'of any connection to base twelve.',
      ),
      ProseSection(
        'Plato\'s ideal city',
        'In his "Laws" (Book V) Plato asks how many citizens an ideal city '
            'should have. His answer: 5040. The argument is not mystical but '
            'practical — a city must constantly divide its citizens into equal '
            'groups, and 5040 is divisible by every number from 1 to 12, with '
            'the sole exception of 11. (For divisibility by 11 Plato suggests '
            'subtracting two families.)\n\n'
            'What Plato describes here is the same insight that underlies the '
            'dozenal system: in everyday life the small divisors are the '
            'important ones. 5040 = 7! is in a sense the big sister of '
            'twelve — the same divisibility philosophy applied to an entire '
            'city population instead of to a number system.',
      ),
      ProseSection(
        'Curiosity is not numerology',
        'Twelve carries many labels at once: highly composite, abundant, '
            'sublime, index of the only non-trivial Fibonacci square. This '
            'accumulation looks impressive — but each property is its own '
            'independent definition. Their joint occurrence is neither the cause '
            'nor a symbol of something higher. What really sets twelve apart is '
            'its smallness: it is the smallest number with these properties; '
            'larger numbers such as 24, 36, or 60 have even more divisors.\n\n'
            'A widespread error deserves clear correction: twelve is often '
            'called a "perfect number." That is mathematically false. Perfect '
            'means: the sum of the proper divisors equals the number itself — '
            'as with 6 (1+2+3) or 28 (1+2+4+7+14). For twelve the proper '
            'divisors sum to 16, which is more than 12. Twelve is abundant, not '
            'perfect. The confusion goes back to Nicomachus of Gerasa (around '
            'AD 100), who attached moral valuations to these number classes — '
            'an interpretation of antiquity, not mathematics.\n\n'
            'The value of this chapter lies precisely in the distinction: '
            'Cohn\'s theorem, the cannonball identity, and the smallest abundant '
            'number are proven facts. They deserve to be seen for what they are '
            '— fine, honest mathematics that needs no mystical charge.',
      ),
    ],
    sources: [
      Source(
        'Square Fibonacci Numbers, Etc. (J. H. E. Cohn, 1964)',
        'https://math.la.asu.edu/~checkman/SquareFibonacci.html',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci and Lucas perfect powers (Bugeaud, Mignotte, Siksek, 2006) — Annals of Mathematics',
        'https://annals.math.princeton.edu/2006/163-3/p05',
        'R1',
        'A1',
      ),
      Source(
        'Fibonacci sequence — Wikipedia',
        'https://en.wikipedia.org/wiki/Fibonacci_sequence',
        'R2',
        'A1',
      ),
      Source(
        'Cannonball problem — Wikipedia',
        'https://en.wikipedia.org/wiki/Cannonball_problem',
        'R2',
        'A1',
      ),
      Source(
        'Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number',
        'R2',
        'A1',
      ),
      Source(
        'Abundant number — Wikipedia',
        'https://en.wikipedia.org/wiki/Abundant_number',
        'R2',
        'A1',
      ),
      Source(
        'Sublime number — Wikipedia',
        'https://en.wikipedia.org/wiki/Sublime_number',
        'R2',
        'A1',
      ),
      Source(
        '5040 (number) — Wikipedia',
        'https://en.wikipedia.org/wiki/5040_(number)',
        'R2',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'The dodecagon (twelve-sided polygon)',
    [
      ProseSection(
        'What a regular dodecagon is',
        'A regular dodecagon (Greek dodekagōnon: dōdeka = twelve, '
            'gōnía = angle) is a polygon with twelve equal sides and twelve '
            'equal interior angles. All twelve vertices lie evenly distributed '
            'on a circle, the circumscribed circle, each 30° apart from the '
            'next.\n\n'
            'Each interior angle measures exactly 150°. This follows from a '
            'simple consideration: walking once around the figure, you turn '
            'through a full 360° at the twelve corners combined, i.e. 30° per '
            'corner. This exterior angle and the interior angle add up to 180°, '
            'leaving 180° − 30° = 150°. In the dozenal system 150° is written '
            'as 106°, and the exterior angle 30° as 26°. All angles that appear '
            'in the dodecagon are multiples of 15° — dozenal 13°.\n\n'
            'The dodecagon is one of the shapes that can be drawn exactly with '
            'compass and straightedge. The path is short: strike a circle, '
            'divide it into six equal parts (achievable with the compass alone, '
            'because in a hexagon the side equals the radius), then bisect each '
            'of the six arcs — twelve evenly distributed points are ready. That '
            'this works is no accident: a regular n-gon is constructible if and '
            'only if n is composed of a power of two and distinct so-called '
            'Fermat primes (theorem of Gauss and Wantzel). For 12 = 2² × 3 '
            'this is satisfied, because 3 is such a prime.',
      ),
      ProseSection(
        'Three polygons share the vertices',
        'What is remarkable about the dodecagon is less its shape than what is '
            'contained within it. Connecting every second vertex yields a '
            'regular hexagon. Every third vertex gives a square, every fourth '
            'an equilateral triangle — all three exactly, not approximately, '
            'and all on the same circumscribed circle as the dodecagon '
            'itself.\n\n'
            'Behind this lies a general rule: a regular m-gon fits exactly '
            'inside an n-gon using the same vertices if m divides n; one then '
            'connects every (n/m)-th vertex. Hexagon, square, and triangle are '
            'contained within the dodecagon because 12 is divisible by 6, 4, '
            'and 3. And 12 is the smallest number divisible by 3, 4, and 6 '
            'simultaneously — their least common multiple, lcm(3,4,6). That is '
            'why the dodecagon is the smallest regular polygon that jointly '
            'contains these three basic shapes; a pentagon, octagon, or decagon '
            'cannot do this.\n\n'
            'It is exactly the same divisibility that makes the dozenal system '
            'so convenient. The fact that 12 divides evenly by 2, 3, 4, and 6 '
            'makes the three polygons coincide geometrically in one dodecagon '
            '— and makes the fractions one half, one third, one quarter, and '
            'one sixth into short, clean dozenal fractions. Shape and fraction '
            'arithmetic share the same root.',
      ),
      ProseSection(
        'Fifty-four diagonals, six lengths',
        'A diagonal connects two vertices that are not adjacent. The formula '
            'n(n−3)/2 gives for the dodecagon 12 × 9 / 2 = 54 diagonals. That '
            'looks unwieldy, but is strictly ordered: because the dodecagon is '
            'so symmetric, all diagonals that skip the same number of vertices '
            'are equal in length. There are five such skip-distances plus the '
            'diameter — just six different lengths in all. With side length 1:\n\n'
            'd₂ skips one vertex and measures √(2+√3) ≈ 1.932. d₃ skips two '
            'vertices, 1+√3 ≈ 2.732. d₄ skips three vertices, (3√2+√6)/2 ≈ '
            '3.346. d₅ skips four vertices, 2+√3 ≈ 3.732. d₆ finally connects '
            'opposite vertices — that is the diameter, √6+√2 ≈ 3.864.\n\n'
            'These values hide clean patterns. The fifth and third diagonals '
            'differ by exactly the side length: (2+√3) − (1+√3) = 1. And the '
            'diameter is exactly twice the shortest diagonal, d₆ = 2 · d₂ — '
            'the same 2:1 ratio as the octave in music. All angles between the '
            'diagonals are again multiples of 15°, because the twelve vertices '
            'divide the full circle into steps of 30°.',
      ),
      ProseSection(
        'The area and the "round three"',
        'To find the area, decompose the dodecagon from its centre into twelve '
            'equal, narrow triangles. Each has two legs of length R — the '
            'circumradius, the distance from the centre to a vertex — and an '
            'apex angle of 30°. Summing the twelve triangles, something '
            'beautiful falls out:\n\n'
            'A = 3 · R².\n\n'
            'The factor is a clean, whole three, without any root. This works '
            'because sin(30°) = one half appears in the calculation, and 30° is '
            'precisely the vertex angle of the dodecagon. Among the constructible '
            'polygons it is the only larger one for which the area formula comes '
            'out so cleanly; for the hexagon, for instance, a root remains. '
            'If one prefers the side length s, the area is A = 3(2+√3)·s² ≈ '
            '11.196·s².\n\n'
            'Setting the area in ratio to the circumscribed circle, whose area '
            'is π·R², the R² cancels and exactly 3/π ≈ 0.9549 remains. The '
            'dodecagon therefore fills its circumscribed circle to about 95.5 % '
            '— far more than a hexagon (about 83 %), a square (around 64 %), or '
            'a triangle (around 41 %). Instead of the unwieldy circle number π '
            'stands the round three: at R = 1 the dodecagon area is exactly 3 '
            'and thus just below π ≈ 3.1416.\n\n'
            'Archimedes already exploited this closeness. He approximated π via '
            'polygons, starting with the easily drawn hexagon and doubling the '
            'number of sides: 6, 12, 24, 48, 96. The dodecagon was his first '
            'step. The 96-gon — dozenally 12 × 8 — already fills the circle to '
            '99.93 % and gave him 3 + 10/71 < π < 3 + 1/7.',
      ),
      ProseSection(
        'Where the dodecagon appears as a shape',
        'The twelve hour-marks of an analogue clock form a regular dodecagon: '
            'twelve points 30° apart on the circle. The fact that the full '
            'circle spans 360° = 12 × 30° and the day has twice twelve hours is '
            'the same 30° grid that compass roses also use for twelve '
            'directions.\n\n'
            'Several countries have minted twelve-sided coins — above all so '
            'that their shape can be felt apart from round coins. The British '
            'brass threepence (from 1937) was the first non-round coin in '
            'general circulation in Great Britain; the twelve-sided pound coin '
            '(from 2017) was introduced against counterfeiting and deliberately '
            'styled after that precedent. Unlike what is sometimes claimed, such '
            'coins do not have a constant width — that property belongs to the '
            'seven-sided British 20p and 50p pieces, which are not '
            'dodecagons.\n\n'
            'The dodecagon alone cannot tile the plane: 150° does not divide '
            '360° evenly. Together with other polygons it can, though — for '
            'instance with triangles, or with squares and hexagons whose angles '
            'add up to 360° at every vertex. Such twelve-fold patterns form a '
            'foundation of Islamic geometric ornament. How twelve found its way '
            'beyond that into architecture and art is the subject of the '
            'chapters "The twelve in building" and "The twelve in art."',
      ),
      ProseSection(
        'Geometry, not number mysticism',
        'The properties of the dodecagon are genuine mathematical facts, not '
            'secrets. That the area stands in the ratio 3/π to the circumscribed '
            'circle follows necessarily from sin(30°) = one half; it shows only '
            'that the dodecagon approximates the circle well, and creates no '
            'hidden connection between three and π. Likewise the plain three in '
            '"area = 3·R²" is a consequence of the vertex angle, not a miracle.\n\n'
            'The formula "A = 3·R²" also calls for the right reading: the clean '
            'three applies to the circumradius. With side length 1 the area is '
            'about 11.2, not 3. And with the diagonals, precision pays off — '
            'the fourth is (3√2+√6)/2 ≈ 3.346, no simpler radical expression; '
            'incorrect values circulate in some sources.\n\n'
            'Finally, easy constructibility says only that the shape arises with '
            'simple tools. It explains well why dodecagons appear so frequently '
            'in craftsmanship, on coins, and in ornament. Why the clock has '
            'twelve hours, however, is a question of tradition, not of geometry. '
            'The dodecagon is a fine geometric tool — and nothing more should be '
            'read into it.',
      ),
    ],
    sources: [
      Source(
        'Dodecagon — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Constructible polygon — Wikipedia',
        'https://en.wikipedia.org/wiki/Constructible_polygon',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagon (12-gon) calculator and formulas — RedCrab Software',
        'https://www.redcrab-software.com/en/Calculator/Geometry/Dodecagon',
        'R2',
        'A1',
      ),
      Source(
        'Area of a Dodecagon — Alison Kiddle',
        'https://alisonkiddle.co.uk/area-of-a-dodecagon/',
        'R3',
        'A1',
      ),
      Source(
        'Getting Closer to π: Inscribing and Circumscribing Polygons — Univ. Alberta',
        'https://sites.ualberta.ca/~esimmt/think/main/richMathTasks/evan/files/InscribingAndCircumscribingPolygons.pdf',
        'R3',
        'A1',
      ),
      Source(
        'Archimedes on the Circumference and Area of a Circle — AMS Feature Column',
        'https://www.ams.org/publicoutreach/feature-column/fc-2012-02',
        'R2',
        'A1',
      ),
      Source(
        'Brass threepence — Wikipedia',
        'https://en.wikipedia.org/wiki/Brass_threepence',
        'R2',
        'A1',
      ),
      Source(
        'Dodecagonal coin — Wikipedia',
        'https://en.wikipedia.org/wiki/Dodecagonal_coin',
        'R2',
        'A1',
      ),
    ],
    imageId: 'math/dodekagon',
  ),
  ProseChapter(
    'The dodecahedron',
    [
      ProseSection(
        'Twelve pentagons in space',
        'The dodecahedron (Greek dōdeka = twelve, hédra = face) is a solid '
            'made of twelve identical, regular pentagons. All faces are '
            'identical, all edges equal in length, and exactly three pentagons '
            'meet at every vertex. Counted out, that gives twelve faces, thirty '
            'edges, and twenty vertices.\n\n'
            'It is one of the five Platonic solids — the convex solids whose '
            'faces consist exclusively of identical, regular polygons and at '
            'whose vertices the same number of faces always meet. The other four '
            'are the tetrahedron (four triangles), the cube (six squares), the '
            'octahedron (eight triangles), and the icosahedron (twenty '
            'triangles). Among these five, the dodecahedron is the only one '
            'with pentagonal faces.\n\n'
            'Briefly described, the dodecahedron is denoted {5, 3}: pentagons '
            'as faces, three of them at every vertex. The dihedral angle '
            'between two neighbouring faces is approximately 116.57° (decimal). '
            'For comparison: in the cube it is 90°.',
      ),
      ProseSection(
        'Why there are exactly five',
        'That there can only be five such solids — no more and no fewer — is a '
            'proven result. Two paths lead to it, and both arrive at the same '
            'conclusion.\n\n'
            'The first path is a simple count, Euler\'s polyhedron formula: for '
            'every convex solid, vertices minus edges plus faces equals two. For '
            'the dodecahedron: 20 − 30 + 12 = 2. Leonhard Euler noted this '
            'relationship around 1750; the first complete proof was given by '
            'Cauchy in 1811. The formula holds for every hole-free convex '
            'solid, every pyramid, every prism. Combine it with the requirement '
            'that the faces be identical regular polygons and exactly five '
            'solutions remain.\n\n'
            'The second path is more intuitive and examines a single vertex. '
            'The interior angle of a regular pentagon is 108°. When three '
            'pentagons meet at a vertex, their angles sum to 324°. The missing '
            '36° to the full circle is exactly the gap that folds toward the '
            'space — that is how a vertex of the dodecahedron is formed. Four '
            'pentagons would already give 432° and could no longer fit into one '
            'vertex. Three pentagons are therefore the only possibility, and the '
            'dodecahedron the only solid with pentagonal faces.',
      ),
      ProseSection(
        'The golden ratio in the pentagon and in the solid',
        'Every face of the dodecahedron is a regular pentagon — and the '
            'pentagon is the simplest plane figure in which the golden ratio '
            'φ = (1+√5)/2 ≈ 1.618 appears as a ratio of lengths. The diagonal '
            'of a regular pentagon is exactly φ times its side. Entering φ² = '
            'in the calculator gives φ+1 — that is the defining equation of '
            'the golden ratio.\n\n'
            'Because every face carries this ratio, φ permeates the entire '
            'solid. Place the dodecahedron in a coordinate system and φ '
            'literally appears in the numbers of its twenty vertices. Eight of '
            'these vertices form a cube on their own; in total five different '
            'cubes can be inscribed in the dodecahedron. Other vertices span '
            'three golden rectangles — rectangles with the side ratio φ to one '
            '— that stand mutually perpendicular.\n\n'
            'φ appears here not by magic but by necessity: wherever there are '
            'regular pentagons, there is φ. The further interpretations of the '
            'golden ratio as the "divine proportion" are human attributions, not '
            'a property of the geometry itself.',
      ),
      ProseSection(
        'Duality and the richest symmetry',
        'For every Platonic solid there is a dual solid: place a new vertex at '
            'the centre of every face and connect the vertices of neighbouring '
            'faces. For the dodecahedron this creates the icosahedron — and '
            'vice versa. Faces and vertices swap places: the dodecahedron has '
            '12 faces and 20 vertices, the icosahedron 20 faces and 12 vertices. '
            'The edge count of 30 stays the same for both. Twelve appears in '
            'both — once as the face count, once as the vertex count.\n\n'
            'Because both share the same structure, they also share the same '
            'symmetry — and it is the richest among all the Platonic solids: '
            '120 symmetries in all, namely 60 rotations and 60 '
            'roto-reflections. The cube has only 48, the tetrahedron 24. The '
            '60 rotations are distributed over six fivefold axes through '
            'opposite face centres, ten threefold axes through opposite vertices, '
            'and fifteen twofold axes through opposite edge midpoints.\n\n'
            'The number 120 can be written as 5! (5 × 4 × 3 × 2 × 1) and '
            'decomposed into the prime factors 2, 3, and 5 — the same three '
            'numbers that recur in the axes and in the pentagonal face shape. '
            'These fivefold axes are also the reason why no ordinary crystal '
            'can form a true dodecahedron: a periodic lattice cannot '
            'accommodate fivefold symmetry (see the chapter on pyrite).',
      ),
      ProseSection(
        'The Euler twelve: why always twelve pentagons',
        'One last result links the dodecahedron to things that at first seem '
            'to have nothing to do with it. The question is: can one build a '
            'closed, sphere-like shell from regular hexagons alone? The answer '
            'is no. Pure hexagons produce a flat surface; to curve it into a '
            'sphere, exactly twelve pentagons must be incorporated — regardless '
            'of how many hexagons are otherwise used.\n\n'
            'This again follows from Euler\'s theorem. With zero hexagons the '
            'regular dodecahedron arises. With twelve pentagons and twenty '
            'hexagons arises the classic football — and here lies a common '
            'error: a football is not a dodecahedron. It is a truncated '
            'icosahedron with 32 faces: twelve pentagons plus twenty hexagons. '
            'The two share only the twelve pentagons; the dodecahedron has no '
            'hexagons at all.\n\n'
            'The regular dodecahedron is thus the purest case of this '
            'twelve-ness: twelve pentagons and nothing else.',
      ),
      ProseSection(
        'Cube, dodecagon, and pyritohedron — what it is not',
        'In role-playing games the dodecahedron is known as the D12, the '
            'twelve-sided die. Because it comes closest to the sphere among all '
            'five solids, it rolls pleasantly and reliably comes to rest on a '
            'face; its twelve equal faces make it fair.\n\n'
            'Three confusions are worth clarifying. First: the dodecagon is not '
            'the dodecahedron. Both words carry "dodeca-" (twelve), but the '
            'dodecagon is a flat twelve-sided polygon, while the dodecahedron is '
            'a three-dimensional solid with twelve faces. Second: the '
            'pyritohedron of the mineral pyrite likewise has twelve pentagonal '
            'faces, but is not a regular dodecahedron — its pentagons are '
            'distorted, and it has no true fivefold symmetry (discussed in '
            'detail in the chapter on pyrite). Third, finally: Plato assigned '
            'the dodecahedron to the cosmos as a whole; that is an ancient '
            'philosophical interpretation, not a mathematical result. The '
            'geometry of the solid stands on its own, entirely independently of '
            'whatever meaning people have given it.',
      ),
    ],
    sources: [
      Source(
        'Regular dodecahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Regular_dodecahedron',
        'R2',
        'A1',
      ),
      Source(
        'Dodekaeder — Wikipedia (de)',
        'https://de.wikipedia.org/wiki/Dodekaeder',
        'R2',
        'A1',
      ),
      Source(
        'Platonic solid — Wikipedia',
        'https://en.wikipedia.org/wiki/Platonic_solid',
        'R2',
        'A1',
      ),
      Source(
        'Eulers Polyederformel — Plus Maths (Cambridge)',
        'https://plus.maths.org/content/eulers-polyhedron-formula',
        'R1',
        'A1',
      ),
      Source(
        'Platonic Solids: Why Five? — MathsIsFun',
        'https://www.mathsisfun.com/geometry/platonic-solids-why-five.html',
        'R1',
        'A1',
      ),
      Source(
        'Golden ratio — Wikipedia',
        'https://en.wikipedia.org/wiki/Golden_ratio',
        'R2',
        'A1',
      ),
      Source(
        'Phi in 3D Geometry (Ron Knott) — University of Surrey',
        'https://r-knott.surrey.ac.uk/Fibonacci/phi3DGeom.html',
        'R2',
        'A1',
      ),
      Source(
        'Icosahedral symmetry — Wikipedia',
        'https://en.wikipedia.org/wiki/Icosahedral_symmetry',
        'R2',
        'A1',
      ),
      Source(
        'Truncated icosahedron — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_icosahedron',
        'R2',
        'A1',
      ),
    ],
  ),
];
