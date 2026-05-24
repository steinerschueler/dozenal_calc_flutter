import 'package:flutter/material.dart';

import 'flag_painter.dart';

/// Metadata for one language the in-app picker can offer: which [Locale]
/// it represents, a self-referential [label] (always rendered in the
/// language it represents — "Deutsch", "English", "Français" — never in
/// the currently active locale), and how to paint its flag.
///
/// The flag is rendered at the canonical aspect ratio stored in
/// [canonicalFlagSize]; the picker scales by height and lets the width
/// follow.
@immutable
class LanguageOption {
  final Locale locale;
  final String label;
  final CustomPainter flagPainter;
  final Size canonicalFlagSize;

  const LanguageOption({
    required this.locale,
    required this.label,
    required this.flagPainter,
    required this.canonicalFlagSize,
  });
}

/// Single source of truth for the language picker. To add a new language:
///   1. Create `lib/l10n/app_<code>.arb` and let `flutter gen-l10n` run.
///   2. Add a flag painter to [flag_painter.dart].
///   3. Add a chapter-content function to a new `info_content_<code>.dart`
///      `part of`-file and register it in `info_content.dart`'s map.
///   4. Append one [LanguageOption] entry here.
const List<LanguageOption> kSupportedLanguages = [
  LanguageOption(
    locale: Locale('de'),
    label: 'Deutsch',
    flagPainter: GermanFlagPainter(),
    canonicalFlagSize: Size(66, 40),
  ),
  LanguageOption(
    locale: Locale('en'),
    label: 'English',
    flagPainter: UnionJackPainter(),
    canonicalFlagSize: Size(80, 40),
  ),
  LanguageOption(
    locale: Locale('fr'),
    label: 'Français',
    flagPainter: FrenchFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('es'),
    label: 'Español',
    flagPainter: SpanishFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('it'),
    label: 'Italiano',
    flagPainter: ItalianFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('fa'),
    label: 'فارسی',
    flagPainter: IranianFlagPainter(),
    canonicalFlagSize: Size(70, 40),
  ),
  LanguageOption(
    locale: Locale('ru'),
    label: 'Русский',
    flagPainter: RussianFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('ga'),
    label: 'Gaeilge',
    flagPainter: IrishFlagPainter(),
    canonicalFlagSize: Size(80, 40),
  ),
  LanguageOption(
    locale: Locale('hi'),
    label: 'हिन्दी',
    flagPainter: IndianFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('zh'),
    label: '简体中文',
    flagPainter: ChineseFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    label: '繁體中文',
    flagPainter: HongKongFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
  LanguageOption(
    locale: Locale('cy'),
    label: 'Cymraeg',
    flagPainter: WelshFlagPainter(),
    canonicalFlagSize: Size(80, 48),
  ),
  LanguageOption(
    locale: Locale('ja'),
    label: '日本語',
    flagPainter: JapaneseFlagPainter(),
    canonicalFlagSize: Size(60, 40),
  ),
];
