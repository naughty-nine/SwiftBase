import XCTest


#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(SwiftBaseTests.allTests),
  ]
}
#endif
