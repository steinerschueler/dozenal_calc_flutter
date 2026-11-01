// Privacy boundary (npf ARC-10, ARC-11): the app opens no connections itself.
// A hit here means a new network target, which needs npf.toml and the privacy
// policy to change in the same commit.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const _forbiddenInAppCode = [
  'dart:io',
  'package:http',
  'package:dio',
  'HttpClient',
  'WebSocket',
  'Image.network',
  'NetworkImage',
];

const _allowedRuntimePackages = {
  'flutter',
  'flutter_localizations',
  'flutter_markdown_plus',
  'shared_preferences',
  'url_launcher',
  'package_info_plus',
};

void main() {
  test('app code uses no networking API', () {
    final hits = <String>[];
    final sources = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    for (final file in sources) {
      final content = file.readAsStringSync();
      for (final term in _forbiddenInAppCode) {
        if (content.contains(term)) hits.add('${file.path}: $term');
      }
    }
    expect(hits, isEmpty);
  });

  test('android release manifest requests no internet permission', () {
    final manifest = File(
      'android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();
    expect(manifest, isNot(contains('android.permission.INTERNET')));
  });

  test('macOS release entitlements allow no network', () {
    final entitlements = File(
      'macos/Runner/Release.entitlements',
    ).readAsStringSync();
    expect(entitlements, isNot(contains('com.apple.security.network')));
  });

  test('runtime dependencies stay on the reviewed list', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final start = pubspec.indexOf('\ndependencies:\n');
    final end = pubspec.indexOf('\ndev_dependencies:');
    final names = RegExp('^  ([a-z_0-9]+):', multiLine: true)
        .allMatches(pubspec.substring(start, end))
        .map((match) => match.group(1)!)
        .toSet();
    expect(names, _allowedRuntimePackages);
  });

  test('npf.toml declares no network target', () {
    expect(File('npf.toml').readAsStringSync(), contains('netz = []'));
  });
}
