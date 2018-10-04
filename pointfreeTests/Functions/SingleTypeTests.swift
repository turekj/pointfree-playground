@testable import pointfree
import UIKit
import XCTest

class SingleTypeTests: XCTestCase {

    func testSingleTypeComposition() {
        let view = UIView()
            |> rounded
            <> black
            <> {
                $0.isHidden = true
            }

        XCTAssertEqual(5.0, view.layer.cornerRadius)
        XCTAssertEqual(UIColor.black, view.backgroundColor)
        XCTAssertTrue(view.isHidden)
    }

}

private func rounded(_ view: UIView) {
    view.layer.cornerRadius = 5.0
}

private func black(_ view: UIView) {
    view.backgroundColor = UIColor.black
}
