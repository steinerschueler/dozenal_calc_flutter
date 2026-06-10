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
    'Cyclic Numbers',
    [
      ProseSection(
        'The Seventh and Its Relatives',
        'One seventh does not come out evenly in base twelve but repeats: '
            'one seventh = 0;186A35, then 186A35 again, endlessly. (A stands '
            'for ten, B for eleven.) The repeating group is the period; it is '
            'six digits long here.\n\n'
            'The surprising part shows up when you place the other sevenths '
            'alongside it. Two sevenths = 0;35186A, three sevenths = 0;5186A3, '
            'four sevenths = 0;6A3518, five sevenths = 0;86A351, six sevenths = '
            '0;A35186. Each time it is the same six digits in the same order — '
            'only the starting point shifts. You can picture them strung around '
            'a ring that rotates one step further for each fraction.',
      ),
      ProseSection(
        'When the Multiples Rotate',
        'The same rotation is hidden in the multiplication table of the period '
            'itself. Take the digit string 186A35 as a whole number and multiply '
            'it in turn: 186A35 × 2 = 35186A, × 3 = 5186A3, × 4 = 6A3518, '
            '× 5 = 86A351, × 6 = A35186. The results are nothing but rotations. '
            'A number with this property is called a cyclic number.\n\n'
            'The seventh step closes the circle: 186A35 × 7 = BBBBBB. All '
            'elevens — the highest digit of base twelve, six times in a row. '
            'This is no coincidence: BBBBBB is exactly one less than the next '
            'round place. In base ten the same trick is known from the famous '
            'number 142857 (the period of one seventh in the decimal system): '
            'there too the multiples give rotations, and 142857 × 7 = 999999. '
            'The digits differ; the structure is the same.',
      ),
      ProseSection(
        'Why Exactly Six Places',
        'That the period is exactly six digits long — and not shorter — has a '
            'clear reason. In long division a remainder is left at each step, '
            'and the period ends as soon as a remainder repeats. For one seventh '
            'all six possible remainders 1 through 6 appear in succession before '
            'the first one repeats. Seven cannot yield more than six different '
            'remainders, so six is the maximum possible length.\n\n'
            'A prime whose reciprocal achieves this longest possible period is '
            'called a full-reptend prime. Only then do the multiples cycle '
            'through all rotations, and only then is a cyclic number produced. '
            'Whether a prime is full-reptend depends on how the powers of the '
            'base — here twelve — behave when divided by that prime.',
      ),
      ProseSection(
        'The Complement to the Highest Digit',
        'The period 186A35 carries a second pattern. Split it in the middle and '
            'add the halves: 186 + A35 = BBB — all elevens again, three of them '
            'this time. The two halves complement each other exactly to the '
            'highest digit.\n\n'
            'This is a general theorem (due to Étienne Midy, 1836) and holds in '
            'every base: in base ten it is 142 + 857 = 999. The effect shows that '
            'the second half of the period is no new material but the mirror image '
            'of the first.',
      ),
      ProseSection(
        'Not Every Prime Joins In',
        'The beautiful rotation is the exception, not the rule. One eleventh '
            'yields in base twelve only the period 0;1 — a single repeating one, '
            'because twelve is one above eleven (the counterpart to one ninth = '
            '0;1 in the decimal system). One thirteenth gives 0;0B with the short '
            'period 0B. Such primes do not produce a cyclic number.\n\n'
            'Among the small primes, 5, 7, 17, 31, 41, and 43 (counted in '
            'decimal) are full-reptend primes in base twelve — remarkably, all '
            'ending in 5 or 7 in base twelve. That is a necessary but not '
            'sufficient condition: nineteen also ends in 7 but has only a '
            'six-digit period. The change of base also plays a role: five is '
            'full-reptend in base twelve (one fifth = 0;2497, period 2497), yet '
            'in the decimal system one fifth terminates. Which primes join in '
            'therefore belongs to the pair of base and prime, not to the prime '
            'alone.',
      ),
      ProseSection(
        'How Many There Are — An Open Question',
        'One might suppose that so clear a property would long have been counted '
            'up. That is not so. How many full-reptend primes there are in base '
            'twelve — whether infinitely many — has not been proved to this day.\n\n'
            'A conjecture by Emil Artin from 1927 predicts that roughly '
            'thirty-seven out of a hundred primes should be full-reptend, in base '
            'twelve as in any other eligible base. Observations on small numbers '
            'are consistent with this order of magnitude. But the conjecture '
            'remains exactly that: despite great effort it has not been proved '
            'for any single base. That belongs to an honest account — a '
            'seemingly simple pattern concealing a problem still open today.',
      ),
      ProseSection(
        'Try It in the Calculator',
        'All of this can be verified right here. Type one seventh and press '
            'equals and the display shows 0; with a bar over 186A35 — the six '
            'digits of the period. For two sevenths the same sequence appears as '
            '35186A, rotated; that is no rounding, but exactly the same pattern. '
            'One fifth shows the bar over 2497; one eleventh over just the '
            'single digit 1.\n\n'
            'Larger examples reveal the limits: a fraction with denominator '
            'thirty-one (decimal) has a thirty-digit period — here the display '
            'abbreviates with an ellipsis because not everything fits on one '
            'line. How the calculator determines exact fractions and their '
            'periods at all is explained in the chapter "How This Calculator '
            'Computes".',
      ),
    ],
    sources: [
      Source(
        'Cyclic number — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_number',
        'R2',
        'A1',
      ),
      Source(
        'Full reptend prime — Wikipedia',
        'https://en.wikipedia.org/wiki/Full_reptend_prime',
        'R2',
        'A1',
      ),
      Source(
        '142857 — Wikipedia',
        'https://en.wikipedia.org/wiki/142857',
        'R2',
        'A1',
      ),
      Source(
        'Midy’s theorem — Wikipedia',
        'https://en.wikipedia.org/wiki/Midy%27s_theorem',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative order — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_order',
        'R2',
        'A1',
      ),
      Source(
        'Artin’s conjecture on primitive roots — Wikipedia',
        'https://en.wikipedia.org/wiki/Artin%27s_conjecture_on_primitive_roots',
        'R2',
        'A1',
      ),
      Source(
        'Orders of Units in Modular Arithmetic (Keith Conrad, UConn)',
        'https://kconrad.math.uconn.edu/blurbs/ugradnumthy/ordersmodm.pdf',
        'R1',
        'A2',
      ),
      Source(
        'OEIS A019340 — Primes with primitive root 12',
        'https://oeis.org/A019340',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Divisibility and the Eleven-Test',
    [
      ProseSection(
        'The Last Digit Tells a Lot',
        'In base twelve the last digit of a number is nothing other than its '
            'remainder on division by twelve. So the final digit immediately '
            'reveals whether the number divides evenly by any divisor of twelve. '
            'Even final digits (0, 2, 4, 6, 8, A) mean divisible by two. A '
            'number ending in 0, 3, 6, or 9 is divisible by three; ending in '
            '0, 4, or 8, by four; in 0 or 6, by six; in 0 alone, by twelve. '
            '(A stands here for ten.)\n\n'
            'That is a concrete advantage of twelve. In the decimal system the '
            'final digit reveals divisibility only by two, five, and ten — for '
            'three, four, or six you have to calculate. Twelve exposes precisely '
            'the common small divisors.',
      ),
      ProseSection(
        'The Eleven-Test: the Digit Sum Counts',
        'For eleven (B) the final digit is no help, but an equally simple trick '
            'works: the digit sum, that is, the sum of all the digits. A number '
            'in base twelve is divisible by eleven if and only if its digit sum '
            'is divisible by eleven. The reason is elegant: twelve leaves a '
            'remainder of one on division by eleven, and so does every higher '
            'place — so only what the digits add up to matters together.\n\n'
            'This is the exact counterpart to the familiar casting-out-nines in '
            'the decimal system, where the digit sum tests the nine. In base '
            'twelve it tests eleven — hence the name eleven-test. An example: '
            'the number 4B7 has the digit sum 4 + B + 7, that is fourteen plus '
            'eight, which is twenty-two — and twenty-two is twice eleven, so 4B7 '
            'is divisible by eleven. Like casting out nines, the eleven-test '
            'serves as a quick arithmetic check: if the test fails, there is an '
            'error in the result.',
      ),
      ProseSection(
        'Thirteen via the Alternating Digit Sum',
        'A second test catches thirteen. Here you add and subtract the digits '
            'alternately, starting from the right — the alternating digit sum. '
            'If this is divisible by thirteen, so is the number. The reason is '
            'the mirror image of the eleven-test: twelve lies one below thirteen, '
            'so the places alternate in sign on division by thirteen.\n\n'
            'A small stumbling block for anyone used to the decimal system: '
            'there the "eleven-test" refers precisely to the alternating version, '
            'because eleven is one above ten. In base twelve the roles are '
            'swapped — the plain digit sum belongs to eleven, the alternating '
            'one to thirteen. (Thirteen itself is written as 11 in base twelve, '
            'one twelve and one unit; it is always the value that is meant.)',
      ),
      ProseSection(
        'Where Twelve Struggles',
        'No advantage comes for free. Five and seven share no factor with '
            'twelve and do not fit the eleven or thirteen tests either — for '
            'them there is no convenient final-digit or digit-sum rule in base '
            'twelve. Of all numbers, five, which in the decimal system has the '
            'very simplest test (final digit zero or five), becomes awkward here.\n\n'
            'That is the honest trade: twelve gives us the easy tests for three, '
            'four, and six, and takes away the easy test for five in return. '
            'Which side weighs more depends on which divisors are needed most '
            'often in daily life — and those are usually the small ones.',
      ),
    ],
    sources: [
      Source(
        'Divisibility rule — Wikipedia',
        'https://en.wikipedia.org/wiki/Divisibility_rule',
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
        'Casting out nines — Wikipedia',
        'https://en.wikipedia.org/wiki/Casting_out_nines',
        'R2',
        'A1',
      ),
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'Tricks in the Multiplication Table',
    [
      ProseSection(
        'Rows with Short Tails',
        'The base-twelve multiplication table has twelve rows, and some of them '
            'are almost self-memorising — namely those of the divisors. Their '
            'multiples end in short, repeating patterns. The six-row alternates '
            'between 6 and 0 (6, 10, 16, 20, 26, 30 …). The four-row runs '
            '4, 8, 0, 4, 8, 0; the three-row 3, 6, 9, 0 and back to the '
            'beginning; the two-row stays even throughout.\n\n'
            'Two shortcuts are especially handy. Times twelve simply means '
            'appending a zero: seven times twelve is 70. And the six-row is '
            'half the twelve-row — six times an even number ends in 0, six '
            'times an odd number ends in 6.',
      ),
      ProseSection(
        'The Eleven-Row as a Mirror',
        'The most elegant row belongs to eleven (B): B, 1A, 29, 38, 47, 56, '
            '65, 74, 83, 92, A1, B0. It contains two patterns at once. The '
            'leading digit climbs one step at a time — 0, 1, 2, 3, and so on '
            '— while the trailing digit falls in step. And in every result the '
            'two digits add up to eleven: one and ten, two and nine, three and '
            'eight.\n\n'
            'This is exactly the mirror image of the nine-row in the decimal '
            'system, where the digits add up to nine. A handy trick follows: '
            'instead of multiplying by eleven, take times twelve and subtract '
            'the number once. Eleven times seven is therefore seventy minus '
            'seven, which gives 65 in base twelve — and indeed the table shows '
            '65 at eleven times seven.',
      ),
      ProseSection(
        'The Stubborn Rows: Five and Seven',
        'Not all rows are this accommodating. Five and seven share no factor '
            'with twelve, and so their rows run through all twelve possible '
            'final digits before anything repeats — no short cycle to aid '
            'memorisation. The five-row ends in turn on 5, A, 3, 8, 1, 6, B, '
            '4, 9, 2, 7, 0; the seven-row is similarly erratic.\n\n'
            'Here an old quartet recurs: precisely the rows of one, five, seven, '
            'and eleven cycle through every final digit completely — the same '
            'four numbers that generate the full circle on the clock face and '
            'that end in prime digits. And that is exactly why one fifth and one '
            'seventh have those long, full periods from the chapter on cyclic '
            'numbers. In the decimal system the seven-row is the notoriously '
            'awkward one; in base twelve it is five and seven together.',
      ),
      ProseSection(
        'Squares and the Gross',
        'Running diagonally from top left to bottom right through the table '
            'gives the square numbers: 1, 4, 9, 14, 21, 30, 41, 54, 69, 84, '
            'A1 — and finally 100. That last one is twelve times twelve, that '
            'is one hundred and forty-four, which in base twelve is simply "100" '
            'and has long been called a gross. Twelve writes its own square '
            'number as neatly as the decimal system writes one hundred.\n\n'
            'Doubling and halving are also easy in base twelve because twelve '
            'is even and divisible by four: half of 10 is 6, half of 6 is 3, '
            'half of 3 is 1;6. Much can be broken into small, clean steps in '
            'the head — the real reason why enthusiasts of twelve find arithmetic '
            'in it pleasant.',
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
        'Multiplication table — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplication_table',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
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
    'The Clock as a Group (ℤ/12ℤ)',
    [
      ProseSection(
        'Arithmetic on the Clock Face',
        'On a clock, eleven o’clock plus two hours is not thirteen but one '
            'o’clock. You compute normally and take the remainder on division '
            'by twelve at the end. Pictorially, the endless number line is wound '
            'onto a circle with twelve marks; every number lands on one of the '
            'marks 0 through 11.\n\n'
            'These twelve marks with clock-face addition form a neat little '
            'arithmetic system. It always stays closed (every sum is again one '
            'of the twelve marks), there is zero as the "changes nothing" element, '
            'and every step has a way back: five forward and seven backward cancel '
            'out, because 5 + 7 = 12 = 0. An arithmetic system with these '
            'properties is called a group in mathematics. The clock face is the '
            'most tangible example of all; its name is ℤ/12ℤ, read "Z modulo '
            'twelve".',
      ),
      ProseSection(
        'Which Step Sizes Reach Every Position',
        'Walking in steps of one around the circle, you visit each of the '
            'twelve marks in turn before returning to the start. But not every '
            'step size manages this. Jump always by three and you land only on '
            '0, 3, 6, 9 and are back after four jumps — eight positions left '
            'untouched. Jump by four and you hit only 0, 4, 8.\n\n'
            'A step size reaches all twelve positions if and only if it shares '
            'no common factor with twelve. That applies to exactly four steps: '
            '1, 5, 7, and B (= eleven). Exactly four — that is no coincidence '
            'but a counting quantity of twelve that will appear twice more. '
            'These four are the "good" step sizes that generate the full circle.',
      ),
      ProseSection(
        'The Subgroups on the Clock Face',
        'The step sizes that only reach part of the marks trace regular '
            'figures on the clock face. The step of six connects 0 and 6 with '
            'a line across the centre. The step of four draws the triangle '
            '0–4–8, the step of three the square 0–3–6–9, the step of two the '
            'hexagon of even hours. Each of these figures is itself a small, '
            'self-contained clock — a subgroup.\n\n'
            'Remarkably, to every divisor of twelve — 1, 2, 3, 4, 6, 12 — there '
            'belongs exactly one such figure, no more and no fewer. Twelve has '
            'more divisors than any smaller number, which is why its clock face '
            'carries so many clean figures. An imaginary ten-hour clock would '
            'offer only the divisors 1, 2, 5, 10 — no triangle, no square. The '
            'same divisibility that distinguishes twelve as a counting base makes '
            'its clock face so rich.',
      ),
      ProseSection(
        'The Same Clock in Music',
        'The twelve semitones of an octave form the same circle: after twelve '
            'semitone steps you are back at the starting note, one octave higher. '
            'Transposing a melody to another key means rotating all notes by the '
            'same step — addition on the pitch circle.\n\n'
            'The circle of fifths, which musicians learn by heart, is nothing '
            'other than the step of seven on this circle: a perfect fifth is '
            'seven semitones, and because seven is one of the four good step '
            'sizes, the circle of fifths runs through all twelve notes before '
            'closing. The fourth (five semitones) turns the same circle '
            'backwards. Steps with a common factor instead get stuck in a '
            'figure and produce exactly the familiar symmetric chords: the major '
            'third the triangle, the tritone the line. Why there are twelve '
            'semitones in particular and how they sound is the subject of the '
            'chapter on twelve in music; what matters here is only that it is '
            'the same circle.',
      ),
      ProseSection(
        'And in the Prime Digits',
        'A third place shows the same group of four. Write the prime numbers in '
            'base twelve: every prime above three ends in one of the digits 1, '
            '5, 7, or B. Other final digits are impossible: a number ending in '
            '0, 2, 4, 6, 8, or A is even; one ending in 3, 6, or 9 is divisible '
            'by three. What remains is exactly the four digits that share no '
            'divisor with twelve — again 1, 5, 7, B.\n\n'
            'They are the same four as the good step sizes and the '
            'circle-generating intervals. A final digit from this group of four '
            'is, however, only a necessary condition, not a proof of primality: '
            '25 ends in 1 in base twelve, but is five times five. The digit '
            'rules out many numbers as primes; it does not crown any.',
      ),
      ProseSection(
        'Addition Always, Division Not Always',
        'On the clock face you can also multiply — and here the nice '
            'self-containment breaks down. With addition every step has a way '
            'back; with multiplication that is not so. There is no hour you '
            'could multiply by two to land cleanly on one, because any double '
            'is always even. Two has no inverse on the twelve-hour clock.\n\n'
            'Only the four good numbers 1, 5, 7, B have inverses — and each '
            'is its own: five times five is 25, which is 1 on the twelve-hour '
            'clock; likewise seven times seven and B times B. If the clock had '
            'a prime number of hours like eleven or thirteen, every hour would '
            'have an inverse. Twelve is too divisible for that — the same '
            'richness of divisors that adorns its clock face takes away clean '
            'division. That is not a defect but the nature of composite numbers; '
            'a ten-hour clock would fare exactly the same way.',
      ),
      ProseSection(
        'Modulo Twelve Is Not Base Twelve',
        'One last, important distinction that is easily confused. The clock '
            'computes "modulo twelve" — it keeps only the remainder on division '
            'by twelve. That is different from "base twelve", the notation used '
            'by this calculator, where the places stand for units, twelves, '
            'grosses, and so on. Modulo tells you which residue class a number '
            'falls into; base tells you how to write it down.\n\n'
            'Both revolve around the number twelve, but for the same deeper '
            'reason — its many divisors — not because they are the same thing. '
            'We compute modulo twelve on the clock every day while writing the '
            'time in the decimal system all the same. This kind of remainder '
            'arithmetic was introduced by Carl Friedrich Gauss in 1801 as its '
            'own notation; today it sits invisibly in the check digits of book '
            'numbers and bank accounts and in every day-of-the-week formula.',
      ),
    ],
    sources: [
      Source(
        'Modular arithmetic — Wikipedia',
        'https://en.wikipedia.org/wiki/Modular_arithmetic',
        'R2',
        'A1',
      ),
      Source(
        'Cyclic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Cyclic_group',
        'R2',
        'A1',
      ),
      Source(
        'Subgroups of cyclic groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Subgroups_of_cyclic_groups',
        'R2',
        'A1',
      ),
      Source(
        'Multiplicative group of integers modulo n — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n',
        'R2',
        'A1',
      ),
      Source(
        'Circle of fifths — Wikipedia',
        'https://en.wikipedia.org/wiki/Circle_of_fifths',
        'R2',
        'A1',
      ),
      Source(
        'Pitch class — Wikipedia',
        'https://en.wikipedia.org/wiki/Pitch_class',
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
        'Disquisitiones Arithmeticae — Wikipedia',
        'https://en.wikipedia.org/wiki/Disquisitiones_Arithmeticae',
        'R1',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    '12! and the Orderings',
    [
      ProseSection(
        'How Many Orderings?',
        'How many ways are there to arrange a dozen things in a row — twelve '
            'guests at a table, the twelve months on a list, twelve books on a '
            'shelf? For the first place you have twelve candidates, for the '
            'second eleven, then ten, and so on down to the last, for which only '
            'one remains. Multiply all the possibilities: '
            '12 · 11 · 10 · … · 2 · 1.\n\n'
            'This product of all numbers from 1 to twelve is written briefly as '
            '"12!" and called twelve factorial. In general, n! is the product of '
            'all numbers from 1 to n and counts the orderings of n things. A '
            'curiosity on the side: 0! is defined as 1 — there is exactly one '
            'way to arrange nothing at all, namely the empty one.',
      ),
      ProseSection(
        'The Number 12!',
        'Calculated out, 12! = 479001600 in the decimal system — just under half '
            'a billion orderings for only twelve things. In base twelve the same '
            'number is written as 114500000, with five trailing zeros. Those '
            'zeros are home territory for twelve: because 12! contains the '
            'factors two and three so many times and each trailing zero '
            'corresponds to exactly one twelve, five of them divide out evenly. '
            'In the decimal system 12! ends in only two zeros.\n\n'
            'How large is half a billion orderings? Showing one new ordering per '
            'second would take over fifteen years to get through them all. If '
            'the dozen sit around a round table, where only the neighbourhood '
            'matters and not the starting seat, the count shrinks to eleven '
            'factorial — about forty million. You can ask the calculator: the '
            'factorial key delivers 12! immediately in base twelve.',
      ),
      ProseSection(
        'Selection With and Without Order',
        'Often you do not want to order all twelve but only choose some — and '
            'then it makes a difference whether the order counts. Three runners '
            'on the podium (gold, silver, bronze) from twelve: '
            '12 · 11 · 10 = 1320 ordered possibilities. Order matters here, '
            'because first and second are not the same.\n\n'
            'If instead you choose six from twelve purely as a group, with no '
            'ranking — say six volunteers — there are 924 possibilities; two '
            'from twelve as a pair gives 66. Both counting methods rest on the '
            'factorial. In everyday language the two are often confused: a '
            '"combination lock" actually requires a specific order — it should '
            'really be called a permutation lock.',
      ),
      ProseSection(
        'Bells That Ring Every Ordering',
        'In English church towers there is an old art that does exactly this: '
            'change ringing. Instead of melodies, the ringers ring their bells '
            'in ever-new orderings, each ordering exactly once. At each change '
            'every bell may move only one position — a physical embodiment of '
            'swapping adjacent elements, which ringers had mastered by around '
            '1621, long before mathematicians described the same trick.\n\n'
            'Each bell count has a name; twelve bells are called Maximus. To '
            'ring all orderings of twelve bells would mean working through '
            '12! = about 479 million changes — at two seconds per change that '
            'would take decades of uninterrupted ringing. No one has ever '
            'achieved this and it is considered impossible; the longest pieces '
            'actually rung on twelve bells reach only some tens of thousands '
            'of changes. A full extent has been completed only on eight bells: '
            '40320 changes, just under eighteen hours, in Loughborough in 1963.',
      ),
      ProseSection(
        'From Number to Group',
        'Collect all 12! rearrangements of a dozen and understand "first this '
            'one, then that one" as a rule of composition, and again a group '
            'arises — the full permutation group of twelve objects. Unlike on '
            'the clock face, the order of the steps matters here: swap first '
            'then shift gives something different from the reverse. This group '
            'is enormous and non-commutative.\n\n'
            'Hidden within it is one final marvel. Among the nearly five hundred '
            'million rearrangements there is a tiny, extraordinarily regular '
            'selection of only 95040 that sends any five of the twelve points '
            'to any five chosen targets in exactly one way. That something like '
            'this is possible at all on exactly twelve points is among the '
            'rarest phenomena in mathematics — and is the subject of the '
            'next chapter.',
      ),
    ],
    sources: [
      Source(
        'Factorial — Wikipedia',
        'https://en.wikipedia.org/wiki/Factorial',
        'R2',
        'A1',
      ),
      Source(
        'Permutation — Wikipedia',
        'https://en.wikipedia.org/wiki/Permutation',
        'R2',
        'A1',
      ),
      Source(
        'Combination — Wikipedia',
        'https://en.wikipedia.org/wiki/Combination',
        'R2',
        'A1',
      ),
      Source(
        'Change ringing — Wikipedia',
        'https://en.wikipedia.org/wiki/Change_ringing',
        'R2',
        'A1',
      ),
      Source(
        'Extent (change ringing) — Wikipedia',
        'https://en.wikipedia.org/wiki/Extent_(change_ringing)',
        'R2',
        'A1',
      ),
      Source(
        'Symmetric group — Wikipedia',
        'https://en.wikipedia.org/wiki/Symmetric_group',
        'R2',
        'A1',
      ),
      Source(
        'Steinhaus–Johnson–Trotter algorithm — Wikipedia',
        'https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm',
        'R2',
        'A2',
      ),
    ],
  ),
  ProseChapter(
    'The Mathieu Group M₁₂',
    [
      ProseSection(
        'A Selection Among Nearly Half a Billion',
        'The previous chapter ended with a promise: among the nearly five '
            'hundred million rearrangements of a dozen there is a tiny selection '
            'of exactly 95040 that can do something almost unbelievable. Choose '
            'five of the twelve points and say where each one should go — among '
            'these 95040 rearrangements there is exactly one that does it. Not '
            'two, not none: exactly one.\n\n'
            'From this single property the total count already follows. For the '
            'destination of the first point you have twelve choices, for the '
            'second eleven, then ten, nine, eight — and with that the rest is '
            'determined. Twelve times eleven times ten times nine times eight '
            'equals 95040. This rare collection of rearrangements has a name: '
            'the Mathieu group M₁₂.',
      ),
      ProseSection(
        'The Steiner System S(5,6,12)',
        'What do these 95040 rearrangements hold fixed? A delicate combinatorial '
            'structure. From twelve points one can choose certain groups of six '
            'in such a way that every possible choice of five points is contained '
            'in exactly one of these six-element groups. There are exactly 132 '
            'such six-element groups, and this arrangement is, up to relabelling '
            'the points, the only one possible.\n\n'
            'This finely balanced structure is called the Steiner system S(5,6,12). '
            'The Mathieu group is precisely the set of rearrangements that map '
            'all 132 six-element groups back to six-element groups — the '
            'symmetries of this structure. The two numbers, 132 six-element groups '
            'and 95040 symmetries, are written in base twelve as B0 and 47000.',
      ),
      ProseSection(
        'Why Twelve in Particular',
        'What is truly astonishing is not that M₁₂ is so regular, but how '
            'rarely such regularity occurs at all. Camille Jordan proved in 1872: '
            'setting aside the obvious ordinary cases, a set of rearrangements '
            'that can place five points freely in exactly one way is possible on '
            'only a single number of points — twelve. The analogous thing for '
            'four points exists as an exception only on eleven points.\n\n'
            'On exactly eleven and twelve points — and nowhere else beyond the '
            'ordinary cases — do these extraordinarily perfect symmetries exist. '
            'Twelve is therefore one of only a handful of numbers that can carry '
            'something like this. That is a clear mathematical result, not '
            'numerology — but a genuine reason for wonder.',
      ),
      ProseSection(
        'The First of Its Kind',
        'Finite groups have building blocks that cannot be broken down further '
            '— the simple groups, the atoms of group theory. "Simple" here means '
            'indecomposable, not easy. Most of these atoms belong to a few '
            'infinite families; alongside them stand exactly twenty-six '
            'singletons, the sporadic groups. M₁₂ is one of them.\n\n'
            'Émile Mathieu described M₁₂ as early as 1861 — it was the very '
            'first sporadic group ever found, almost a hundred years before the '
            'rest. Its existence long remained disputed; some experts doubted it; '
            'only Ernst Witt put it on firm ground in 1938. The series of '
            'sporadic groups that began with M₁₂ ends with the legendarily large '
            '"Monster," and their complete enumeration is one of the greatest '
            'collective achievements in all of mathematics.',
      ),
      ProseSection(
        'Something Tangible: Cards and a Game',
        'Abstract as it all sounds, there are hands-on approaches. Shuffle '
            'twelve playing cards in two specific, always identical ways, over '
            'and over, and according to reported sources you generate exactly '
            'the rearrangements of the Mathieu group. And the mathematician '
            'John Conway invented a "mathematical blackjack" with the twelve '
            'numbers zero through B, whose winning strategy rests directly on '
            'the 132 six-element groups.\n\n'
            'To be honest: this chapter has barely a key on the calculator that '
            'corresponds to it — it is pure theoretical beauty, not a tool. But '
            'sometimes that is precisely the appeal: that twelve, which gives '
            'this calculator its rhythm, is one of the few numbers on which '
            'mathematics has hidden a symmetry this rare and this perfect.',
      ),
    ],
    sources: [
      Source(
        'Mathieu group M12 — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group_M12',
        'R2',
        'A1',
      ),
      Source(
        'Mathieu group — Wikipedia',
        'https://en.wikipedia.org/wiki/Mathieu_group',
        'R2',
        'A1',
      ),
      Source(
        'Steiner system — Wikipedia',
        'https://en.wikipedia.org/wiki/Steiner_system',
        'R2',
        'A1',
      ),
      Source(
        'Sporadic group — Wikipedia',
        'https://en.wikipedia.org/wiki/Sporadic_group',
        'R2',
        'A1',
      ),
      Source(
        'Multiply transitive group — Wikipedia',
        'https://en.wikipedia.org/wiki/Multiply_transitive_group',
        'R2',
        'A1',
      ),
      Source(
        'Classification of finite simple groups — Wikipedia',
        'https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups',
        'R2',
        'A1',
      ),
      Source(
        'Émile Léonard Mathieu — Wikipedia',
        'https://en.wikipedia.org/wiki/%C3%89mile_L%C3%A9onard_Mathieu',
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
    'Archimedean Tilings',
    [
      ProseSection(
        'The Dodecagon Cannot Tile the Plane Alone',
        'A regular dodecagon is a beautiful, rounded shape — but it cannot '
            'cover a floor by itself without gaps. The reason is its interior '
            'angle of 150 degrees. Around every vertex the adjacent shapes must '
            'add up to exactly 360 degrees, but 360 divided by 150 gives two '
            'point four — not a whole number. Two dodecagons leave a gap at a '
            'vertex; three overlap.\n\n'
            'The dodecagon therefore needs partners. Place the right shapes in '
            'the gaps and gapless, highly regular patterns arise — Archimedean '
            'tilings. That is the name for tilings of the plane consisting '
            'solely of regular polygons and looking identical at every vertex. '
            'There are exactly eleven such patterns in all.',
      ),
      ProseSection(
        'Two Patterns Containing the Dodecagon',
        'Of these eleven patterns, exactly two contain a regular dodecagon. In '
            'the first, small equilateral triangles fill the gaps between the '
            'dodecagons — at every vertex one triangle and two dodecagons meet, '
            'and their angles add up to 60 plus 150 plus 150, exactly 360 '
            'degrees.\n\n'
            'The second is the richer one and is the pattern shown in the '
            'illustration: around every dodecagon lies a ring of alternating '
            'squares and hexagons. At every vertex one square, one hexagon, and '
            'one dodecagon meet — 90 plus 120 plus 150 degrees, again exactly '
            '360. Because the sum works out, the ring closes without any gap '
            'and the pattern continues in all directions.',
      ),
      ProseSection(
        'Why Only Three, Four, Six Fit',
        'Beside a dodecagon only three kinds of neighbour fit: triangles, '
            'squares, and hexagons. That is no coincidence. Their interior '
            'angles are 60, 90, and 120 degrees — which are precisely 360 '
            'divided by six, by four, and by three. So exactly the divisors '
            'three, four, and six of twelve appear here.\n\n'
            'Those same three divisors are the ones that make the fractions one '
            'third, one quarter, and one sixth come out evenly in base twelve. '
            'The beautiful tiling and the clean fraction share the same root: '
            'the rich divisibility of twelve. That is a genuine connection, '
            'but not a compulsion — the angles come from geometry, the clean '
            'fractions from notation; both depend only on the same number.',
      ),
      ProseSection(
        'Kepler, Mosques, and Crystals',
        'The first to enumerate these patterns completely was Johannes Kepler '
            'in 1619, in a work on the harmony of the world. The name '
            '"Archimedean" is merely a reference to the Archimedean solids; '
            'no ancient text in which Archimedes himself treated tilings has '
            'been handed down.\n\n'
            'Long before Kepler, however, the dodecagon already lived in art: '
            'twelve-pointed stars are among the most magnificent motifs of '
            'Islamic geometric ornament, constructed with compass and '
            'straightedge from pure geometry — appearing early, for instance, '
            'at the mosque in Konya (1220). And in nature the same twelvefold '
            'order recurs in quasicrystals, which are the subject of a separate '
            'chapter. The dodecagon, which cannot tile a floor alone, is in '
            'partnership one of the most fruitful shapes in the plane.',
      ),
    ],
    sources: [
      Source(
        'Euclidean tilings by convex regular polygons — Wikipedia',
        'https://en.wikipedia.org/wiki/Euclidean_tilings_by_convex_regular_polygons',
        'R2',
        'A1',
      ),
      Source(
        'Truncated hexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_hexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Truncated trihexagonal tiling — Wikipedia',
        'https://en.wikipedia.org/wiki/Truncated_trihexagonal_tiling',
        'R2',
        'A1',
      ),
      Source(
        'Archimedean Tilings and Egyptian Fractions (John Baez)',
        'https://math.ucr.edu/home/baez/egyptian.html',
        'R3',
        'A1',
      ),
      Source(
        'Islamic geometric patterns — Wikipedia',
        'https://en.wikipedia.org/wiki/Islamic_geometric_patterns',
        'R2',
        'A1',
      ),
      Source(
        'Harmonices Mundi — Wikipedia',
        'https://en.wikipedia.org/wiki/Harmonices_Mundi',
        'R2',
        'A2',
      ),
    ],
    imageId: 'math/parkettierung',
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
