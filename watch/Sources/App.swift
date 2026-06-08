// Dozenal Calc for Apple Watch — a deliberately tiny calculator.
// Layout: a fixed two-line display on top; below it three horizontally swiped
// pages — left: about/licence/privacy, middle: dozenal glyph keypad,
// right: function keys. Swiping replaces the previous page entirely.
//
// Page sizing comes from the OUTER GeometryReader and is passed to each page as
// an explicit CGSize. The pages do not rely on the size the page-style TabView
// proposes (which is wrong on the first layout pass and left the initial glyph
// page zoomed/clipped until a swipe).
import SwiftUI
import WatchKit

@main
struct DozenalWatchApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

private func tick() { WKInterfaceDevice.current().play(.click) }

private let keyFill = Color(white: 0.13)
private let keyGap: CGFloat = 4

struct ContentView: View {
    @StateObject private var calc = Calculator()
    @State private var page = 1   // start on the glyph keypad (middle)
    @State private var rebuild = false

    var body: some View {
        VStack(spacing: 0) {
            DisplayView(calc: calc)
                .frame(height: 44)
            TabView(selection: $page) {
                AboutPage().tag(0)
                GlyphPad(calc: calc).tag(1)
                FunctionPad(calc: calc).tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            // Rebuild the page-style TabView once, one runloop after first
            // appear: on the very first layout it mis-sizes its initial page
            // (glyphs came up zoomed/clipped until a swipe). By then the
            // geometry is known, so the rebuilt TabView lays out correctly.
            .id(rebuild)
            .onAppear { DispatchQueue.main.async { rebuild.toggle() } }
        }
        // Reclaim most of the large watchOS top safe area (the time band) for
        // the keys; a top inset keeps the display below the clock and clear of
        // the rounded top corner.
        .padding(.top, 16)
        .background(Color.black)
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct DisplayView: View {
    @ObservedObject var calc: Calculator

    var body: some View {
        // Left-aligned, top — like an ordinary calculator. The system clock
        // sits top-right, so left alignment keeps the input clear of it.
        VStack(alignment: .leading, spacing: 0) {
            Text(calc.expr.isEmpty ? " " : calc.expr)
                .font(.system(size: 15, design: .monospaced))
                .foregroundColor(.gray)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(calc.result)
                .font(.system(size: 22, weight: .semibold, design: .monospaced))
                .foregroundColor(calc.isError ? .red : .white)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        // Extra leading inset so the left-aligned input clears the watch's
        // rounded top-left corner.
        .padding(.leading, 16)
        .padding(.trailing, 6)
    }
}

// MARK: - Glyph keypad (middle page) — 3 columns × 4 rows, the twelve digits.

struct GlyphPad: View {
    @ObservedObject var calc: Calculator

    private let rows: [[DozenalDigit]] = [
        [.d10, .d11, .d0],
        [.d7, .d8, .d9],
        [.d4, .d5, .d6],
        [.d1, .d2, .d3],
    ]

    var body: some View {
        GeometryReader { geo in
            let cw = (geo.size.width - keyGap * 2) / 3
            let ch = (geo.size.height - keyGap * 3) / 4
            VStack(spacing: keyGap) {
                ForEach(rows.indices, id: \.self) { r in
                    HStack(spacing: keyGap) {
                        ForEach(rows[r], id: \.self) { d in
                            Button {
                                calc.inputDigit(d); tick()
                            } label: {
                                GlyphShape(digit: d)
                                    .stroke(Color.white,
                                            style: StrokeStyle(lineWidth: 2, lineCap: .round))
                                    .padding(ch * 0.17)
                                    .frame(width: cw, height: ch)
                                    .background(keyFill)
                                    .cornerRadius(5)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
        }
    }
}

// MARK: - Function keypad (right page) — 12 keys (4×3) + a full-width equals.

struct FunctionPad: View {
    @ObservedObject var calc: Calculator

    // Set 1: operators · Set 2: exponent, root, log, decimal point ·
    // Set 3: parentheses, delete, clear-all. Equals spans below.
    private let rows: [[String]] = [
        ["+", "\u{2212}", "\u{00D7}", "\u{00F7}"],         // + − × ÷
        ["x\u{02B8}", "\u{221A}", "log", "."],             // xʸ √ log .
        ["(", ")", "\u{232B}", "AC"],                       // ( ) ⌫ AC
    ]

    var body: some View {
        GeometryReader { geo in
            let cw = (geo.size.width - keyGap * 3) / 4   // 4 columns
            let ch = (geo.size.height - keyGap * 3) / 4  // 3 key rows + equals
            VStack(spacing: keyGap) {
                ForEach(rows.indices, id: \.self) { r in
                    HStack(spacing: keyGap) {
                        ForEach(rows[r], id: \.self) { k in
                            Button {
                                tap(k)
                            } label: {
                                Text(k)
                                    .font(.system(size: k.count > 1 ? 13 : 18))
                                    .foregroundColor(color(for: k))
                                    .minimumScaleFactor(0.6)
                                    .lineLimit(1)
                                    .frame(width: cw, height: ch)
                                    .background(keyFill)
                                    .cornerRadius(5)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                Button {
                    calc.equals(); tick()
                } label: {
                    Text("=")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.green)
                        .frame(width: geo.size.width, height: ch)
                        .background(keyFill)
                        .cornerRadius(5)
                }
                .buttonStyle(.plain)
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
        }
    }

    private func color(for k: String) -> Color {
        switch k {
        case "AC": return .red
        case "\u{232B}": return .orange      // ⌫
        case ".", "(", ")": return .white
        default: return .blue                // operators + functions
        }
    }

    private func tap(_ k: String) {
        switch k {
        case "x\u{02B8}": calc.op("^")
        case "\u{221A}":  calc.op("\u{221A}")
        case "log":       calc.op("log")
        case ".":         calc.dot()
        case "\u{232B}":  calc.del()
        case "AC":        calc.clear()
        default:          calc.op(k)         // + − × ÷ ( )
        }
        tick()
    }
}

// MARK: - About / licence / privacy (left page)

struct AboutPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 6) {
                Text("Dozenal Calc")
                    .font(.headline)
                Text("Ein Rechner in Basis Zwölf.")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Divider()
                Text("Lizenz")
                    .font(.caption.weight(.semibold))
                Text("MIT-Lizenz · © 2026 Eric Naville")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Divider()
                Text("Datenschutz")
                    .font(.caption.weight(.semibold))
                Text("Kein Netzwerk, kein Tracking, keine Analytics, keine Datensammlung. Alles bleibt auf der Uhr.")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
