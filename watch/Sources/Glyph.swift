// Dozenal digit glyphs ported 1:1 from the Flutter app's glyph_painter.dart
// (itself a port of the Rust paint_dozenal_digit). A glyph fits in a 2q×2q box
// centred in the rect, q = min(w,h)/4. Stroked, never filled.
import SwiftUI

enum DozenalDigit: Int, CaseIterable, Hashable {
    case d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11

    var value: Int { rawValue }
    /// Conventional label for the display: 0–9, then A/B for ten/eleven.
    var label: String {
        rawValue < 10 ? String(rawValue) : (rawValue == 10 ? "A" : "B")
    }
}

struct GlyphShape: Shape {
    let digit: DozenalDigit

    func path(in rect: CGRect) -> Path {
        var p = Path()
        let q = min(rect.width, rect.height) / 4
        let c = CGPoint(x: rect.midX, y: rect.midY)
        let top = CGPoint(x: c.x, y: c.y - q)
        let bot = CGPoint(x: c.x, y: c.y + q)

        func off(_ dx: CGFloat, _ dy: CGFloat) -> CGPoint {
            CGPoint(x: c.x + dx, y: c.y + dy)
        }
        func circle(_ ctr: CGPoint) {
            p.addEllipse(in: CGRect(x: ctr.x - q, y: ctr.y - q,
                                    width: 2 * q, height: 2 * q))
        }
        // Arc sampled parametrically (matches Flutter's y-down angle convention:
        // 0°=+x, +90°=down). Avoids any addArc direction ambiguity.
        func arc(_ ctr: CGPoint, _ startDeg: Double, _ endDeg: Double) {
            let steps = 28
            for i in 0...steps {
                let t = (startDeg + (endDeg - startDeg) * Double(i) / Double(steps))
                    * .pi / 180
                let pt = CGPoint(x: ctr.x + q * cos(t), y: ctr.y + q * sin(t))
                if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
            }
        }
        func rightHalf(_ ctr: CGPoint) { arc(ctr, -90, 90) }
        func leftHalf(_ ctr: CGPoint) { arc(ctr, 90, 270) }
        func arrow(_ tip: CGPoint, _ w1: CGPoint, _ w2: CGPoint) {
            p.move(to: tip); p.addLine(to: w1)
            p.move(to: tip); p.addLine(to: w2)
        }

        switch digit {
        // Anchor digits: arrow pointing in a cardinal direction.
        case .d1:  arrow(off(0, -q), off(-q, q), off(q, q))
        case .d4:  arrow(off(-q, 0), off(q, -q), off(q, q))
        case .d7:  arrow(off(q, 0), off(-q, -q), off(-q, q))
        case .d10: arrow(off(0, q), off(-q, -q), off(q, -q))
        // Composite digits: a top + bottom element, each radius q.
        case .d0:  circle(c)
        case .d2:  rightHalf(top); leftHalf(bot)
        case .d3:  rightHalf(top); rightHalf(bot)
        case .d5:  leftHalf(top);  rightHalf(bot)
        case .d6:  leftHalf(top);  circle(bot)
        case .d8:  circle(top);    circle(bot)
        case .d9:  circle(top);    rightHalf(bot)
        case .d11: rightHalf(top); circle(bot)
        }
        return p
    }
}
