// Minimal dozenal calculator model for the watch: build a base-12 expression,
// evaluate it (recursive descent: + − × ÷, ^ power, √ root, log, parentheses,
// unary minus) and show the result back in base 12. Floating-point — the full
// app's exact rational track is intentionally out of scope for the watch.
import Foundation

private let digitChars = Array("0123456789AB")
private let digitSet = Set("0123456789ABab")
private let numSet = Set("0123456789ABab.")

private func digitValue(_ ch: Character) -> Int? {
    switch ch {
    case "0"..."9": return Int(String(ch))
    case "A", "a": return 10
    case "B", "b": return 11
    default: return nil
    }
}

private enum Tok: Equatable {
    case num(Double), plus, minus, times, divide, power, sqrtFn, logFn, lp, rp
}

private enum CalcError: Error { case syntax, div0, overflow }

final class Calculator: ObservableObject {
    @Published var expr: String = ""
    @Published var result: String = "0"
    @Published var isError: Bool = false

    func inputDigit(_ d: DozenalDigit) { append(d.label) }

    /// Append an operator/function token verbatim ("+", "−", "×", "÷", "^",
    /// "√", "log", "(", ")").
    func op(_ s: String) { append(s) }

    func dot() {
        if isError { clear() }
        var hasDot = false
        for ch in expr.reversed() {
            if ch == "." { hasDot = true; break }
            if !digitSet.contains(ch) { break }
        }
        if hasDot { return }
        if let last = expr.last, digitSet.contains(last) {
            expr += "."
        } else {
            expr += "0."
        }
    }

    func del() {
        if isError { clear(); return }
        guard !expr.isEmpty else { return }
        // Remove a whole "log" keyword at once.
        if expr.hasSuffix("log") { expr.removeLast(3) } else { expr.removeLast() }
    }

    func clear() {
        expr = ""
        result = "0"
        isError = false
    }

    func equals() {
        do {
            let v = try evaluate(expr)
            result = Calculator.formatBase12(v)
            isError = false
        } catch {
            result = "Error"
            isError = true
        }
    }

    private func append(_ s: String) {
        if isError { clear() }
        expr += s
    }

    // MARK: - Evaluation

    // Internal (not private) so the parity test target can drive it directly
    // through `@testable import`. See watch/Tests/CalculatorParityTests.swift.
    func evaluate(_ s: String) throws -> Double {
        let tokens = try Calculator.tokenize(s)
        var pos = 0
        func peek() -> Tok? { pos < tokens.count ? tokens[pos] : nil }

        func primary() throws -> Double {
            guard let t = peek() else { throw CalcError.syntax }
            switch t {
            case .lp:
                pos += 1
                let v = try expression()
                guard peek() == .rp else { throw CalcError.syntax }
                pos += 1
                return v
            case .num(let n): pos += 1; return n
            default: throw CalcError.syntax
            }
        }
        func unary() throws -> Double {
            switch peek() {
            case .minus:  pos += 1; return -(try unary())
            case .plus:   pos += 1; return try unary()
            case .sqrtFn: pos += 1; return sqrt(try unary())
            case .logFn:  pos += 1; return log10(try unary())
            default:      return try primary()
            }
        }
        func power() throws -> Double {
            let base = try unary()
            if let t = peek(), t == .power || t == .sqrtFn {
                pos += 1
                let rhs = try power()           // right-associative
                // a^b, or a√b = the a-th root of b = b^(1/a).
                return t == .power ? pow(base, rhs) : pow(rhs, 1.0 / base)
            }
            return base
        }
        func term() throws -> Double {
            var v = try power()
            while let t = peek(), t == .times || t == .divide {
                pos += 1
                let r = try power()
                if t == .divide {
                    if r == 0 { throw CalcError.div0 }
                    v /= r
                } else {
                    v *= r
                }
            }
            return v
        }
        func expression() throws -> Double {
            var v = try term()
            while let t = peek(), t == .plus || t == .minus {
                pos += 1
                let r = try term()
                v = (t == .plus) ? v + r : v - r
            }
            return v
        }

        if tokens.isEmpty { return 0 }
        let v = try expression()
        if pos != tokens.count { throw CalcError.syntax }
        if v.isNaN || v.isInfinite { throw CalcError.overflow }
        return v
    }

    private static func tokenize(_ s: String) throws -> [Tok] {
        var tokens: [Tok] = []
        let chars = Array(s)
        var i = 0
        while i < chars.count {
            let c = chars[i]
            if c == " " { i += 1; continue }
            if c == "l" || c == "L" {           // "log"
                if i + 2 < chars.count,
                   "oO".contains(chars[i + 1]), "gG".contains(chars[i + 2]) {
                    tokens.append(.logFn); i += 3; continue
                }
                throw CalcError.syntax
            }
            if c == "\u{221A}" { tokens.append(.sqrtFn); i += 1; continue }  // √
            if numSet.contains(c) {
                var lit = ""
                while i < chars.count && numSet.contains(chars[i]) {
                    lit.append(chars[i]); i += 1
                }
                guard let v = parseBase12(lit) else { throw CalcError.syntax }
                tokens.append(.num(v))
                continue
            }
            switch c {
            case "+":              tokens.append(.plus)
            case "-", "\u{2212}":  tokens.append(.minus)
            case "*", "\u{00D7}":  tokens.append(.times)
            case "/", "\u{00F7}":  tokens.append(.divide)
            case "^":              tokens.append(.power)
            case "(":              tokens.append(.lp)
            case ")":              tokens.append(.rp)
            default:               throw CalcError.syntax
            }
            i += 1
        }
        return tokens
    }

    private static func parseBase12(_ str: String) -> Double? {
        if str.isEmpty || str == "." { return nil }
        let parts = str.split(separator: ".", omittingEmptySubsequences: false)
        if parts.count > 2 { return nil }
        var intVal = 0.0
        for ch in parts[0] {
            guard let d = digitValue(ch) else { return nil }
            intVal = intVal * 12 + Double(d)
        }
        var frac = 0.0
        if parts.count == 2 {
            var scale = 1.0 / 12.0
            for ch in parts[1] {
                guard let d = digitValue(ch) else { return nil }
                frac += Double(d) * scale
                scale /= 12
            }
        }
        return intVal + frac
    }

    static func formatBase12(_ value: Double) -> String {
        if value.isNaN || value.isInfinite { return "Error" }
        if abs(value) >= 1e12 { return "Error" }
        var v = value
        let sign = v < 0 ? "-" : ""
        if v < 0 { v = -v }

        let intPart = floor(v)
        var n = Int(intPart)
        var intDigits: String
        if n == 0 {
            intDigits = "0"
        } else {
            var ds: [Character] = []
            while n > 0 { ds.append(digitChars[n % 12]); n /= 12 }
            intDigits = String(ds.reversed())
        }

        var frac = v - intPart
        var fracDigits = ""
        var count = 0
        while frac > 1e-9 && count < 5 {
            frac *= 12
            let d = Int(floor(frac + 1e-9))
            fracDigits.append(digitChars[min(d, 11)])
            frac -= Double(d)
            count += 1
        }
        while fracDigits.hasSuffix("0") { fracDigits.removeLast() }

        return sign + intDigits + (fracDigits.isEmpty ? "" : "." + fracDigits)
    }
}
