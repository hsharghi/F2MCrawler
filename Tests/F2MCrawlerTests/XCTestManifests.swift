import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(F2MCrawlerTests.allTests),
    ]
}
#endif
