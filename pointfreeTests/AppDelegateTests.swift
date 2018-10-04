@testable import pointfree
import UIKit
import XCTest

class AppDelegateTests: XCTestCase {

    var sut: AppDelegate!

    override func setUp() {
        super.setUp()
        sut = AppDelegate()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testDidFinishLaunchingWithOptionsReturnsTrue() {
        let didFinishLaunching = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

        XCTAssertTrue(didFinishLaunching)
    }

    func testDidFinishLaunchingWithOptionsInitializesWindow() {
        _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

        let window = sut.window

        XCTAssertNotNil(window)
        XCTAssertEqual(UIScreen.main.bounds.size, window?.frame.size)
        XCTAssertTrue(window!.isKeyWindow)
    }

    func testDidFinishLaunchingWithOptionsInitializesRootViewController() {
        _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

        let rootViewController = sut.window?.rootViewController as? UINavigationController

        XCTAssertNotNil(rootViewController)
        XCTAssertTrue(rootViewController?.viewControllers.first is ViewController)
        XCTAssertEqual(1, rootViewController?.viewControllers.count)
    }

}
