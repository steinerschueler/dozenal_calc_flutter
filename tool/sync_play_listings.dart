// Extracts Play Store listing content from `store/play-store/listing.<tag>.md` and
// the most recent `build<N>-release-notes.txt` at the repo root, and writes
// the per-locale text files that Gradle Play Publisher consumes:
//
//   android/app/src/main/play/listings/<play-locale>/title.txt
//   android/app/src/main/play/listings/<play-locale>/short-description.txt
//   android/app/src/main/play/listings/<play-locale>/full-description.txt
//   android/app/src/main/play/release-notes/<play-locale>/default.txt
//
// The play/ tree is gitignored — store/play-store/listing.*.md and the build-notes
// file are the only sources of truth. Run before `./gradlew publishListing`
// or `./gradlew publishBundle`.
//
// Usage from the repo root:
//   dart run tool/sync_play_listings.dart

import 'dart:io';

// In-repo locale tag → Play Console locale code (directory name expected by
// Gradle Play Publisher). Persian is fa-AF (Google's only Farsi listing
// locale); Chinese Traditional is zh-TW (zh-HK shares the same content but
// must be uploaded separately if needed); Arabic is the bare "ar".
const Map<String, String> _localeMap = {
  'de': 'de-DE',
  'en': 'en-US',
  'fr': 'fr-FR',
  'es': 'es-ES',
  'it': 'it-IT',
  'fa': 'fa-AF',
  'ru': 'ru-RU',
  'hi': 'hi-IN',
  'zh': 'zh-CN',
  'zh-Hant': 'zh-TW',
  'ja': 'ja-JP',
  'ar': 'ar',
};

const String _listingDir = 'store/play-store';
const String _playListingsDir = 'android/app/src/main/play/listings';
const String _playReleaseNotesDir = 'android/app/src/main/play/release-notes';

// Framed marketing screenshots live under store/screenshots/play/<key>/ where
// <key> is the i18n.json/tool key (note: Simplified Chinese is "zh-Hans" here,
// unlike the bare "zh" used for listing text). Mapped to Play Console graphics
// locale dirs. Locales without a folder (fa/ga/cy) keep their Play screenshots.
const String _screenshotSrcDir = 'store/screenshots/play';
const Map<String, String> _screenshotLocaleMap = {
  'de': 'de-DE',
  'en': 'en-US',
  'fr': 'fr-FR',
  'es': 'es-ES',
  'it': 'it-IT',
  'ru': 'ru-RU',
  'hi': 'hi-IN',
  'ja': 'ja-JP',
  'zh-Hans': 'zh-CN',
  'zh-Hant': 'zh-TW',
  'ar': 'ar',
};

void main() {
  _syncListings();
  _syncReleaseNotes();
  _syncScreenshots();
}

void _syncListings() {
  var ok = 0;
  for (final entry in _localeMap.entries) {
    final inFile = File('$_listingDir/listing.${entry.key}.md');
    if (!inFile.existsSync()) {
      stderr.writeln('WARN: missing ${inFile.path}, skipping ${entry.key}');
      continue;
    }
    final content = inFile.readAsStringSync();
    final String title;
    final String short;
    final String long;
    try {
      title = _extractTitle(content);
      short = _extractCodeBlock(content, '## Kurzbeschreibung', '');
      long = _extractCodeBlock(content, '## Lange Beschreibung', 'html');
    } on FormatException catch (e) {
      stderr.writeln('ERROR parsing ${inFile.path}: ${e.message}');
      exitCode = 1;
      continue;
    }

    final outDir = Directory('$_playListingsDir/${entry.value}');
    outDir.createSync(recursive: true);
    File('${outDir.path}/title.txt').writeAsStringSync(title);
    File('${outDir.path}/short-description.txt').writeAsStringSync(short);
    File('${outDir.path}/full-description.txt').writeAsStringSync(long);
    stdout.writeln(
        'listing → ${entry.value.padRight(6)}  short=${short.length.toString().padLeft(3)}  long=${long.length}');
    ok++;
  }
  stdout.writeln('synced $ok/${_localeMap.length} listings');
}

