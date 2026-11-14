// Guards tool/coverage_gate.dart, the minimum test coverage of code without
// UI (CC-22). A gate that counts the wrong files would pass silently.
import 'package:flutter_test/flutter_test.dart';

import '../tool/coverage_gate.dart';

const _lcov = r'''
SF:lib/logic/rational.dart
DA:1,1
LF:10
LH:9
end_of_record
SF:lib\state.dart
LF:4
LH:1
end_of_record
''';

void main() {
  group('parseLcov', () {
    test('reads found and hit lines per file', () {
      final counts = parseLcov(_lcov);
      expect(counts.keys, ['lib/logic/rational.dart', 'lib/state.dart']);
      expect(counts['lib/logic/rational.dart']!.found, 10);
      expect(counts['lib/logic/rational.dart']!.hit, 9);
    });

    test('turns Windows backslashes into forward slashes', () {
      expect(parseLcov(_lcov).containsKey('lib/state.dart'), isTrue);
    });
  });

  group('importsUi', () {
    test('counts Flutter UI libraries and dart:ui as UI', () {
      expect(importsUi("import 'package:flutter/material.dart';"), isTrue);
      expect(importsUi("import 'package:flutter/widgets.dart';"), isTrue);
      expect(importsUi('import "dart:ui" as ui;'), isTrue);
      expect(importsUi("export 'package:flutter/painting.dart';"), isTrue);
    });

    test('does not count foundation or plain Dart as UI', () {
      expect(importsUi("import 'package:flutter/foundation.dart';"), isFalse);
      expect(importsUi("import 'dart:math' as math;"), isFalse);
      expect(importsUi("// import 'package:flutter/material.dart';"), isFalse);
    });
  });

  group('measure', () {
    final counts = {
      'lib/logic/rational.dart': const LineCount(found: 10, hit: 9),
      'lib/display.dart': const LineCount(found: 100, hit: 0),
      'lib/l10n/app_localizations_de.dart': const LineCount(found: 50, hit: 0),
      'test/helpers.dart': const LineCount(found: 20, hit: 0),
      'lib/removed.dart': const LineCount(found: 30, hit: 0),
    };
    final sources = {
      'lib/logic/rational.dart': "import 'dart:math';",
      'lib/display.dart': "import 'package:flutter/material.dart';",
      'lib/l10n/app_localizations_de.dart': '',
      'test/helpers.dart': '',
    };

    test('counts only existing files under lib without UI', () {
      final result = measure(counts, (path) => sources[path]);
      expect(result.fileCount, 1);
      expect(result.found, 10);
      expect(result.hit, 9);
      expect(result.percent, 90);
    });
  });

  group('passes', () {
    test('rejects coverage below the minimum', () {
      const result = CoverageResult(found: 1000, hit: 699, fileCount: 3);
      expect(result.passes, isFalse);
    });

    test('accepts coverage at the minimum', () {
      const result = CoverageResult(found: 1000, hit: 700, fileCount: 3);
      expect(result.passes, isTrue);
    });

    test('rejects a run that found no file to count', () {
      const result = CoverageResult(found: 0, hit: 0, fileCount: 0);
      expect(result.passes, isFalse);
    });
  });
}
