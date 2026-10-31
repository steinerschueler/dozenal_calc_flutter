import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('web build loads CanvasKit and fallback fonts from its own site', () {
    final bootstrap = File('web/flutter_bootstrap.js').readAsStringSync();

    expect(bootstrap, contains('canvasKitBaseUrl: "canvaskit/"'));
    expect(bootstrap, contains('fontFallbackBaseUrl: "fonts/"'));
    expect(bootstrap, isNot(contains('gstatic')));

    final indexPage = File('web/index.html').readAsStringSync();
    expect(indexPage, contains('src="flutter_bootstrap.js"'));
  });
}