void _syncReleaseNotes() {
  final files = Directory('.')
      .listSync()
      .whereType<File>()
      .where((f) {
        final name = f.uri.pathSegments.last;
        return name.startsWith('build') && name.endsWith('-release-notes.txt');
      })
      .toList()
    ..sort((a, b) {
      // Sort numerically by build number, not lexicographically — so build11
      // doesn't sort after build2.
      final aN = _buildNumber(a.path);
      final bN = _buildNumber(b.path);
      return bN.compareTo(aN);
    });
  if (files.isEmpty) {
    stderr.writeln('WARN: no build<N>-release-notes.txt found, skipping notes');
    return;
  }
  final notesFile = files.first;
  final content = notesFile.readAsStringSync();
  stdout.writeln('release notes source: ${notesFile.uri.pathSegments.last}');

  // Match `<locale>\n...\n</locale>` blocks. Locale tag is Play Console
  // format (e.g. de-DE, en-US, fa-AF). Body is preserved verbatim except
  // for trim().
  final blockRe = RegExp(r'<([a-zA-Z-]+)>\s*\n(.+?)\n\s*</\1>', dotAll: true);
  var n = 0;
  for (final match in blockRe.allMatches(content)) {
    final tag = match.group(1)!;
    final body = match.group(2)!.trim();
    final outDir = Directory('$_playReleaseNotesDir/$tag');
    outDir.createSync(recursive: true);
    File('${outDir.path}/default.txt').writeAsStringSync(body);
    stdout.writeln(
        'notes   → ${tag.padRight(6)}  len=${body.length}');
    n++;
  }
  if (n == 0) {
    stderr.writeln('WARN: no <locale>...</locale> blocks in ${notesFile.path}');
  }
  stdout.writeln('synced $n release-notes blocks');
}

void _syncScreenshots() {
  var n = 0;
  for (final entry in _screenshotLocaleMap.entries) {
    final srcDir = Directory('$_screenshotSrcDir/${entry.key}');
    if (!srcDir.existsSync()) {
      stderr.writeln('WARN: missing screenshots ${srcDir.path}, skipping ${entry.key}');
      continue;
    }
    final outDir =
        Directory('$_playListingsDir/${entry.value}/graphics/phone-screenshots');
    if (outDir.existsSync()) outDir.deleteSync(recursive: true);
    outDir.createSync(recursive: true);
    final pngs = srcDir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.png'))
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));
    for (final f in pngs) {
      f.copySync('${outDir.path}/${f.uri.pathSegments.last}');
    }
    stdout.writeln('shots   → ${entry.value.padRight(6)}  ${pngs.length} png');
    n++;
  }
  stdout.writeln('synced $n screenshot locales');
}

int _buildNumber(String path) {
  final m = RegExp(r'build(\d+)-release-notes\.txt$').firstMatch(path);
  return m == null ? -1 : int.parse(m.group(1)!);
}

String _extractTitle(String md) {
  final m = RegExp(r'## App-Name\s*\n\s*`([^`]+)`').firstMatch(md);
  if (m == null) throw const FormatException('App-Name not found');
  return m.group(1)!;
}

String _extractCodeBlock(String md, String heading, String lang) {
  final headIdx = md.indexOf(heading);
  if (headIdx < 0) throw FormatException('Heading not found: $heading');
  final after = md.substring(headIdx);
  final fence = lang.isEmpty ? '```' : '```$lang';
  // For plain ``` blocks we have to be careful not to match a later ```html
  // block — search line-anchored.
  final openRe = RegExp('^${RegExp.escape(fence)}\$', multiLine: true);
  final openMatch = openRe.firstMatch(after);
  if (openMatch == null) {
    throw FormatException('Opening fence ($fence) not found after $heading');
  }
  final bodyStart = openMatch.end + 1; // +1 for the newline after fence
  final closeRe = RegExp(r'^```$', multiLine: true);
  final closeMatch = closeRe.firstMatch(after.substring(bodyStart));
  if (closeMatch == null) {
    throw FormatException('Unterminated code block after $heading');
  }
  return after.substring(bodyStart, bodyStart + closeMatch.start).trimRight();
}
