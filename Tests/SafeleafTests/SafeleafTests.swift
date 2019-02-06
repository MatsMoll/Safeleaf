import XCTest
@testable import Safeleaf

final class SafeleafTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Safeleaf().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
