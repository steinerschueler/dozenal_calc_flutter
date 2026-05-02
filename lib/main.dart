// Pilot app for the dozenal_calc Flutter port.
// Renders D1 (anchor digit, arrow up), D5 (composite, mirror half-circles),
// and D8 (composite, two stacked circles) at three sizes each.
//
// Visual comparison reference: the live Rust web build, which renders the
// same glyphs with the same geometry. If these glyphs look identical to
// the Rust version, the spec in GLYPHS.md is sufficient for the full port.

import 'package:flutter/material.dart';
import 'glyph_painter.dart';

void main() => runApp(const PilotApp());

class PilotApp extends StatelessWidget {
  const PilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dozenal_calc - pilot',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
      ),
      home: const PilotPage(),
    );
  }
}

class PilotPage extends StatelessWidget {
  const PilotPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizes = [40.0, 80.0, 160.0];
    const digits = [DozenalDigit.d1, DozenalDigit.d5, DozenalDigit.d8];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Glyph Pilot'),
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: digits.map((d) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      d.name.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  ...sizes.map((s) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: s,
                          height: s,
                          child: CustomPaint(
                            painter: DozenalGlyphPainter(
                              digit: d,
                              strokeWidth: s / 30,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
