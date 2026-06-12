// Swift half of the watch/Flutter parity safety net. Replays the SAME fixture
// file the Dart suite uses (test/fixtures/watch_parity_fixtures.json, included
// as a resource of this test target via watch/project.yml) against the watchOS
// evaluator. The fixtures' expected values are independently validated against
// the Flutter evaluator by test/watch_parity_test.dart; this side proves the
// Swift port agrees with them. Drift on the shared operator core breaks one suite.
//
// NOTE: requires Xcode (watchOS XCTest). It cannot run on Linux. To run:
//   cd watch && xcodegen generate && \
//     xcodebuild test -project DozenalWatch.xcodeproj -scheme DozenalWatch \
//       -destination 'platform=watchOS Simulator,name=Apple Watch Series 10 (46mm)'

import XCTest
@testable import DozenalWatch

final class CalculatorParityTests: XCTestCase {
    private struct Fixture: Decodable {
        let expr: String
        let expect: Double
        let note: String?
    }

    private func loadFixtures() throws -> [Fixture] {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "watch_parity_fixtures", withExtension: "json") else {
            XCTFail("watch_parity_fixtures.json missing from the test bundle resources")
            return []
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Fixture].self, from: data)
    }

    func testEvaluatorMatchesSharedFixtures() throws {
        let fixtures = try loadFixtures()
        XCTAssertFalse(fixtures.isEmpty, "no fixtures loaded")

        let calc = Calculator()
        for fx in fixtures {
            let got: Double
            do {
                got = try calc.evaluate(fx.expr)
            } catch {
                XCTFail("watch evaluate threw for \"\(fx.expr)\": \(error)")
                continue
            }
            XCTAssertEqual(
                got, fx.expect, accuracy: 1e-9,
                "parity drift on \"\(fx.expr)\": watch gave \(got), fixture expects \(fx.expect)"
            )
        }
    }
}
