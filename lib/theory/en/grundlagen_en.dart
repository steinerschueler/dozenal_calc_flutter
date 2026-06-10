part of '../grundlagen_theory.dart';

List<ProseChapter> _grundlagenChaptersEn() => const [
  ProseChapter(
    'What is the dozenal system?',
    [
      ProseSection(
        'What a base is',
        'In a positional numeral system the value of a digit depends on its '
            'place. In the number 347 the 3 stands for three hundred, the 4 for '
            'forty, the 7 for seven. Each position is as many times larger than '
            'its right-hand neighbour as the base specifies. In the familiar '
            'decimal system the base is ten.\n\n'
            'The dozenal system has the base twelve. The places are therefore '
            'not ones, tens, hundreds, but ones, twelves, '
            'one-hundred-and-forty-fours. The number "100" means here not a '
            'hundred, but twelve times twelve, i.e. 144 in decimal. And "10" '
            'means exactly one dozen.\n\n'
            'One important point: the quantity itself never changes, only the '
            'notation. Fifteen apples remain fifteen apples, whether you write '
            'them as "15" (decimal) or "13" (dozenal). A number becomes neither '
            'larger nor smaller by a change of base.',
      ),
      ProseSection(
        'Why two new digits are needed',
        'The decimal system manages with ten symbols (0 to 9), because a new '
            'place begins at every tenth unit. The dozenal system advances a '
            'place only at the twelfth unit. It therefore needs two extra '
            'symbols — for the values ten and eleven, which in decimal already '
            'occupy two places.\n\n'
            'This calculator writes them as A (= ten) and B (= eleven). This is '
            'crucial: A and B are not letters here, and not placeholders, but '
            'fully valid single-digit numerals — just like 7 or 9, only for ten '
            'and eleven respectively. Counting thus goes: 0, 1, 2, …, 9, A, B, '
            '10, 11, …\n\n'
            'This is a genuine stumbling block for anyone accustomed to algebra. '
            'There, "2B" means the product two times B. Not here. "2B" is a '
            'two-digit number: a 2 in the twelves place and a B in the ones '
            'place, meaning two twelves and eleven ones — 35 in decimal. The '
            'product two times eleven, on the other hand, would be 22, dozenal '
            '"1A" — something altogether different. Adjacent digits form a '
            'number; they are not multiplied. The calculator knows this '
            'automatically, because A and B are fixed digits for it, not '
            'letters.\n\n'
            'Other notations are widespread, above all the rotated digits ↊ and '
            '↋ that Isaac Pitman proposed in 1857 and which have even had their '
            'own Unicode code points since 2015. A single universally valid '
            'standard does not exist to this day.',
      ),
      ProseSection(
        'The advantage: clean fractions',
        'The real attraction of twelve is its divisibility. Twelve divides '
            'evenly by 2, 3, 4, and 6; ten only by 2 and 5. This shows most '
            'clearly in fraction arithmetic. In base 10, one third (0.333…) and '
            'one sixth (0.1666…) are infinite, recurring decimals. In base 12 '
            'they are short and exact: one third is 0;4, one sixth is 0;2.\n\n'
            'Behind this lies a simple rule: a fraction 1/n terminates in a '
            'given base if and only if the denominator n consists solely of '
            'prime factors of the base. Twelve is made up of 2 and 3 — so all '
            'fractions with denominators built from twos and threes terminate '
            'cleanly.\n\n'
            'This is not a pure gain, however, but a trade-off. One fifth, the '
            'clean 0.2 in base 10, becomes recurring in base 12 (0;2497…). '
            'Tenths become recurring too. The trade-off pays off in everyday '
            'life, because one divides by three and four more often than by '
            'five — but it is honestly a trade-off, not a miracle.',
      ),
      ProseSection(
        'Where twelve has long been at home',
        'Long before any theory, twelve had already embedded itself in '
            'measurement, time, and trade, precisely because it divides so '
            'well. In trade one counts in dozens (12 items) and in the gross '
            '(144 = 12² items); the word "dozen" goes via French from Latin '
            'duodecim, "twelve."\n\n'
            'The Latin word uncia meant "one twelfth" — of a foot as well as of '
            'a pound. From it came the English words inch and ounce: 12 inches '
            'make a foot. Time is divided by twelve as well: twice twelve hours '
            'in a day, twelve months in a year, and the full circle has '
            '360 = 30 × 12 degrees.\n\n'
            'There is even a conjecture as to why twelve in particular: with the '
            'thumb one can count the three segments of each of the four '
            'remaining fingers, giving 4 × 3 = 12. This counting method is '
            'still in use in parts of Asia today. It is a plausible explanation '
            'for the origin of counting in twelves, but not proven — it remains '
            'a hypothesis.',
      ),
      ProseSection(
        'The dozenal movement',
        'Consciously exploiting the advantages of twelve is an old idea that '
            'found a small organised form in the 20th century. In 1935 Frank '
            'Emerson Andrews wrote the first book on the subject in the USA; '
            'in 1944 the Dozenal Society of America was founded, and in 1959 '
            'the Dozenal Society of Great Britain. Both publish journals to this '
            'day and use the Pitman digits.\n\n'
            'These societies do not call for a worldwide change of system. They '
            'understand their work as education and exploration: they want to '
            'show that the choice of number base is no natural necessity, but a '
            'convention. The mathematician Alexander Craig Aitken prominently '
            'advocated for twelve and rated the decimal system as considerably '
            'less efficient — an illustrative estimate, not a measured value.',
      ),
      ProseSection(
        'Why it has never caught on',
        'If base 12 is often more convenient arithmetically, why does the whole '
            'world count in decimal? The answer lies not in mathematics but in '
            'habit. The decimal system has been entrenched for millennia — '
            'presumably because humans have ten fingers. That is an anatomical '
            'reason, not a mathematical one, but it runs deep.\n\n'
            'When the world standardised its measures in the 18th and 19th '
            'centuries, the decimal-metric system won; a change of counting '
            'system was already considered impracticable at the time. Today the '
            'costs of conversion — new textbooks, devices, software, retraining '
            'of everyone — would amount to a complete rebuild. And computers '
            'calculate in binary anyway, where base 16 is closer to hand than '
            'twelve.\n\n'
            'The traces of twelve in the clock, the tape measure, and the dozen '
            'are therefore no call to change. They only show that twelve has '
            'never quite disappeared — and make calculating in it a journey into '
            'a familiar yet foreign land of numbers.',
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
        'Positional notation — Wikipedia',
        'https://en.wikipedia.org/wiki/Positional_notation',
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
        'Dozen — Wikipedia',
        'https://en.wikipedia.org/wiki/Dozen',
        'R2',
        'A1',
      ),
      Source(
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'Dozenal Society of America — Foundation and First Generation',
        'https://dozenal.org/drupal/content/foundation-and-first-generation.html',
        'R2',
        'A1',
      ),
      Source(
        'Why ten and not twelve? — Metric Views',
        'https://metricviews.uk/2016/10/10/why-ten-and-not-twelve/',
        'R3',
        'A1',
      ),
    ],
  ),
  ProseChapter(
    'Twelve segments on the hand',
    [
      ProseSection(
        'The method: twelve segments, one thumb',
        'Hold one hand in front of you and look at the four fingers beside '
            'the thumb. Each of these fingers has three segments, separated by '
            'visible joints: a proximal, a middle, and a distal segment. Four '
            'fingers times three segments gives twelve — twelve countable '
            'points on a single hand.\n\n'
            'The thumb serves as the pointer and is not itself counted. It '
            'touches each of the twelve segments in turn, counting from one to '
            'twelve. The most commonly described order begins at the outermost '
            'segment of the little finger and moves finger by finger toward the '
            'palm. There are variants, though: some start at the index finger, '
            'some count from tip downward. Only the basic structure is fixed — '
            'one pointer, four fingers, three segments each, total twelve.\n\n'
            'That there are exactly three segments is no cultural choice but '
            'anatomy: this 2-3-3-3-3 form (the thumb has only two segments) '
            'is shared by all humans and is an ancient heritage of the mammalian '
            'hand. The segments evolved for grasping and climbing, not for '
            'counting — but they serve the purpose well.',
      ),
      ProseSection(
        'From twelve to sixty',
        'Once the thumb has worked through all twelve segments of the first '
            'hand, one full round is complete. Now the second hand takes over '
            'the tally: for each completed dozen it extends one finger. Five '
            'fingers times twelve segments gives sixty. With two hands one can '
            'therefore count silently and without any aid up to 60.\n\n'
            'This connection 12 × 5 = 60 is the simplest explanation for why '
            'sixty plays such a large role in the Mesopotamian systems — and '
            'through them to this day: 60 seconds per minute, 60 minutes per '
            'hour, 360 = 6 × 60 degrees in the full circle.\n\n'
            'There is also another convention in which both hands count '
            'segments; that gives 12 × 12 = 144. Both ways of counting are '
            'valid, but they are not the same system.',
      ),
      ProseSection(
        'Where this counting is used',
        'This counting method is no modern invention. The historian of '
            'mathematics Georges Ifrah popularised it in his "Universal History '
            'of Numbers" and described it as still in use — across a broad belt '
            'from Egypt through Syria, Turkey, Iraq, Iran, Afghanistan, and '
            'Pakistan to India and Indochina.\n\n'
            'A note on the sources is honestly warranted here: this list of '
            'countries is the most-cited statement on the subject, but it '
            'derives almost entirely from this single source. Later texts '
            'mostly refer back to Ifrah. When and how precisely the observations '
            'were made is not recorded; a more recent, systematic survey is '
            'lacking.\n\n'
            'The best-documented case is that of the Chepang in Nepal. The '
            'linguists Ross Caughley and Martine Mazaudon documented that the '
            'Chepang count game in dozens by tapping the finger segments; their '
            'word for twelve, hale, goes back to an old root meaning "basis of '
            'counting." Some languages in central Nigeria also carry duodecimal '
            'number words. In both cases, though, the situation is: in everyday '
            'life people today count in decimal; the traces of twelve are more '
            'remnants than a living full system.',
      ),
      ProseSection(
        'The grand thesis — and why it remains open',
        'Ifrah put forward the conjecture that the duodecimal system as a whole '
            '— and the Babylonian sexagesimal system with base 60 — arose from '
            'this finger-segment counting. The thesis has strong points: it '
            'explains twelve and sixty simultaneously, it is anatomically '
            'plausible, and it shows a concrete action rather than a mere '
            'numerical coincidence.\n\n'
            'Even so, it is a hypothesis, not established history. Ifrah '
            'himself explicitly calls his derivation speculative. No ancient '
            'text, no clay tablet, and no image describes this method as the '
            'origin of the Babylonian system. The method fits the origin — but '
            'that is not the same as proof.\n\n'
            'The strongest counter-argument comes from Egypt: according to '
            'Ifrah the Egyptians also counted on their finger segments — and yet '
            'developed a decimal number system. The finger method alone therefore '
            'compels neither twelve nor sixty.',
      ),
      ProseSection(
        'Other explanations alongside it',
        'The finger-segment thesis does not stand alone. For the origin of '
            'sixty, historians even consider another conjecture the most widely '
            'accepted: that two peoples with different counting bases met in '
            'trade and agreed on 60 as a common multiple. There is no direct '
            'historical evidence for that either.\n\n'
            'Alongside those stand an astronomical explanation (roughly twelve '
            'lunar cycles fit into a year, hence twelve months and twelve '
            'zodiac signs) and an arithmetic one (twelve and sixty have '
            'especially many divisors and are therefore practical). These '
            'reasons explain well why the numbers have persisted — but not '
            'necessarily why people reached for them in the first place.\n\n'
            'Several forces probably worked together: the hand, the sky, trade, '
            'and good divisibility. That is precisely what makes it so difficult '
            'to isolate a single cause. What remains is a fine, honest finding: '
            'the human hand offers a natural basis for twelve — whether it '
            'shaped the number system cannot be said conclusively.',
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
        'Finger-counting — Wikipedia',
        'https://en.wikipedia.org/wiki/Finger-counting',
        'R2',
        'A1',
      ),
      Source(
        'The Universal History of Numbers (Georges Ifrah) — Wikipedia',
        'https://en.wikipedia.org/wiki/The_Universal_History_of_Numbers',
        'R2',
        'A3',
      ),
      Source(
        'Chepang: a Sino-Tibetan language with a duodecimal numeral base? (Caughley) — ANU Repository',
        'https://openresearch-repository.anu.edu.au/handle/1885/145390',
        'R1',
        'A2',
      ),
      Source(
        'Number building in Tibeto-Burman languages (Mazaudon, 2008)',
        'https://www.academia.edu/3253865/',
        'R1',
        'A2',
      ),
      Source(
        'Babylonian numerals — MacTutor, Univ. St Andrews',
        'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/',
        'R2',
        'A1',
      ),
      Source(
        'Why Did Sumerians Use the Sexagesimal System? — Nagaitoshiya',
        'https://www.nagaitoshiya.com/en/2013/sexagesimal/',
        'R3',
        'A1',
      ),
      Source(
        'Phalanx bone — Wikipedia',
        'https://en.wikipedia.org/wiki/Phalanx_bone',
        'R1',
        'A1',
      ),
    ],
  ),
];
