//  English prose for the "Dozenal Society" chapters. part of
// ../society_theory.dart. Simple sentences (easier to translate). Facts and
// attributed views; honest about uncertain attributions (citation cascades),
// no narrator verdicts. Distilled from docs/research/society_*.md.

part of '../society_theory.dart';

List<ProseChapter> _societyChaptersEn() => const [
  ProseChapter('A Movement for the Twelve', [
    ProseSection(
      'Individual Pioneers',
      'The idea of counting in twelves rather than tens is an old one. For a '
          'long time, though, there were only individual advocates, not a '
          'movement. As early as the 18th century, the naturalist Buffon is '
          'mentioned — but the exact source for this is uncertain and drifts '
          'from one reference work to the next.\n\n'
          'It becomes more tangible in the 19th century. The shorthand inventor '
          'Isaac Pitman championed the twelve from 1857 on and proposed his own '
          'symbols for ten and eleven. The philosopher Herbert Spencer argued '
          'for it in 1896, explicitly against the metric system.',
    ),
    ProseSection(
      'Andrews and "New Numbers"',
      'It was an American who turned it into a cause: Frank Emerson Andrews. In '
          '1934 his essay "An Excursion in Numbers" appeared in the Atlantic '
          'Monthly — a magazine that, by its own account, had never before '
          'printed mathematics and placed a warning note for math-shy readers '
          'right in the middle of the text.\n\n'
          'In 1935 came his book "New Numbers," the first of its kind in the '
          'United States. His argument was simple: twelve is divisible by 2, 3, '
          '4, and 6, ten only by 2 and 5. Andrews was clear-eyed about it — he '
          'thought a real changeover unlikely against the "tough power of '
          'habit."',
    ),
    ProseSection(
      'The Societies Take Shape',
      'Out of the responses to Andrews\' article grew a circle of '
          'correspondents, and from that, in 1944, the "Duodecimal Society of '
          'America." It was Ralph "Whiskers" Beard who jokingly gave it the '
          'name; the seed money came from George Terry. Later it was renamed the '
          '"Dozenal Society of America" — because the word "duodecimal" contains '
          'the decimal "decimal."\n\n'
          'In 1959 its British sister joined it, the Dozenal Society of Great '
          'Britain, with the mathematician A. C. Aitken as a prominent member. '
          'The American society publishes the "Duodecimal Bulletin" to this day; '
          'among its honorary members was the science fiction author Isaac '
          'Asimov.',
    ),
  ], sources: [
    Source('F. Emerson Andrews — Wikipedia', 'https://en.wikipedia.org/wiki/F._Emerson_Andrews', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('New Numbers (F. E. Andrews) — Internet Archive', 'https://archive.org/details/newnumbershowacc0000fran', 'R2', 'A1'),
    Source('Honorary Members and Fellows — DSA', 'https://dozenal.org/about-us-honorary-members-and-fellows-society', 'R1', 'A1'),
    Source('Summer Reading: New Numbers — Charles Petzold', 'http://www.charlespetzold.com/blog/2006/08/250954.html', 'R3', 'A1'),
  ]),
  ProseChapter('New Digits for Ten and Eleven', [
    ProseSection(
      'The Symbol Problem',
      'Anyone counting in twelves needs two additional digits — one for ten and '
          'one for eleven. Which ones they should be has never been settled in a '
          'uniform way; even the American society prescribes no fixed '
          'notation.\n\n'
          'There are several variants: Pitman\'s rotated two and three (↊ and '
          '↋), Andrews\' italic X and rounded E, a sextile and a double cross '
          '(inspired by telephone keys), the glyphs of the type designer '
          'Dwiggins — and simply the letters A and B from the world of '
          'computing.',
    ),
    ProseSection(
      'Pitman, Unicode, and the 2026 Switch',
      'The American society changed its symbols several times: sextile and '
          'double cross until about 2008, then the Dwiggins glyphs, and since '
          '2015 the Pitman digits. In 2015 the Unicode standard also officially '
          'adopted the Pitman characters.\n\n'
          'In early 2026 the society switched its websites to the letters A and '
          'B — not because it was giving up Pitman, but because the special '
          'characters still do not display reliably on many browsers and '
          'phones. In the printed Bulletin the Pitman digits remain the '
          'standard. (This app can show either its own glyphs or 0–9 / A, B on '
          'the display.)',
    ),
    ProseSection(
      'Little Twelvetoes',
      'The best-known piece of dozenal in pop culture is a song: "Little '
          'Twelvetoes" from the U.S. educational series Schoolhouse Rock, '
          'written and sung by Bob Dorough, first aired in 1973.\n\n'
          'In it, a friendly alien with twelve toes shows how someone with '
          'twelve "fingers" would have invented two new digits — pronounced '
          '"dek" for ten and "el" for eleven. It was considered too hard for '
          'grade-school children and aired less often than the other episodes, '
          'yet it stuck in many people\'s memory.',
    ),
  ], sources: [
    Source('Unicode-Proposal L2/15-116: Pitman digits (PDF)', 'https://www.unicode.org/L2/L2015/15116-pitman.pdf', 'R1', 'A1'),
    Source('Symbols, Symbols … Symbols — DSA', 'https://dozenal.org/drupal/content/symbols-symbols-%C2%A2-symbols.html', 'R1', 'A1'),
    Source('The DSA Symbology Synopsis', 'https://dozenal.org/drupal/content/dsa-symbology-synopsis.html', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Little Twelvetoes — Schoolhouse Rock Wiki', 'https://schoolhouserock.fandom.com/wiki/Little_Twelvetoes', 'R3', 'A1'),
  ]),
  ProseChapter('Do, Gro, Mo — Speaking Dozenal', [
    ProseSection(
      'Dozen, Gross, and Great Gross',
      'In base twelve, twelve becomes "10." There have long been everyday words '
          'for its place values: twelve items make a dozen, twelve dozen (144) a '
          'gross, twelve gross (1728) a great gross.\n\n'
          'This is remarkable: these familiar trade words are in truth already '
          'dozenal place values — a dozen is the "10," the gross the "100," the '
          'great gross the "1000" of the world of twelves.',
    ),
    ProseSection(
      'Dek, El, and Systematic Naming',
      'The two new digits are usually pronounced "dek" (ten) and "el" (eleven). '
          'For the place values, the short forms do, gro, mo are used (from '
          'dozen, gross, great gross).\n\n'
          'Alongside this there is a systematic naming, developed in the online '
          'community: fixed word roots for the digits (un, bi, tri … dec, lev) '
          'plus endings for the powers of twelve — "-qua" going up, "-cia" going '
          'down. A nice touch: "uncia" is exactly one twelfth — the same Latin '
          'word from which "inch" and "ounce" arose.',
    ),
  ], sources: [
    Source('Systematic Dozenal Nomenclature (brief version) — gorpub', 'https://gorpub.freeshell.org/dozenal/sdnbrief.html', 'R2', 'A1'),
    Source('Duodecimal — Wikipedia', 'https://en.wikipedia.org/wiki/Duodecimal', 'R2', 'A1'),
    Source('Base 12 — Numberphile (James Grime)', 'https://www.numberphile.com/videos/base-12', 'R3', 'A1'),
    Source('Engines of Our Ingenuity No. 3172: "Dozenels"', 'https://engines.egr.uh.edu/episode/3172', 'R3', 'A1'),
  ]),
  ProseChapter('TGM, Societies, and Tools Today', [
    ProseSection(
      'TGM — a Dozenal System of Measures',
      'Tom Pendlebury of the British society designed a complete dozenal system '
          'of measures: TGM, named after its three base units Tim, Grafut, and '
          'Maz.\n\n'
          'Unlike the metric system, it does not begin with length but with '
          'time, and derives everything from the Earth\'s gravity. The "Grafut" '
          '(gravity foot) comes out just under a foot. From it follow, '
          'coherently, units for area, volume, speed, and force — a '
          'self-contained counterpart to the metric system, entirely in '
          'twelves.',
    ),
    ProseSection(
      'The Societies Today',
      'Both societies live on, but they are small and run by volunteers; there '
          'are no reliable membership figures. The American one continues to '
          'publish the Duodecimal Bulletin and provides learning and conversion '
          'tools; the British one mainly maintains the TGM material.\n\n'
          'The liveliest place is the online forum "Dozensonline." It was there '
          'that the systematic naming of numbers arose, along with the never '
          'quite settled debate over the right digits. The community is small, '
          'but active.',
    ),
    ProseSection(
      'Calculators, Apps — and This App',
      'A surprisingly busy tool scene has grown up around the twelve: dozenal '
          'calculators, measure converters, even a dozenal clock and a calendar, '
          'much of it open source and built by members of the societies.\n\n'
          'This app fits right in there — a calculator that computes natively in '
          'base twelve, with its own glyphs, exact fractions, and a units '
          'section. It is a small contribution to a long, lovingly tended niche '
          'tradition.',
    ),
    ProseSection(
      'Why the World Stays Decimal Anyway',
      'That the twelve has not caught on has little to do with the mathematics — '
          'that is on its side. It has to do with habit: the base-ten system is '
          'embedded in language, schooling, law, and technology, and a '
          'changeover would be enormously costly. Even the far smaller switch of '
          'the United States to the metric system failed because of it.\n\n'
          'Accordingly, most of those involved today see the matter more as an '
          'appealing thought experiment than as a serious plan for changeover. '
          'It shows that the choice of number base is not a given — and it '
          'sharpens our eye for the numbers we deal with every day.',
    ),
  ], sources: [
    Source('TGM: A Coherent Dozenal Metrology (Pendlebury/Goodman) — DSA (PDF)', 'http://www.dozenal.org/drupal/sites_bck/default/files/tgm_0.pdf', 'R1', 'A1'),
    Source('TGM — fergusoncreations.co.uk', 'http://www.fergusoncreations.co.uk/home/shaun/metrology/tgm.htm', 'R2', 'A1'),
    Source('The Dozenal Society of America — Wikipedia', 'https://en.wikipedia.org/wiki/The_Dozenal_Society_of_America', 'R2', 'A1'),
    Source('Dozenal Society of America', 'https://dozenal.org/', 'R2', 'A1'),
    Source('Dozenal Suite (Apps) — dozenal.ca', 'https://dozenal.ca/suite/', 'R2', 'A1'),
    Source('Dozenal RPN Calculator — Eddie\'s Math and Calculator Blog', 'http://edspi31415.blogspot.com/2026/02/dozenal-rpn-calculator-app-for-android.html', 'R3', 'A1'),
  ]),
];
