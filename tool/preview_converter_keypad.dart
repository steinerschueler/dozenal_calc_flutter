// Throwaway preview / interaction smoke-render for the converter (Step 7
// review). Pumps the REAL ConverterPage and drives it with simulated taps,
// then writes PNGs to tool/preview/ — so the full path (tap → state →
// display) is exercised, not just a static state render.
//
//   flutter test tool/preview_converter_keypad.dart

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dozenal_calc_flutter/conversions_page.dart';
import 'package:dozenal_calc_flutter/converter_display.dart';
import 'package:dozenal_calc_flutter/converter_page.dart';
import 'package:dozenal_calc_flutter/l10n/app_localizations.dart';

Future<void> _loadFont() async {
  final bytes = await File('tool/fonts/LiberationSans-Bold.ttf').readAsBytes();
  // Register under the theme family AND 'monospace' so the display's
  // monospace TextSpans render with a real font instead of Ahem boxes.
  for (final family in ['PreviewFont', 'monospace']) {
    final loader = FontLoader(family)
      ..addFont(Future.value(ByteData.sublistView(bytes)));
    await loader.load();
  }
}

Widget _app() => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'PreviewFont'),
      locale: const Locale('de'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ConverterPage(),
    );

Future<void> _shoot(GlobalKey key, String name) async {
  final boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 2.0);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  final dir = Directory('tool/preview')..createSync(recursive: true);
  File('${dir.path}/converter_$name.png')
      .writeAsBytesSync(bytes!.buffer.asUint8List());
}

void main() {
  setUpAll(_loadFont);

  Future<({GlobalKey key, SemanticsHandle handle, Future<void> Function(Finder) tap})>
      boot(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 760);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final handle = tester.ensureSemantics();
    final key = GlobalKey();
    await tester.pumpWidget(RepaintBoundary(key: key, child: _app()));
    await tester.pump(const Duration(milliseconds: 50));
    Future<void> tap(Finder f) async {
      await tester.tap(f);
      await tester.pump(const Duration(milliseconds: 180));
    }
    return (key: key, handle: handle, tap: tap);
  }

  testWidgets('compound 5 ft 3 in → breakdown', (tester) async {
    final b = await boot(tester);
    await b.tap(find.text('Länge'));
    await b.tap(find.bySemanticsLabel('Ziffer 5'));
    await b.tap(find.text('ft'));
    await b.tap(find.bySemanticsLabel('Ziffer 3'));
    await b.tap(find.text('in'));
    // cycle '=' to the breakdown view (after the 7 ladder units)
    for (var i = 0; i < 7; i++) {
      await b.tap(find.bySemanticsLabel('Gleich'));
    }
    await _shoot(b.key, 'compound_breakdown');
    b.handle.dispose();
  });

  testWidgets('caret tap repositions to the left', (tester) async {
    final b = await boot(tester);
    await b.tap(find.text('Länge'));
    await b.tap(find.bySemanticsLabel('Ziffer 5'));
    await b.tap(find.text('ft'));
    await b.tap(find.bySemanticsLabel('Ziffer 3'));
    await b.tap(find.text('in'));
    // tap the input line's left portion → caret should jump left
    final rect = tester.getRect(find.byType(ConverterDisplay));
    await tester.tapAt(Offset(rect.left + rect.width * 0.42, rect.top + 24));
    await tester.pump(const Duration(milliseconds: 120));
    await _shoot(b.key, 'caret_tap');
    b.handle.dispose();
  });

  testWidgets('subtraction 5 ft − 3 in', (tester) async {
    final b = await boot(tester);
    await b.tap(find.text('Länge'));
    await b.tap(find.bySemanticsLabel('Ziffer 5'));
    await b.tap(find.text('ft'));
    await b.tap(find.bySemanticsLabel('minus'));
    await b.tap(find.bySemanticsLabel('Ziffer 3'));
    await b.tap(find.text('in'));
    await _shoot(b.key, 'subtraction');
    b.handle.dispose();
  });

  testWidgets('unit theory page — Länge tab', (tester) async {
    tester.view.physicalSize = const Size(430, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final handle = tester.ensureSemantics();
    final key = GlobalKey();
    await tester.pumpWidget(RepaintBoundary(
      key: key,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'PreviewFont'),
        locale: const Locale('de'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ConversionsPage(),
      ),
    ));
    await tester.pump(const Duration(milliseconds: 300));
    // default tab = Anzahl (count) → shows the new title + count theory
    await _shoot(key, 'theory_count');
    handle.dispose();
  });

  testWidgets('breit (tablet landscape) dist active', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final handle = tester.ensureSemantics();
    final key = GlobalKey();
    await tester.pumpWidget(RepaintBoundary(key: key, child: _app()));
    await tester.pump(const Duration(milliseconds: 50));
    Future<void> tap(Finder f) async {
      await tester.tap(f);
      await tester.pump(const Duration(milliseconds: 150));
    }
    await tap(find.text('Länge'));
    await tap(find.bySemanticsLabel('Ziffer 5'));
    await tap(find.text('ft'));
    await tap(find.bySemanticsLabel('Ziffer 3'));
    await tap(find.text('in'));
    await _shoot(key, 'breit');
    handle.dispose();
  });
}
