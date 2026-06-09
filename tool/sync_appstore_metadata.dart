// Extracts App Store listing content from store/app-store/listing.<code>.md and
// the matching store/app-store/whats-new-<version>.md, and writes the per-locale
// text files that `fastlane deliver` consumes:
//
//   fastlane/metadata/<asc-locale>/name.txt
//   fastlane/metadata/<asc-locale>/subtitle.txt
//   fastlane/metadata/<asc-locale>/promotional_text.txt
//   fastlane/metadata/<asc-locale>/keywords.txt
//   fastlane/metadata/<asc-locale>/description.txt
//   fastlane/metadata/<asc-locale>/release_notes.txt
//
// The fastlane/metadata/ tree is gitignored — store/app-store/*.md are the only
// sources of truth (parallel to tool/sync_play_listings.dart for the Play Store).
// The same metadata pushes to BOTH iOS and macOS (deliver --platform ios|osx);
// the text is identical, only screenshots differ per platform.
//
// Usage from the repo root (version drives which whats-new file is read):
//   dart run tool/sync_appstore_metadata.dart            # defaults to pubspec version
//   dart run tool/sync_appstore_metadata.dart 1.3.0

import 'dart:io';

// In-repo listing tag → App Store Connect / deliver locale folder name.
// Region-suffixed where the App Store requires it (de-DE, en-US, fr-FR, es-ES,
// ar-SA); bare where ASC uses the language code alone (it, ru, hi, ja, zh-*).
// fa/ga/cy are not App Store listing languages (no listing.* file for them).
const Map<String, String> _localeMap = {
  'de': 'de-DE',
  'en': 'en-US',
  'fr': 'fr-FR',
  'es': 'es-ES',
  'it': 'it',
  'ru': 'ru',
  'hi': 'hi',
  'ja': 'ja',
  'zh-Hans': 'zh-Hans',
  'zh-Hant': 'zh-Hant',
  'ar': 'ar-SA',
};

const String _srcDir = 'store/app-store';
const String _outDir = 'fastlane/metadata';

void main(List<String> argv) {
  final version = argv.isNotEmpty ? argv.first : _pubspecVersion();
  stdout.writeln('App Store metadata sync — version $version');
  final notes = _parseWhatsNew(version); // code-token -> body
  var ok = 0;
  for (final e in _localeMap.entries) {
    final src = File('$_srcDir/listing.${e.key}.md');
    if (!src.existsSync()) {
      stderr.writeln('WARN: missing ${src.path}, skipping ${e.key}');
      continue;
    }
    final md = src.readAsStringSync();
    final String name, subtitle, promo, keywords, description;
    try {
      name = _inlineBacktick(md, '## App-Name');
      subtitle = _inlineBacktick(md, '## Untertitel');
      promo = _fenced(md, '## Werbetext');
      keywords = _fenced(md, '## Schlüsselwörter');
      description = _fenced(md, '## Beschreibung');
    } on FormatException catch (err) {
      stderr.writeln('ERROR parsing ${src.path}: ${err.message}');
      exitCode = 1;
      continue;
    }
    final note = notes[e.value] ?? notes[e.key] ?? notes[e.value.split('-').first];

    final dir = Directory('$_outDir/${e.value}')..createSync(recursive: true);
    File('${dir.path}/name.txt').writeAsStringSync(name);
    File('${dir.path}/subtitle.txt').writeAsStringSync(subtitle);
    File('${dir.path}/promotional_text.txt').writeAsStringSync(promo);
    File('${dir.path}/keywords.txt').writeAsStringSync(keywords);
    File('${dir.path}/description.txt').writeAsStringSync(description);
    if (note != null) {
      File('${dir.path}/release_notes.txt').writeAsStringSync(note);
    } else {
      stderr.writeln('WARN: no release notes for ${e.value}');
    }
    stdout.writeln('  ${e.value.padRight(8)}  '
        'kw=${keywords.length.toString().padLeft(3)}  '
        'desc=${description.length.toString().padLeft(4)}  '
        'notes=${note?.length ?? 0}');
    ok++;
  }
  stdout.writeln('synced $ok/${_localeMap.length} locales → $_outDir');
}

String _pubspecVersion() {
  final m = RegExp(r'^version:\s*([0-9]+\.[0-9]+\.[0-9]+)', multiLine: true)
      .firstMatch(File('pubspec.yaml').readAsStringSync());
  if (m == null) throw const FormatException('version not found in pubspec.yaml');
  return m.group(1)!;
}

// Parses store/app-store/whats-new-<version>.md into a map keyed by every code
// token in each `## <Lang> — code1 / code2` header (so both "en-US" and "en-GB"
// resolve to the same body).
Map<String, String> _parseWhatsNew(String version) {
  final f = File('$_srcDir/whats-new-$version.md');
  if (!f.existsSync()) {
    stderr.writeln('WARN: ${f.path} not found — release notes will be empty');
    return {};
  }
  final md = f.readAsStringSync();
  final out = <String, String>{};
  // `## Lang — codes` followed by a fenced ``` block.
  final re = RegExp(
      r'^##[^\n]*?—\s*([^\n]+?)\s*\n+```\n(.*?)\n```',
      multiLine: true, dotAll: true);
  for (final m in re.allMatches(md)) {
    final codes = m.group(1)!.split('/').map((s) => s.trim());
    final body = m.group(2)!.trimRight();
    for (final c in codes) {
      out[c] = body;
    }
  }
  return out;
}

String _inlineBacktick(String md, String heading) {
  final idx = md.indexOf(heading);
  if (idx < 0) throw FormatException('Heading not found: $heading');
  final m = RegExp(r'`([^`]+)`').firstMatch(md.substring(idx));
  if (m == null) throw FormatException('No `value` after $heading');
  return m.group(1)!.trim();
}

String _fenced(String md, String heading) {
  final idx = md.indexOf(heading);
  if (idx < 0) throw FormatException('Heading not found: $heading');
  final after = md.substring(idx);
  final open = RegExp(r'^```$', multiLine: true).firstMatch(after);
  if (open == null) throw FormatException('Opening fence not found after $heading');
  final bodyStart = open.end + 1;
  final close = RegExp(r'^```$', multiLine: true).firstMatch(after.substring(bodyStart));
  if (close == null) throw FormatException('Unterminated fence after $heading');
  return after.substring(bodyStart, bodyStart + close.start).trimRight();
}
