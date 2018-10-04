@testable import pointfree
import UIKit
import XCTest

class FlipTests: XCTestCase {

    func testThatFunctionCanBeFlipped() {
        let flipped = flip(substract)

        XCTAssertEqual(15, flipped(6)(21))
    }

}

private func substract(_ a: Int) -> (Int) -> Int {
    return { b in a - b }
}
