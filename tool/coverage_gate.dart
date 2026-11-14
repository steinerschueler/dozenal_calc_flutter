// Fails the pre-push run and CI when the test coverage of code without UI is
// below the minimum of CC-22.
//
// Reads coverage/lcov.info, written by `flutter test --coverage`. A file under
// lib/ counts as code without UI when it imports neither `dart:ui` nor a
// Flutter library other than `package:flutter/foundation.dart`. Generated
// localizations are skipped. Files that no test loads do not appear in the
// lcov data and therefore do not count.
//
// Usage: dart run tool/coverage_gate.dart
import 'dart:io';

/// Minimum line coverage of code without UI, in percent (CC-22).
const double minimumCoveragePercent = 70;

const String _lcovPath = 'coverage/lcov.info';
const String _generatedLocalizationsPrefix = 'lib/l10n/app_localizations';

final RegExp _uiImport = RegExp(
  r'''^\s*(import|export)\s+['"](dart:ui|package:flutter/(?!foundation\.dart))''',
  multiLine: true,
);

/// Found and hit lines of one source file in the lcov data.
class LineCount {
  const LineCount({required this.found, required this.hit});

  final int found;
  final int hit;
}

/// Coverage summed over the files that count.
class CoverageResult {
  const CoverageResult({
    required this.found,
    required this.hit,
    required this.fileCount,
  });

  final int found;
  final int hit;
  final int fileCount;

  double get percent => found == 0 ? 0 : hit * 100 / found;

  bool get passes => fileCount > 0 && percent >= minimumCoveragePercent;
}

/// Reads `SF`, `LF` and `LH` records; paths use forward slashes.
Map<String, LineCount> parseLcov(String lcov) {
  final counts = <String, LineCount>{};
  String? path;
  var found = 0;
  var hit = 0;
  for (final line in lcov.split('\n').map((l) => l.trim())) {
    if (line.startsWith('SF:')) {
      path = line.substring(3).replaceAll(r'\', '/');
      found = 0;
      hit = 0;
    } else if (line.startsWith('LF:')) {
      found = int.parse(line.substring(3));
    } else if (line.startsWith('LH:')) {
      hit = int.parse(line.substring(3));
    } else if (line == 'end_of_record' && path != null) {
      counts[path] = LineCount(found: found, hit: hit);
      path = null;
    }
  }
  return counts;
}

/// Whether [source] imports a UI library (see the file comment).
bool importsUi(String source) => _uiImport.hasMatch(source);

/// Sums the coverage of the files under lib/ without UI. [readSource] returns
/// the content of a file, or null when the file no longer exists.
CoverageResult measure(
  Map<String, LineCount> counts,
  String? Function(String path) readSource,
) {
  var found = 0;
  var hit = 0;
  var fileCount = 0;
  for (final MapEntry(key: path, value: count) in counts.entries) {
    if (!path.startsWith('lib/') ||
        path.startsWith(_generatedLocalizationsPrefix)) {
      continue;
    }
    final source = readSource(path);
    if (source == null || importsUi(source)) continue;
    found += count.found;
    hit += count.hit;
    fileCount++;
  }
  return CoverageResult(found: found, hit: hit, fileCount: fileCount);
}

String? _readIfExists(String path) {
  final file = File(path);
  return file.existsSync() ? file.readAsStringSync() : null;
}

void main() {
  final lcov = File(_lcovPath);
  if (!lcov.existsSync()) {
    stderr.writeln(
      '$_lcovPath fehlt. Zuerst `flutter test --coverage` ausführen.',
    );
    exitCode = 1;
    return;
  }
  final result = measure(parseLcov(lcov.readAsStringSync()), _readIfExists);
  final summary =
      'Testabdeckung ohne Oberfläche: ${result.percent.toStringAsFixed(1)} % '
      '(${result.hit} von ${result.found} Zeilen in ${result.fileCount} '
      'Dateien), Minimum ${minimumCoveragePercent.toStringAsFixed(0)} % '
      '(CC-22).';
  if (result.passes) {
    stdout.writeln(summary);
  } else {
    stderr.writeln(summary);
    exitCode = 1;
  }
}
