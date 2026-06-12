// English unit-theory prose. part of ../unit_theory.dart.
// Bodies are kept in simple, short sentences (easier to translate). Distilled
// from the research dossiers in docs/research/. Also carries the converter
// intro card (first tab) and the count card (dozen/gross/great gross).

part of '../unit_theory.dart';

List<UnitTheorySection> _converterIntroEn() {
  return const [
    UnitTheorySection(
      'What the Calculator Can Do',
      'The unit converter converts between the imperial-dozenal world '
          '(base twelve) and the metric world (base ten) — across every '
          'category: length, area, volume, weight, time, angle, currency, '
          'temperature, and more such as pressure, force, energy, power, '
          'cooking and torque.\n\n'
          'The { } bracket always shows the value in the other system. '
          'Several units can be combined into one value — for example '
          '1 ft 6 in or 2 h 30 min. Pressing = cycles through the unit '
          'representations and the stepped breakdown; a long press on a unit '
          'shows a short definition. Digits appear as dozenal glyphs or as '
          'ordinary 0–9/A/B, depending on the display setting.',
    ),
    UnitTheorySection(
      'What It Cannot Do',
      'It is a converter, not a scientific calculator: no functions such as '
          'sine or logarithm, no free arithmetic with × and ÷, no memory and '
          'no angle mode. The main calculator is there for that.\n\n'
          'The currency (pence/shilling/pound) reflects the historic British '
          'ratio — twelve pence to the shilling, twenty shillings to the '
          'pound — not current exchange rates. It shows the dozenal structure '
          'of the old money, not present-day values. The set of units is '
          'fixed.',
    ),
    UnitTheorySection(
      'How to Use It',
      'Tap a category (length, say) — its ladder of units opens in the '
          'opposite column. Tap a unit, type digits, and combine several '
          'units into one value. The DOZ/DEZ key switches between the '
          'imperial and the metric world; the { } bracket shows the '
          'counterpart. = cycles the representations, a long press on a unit '
          'shows its meaning, and a tap on the input line moves the cursor.\n\n'
          'An example — enter 1 ft 6 in and read it in the opposite world:',
    ),
  ];
}

