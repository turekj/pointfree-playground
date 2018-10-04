@testable import pointfree
import UIKit
import XCTest

class ComposeTests: XCTestCase {

    func testFunctionsCanBeComposed() {
        let result = 12
            |> square
            >>> advance(by: 10)
            >>> String.init

        XCTAssertEqual("154", result)
    }

}

private func square(_ a: Int) -> Int {
    return a * a
}

private func advance(by a: Int) -> (Int) -> Int {
    return { $0 + a }
}
