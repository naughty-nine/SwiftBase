import XCTest
@testable import SwiftBase


final class UserDefaultsStoreTests: XCTestCase {
  let defaults = UserDefaults.standard

  @UserDefaultsStore(key: "TestBool", defaultValue: false)
    var testBool: Bool
  @UserDefaultsStore(key: "TestString", defaultValue: "default")
    var testString: String
  @UserDefaultsStore(key: "TestInt", defaultValue: nil)
    var testInt: Int?
  @UserDefaultsStore(key: "TestIntNotNil", defaultValue: 9)
    var testIntNotNil: Int
  @UserDefaultsStore(key: "TestData", defaultValue: nil)
    var testData: Data?

  override func setUp() {
    let dict = UserDefaults.standard.dictionaryRepresentation()
    dict.keys.forEach {
      if $0.starts(with: "Test") {
        defaults.removeObject(forKey: $0)
      }
    }
  }

  func testBoolStore() {
    XCTAssertFalse(testBool)

    testBool = true
    XCTAssertTrue(testBool)
    XCTAssertTrue(_testBool.wrappedValue)
  }

  func testStringStore() {
    XCTAssertEqual(self.testString, "default")

    testString = "changed"
    XCTAssertEqual(testString, "changed")
    XCTAssertEqual(_testString.wrappedValue, "changed")
  }

  func testIntStore() {
    XCTAssertNil(testInt)

    testInt = 2
    XCTAssertEqual(testInt, 2)
    XCTAssertEqual(_testInt.wrappedValue, 2)
  }

  func testDataStore() {
    XCTAssertNil(testData)

    let data = "someString".data(using: .utf8)
    testData = data
    let storedData = testData!
    let string = String(data: storedData, encoding: .utf8)!
    XCTAssertEqual(string, "someString")
    XCTAssertEqual(_testData.wrappedValue, data!)
  }

  func test_returnsDefaultValue_when_notDecodable() {
    let stringValue: String = "blah"
    let data = try! JSONEncoder().encode(stringValue)
    defaults.set(data, forKey: "TestIntNotNil")

    XCTAssertEqual(testIntNotNil, 9)
  }
}
