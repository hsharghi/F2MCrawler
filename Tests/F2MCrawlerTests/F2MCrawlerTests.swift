import XCTest
@testable import F2MCrawler

final class F2MCrawlerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(F2MCrawler().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
