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
  ProseChapter('Divisors, Fractions, and Repeating Digits', [
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
  ], sources: [
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Repeating decimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Repeating_decimal', 'R2', 'A1'),
    Source('Highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Highly_composite_number', 'R2', 'A1'),
    Source('Dozenal Divisibility Rules — Dozenal Society of America',
        'https://dozenal.org/drupal/content/dozenal-divisibility-rules.html',
        'R2', 'A1'),
    Source('Decimal Period — Wolfram MathWorld',
        'https://mathworld.wolfram.com/DecimalPeriod.html', 'R1', 'A2'),
    Source('Orders of Units in Modular Arithmetic — Keith Conrad (UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1', 'A2'),
  ]),
  ProseChapter('The Number Bases Compared', [
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
  ], sources: [
    Source('Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('Superior highly composite number — Wikipedia',
        'https://en.wikipedia.org/wiki/Superior_highly_composite_number',
        'R2', 'A1'),
    Source('Octal — Wikipedia', 'https://en.wikipedia.org/wiki/Octal', 'R2',
        'A2'),
  ]),
  ProseChapter('A Short History of Place-Value Systems', [
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
  ], sources: [
    Source('Babylonian mathematics — MacTutor (St Andrews)',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/',
        'R2', 'A1'),
    Source('Sexagesimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
    Source('History of the Hindu–Arabic numeral system — Wikipedia',
        'https://en.wikipedia.org/wiki/History_of_the_Hindu%E2%80%93Arabic_numeral_system',
        'R2', 'A2'),
    Source('Binary number — Wikipedia',
        'https://en.wikipedia.org/wiki/Binary_number', 'R3', 'A2'),
    Source('Hexadecimal — Wikipedia',
        'https://en.wikipedia.org/wiki/Hexadecimal', 'R2', 'A1'),
    Source('IBM System/360 — Wikipedia',
        'https://en.wikipedia.org/wiki/IBM_System/360', 'R2', 'A2'),
  ]),
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
];