List<UnitTheorySection> _unitTheoryEn(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return const [
        UnitTheorySection(
          'Stacking in Twelves',
          'You can bundle counts in tens — or in twelves. A dozen is twelve '
              'items, a gross is twelve dozen (144), a great gross is twelve '
              'gross (1728). This is the same ladder as ones, tens, hundreds '
              'and thousands, only in base twelve: dozen = 12¹, gross = 12², '
              'great gross = 12³. Written in base twelve these come out as a '
              'clean 10, 100 and 1000 — so the great gross is the “dozenal '
              'thousand”.\n\n'
              'Why twelve divides so conveniently, and how you count to twelve '
              'on the three joints of the four fingers, is covered in '
              'Theory → Basics. Here we look at the counting units themselves.',
        ),
        UnitTheorySection(
          'Where the Names Come From',
          '“Dozen” comes through Old French douzaine from the Latin duodecim, '
              '“two-and-ten”; the word means exactly twelve, not roughly. The '
              'Spanish docena, the Italian dozzina and the English dozen are '
              'all related.\n\n'
              '“Gross” comes from the grosse douzaine, the “great dozen”, and '
              'is attested from the early 15th century. In wholesale, small '
              'goods — pencils, buttons, needles — were counted and packed by '
              'the gross; some boxes of pencils still read “1 gross” today. '
              'The great gross (1728) is the dozen gross — and, as it happens, '
              'also the number of cubic inches in a cubic foot (12 × 12 × 12). '
              'Eggs are still sold by the dozen today.',
        ),
        UnitTheorySection(
          'The Baker’s Dozen',
          'A baker’s dozen is thirteen — one more than an ordinary dozen; the '
              'thirteenth loaf is called the “vantage loaf”. The common '
              'explanation points to the medieval English bread law (the '
              'Assize of Bread, 13th century): selling underweight bread '
              'risked penalties, so the baker added one loaf to be safe.\n\n'
              'An honest caveat belongs here: this derivation is plausible and '
              'widely repeated, but not documented in the records. The earliest '
              'written evidence for the English “baker’s dozen” dates only from '
              'the late 16th century — long after the law.',
        ),
      ];
    case UnitCategory.dist:
      return const [
        UnitTheorySection(
          'Measures from the Body',
          'The oldest measures of length come from the human body. The '
              'width of a finger became the inch, the forearm the cubit, the foot the '
              'foot, the span of the outstretched arms the fathom. This was practical, for '
              'everyone carried their measure with them. But it was imprecise, for no '
              'two bodies are alike.\n\n'
              'The first fixed standards arose in Mesopotamia and '
              'Egypt. In Egypt the royal cubit prevailed, about 52 centimeters. It '
              'was the forearm of the pharaoh and was preserved in stone as the master '
              'measure. Working cubits made of wood were checked against it '
              'regularly — that was the beginning of calibration.',
        ),
        UnitTheorySection(
          'From Rome to the Middle Ages',
          'The Romans put the system in order. Their foot (pes) had twelve “unciae.” '
              'From uncia came the word “inch” — and also '
              '“ounce.” Their mile was called “mille passus,” a thousand double paces, '
              'about 1480 meters. It is the root of all later miles.\n\n'
              'In the Middle Ages almost every town had its own measures. An inch was '
              'defined as three barleycorns laid end to end. For the '
              'foot there were curious methods: in 1535 Jacob Köbel described how one '
              'should line up sixteen men coming out of church on a Sunday, foot behind '
              'foot — a sixteenth of that was the “right foot.” In this way '
              'the differences were averaged out. In Germany the '
              'foot nonetheless ranged from 235 to 408 millimeters.',
        ),
        UnitTheorySection(
          'Measures around the World',
          'The same pattern appears everywhere. In China people measured in chi (foot) and '
              'cun (inch), in India in hasta (cubit) and angula (finger), in the '
              'Islamic world in various cubits. The cubit from the elbow '
              'to the fingertip is found on almost every continent — the '
              'body is the common origin.\n\n'
              'In many cultures the body was regarded as a sacred measure, the human being '
              'as an image of the world order. Egyptian temples, the biblical building '
              'of the ark, and Hindu temples were measured in cubits.\n\n'
              'Language too has preserved the measures. “Give them an inch, and '
              'they take a mile” originally meant “… and they take an '
              'ell.” A “stone\'s throw” is a short distance. The '
              'sailor\'s leadsman\'s call “mark twain” (two fathoms deep) became the '
              'pen name of Mark Twain.',
        ),
        UnitTheorySection(
          'Why Twelve — and an Honest Caveat',
          'Why does the foot have exactly twelve inches? Because of divisibility. '
              'Twelve can be cleanly halved, divided into thirds, quarters, and '
              'sixths. Ten only into halves and fifths. A third of a foot is '
              'exactly four inches; in decimal it would be 0.333… meters. For craft and '
              'trade, long before the decimal point, that was a real advantage. The '
              'Romans already chose twelve for exactly this reason.\n\n'
              'An honest caveat belongs here: the imperial system is '
              'not a thoroughgoing duodecimal system. Only the foot and inch — and the '
              'twelve troy ounces for precious metal — are truly dozenal. The '
              'yard has three feet, the mile 1760 yards: awkward numbers. And inches '
              'are divided in everyday use into halves, quarters, eighths, that is by '
              'base two. So twelve sits only at individual points, not '
              'throughout the whole system.',
        ),
        UnitTheorySection(
          'In Use Today',
          'Today it is mainly the USA and Britain that use these measures in '
              'everyday life. Worldwide, however, they hold sway in aviation and seafaring: '
              'aircraft measure their altitude in feet, their speed in knots, '
              'and their distance in nautical miles. A nautical mile is one '
              'arcminute on the globe — it follows the division by sixty, '
              'not by twelve. Screens, tires, and pipes are stated almost '
              'everywhere in inches. In Scandinavia the “mil” equals ten '
              'kilometers. In metric countries the old measures live on only in '
              'figures of speech.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Some explanations are appealing but uncertain. One holds that '
              'twelve comes from counting the finger joints with the thumb — '
              'plausible, but not proven. Other theories such as the '
              '“pyramid inch” or the “megalithic yard” claim '
              'hidden advanced knowledge in ancient buildings. They are regarded in '
              'scholarship as refuted: they pick out from many measures only '
              'those that fit the thesis.',
        ),
      ];
    case UnitCategory.area:
      return const [
        UnitTheorySection(
          'Land as Labor',
          'Areas are measured by combining length with length. Yet the '
              'old land measures arose not from geometry, but from '
              'labor. A field was as large as what one could work '
              'in a single day.\n\n'
              'The German “Morgen” is so called because one plowed it in a single morning. '
              'The English “acre” was the area that a team '
              'of eight oxen could manage in a day. The Roman “iugerum” '
              'comes from “iugum,” the yoke of the oxen. The Arabic '
              '“feddan” too means ox-yoke. Everywhere the same idea: land is '
              'labor.\n\n'
              'In ancient Egypt the fields had to be measured anew after every Nile flood, '
              'because the water blurred the boundaries. The surveyors '
              'stretched knotted ropes; the Greeks later called them '
              '“rope-stretchers.” In Mesopotamia the basic measure was the “sar” — a '
              'square of twelve by twelve cubits.',
        ),
        UnitTheorySection(
          'The Acre and Its Awkward Number',
          'The acre has an unusual shape: a long, narrow strip, '
              'one furlong long and one chain wide (660 by 66 feet). That '
              'reflects plowing practice: long furrow, narrow lane. This gives '
              '43,560 square feet or 4840 square yards.\n\n'
              'Why this awkward number 4840? It is an accident of history. '
              'When England shortened the foot in the 13th century, the rod '
              'and furlong stayed unchanged in the property boundaries. As a result the '
              'acre jumped from 4000 old to 4840 new square yards. So the awkward '
              'number is not by design, but the leftover of a '
              'measurement reform.',
        ),
        UnitTheorySection(
          'Area Measures around the World',
          'Today the hectare (10,000 square meters) is the world\'s '
              'most widespread land measure. Yet old measures live on stubbornly. In '
              'Thailand the rai even appears in the official land register. In India '
              'and Bangladesh land is traded in bigha. In Korea '
              'the pyeong is common in everyday life despite a ban. Egypt kept the '
              'feddan, China the mu. In Israel, Turkey, and the Balkans '
              'land is measured in dunam. In Germany the Morgen, Joch, and '
              'Tagwerk still live on in agriculture and in the language.\n\n'
              'The most tenacious are measures that have been fixed to round metric '
              'values — a rai is exactly 1600, a dunam exactly '
              '1000 square meters.',
        ),
        UnitTheorySection(
          'Twelve in Area — and a Caveat',
          'It is in the small units that twelve shows itself most beautifully. A '
              'square foot is 144 square inches, for twelve times twelve is 144. '
              'Written in base twelve that is a clean “100.” A square yard '
              'is nine square feet.\n\n'
              'With the large land measures the order breaks up. The acre with '
              'its 4840 square yards fits into no simple base. That is '
              'because the land measures arose from labor, not from '
              'calculation.\n\n'
              'Even so a practical point remains: a third of a hectare is '
              '3333.33… square meters — an awkward number. A third of a feddan '
              'on the other hand is a clean eight kirat. Where one often divides into thirds, '
              'a base divisible by three has the advantage. That is exactly what twelve '
              'delivers.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Where does the preference for twelve come from? A well-known but '
              'unproven conjecture: from counting the finger joints. The thumb '
              'taps off the three joints of the four other fingers — that gives '
              'twelve per hand. This counting technique is attested to this day in parts of Asia '
              'and the Middle East. But it cannot be proven '
              'as the definite origin.',
        ),
      ];
    case UnitCategory.space:
      return const [
        UnitTheorySection(
          'First the Vessel, Then the Cube',
          'Volume is measured by combining three lengths — a cube. '
              'Yet that is almost nowhere how it began. At the beginning stood the vessel: a '
              'filled jug, a sack of grain, a ladle of oil. People measured '
              'what they could eat, carry, or trade, not what they could '
              'calculate.\n\n'
              'The reference was usually a quantity of food. The Greek '
              '“choinix” was the daily grain ration for a worker. The '
              'Japanese “koku” was as much rice as a person eats in a '
              'year — about 180 liters. The German “Scheffel” was roughly a '
              'portable sack.\n\n'
              'Only great empires with administration derived volume from the '
              'length measure. The Romans took the first clear step: their '
              '“amphora” held exactly one cubic foot, about 26 liters. With that '
              'volume was for the first time a true cube from the foot measure — the '
              'direct ancestor of the cubic foot, the liter, and the cubic meter.',
        ),
        UnitTheorySection(
          'Measure, Rank, and Wealth',
          'Measures of capacity were often more than quantities — they ordered whole '
              'societies. In Japan the wealth of a fief was measured in '
              'koku of rice yield. From ten thousand koku upward a lord ranked as a “daimyō,” '
              'as a prince. Even the pay of the samurai and the size of ships '
              'were counted in koku.\n\n'
              'In Rome the soldier\'s ration was allotted in “modii,” a '
              'dry measure of just under nine liters. In Mesopotamia, Egypt, and '
              'China rulers controlled the measures through calibrated standard vessels. '
              'The most famous is the Chinese “jialiang” from the time around '
              'the year zero: a single bronze casting that embodies five '
              'volume units at once. It stood before the emperor\'s halls '
              'as a sign of the unity and justice of his rule.',
        ),
        UnitTheorySection(
          'Volume around the World',
          'Hardly any field of measurement was as fragmented as volume. The '
              'German Scheffel ranged, depending on the town, from about 5 to 250 liters. '
              'England, the USA, and the Empire alone had three different '
              'gallons. The US gallon (3.79 liters) is to this day about a '
              'fifth smaller than the British one (4.55 liters).\n\n'
              'Many of these measures live on. The world grain trade '
              'reckons in “bushels” — the US harvest reports for corn, soy, and '
              'wheat appear only in them. Crude oil is traded in “barrels” of 42 '
              'US gallons, an old English wine-cask measure. In '
              'Britain and Ireland beer is by law served in the '
              'imperial pint (568 milliliters). In Japan the cup in the '
              'rice cooker measures exactly one “gō.” Firewood is traded in stere, '
              'solid cubic meters, or, in North America, in the “cord.”\n\n'
              'In the USA the cubic measures are embedded in everyday life: engines are stated in '
              'cubic inches (a “350”), concrete and earth in construction in '
              'cubic yards, natural gas in cubic feet.',
        ),
        UnitTheorySection(
          'Twelve in Space — and a Caveat',
          'It is in the cube that twelve shows itself most strongly. A cubic foot is 1728 '
              'cubic inches — and 1728 is twelve to the third power. Written in base twelve '
              'that is the clean “1000.” This number has especially '
              'many divisors, because it is built from twos and threes. A '
              'cubic foot can therefore be cleanly halved, divided into thirds, quarters, '
              'sixths, and eighths.\n\n'
              'A cubic meter, by contrast, divides cleanly only by two and five. '
              'A third of a cubic meter is 0.333… — an endless number. Where one '
              'often divides into thirds, twelve has the advantage.\n\n'
              'The honest caveat: this beautiful order holds only for the '
              'cube measures derived from lengths. The old capacity measures — bushel, '
              'gallon, Scheffel — follow no pure base. They grew out of '
              'sacks and casks, not out of calculation, and mix steps of two, '
              'three, and quite awkward ones.',
        ),
        UnitTheorySection(
          'The Sacred Cube',
          'The cube has a special meaning in many cultures, because '
              'length, breadth, and height are equal — an image of perfection. '
              'The holy of holies in temple and tabernacle was cube-shaped. '
              'The Kaaba in Mecca, whose name means “cube,” is a '
              'black cubic sanctuary. The “new Jerusalem” of the '
              'Bible too is described as a huge cube.\n\n'
              'Across many religions, moreover, the just measure counts as a '
              'sacred duty. The Hebrew Bible demands a “just '
              'ephah”; the prophet Amos accuses merchants who shorten the measure. '
              'The Quran devotes a whole sura to those who give short measure. Whoever '
              'measures falsely sins — this idea is found around the '
              'globe.\n\n'
              'The metric system too carries this spirit, only secular: instead of '
              'from a ruler it derives its measure from the earth itself. '
              'The meter is a fraction of the earth\'s circumference, the cubic meter its '
              'space — measure from nature instead of from power.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Bold volume theories cluster around old structures. Some '
              'claim that the Pyramid of Cheops conceals a “pyramid pint” or '
              'a sacred measure of divine origin. Others hold that '
              'Stone Age stone circles used a “megalithic yard,” from '
              'which exactly one pint results as a cube.\n\n'
              'Scholarship considers this refuted. Such theories pick from '
              'many measures only the fitting ones and read coincidences as '
              'intent. Appealing to read, but no proof.',
        ),
      ];
    case UnitCategory.weight:
      return const [
        UnitTheorySection(
          'From the Grain to the Load',
          'Weights everywhere had two roots. The smallest measures came from '
              'seeds and grains, the large ones from what a human or an '
              'animal could carry.\n\n'
              'The English “grain” is literally a barleycorn, about 65 '
              'milligrams. The “carat” of the jewelers comes from the seed of the '
              'carob tree. In India gold was weighed in “ratti,” the seeds '
              'of a red legume. At the other end stood the load: the '
              'Greek “talent” and the Indian “maund” were roughly as '
              'much as a man could carry. The “ton” comes from the largest '
              'wine cask, the “tun,” which when filled weighed about a ton.\n\n'
              'A third thread connects weight and money: shekel, drachma, '
              'pound, and tola were at once names of coins and of weights. Money was '
              'originally weighed metal — one weighed out silver instead of counting '
              'coins.',
        ),
        UnitTheorySection(
          'Pound, Ounce, and the Roman Legacy',
          'Our words for weight come from Rome. The Roman “libra” was a '
              'balance and a weight of about 329 grams, divided into twelve '
              '“unciae.” From “libra” came the abbreviation “lb” for pound and the '
              'symbol “£” for the British pound. From “uncia” — literally “the '
              'twelfth” — came both the “ounce” and the “inch.”\n\n'
              'From this root grew two different systems. The '
              '“avoirdupois” pound of everyday life divides into 16 ounces — a '
              'number that can be halved again and again. The “troy” pound of the '
              'precious-metal trade kept the Roman twelve ounces. A '
              'troy ounce (the fine ounce) is therefore heavier than an '
              'everyday ounce, but the troy pound lighter — a confusion popular '
              'to this day.',
        ),
        UnitTheorySection(
          'Weights around the World',
          'Almost every culture had its steps. Mesopotamia counted in shekel, '
              'mina, and talent by base sixty. Egypt reckoned decimally in '
              'deben and kite. China uses jin, liang, and the small '
              'mace to this day. In Japan the “momme” (3.75 grams) is by law still '
              'the worldwide unit in the pearl trade.\n\n'
              'Many old weights live on. In Britain and Ireland '
              'body weight is given in “stone” of 14 pounds (“eleven '
              'stone four”). The German pound today means a clean 500 grams. In '
              'South Asia gold is traded in “tola” (about 11.7 grams). And the '
              'Israeli shekel bears the name of an ancient weighing weight.\n\n'
              'One measure was especially fragmented: the stone weighed, depending on the goods, '
              'now 5, now 8, now 14 pounds. Only laws of the 19th '
              'century created order.',
        ),
        UnitTheorySection(
          'The Balance as Symbol',
          'In many cultures weighing is more than technique — it is an image '
              'of justice. In ancient Egypt the heart was weighed in the judgment of the dead '
              'against the feather of truth. In Homer, Zeus holds a '
              'golden balance over the fate of the heroes. In Islam the '
              '“mizan” weighs the deeds on the Day of Judgment, and not even the weight '
              'of a mustard seed is lost.\n\n'
              'The Latin “libra” means balance — hence also the zodiac sign '
              'Libra, the only one that is not a living creature. Many religions '
              'demand honest measure: the Hebrew Bible calls false '
              'weights an abomination, the Quran rebukes those who weigh short. And '
              'the word “talent” changed from a weight to a gift — by way of '
              'the biblical parable of the entrusted talents.',
        ),
        UnitTheorySection(
          'Twelve in Weight — and a Caveat',
          'Twelve sits above all in the troy system: twelve ounces in the pound, and '
              'the fineness of gold is counted in 24 carats (twice twelve). Such numbers '
              'are popular, because twelve has six divisors — one can cleanly '
              'halve, divide into thirds, and quarter. A third of twelve is '
              'a clean four; a third of ten is 3.33…\n\n'
              'The honest caveat: everyday weight does not follow twelve. '
              'The avoirdupois pound has 16 ounces — that is base two, the '
              'continual halving. Mesopotamia counted in base sixty. The '
              'world of weights is thus a patchwork of two, three, twelve, '
              'and sixty — built for dividing in trade, not for calculating in '
              'tens.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Where does the preference for twelve come from? A well-known but '
              'unproven conjecture traces it back to the counting of the finger joints: '
              'the thumb taps off the three joints of the four fingers — '
              'twelve per hand. Count that five times, and you arrive at sixty.\n\n'
              'A second story is even refuted: that the carat rests on '
              'the especially uniform seeds of the carob tree. '
              'The name is correct — but the seeds vary in weight as much '
              'as any others. The uniformity is a myth.',
        ),
      ];
    case UnitCategory.time:
      return const [
        UnitTheorySection(
          'Two Inheritances: Babylon and Egypt',
          'Our time comes from two ancient sources. The hour comes from '
              'Egypt, the minute and second from Babylon.\n\n'
              'The Egyptians divided day and night into twelve hours each — '
              'probably because at night they saw twelve constellations rise. '
              'Thus the 24-hour day arose. But because day and night are '
              'of different length, these hours were unequal in length in summer and winter. '
              'Only the mechanical clock made them equal.\n\n'
              'Babylon reckoned in base sixty. That is why we have sixty '
              'minutes in the hour and sixty seconds in the minute. “Minute” '
              'means “diminished part,” “second” the “second diminution.” '
              'The same base sixty sits in the circle with its 360 degrees — '
              'time and angle are kin.',
        ),
        UnitTheorySection(
          'Moon, Sun, and Week',
          'The day comes from the earth\'s rotation, the month from the moon, the year from '
              'the sun. These three do not fit together cleanly, and that '
              'explains almost every calendar entanglement.\n\n'
              'The week has seven days — presumably after the four phases of the moon '
              'of about seven days each. Later each day was assigned one of '
              'the seven visible heavenly bodies. This series lives on in many '
              'languages: in English “Saturday” is Saturn\'s day, in the '
              'Romance languages “lundi/lunes” the moon\'s day. The Germanic peoples replaced '
              'the Roman gods with their own — from the day of Jupiter came '
              'Thor\'s day, “Thursday.”\n\n'
              'Old ways of counting echo too: the English “fortnight” '
              '(fourteen nights) recalls that the Germanic peoples reckoned in nights '
              'rather than days.',
        ),
        UnitTheorySection(
          'Time around the World',
          'Not everywhere did the clock run the same. China divided the day into twelve '
              'double-hours, named after animals — the hour of the rat fell around '
              'midnight. Japan divided day and night into six segments each, '
              'which grew longer and shorter with the seasons; special clocks '
              'had to readjust to this.\n\n'
              'The Islamic calendar follows the moon purely and is eleven days '
              'shorter than the solar year — that is why Ramadan slowly wanders '
              'through all the seasons. The Maya interlocked several '
              'cycles at once, among them a sacred round of 260 days. In Ethiopia '
              'the day still begins at sunrise: what is “six o\'clock” there '
              'is noon elsewhere.\n\n'
              'Many of these old rhythms live on — in festivals, prayer times, '
              'and lucky days — while everyday life everywhere follows the Gregorian '
              'calendar.',
        ),
        UnitTheorySection(
          'Sacred Numbers of Time',
          'Time was almost everywhere sacred too. In Babylon twelve and '
              'sixty counted as perfect numbers. In Egypt the '
              'sun god traveled through the underworld in the twelve hours of night. The seven '
              'of the week stands in the Jewish tradition for completeness — '
              'on the seventh day God rested.\n\n'
              'Striking is a contrast: for Judaism, Christianity, and Islam '
              'time runs straight ahead, toward a goal. In Hinduism it turns '
              'in a circle — mighty world ages, the “yugas,” come '
              'and pass away again and again, a single day of the creator god '
              'lasts billions of years. Many cultures also feared the '
              'surplus days at the year\'s end as a dangerous “time between.”',
        ),
        UnitTheorySection(
          'Why Not Decimal — and the Twelve Connection',
          'Time is the most stubborn opponent of the decimal system. Second, '
              'minute, hour, day, week, month, year — none of these steps '
              'is a clean power of ten.\n\n'
              'The reason is again divisibility. A third of an hour '
              'is a clean twenty minutes, a quarter is fifteen. With '
              'ten it would not work out. Twelve and sixty can be divided by '
              'three, ten cannot.\n\n'
              'The decimal system was nevertheless tried. In the French '
              'Revolution there were days of ten hours, hours of a hundred '
              'minutes. It lasted only about a year and a half. Unlike with the '
              'length and weight measures, the changeover brought no benefit — '
              'the old clocks already ran the same everywhere. The division by '
              'twelve and sixty was simply more practical.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'How did people arrive at twelve and sixty? An elegant but '
              'unprovable idea: one counted with the thumb the three joints of the '
              'four fingers — twelve per hand —, and five such passes '
              'yield sixty.\n\n'
              'Further out lie claims that the year really had '
              'exactly 360 days in former times and was '
              'altered by cosmic catastrophes. For this there is no scientific proof; '
              'the 360 is far more likely a round, easily divisible reckoning number.',
        ),
      ];
    case UnitCategory.angle:
      return const [
        UnitTheorySection(
          'The Circle from Babylon',
          'We divide the full circle into 360 degrees, the degree into 60 arcminutes, '
              'the minute into 60 seconds. This order is ancient and comes from '
              'Mesopotamia. The Babylonians reckoned in base sixty, a '
              'number with especially many divisors.\n\n'
              'Why exactly 360? Their year had about 360 days, and the sun '
              'travels in it just under one degree per day — day and degree fell '
              'together. The words betray the origin: “minute” comes from the '
              'Latin “first small part,” “second” from the “second '
              'diminution.” We use exactly the same words for time — '
              'angle and time are siblings from the same Babylonian '
              'root.\n\n'
              'An honest note: why it became 360 and not 60 is not '
              'securely attested. The day-per-degree story is the most plausible, '
              'but not a proven explanation.',
        ),
        UnitTheorySection(
          'From the Star to the Hour',
          'The twelve at the circle comes from Egypt. There twelve '
              'rising constellations divided the night — from this came twelve '
              'night hours and finally the day of 24 hours and the '
              'face of the clock.\n\n'
              'The Greeks put the system in order. Hipparchus and later Ptolemy '
              'adopted the division into 360 and thus laid the foundation of '
              'trigonometry. From there the knowledge traveled on: Indian '
              'scholars invented the sine table, the Islamic world refined '
              'it. Our word “sine” is even a translation error — from '
              'the Indian word for “bowstring” came, by way of Arabic, the '
              'Latin word for “bay.”',
        ),
        UnitTheorySection(
          'Angles around the World',
          'Not every culture divided the circle the same. China reckoned '
              'independently: the circle there had 365¼ parts — one for every '
              'day of the year. Only European influence brought the 360. The '
              'Chinese feng shui compass divides the horizon into 24 '
              'directions.\n\n'
              'India divided the zodiac into twelve signs and into 27 '
              'lunar mansions. Islamic astronomy gave us many '
              'words for direction: “azimuth,” “zenith,” and “nadir” are all '
              'Arabic — the duty to find the direction of prayer toward Mecca '
              'drove the art of angles forward.\n\n'
              'At sea the wind rose was divided: four main winds, then eight, then '
              '32 points of 11¼ degrees each. To recite all 32 around the circle — “boxing '
              'the compass” — belonged to the helmsman\'s craft. The '
              'Mediterranean wind names Tramontana, Levante, Scirocco live on '
              'to this day in the language of weather.',
        ),
        UnitTheorySection(
          'Sacred Directions and Numbers',
          'The heavens were almost everywhere divine. For the Babylonians '
              'astronomy was a message of the gods, the zodiac their writing. '
              'Twelve counted to many as a sacred number — twelve zodiac signs, '
              'twelve Olympians, twelve tribes, twelve hours.\n\n'
              'Especially broad is the order of the four cardinal directions. In '
              'Hinduism each direction is guarded by its own god, in China by its '
              'own animal being — dragon in the east, tiger in the west. The '
              'medicine wheel of the Lakota gives each direction color and meaning. '
              'And in Islam the direction of prayer orders the whole world around the '
              'Kaaba.\n\n'
              'Deliberately without such symbolism came the younger measures: the '
              'radian follows only mathematics, the gon the '
              'French Revolution, the military mil ballistics alone.',
        ),
        UnitTheorySection(
          'Twelve and Sixty in the Circle — and a Caveat',
          'The 360 is a marvel of divisibility: it has 24 divisors. Thirds, '
              'quarters, sixths of a circle all yield clean degree numbers. '
              'A hundred-part circle could not do that — a third would be '
              '33.33…\n\n'
              'It was tried decimally. In the French Revolution came '
              'the circle of 400 gon. It remained a niche of surveyors, for '
              '400 has fewer divisors than 360. Decimal time too failed — '
              'among other things because it could not be cleanly quartered.\n\n'
              'The honest caveat: the 360 is not compulsory. China\'s '
              '365-division proves it. And in higher mathematics the '
              'radian wins, because there it does not depend on divisibility, but on '
              'simple formulas. So the world of twelve is strong, but not '
              'without alternative.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Where does the preference for twelve and sixty come from? The well-known but '
              'unproven conjecture: from counting the finger joints. The thumb '
              'taps off the three joints of the four fingers — twelve per hand —, and '
              'five passes yield sixty.\n\n'
              'Appealing is a numerical parallel: the Norse legend gives '
              'Valhalla 540 doors, through each of which 800 warriors march — together '
              '432,000, the same number as an Indian world age. Scholarship '
              'considers this coincidence, not a common heritage. '
              'Lovely to tell, but no proof.',
        ),
      ];
    case UnitCategory.price:
      return const [
        UnitTheorySection(
          'Money Was Weight',
          'Long before there were coins, money was weighed-out metal. One weighed '
              'silver or grain. That is why the oldest names for money are '
              'actually names of weights.\n\n'
              'In Mesopotamia people counted in shekel, mina, and talent — by '
              'base sixty, sixty shekels to the mina. The shekel was '
              'at first a weight, calibrated to the barleycorn. The Greek '
              '“drachma” means literally “a handful,” namely six thin '
              'metal spits.\n\n'
              'Striking: usually only the smallest coin was minted. The large '
              'units like mina and talent were pure reckoning quantities — no one '
              'held a talent in their hand, one only reckoned with it.',
        ),
        UnitTheorySection(
          'Pound, Shilling, Penny',
          'European money comes from Rome. The coin “denarius” gave the '
              'penny the abbreviation “d” and many languages the word for money '
              '(Spanish “dinero,” Arabic “dinar”).\n\n'
              'Charlemagne reordered it: one pound of silver (libra) = 20 '
              'shillings (solidus) = 240 pennies (denarius), that is twelve pennies '
              'to the shilling. Here too only the penny was a real '
              'coin; pound and shilling served for reckoning. This system '
              'lasted over a thousand years.\n\n'
              'England adopted it as pound, shilling, penny — the “£sd.” The '
              'symbol “£” is an ornamented L for “libra,” the balance. So '
              'money hangs on the same word as the zodiac sign Libra and the '
              'weight-pound.',
        ),
        UnitTheorySection(
          'Coins around the World',
          'Almost every region had its steps. In the South German lands '
              'sixty kreuzer counted to a gulden — again the Babylonian '
              'sixty. The “taler” from the Bohemian Joachimsthal gave the '
              '“dollar” its name. The Maria Theresa taler was so popular '
              'that it still circulated as money in Arabia and Ethiopia in the 20th '
              'century.\n\n'
              'Elsewhere money looked quite different. In West Africa people paid '
              'for centuries with cowrie shells. The Aztecs used '
              'cacao beans as small change and standardized cloaks as large money — '
              'counted in twenties. India reckoned the rupee in 16 annas, '
              'China strung coins with a hole into strands.\n\n'
              'The Spanish “piece of eight” dollar could be broken into eight pieces. '
              'Two of them were “two bits” — to this day the '
              'American nickname for the quarter-dollar piece.',
        ),
        UnitTheorySection(
          'Money, Faith, and Symbol',
          'Coins were often more than a means of payment. The Greeks laid a '
              'coin in the mouth of the dead — the ferry fare for Charon, who brings the soul '
              'across the river of the dead. Without a coin it stayed on the bank.\n\n'
              'In the New Testament Jesus holds up a denarius with the emperor\'s image: '
              '“Render to the emperor what is the emperor\'s.” The thirty pieces of silver '
              'of Judas were probably shekels from Tyre — of all things '
              'coins with a pagan god on them, and at the same time the official '
              'temple currency.\n\n'
              'And again and again the sacred twelve: twelve tribes and apostles in '
              'Judaism and Christianity, twelve sun gods in Hinduism, twelve '
              'links of the chain of causation in Buddhism, twelve imams in '
              'Shia, twelve earthly branches in China. The number connects money, '
              'calendar, and faith.',
        ),
        UnitTheorySection(
          'Why Twelve and Twenty — and a Caveat',
          'The reason for all those awkward steps is divisibility. A gulden '
              'of sixty kreuzer can be cleanly divided into thirds: twenty kreuzer. '
              'A third of a dollar, by contrast, is 33.33… cents — an endless number. '
              'Whoever divides often in trade is better served with twelve, twenty, or sixty '
              'than with ten.\n\n'
              'That is why twelve lives on in trade: the dozen (12), the gross '
              '(144), and the great gross (1728). A gross means in London as in '
              'New York the same quantity.\n\n'
              'The honest caveat: the old money was no pure '
              'duodecimal system. The twenty shillings in the pound are a '
              'twenty-logic (fingers and toes). And in 1971 '
              'Britain switched to a hundred pence — with some confusion, '
              'but lastingly. Today almost the whole world reckons decimally.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Why did so many cultures choose twelve? The well-known but '
              'unproven conjecture traces it back to the counting of the finger joints: '
              'three joints on four fingers, tapped off by the thumb, '
              'give twelve.\n\n'
              'Other interpretations go further: that twelve is “three times four,” '
              'heaven times earth, a number of completeness. Some claim '
              'even that a sun god with twelve companions was the model of the '
              'twelve apostles. Such parallels are interpretation, not '
              'secured history — to be taken with caution.',
        ),
      ];
    case UnitCategory.temp:
      return const [
        UnitTheorySection(
          'From the Thermoscope to the Thermometer',
          'Temperature is a late invention. For a long time warmth could only be '
              'felt, not measured. The first step was made by the observation '
              'that air and liquids expand when warm.\n\n'
              'Around 1600 Galileo Galilei built a “thermoscope”: a glass bulb '
              'with a tube, in which a water level rose and fell. It indicated '
              'warmth but had no scale. The first numerical scale was added '
              'shortly afterward by the physician Santorio — a thermometer is a '
              'thermoscope with a scale.\n\n'
              'For measurements to become comparable, fixed reference points are needed. '
              'People agreed on points of nature: the freezing point and the '
              'boiling point of water. On these all scales hang to this day.',
        ),
        UnitTheorySection(
          'Three Scales, Three Zero Points',
          'The well-known scales differ above all in where they '
              'put the zero.\n\n'
              'Daniel Fahrenheit set his zero, around 1724, at the coldest '
              'point he could reliably produce: a mixture of ice, '
              'water, and salt. The freezing point of pure water he placed at '
              '32, body temperature at 96. Thus ordinary winters did not '
              'fall below zero. Later the scale was recalibrated to the freezing (32) and '
              'boiling point (212) — exactly 180 degrees in between.\n\n'
              'Réaumur chose 0 and 80. Anders Celsius set 0 and 100 at '
              'freezing and boiling — and at first even laid the scale out '
              'the wrong way round (0 was the boiling point). Only after his death '
              'was it turned into its present form. The round division into 100 '
              'fit perfectly with the new metric system.',
        ),
        UnitTheorySection(
          'Why the World Measures Differently',
          'Almost the whole world today uses Celsius — it came with the metric '
              'system. The great exceptions are the USA and a few countries closely '
              'tied to them, which stayed with Fahrenheit. A law '
              'of 1975 made the changeover there voluntary, and so it stayed '
              'with the old.\n\n'
              'Old scales are tenacious. Réaumur was widespread in the 18th and 19th centuries in '
              'France, Germany, and Russia and held on in '
              'Russia especially long. That is why Russian literature — '
              'in Dostoevsky or Tolstoy, for instance — speaks of “degrees of frost,” '
              'meaning Réaumur degrees.\n\n'
              'Which scale feels “more natural” is pure habit. '
              'Celsius binds itself to water, Fahrenheit spans roughly from 0 '
              '(very cold) to 100 (very hot) the human range of weather. Both '
              'are convention, not an objective advantage.',
        ),
        UnitTheorySection(
          'Fire and Ice',
          'Heat and cold carry a deep meaning in almost all cultures — '
              'and strikingly often both stand at once for creation and for '
              'punishment.\n\n'
              'In the Norse legend the world arises out of the tension '
              'between the fire realm Muspelheim and the ice realm Niflheim — '
              'cold here is not an evil, but a creative force. '
              'Hell is usually imagined as fire, yet in Dante\'s '
              'Inferno the deepest circle is a frozen lake: betrayal is the '
              'cooling of all human warmth. Buddhism knows both '
              'hot and cold hells, graded by guilt.\n\n'
              'Fire elsewhere is sacred and pure: Agni in Hinduism, the '
              'eternal fire in Zoroastrianism. And the word “nirvana” means '
              'literally “extinguishing” — the snuffing out of the inner burning.',
        ),
        UnitTheorySection(
          'The True Zero Point: Kelvin',
          'What is temperature actually? It is a measure of how fast '
              'the smallest particles move. Hot means: the particles '
              'jiggle more strongly.\n\n'
              'From this it follows that there is a lowest possible temperature — the '
              'point at which this motion is smallest. That is the '
              'absolute zero point at −273.15 °C. Colder is not possible. Lord Kelvin '
              'laid a scale exactly there in 1848: zero kelvin is the absolute '
              'zero point, one kelvin step is as large as one Celsius degree.\n\n'
              'Only this scale allows true ratios: 200 kelvin is '
              'really twice as “warm” as 100. With Celsius or Fahrenheit '
              'that does not hold — “20 degrees is twice as warm as 10 degrees” is '
              'simply false. For science, kelvin is therefore the '
              'base unit.',
        ),
        UnitTheorySection(
          'Why Twelve Hardly Helps Here — Honestly',
          'With the other measures twelve is strong, because a quantity can be well '
              'divided: a third of a foot is a clean four inches. With '
              'temperature this argument does not bite — and that belongs to honesty, '
              'frankly.\n\n'
              'The reason is the shifted zero point. Zero degrees Celsius '
              'does not mean “no warmth,” but only “water freezes.” '
              'That is why temperatures cannot be meaningfully halved or '
              'divided into thirds — “half as warm” does not exist on such a scale. The '
              'beautiful divisibility of twelve runs into the void here.\n\n'
              'Only in one place does divisibility thinking sit after all: in the '
              'division of the scale itself. Fahrenheit\'s 96 and the 64 steps '
              'down to the ice can often be halved. But whether one divides the display '
              'into 10, 12, or 100 steps is pure cosmetics. The '
              'temperature is the honest counterexample: here the choice of '
              'base is a matter of indifference — the real statement sits in the absolute '
              'zero point, not in the division of the scale.',
        ),
        UnitTheorySection(
          'Speculative (with Caution)',
          'Legends cluster around Fahrenheit\'s scale. One holds that the 96 was '
              'the fever temperature of his sick wife — for this there is '
              'no proof. Another says the zero was the coldest winter '
              'of his home town Danzig; more likely is the '
              'reproducible ice-salt mixture.\n\n'
              'Even Fahrenheit\'s own explanation of his fixed points counts as '
              'partly embellished after the fact — much of it he simply took from '
              'the older scale of the astronomer Rømer. Lovely stories, but '
              'to be read with caution.',
        ),
      ];
    // All eight theory areas are now available in English.
    default:
      return const [];
  }
}

