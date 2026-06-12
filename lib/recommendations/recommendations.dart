// Navigation model for the "Empfehlungen" section: one chapter per platform
// (Physisch, Android Play Store, Android F-Droid, iOS, macOS, Linux, Windows),
// each a short intro + a list of recommended calculators with pros/cons + a
// closing verdict. Distilled from docs/taschenrechner-analyse.md.
//
// Editorial rules (agreed with the author):
//   - Power-user framing (woodworking trig/DMS, base-12 benchmark, open-source
//     learning value, RPN, exact/symbolic arithmetic).
//   - Evergreen: no hard prices, version numbers, stock status or dates — only
//     qualitative statements ("Premium-Preis", "nur per Import", "Entwicklung
//     ruht"). A shipped app is not continuously updated.
//   - Intellectual honesty: only well-established facts stated as fact.
//
// One file per language, attached via `part` (like lib/theory/*). German is the
// template / source of truth; all 14 languages are translated.

part 'ar/recommendations_ar.dart';
part 'cy/recommendations_cy.dart';
part 'de/recommendations_de.dart';
part 'en/recommendations_en.dart';
part 'es/recommendations_es.dart';
part 'fa/recommendations_fa.dart';
part 'fr/recommendations_fr.dart';
part 'ga/recommendations_ga.dart';
part 'hi/recommendations_hi.dart';
part 'it/recommendations_it.dart';
part 'ja/recommendations_ja.dart';
part 'ru/recommendations_ru.dart';
part 'zh/recommendations_zh.dart';
part 'zh_Hant/recommendations_zh_Hant.dart';

/// One recommended calculator: its [name], a short [tag] (license · genre),
/// a one/two-sentence [blurb], [pros]/[cons] bullet lists, and a primary [url].
class RecCalc {
  final String name;
  final String tag;
  final String blurb;
  final List<String> pros;
  final List<String> cons;
  final String url;
  const RecCalc(
    this.name, {
    required this.tag,
    required this.blurb,
    required this.pros,
    required this.cons,
    required this.url,
  });
}

/// One platform chapter: a [title], a short [intro], its [calcs], and a closing
/// [verdict] line.
class RecChapter {
  final String title;
  final String intro;
  final List<RecCalc> calcs;
  final String verdict;
  const RecChapter(
    this.title, {
    required this.intro,
    required this.calcs,
    required this.verdict,
  });
}

/// The recommendation chapters in [langTag] (BCP-47). Script-aware: zh-Hant
/// wins over plain zh. Falls back to German for any unrecognized locale (should
/// not happen — resolveLocale only passes supported codes through).
List<RecChapter> recommendationChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _recChaptersEn();
  if (c.startsWith('fr')) return _recChaptersFr();
  if (c.startsWith('es')) return _recChaptersEs();
  if (c.startsWith('it')) return _recChaptersIt();
  if (c.startsWith('ru')) return _recChaptersRu();
  if (c.startsWith('ga')) return _recChaptersGa();
  if (c.startsWith('hi')) return _recChaptersHi();
  if (c.startsWith('cy')) return _recChaptersCy();
  if (c.startsWith('ja')) return _recChaptersJa();
  if (c.startsWith('fa')) return _recChaptersFa();
  if (c.startsWith('ar')) return _recChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _recChaptersZhHant();
  if (c.startsWith('zh')) return _recChaptersZh();
  return _recChaptersDe();
}
