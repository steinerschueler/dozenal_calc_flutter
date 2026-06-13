// The "Bedienung des Rechners" manual: a collection of chapters (like the
// Theory tab) that double as a math primer. Self-contained — replaces the
// single legacy "Bedienung" entry (old info_content.dart chapter 0) and lets
// the teaching chapters (exponents/roots/logs, trigonometry, memory,
// hyperbolics, Set 9 & 10) carry custom-painted illustrations inline.
//
// Per-language content lives in lib/manual/<lang>/manual_<lang>.dart as part
// files, exactly like the theory blocks: German is the reference, other
// languages are migrated/translated incrementally and fall back to German.
//
// Chapters are plain widget lists (not the prose data model) so an explanation
// can interleave prose with any number of custom illustrations — the shared
// helpers _H / _P / _Pre and the illustration widgets below build them.

import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../glyph_painter.dart';
import 'manual_illustrations.dart';

part 'de/manual_de.dart';
part 'en/manual_en.dart';
part 'fr/manual_fr.dart';
part 'es/manual_es.dart';
part 'it/manual_it.dart';
part 'fa/manual_fa.dart';
part 'ru/manual_ru.dart';
part 'ga/manual_ga.dart';
part 'hi/manual_hi.dart';
part 'zh/manual_zh.dart';
part 'zh_Hant/manual_zh_Hant.dart';
part 'cy/manual_cy.dart';
part 'ja/manual_ja.dart';
part 'ar/manual_ar.dart';

/// One manual chapter: a [title] and its body widgets.
class ManualChapter {
  final String title;
  final List<Widget> body;
  const ManualChapter(this.title, this.body);
}

/// The manual chapters in [langTag] (BCP-47). Per-chapter German fallback: a
/// language shows its own chapters as far as it has authored them (by
/// position), and the remaining chapters fall back to German. So every
/// language currently shows its migrated Grundbedienung plus the German
/// teaching chapters until those are translated. Script-aware (zh-Hant ≠ zh).
List<ManualChapter> manualChapters(String langTag) {
  final de = _manualChaptersDe();
  final own = _ownManualChapters(langTag);
  if (own.length >= de.length) return own;
  return [...own, ...de.sublist(own.length)];
}

List<ManualChapter> _ownManualChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _manualChaptersEn();
  if (c.startsWith('fr')) return _manualChaptersFr();
  if (c.startsWith('es')) return _manualChaptersEs();
  if (c.startsWith('it')) return _manualChaptersIt();
  if (c.startsWith('fa')) return _manualChaptersFa();
  if (c.startsWith('ru')) return _manualChaptersRu();
  if (c.startsWith('ga')) return _manualChaptersGa();
  if (c.startsWith('hi')) return _manualChaptersHi();
  if (c.startsWith('cy')) return _manualChaptersCy();
  if (c.startsWith('ja')) return _manualChaptersJa();
  if (c.startsWith('ar')) return _manualChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) return _manualChaptersZhHant();
  if (c.startsWith('zh')) return _manualChaptersZh();
  return _manualChaptersDe();
}

/// The unit-converter manual chapters in [langTag] — the second "Bedienung"
/// section ("Bedienung des Einheitenrechners"). Same per-chapter German
/// fallback as [manualChapters]: a language shows its own chapters as far
/// as it has authored them (by position), the rest falls back to German.
List<ManualChapter> converterManualChapters(String langTag) {
  final de = _converterManualChaptersDe();
  final own = _ownConverterManualChapters(langTag);
  if (own.length >= de.length) return own;
  return [...own, ...de.sublist(own.length)];
}

List<ManualChapter> _ownConverterManualChapters(String langTag) {
  final c = langTag.toLowerCase();
  if (c.startsWith('en')) return _converterManualChaptersEn();
  if (c.startsWith('fr')) return _converterManualChaptersFr();
  if (c.startsWith('es')) return _converterManualChaptersEs();
  if (c.startsWith('it')) return _converterManualChaptersIt();
  if (c.startsWith('fa')) return _converterManualChaptersFa();
  if (c.startsWith('ru')) return _converterManualChaptersRu();
  if (c.startsWith('ga')) return _converterManualChaptersGa();
  if (c.startsWith('hi')) return _converterManualChaptersHi();
  if (c.startsWith('cy')) return _converterManualChaptersCy();
  if (c.startsWith('ja')) return _converterManualChaptersJa();
  if (c.startsWith('ar')) return _converterManualChaptersAr();
  if (c.startsWith('zh') && c.contains('hant')) {
    return _converterManualChaptersZhHant();
  }
  if (c.startsWith('zh')) return _converterManualChaptersZh();
  return _converterManualChaptersDe();
}

// ---------------------------------------------------------------------------
// Shared content helpers (heading / paragraph / monospace block), styled to
// match the theory pages. Copied from the retired info_content.dart so the
// migrated chapter bodies keep their exact look.
// ---------------------------------------------------------------------------

class _H extends StatelessWidget {
  final String text;
  const _H(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 14, bottom: 4),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColors.of(context).textPrimary,
      ),
    ),
  );
}

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 1.45,
        color: AppColors.of(context).textSecondary,
      ),
    ),
  );
}

class _Pre extends StatelessWidget {
  final String text;
  const _Pre(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    // Force LTR for monospace tables in every locale — column alignment relies
    // on left-to-right flow even in RTL locales. FittedBox scales the block
    // uniformly so the columns stay aligned and never re-flow.
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          softWrap: false,
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 14,
            height: 1.5,
            color: AppColors.of(context).textSecondary,
          ),
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Digit legend: the twelve dozenal glyphs with their values. Belongs in the
// basic-operation chapter (moved here from the retired info_content.dart).
// ---------------------------------------------------------------------------

class _DigitLegend extends StatelessWidget {
  const _DigitLegend();

  @override
  Widget build(BuildContext context) {
    final t = AppColors.of(context);
    Widget row(int v) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CustomPaint(
              painter: DozenalGlyphPainter(
                digit: DozenalDigit.values[v],
                color: t.textPrimary,
                strokeWidth: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '= $v',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 13,
              color: t.textTertiary,
            ),
          ),
        ],
      ),
    );
    Widget col(Iterable<int> values) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values.map(row).toList(),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          col([0, 1, 2, 3, 4, 5]),
          const SizedBox(width: 24),
          col([6, 7, 8, 9, 10, 11]),
        ],
      ),
    );
  }
}
