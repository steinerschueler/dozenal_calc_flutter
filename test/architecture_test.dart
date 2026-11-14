// Architecture test (ARC-05): lib/domain/ holds rules, calculations and ports
// without Flutter and IO imports, and imports nothing from the outer layers
// (ARC-02, ARC-04). The folder does not exist yet; the layers arrive with
// larger changes (ARC-30). The check runs from the first file on, and the
// checker itself is tested so that it cannot pass by accident.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _package = 'dozenal_calc_flutter';
const _domainDir = 'lib/domain';

/// Packages without IO or UI that the domain may use.
const _allowedPackages = {'collection', 'meta'};

const _forbiddenDartLibraries = {'dart:io', 'dart:ui', 'dart:html', 'dart:ffi'};

final RegExp _directive = RegExp(
  r'''^\s*(?:import|export|part)\s+['"]([^'"]+)['"]''',
  multiLine: true,
);

/// Returns one message per forbidden directive in [sources], which maps a
/// path under lib/domain/ (with forward slashes) to its content.
List<String> domainImportViolations(Map<String, String> sources) {
  final violations = <String>[];
  for (final MapEntry(key: path, value: source) in sources.entries) {
    for (final match in _directive.allMatches(source)) {
      final uri = match.group(1)!;
      final reason = _violation(path, uri);
      if (reason != null) violations.add('$path: $uri ($reason)');
    }
  }
  return violations;
}

String? _violation(String path, String uri) {
  if (uri.startsWith('dart:')) {
    return _forbiddenDartLibraries.contains(uri) ? 'IO or UI' : null;
  }
  if (uri.startsWith('package:')) {
    final name = uri.substring('package:'.length).split('/').first;
    if (name == _package) {
      return uri.startsWith('package:$_package/domain/') ? null : 'outer layer';
    }
    return _allowedPackages.contains(name) ? null : 'package not allowed';
  }
  final target = Uri.parse('file:///repo/$path').resolve(uri).path;
  return target.startsWith('/repo/$_domainDir/') ? null : 'outer layer';
}

Map<String, String> _readDomainSources() {
  final dir = Directory(_domainDir);
  if (!dir.existsSync()) return const {};
  return {
    for (final file in dir.listSync(recursive: true).whereType<File>())
      if (file.path.endsWith('.dart'))
        file.path.replaceAll(r'\', '/'): file.readAsStringSync(),
  };
}

void main() {
  test('lib/domain imports neither Flutter nor IO nor outer layers', () {
    expect(domainImportViolations(_readDomainSources()), isEmpty);
  });

  group('domainImportViolations', () {
    test('rejects Flutter, IO and UI libraries', () {
      final violations = domainImportViolations({
        'lib/domain/a.dart': '''
import 'package:flutter/foundation.dart';
import 'dart:io';
import "dart:ui";
''',
      });
      expect(violations, hasLength(3));
    });

    test('rejects imports from outer layers of the app', () {
      final violations = domainImportViolations({
        'lib/domain/a.dart': '''
import 'package:dozenal_calc_flutter/state.dart';
import '../ui/display.dart';
export 'package:shared_preferences/shared_preferences.dart';
''',
      });
      expect(violations, hasLength(3));
    });

    test('accepts plain Dart, allowed packages and the domain itself', () {
      final violations = domainImportViolations({
        'lib/domain/rates/a.dart': '''
import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:dozenal_calc_flutter/domain/b.dart';
import '../c.dart';
import 'd.dart';
''',
      });
      expect(violations, isEmpty);
    });
  });
}
