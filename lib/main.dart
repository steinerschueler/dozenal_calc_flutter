// All twelve dozenal glyphs rendered via the Dart port of paint_dozenal_digit.
// Visual reference: the Rust web build (CalcApp legend in painting.rs).

import 'package:flutter/material.dart';
import 'glyph_painter.dart';

void main() => runApp(const PilotApp());

class PilotApp extends StatelessWidget {
  const PilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dozenal_calc - glyph port',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1F1F1F),
      ),
      home: const GlyphGallery(),
    );
  }
}

class GlyphGallery extends StatelessWidget {
  const GlyphGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // Rendered in the same order as the Rust digit legend (rows of 3,
    // descending values — see draw_digit_legend in painting.rs).
    const grid = <List<int>>[
      [10, 11, 0],
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dozenal Glyphs'),
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: grid
              .map((row) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row
                          .map((v) => _GlyphCell(value: v))
                          .toList(growable: false),
                    ),
                  ))
              .toList(growable: false),
        ),
      ),
    );
  }
}

class _GlyphCell extends StatelessWidget {
  final int value;
  const _GlyphCell({required this.value});

  @override
  Widget build(BuildContext context) {
    final digit = DozenalDigit.values[value];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CustomPaint(
              painter: DozenalGlyphPainter(digit: digit, strokeWidth: 2.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '= $value',
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
