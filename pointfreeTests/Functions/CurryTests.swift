@testable import pointfree
import UIKit
import XCTest

class CurryTests: XCTestCase {

    func testFunctionCanBeCurried() {
        let curried = curry(substract)

        XCTAssertEqual(99, curried(100)(1))
    }

}

private func substract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