// Curated key sources per area (A1/full-text first), from the dossiers in
// docs/research/unit_<area>.md. The complete tiered lists live there.
List<Source> _unitSourcesEn(UnitCategory cat) {
  switch (cat) {
    case UnitCategory.count:
      return [
        Source('Dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Dozen', 'R2', 'A1'),
        Source('Gross (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Gross_(unit)', 'R2', 'A1'),
        Source('Great gross — Wikipedia', 'https://en.wikipedia.org/wiki/Great_gross', 'R2', 'A1'),
        Source('Baker’s dozen — Wikipedia', 'https://en.wikipedia.org/wiki/Baker%27s_dozen', 'R2', 'A1'),
        Source('Assize of Bread and Ale — Wikipedia', 'https://en.wikipedia.org/wiki/Assize_of_Bread_and_Ale', 'R2', 'A1'),
        Source('dozen — Online Etymology Dictionary', 'https://www.etymonline.com/word/dozen', 'R2', 'A1'),
        Source('gross — Online Etymology Dictionary', 'https://www.etymonline.com/word/gross', 'R2', 'A1'),
      ];
    case UnitCategory.dist:
      return [
        Source('Measurement — MacTutor History of Mathematics', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Measurement/', 'R1', 'A1'),
        Source('Proportionate measurements (Vastu-Shastra) — wisdomlib.org', 'https://www.wisdomlib.org/hinduism/book/vastu-shastra-indian-architecture/d/doc1085304.html', 'R1', 'A1'),
        Source('Cubit — Wikipedia', 'https://en.wikipedia.org/wiki/Cubit', 'R2', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('The nautical mile — IHO', 'https://ihr.iho.int/articles/the-nautical-mile/', 'R1', 'A2'),
      ];
    case UnitCategory.area:
      return [
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A1'),
        Source('Acre — Wikipedia', 'https://en.wikipedia.org/wiki/Acre', 'R2', 'A1'),
        Source('Hectare — Wikipedia', 'https://en.wikipedia.org/wiki/Hectare', 'R2', 'A1'),
        Source('Jugerum — Wikipedia', 'https://en.wikipedia.org/wiki/Jugerum', 'R2', 'A1'),
        Source('Mathematical accuracy of Aztec land surveys (Codex Vergara) — PNAS', 'https://www.pnas.org/doi/10.1073/pnas.1107737108', 'R1', 'A2'),
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A2'),
      ];
    case UnitCategory.space:
      return [
        Source('Before the Melting Pot: Pre-Columbian Weights and Measures — NIST', 'https://www.nist.gov/blogs/taking-measure/melting-pot-pre-columbian-weights-and-measures', 'R1', 'A1'),
        Source('Ancient Mesopotamian units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Mesopotamian_units_of_measurement', 'R2', 'A1'),
        Source('Hekat — Wikipedia', 'https://en.wikipedia.org/wiki/Hekat', 'R2', 'A1'),
        Source('Medimnos — Wikipedia', 'https://en.wikipedia.org/wiki/Medimnos', 'R2', 'A1'),
        Source('Ancient Roman units of measurement — Wikipedia', 'https://en.wikipedia.org/wiki/Ancient_Roman_units_of_measurement', 'R2', 'A1'),
        Source('Jialiang — Wikipedia', 'https://en.wikipedia.org/wiki/Jialiang', 'R2', 'A1'),
      ];
    case UnitCategory.weight:
      return [
        Source('Hanging in the Balance: Precision Weighing in Antiquity — Penn Museum', 'https://www.penn.museum/sites/expedition/hanging-in-the-balance-2/', 'R1', 'A1'),
        Source('Avoirdupois — Wikipedia', 'https://en.wikipedia.org/wiki/Avoirdupois', 'R2', 'A1'),
        Source('Troy weight — Wikipedia', 'https://en.wikipedia.org/wiki/Troy_weight', 'R2', 'A1'),
        Source('Mina (unit) — Wikipedia', 'https://en.wikipedia.org/wiki/Mina_(unit)', 'R2', 'A1'),
        Source('Cubical Weights — Harappa.com', 'https://www.harappa.com/blog/cubical-weights', 'R1', 'A2'),
        Source('Legume Seeds for Weighing Gold in India — ResearchGate', 'https://www.researchgate.net/publication/344088688', 'R1', 'A2'),
      ];
    case UnitCategory.time:
      return [
        Source('Sexagesimal — Wikipedia', 'https://en.wikipedia.org/wiki/Sexagesimal', 'R2', 'A1'),
        Source('Hour — Wikipedia', 'https://en.wikipedia.org/wiki/Hour', 'R2', 'A1'),
        Source('Minute — Wikipedia', 'https://en.wikipedia.org/wiki/Minute', 'R2', 'A1'),
        Source('Decimal time — Wikipedia', 'https://en.wikipedia.org/wiki/Decimal_time', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A3'),
        Source('Telling Time in Ancient Egypt — Metropolitan Museum of Art', 'https://www.metmuseum.org/essays/telling-time-in-ancient-egypt', 'R1', 'A3'),
      ];
    case UnitCategory.angle:
      return [
        Source('Babylonian mathematics — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_mathematics/', 'R1', 'A1'),
        Source('Why did the Babylonians use 360 degrees? — UNLV', 'https://www.physics.unlv.edu/~jeffery/astro/babylon/babylonian_360_degrees.html', 'R1', 'A1'),
        Source('Hipparchus — MacTutor', 'https://mathshistory.st-andrews.ac.uk/Biographies/Hipparchus/', 'R1', 'A1'),
        Source('Angles in the SI: the radian as an independent unit — arXiv', 'https://arxiv.org/pdf/2101.01578', 'R1', 'A1'),
        Source('Decimal time — MacTutor', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Decimal_time/', 'R1', 'A1'),
      ];
    case UnitCategory.price:
      return [
        Source('£sd — Wikipedia', 'https://en.wikipedia.org/wiki/%C2%A3sd', 'R2', 'A1'),
        Source('Denarius — Wikipedia', 'https://en.wikipedia.org/wiki/Denarius', 'R2', 'A1'),
        Source('Shekel — Wikipedia', 'https://en.wikipedia.org/wiki/Shekel', 'R2', 'A1'),
        Source('Non-decimal currency — Wikipedia', 'https://en.wikipedia.org/wiki/Non-decimal_currency', 'R2', 'A1'),
        Source('Charon\'s obol — Wikipedia', 'https://en.wikipedia.org/wiki/Charon\'s_obol', 'R2', 'A1'),
        Source('Babylonian numerals — MacTutor (St Andrews)', 'https://mathshistory.st-andrews.ac.uk/HistTopics/Babylonian_numerals/', 'R1', 'A2'),
      ];
    case UnitCategory.temp:
      return [
        Source('Kelvin: History — NIST', 'https://www.nist.gov/si-redefinition/kelvin/kelvin-history', 'R1', 'A1'),
        Source('Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Fahrenheit', 'R2', 'A1'),
        Source('Daniel Gabriel Fahrenheit — Wikipedia', 'https://en.wikipedia.org/wiki/Daniel_Gabriel_Fahrenheit', 'R2', 'A1'),
        Source('Réaumur scale — Wikipedia', 'https://en.wikipedia.org/wiki/R%C3%A9aumur_scale', 'R2', 'A1'),
        Source('Thermodynamic temperature — Wikipedia', 'https://en.wikipedia.org/wiki/Thermodynamic_temperature', 'R2', 'A1'),
        Source('Rankine scale — Wikipedia', 'https://en.wikipedia.org/wiki/Rankine_scale', 'R2', 'A1'),
      ];
    default:
      return const [];
  }
}
