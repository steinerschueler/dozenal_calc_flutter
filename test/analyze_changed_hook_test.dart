// Runs tool/analyze_changed.py against a stand-in Dart launcher. The stand-in is
// dart.bat on Windows, the launcher type that a bare "dart" cannot start from
// Python, so this guards the commit hook on every development machine.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _infoFinding =
    'INFO|LINT|SOME_LINT|lib/file_nobody_changed.dart|1|1|1|Old finding.';
const _errorFinding =
    'ERROR|SYNTACTIC_ERROR|BROKEN|lib/file_nobody_changed.dart|2|1|1|Broken.';
// The first character has a UTF-8 byte that cp1252 cannot read, the second one
// does not exist in cp1252 at all.
const _nonAsciiFinding =
    'ERROR|SYNTACTIC_ERROR|BROKEN|lib/file_nobody_changed.dart|2|1|1|Name Á 日.';

final _pathSeparator = Platform.isWindows ? ';' : ':';

/// Writes a launcher named dart into a new directory that prints [analyzerOutput].
Directory _writeFakeDart(String analyzerOutput) {
  final directory = Directory.systemTemp.createTempSync('fake_dart_');
  addTearDown(() => directory.deleteSync(recursive: true));
  File(
    '${directory.path}/analyzer_output.txt',
  ).writeAsStringSync('$analyzerOutput\n');
  if (Platform.isWindows) {
    File(
      '${directory.path}/dart.bat',
    ).writeAsStringSync('@type "%~dp0analyzer_output.txt"\r\n');
  } else {
    final launcher = File('${directory.path}/dart')
      ..writeAsStringSync(
        '#!/bin/sh\ncat "\$(dirname "\$0")/analyzer_output.txt"\n',
      );
    Process.runSync('chmod', ['+x', launcher.path]);
  }
  return directory;
}

/// Runs the hook script with exactly [searchPath] as its program search path.
///
/// The variable that turns off the Windows current-directory lookup is removed,
/// because a normal terminal does not set it.
ProcessResult _runHook(String searchPath, {String? workingDirectory}) {
  // The interpreter is resolved first because searchPath may not contain it.
  final python = Process.runSync('python3', [
    '-I',
    '-c',
    'import sys; print(sys.executable)',
  ]).stdout.toString().trim();
  final environment = {
    for (final entry in Platform.environment.entries)
      if (!const {
        'PATH',
        'NODEFAULTCURRENTDIRECTORYINEXEPATH',
      }.contains(entry.key.toUpperCase()))
        entry.key: entry.value,
    'PATH': searchPath,
  };
  return Process.runSync(
    python,
    ['-I', File('tool/analyze_changed.py').absolute.path, '--base', 'HEAD'],
    workingDirectory: workingDirectory,
    environment: environment,
    includeParentEnvironment: false,
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );
}

String _withFakeDartFirst(Directory fakeDart) =>
    '${fakeDart.path}$_pathSeparator${Platform.environment['PATH']}';

void main() {
  test('passes when the analyzer reports only old findings elsewhere', () {
    final result = _runHook(_withFakeDartFirst(_writeFakeDart(_infoFinding)));

    expect(result.stderr, isNot(contains('Traceback')));
    expect(result.stdout, contains('0 blockierende Befunde'));
    expect(result.exitCode, 0);
  });

  test('fails when the analyzer reports an error', () {
    final result = _runHook(_withFakeDartFirst(_writeFakeDart(_errorFinding)));

    expect(result.stdout, contains('BROKEN'));
    expect(result.stdout, contains('1 blockierende Befunde'));
    expect(result.exitCode, 1);
  });

  test('shows analyzer messages with non-ASCII characters', () {
    final result = _runHook(
      _withFakeDartFirst(_writeFakeDart(_nonAsciiFinding)),
    );

    expect(result.stderr, isNot(contains('Traceback')));
    expect(result.stdout, contains('Name Á 日.'));
    expect(result.exitCode, 1);
  });

  test('ignores a dart launcher that only lies in the current directory', () {
    final currentDirectory = _writeFakeDart(_infoFinding);
    final directoryWithoutDart = Directory.systemTemp.createTempSync(
      'no_dart_',
    );
    addTearDown(() => directoryWithoutDart.deleteSync(recursive: true));

    final result = _runHook(
      directoryWithoutDart.path,
      workingDirectory: currentDirectory.path,
    );

    expect(result.stderr, contains('dart nicht gefunden'));
    expect(result.exitCode, 1);
  });

  test('names the missing Dart SDK instead of crashing', () {
    final directoryWithoutDart = Directory.systemTemp.createTempSync(
      'no_dart_',
    );
    addTearDown(() => directoryWithoutDart.deleteSync(recursive: true));

    final result = _runHook(directoryWithoutDart.path);

    expect(result.stderr, isNot(contains('Traceback')));
    expect(result.stderr, contains('dart'));
    expect(result.exitCode, 1);
  });
}
