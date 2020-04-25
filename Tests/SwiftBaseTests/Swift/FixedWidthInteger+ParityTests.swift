import XCTest
@testable import SwiftBase


final class IntergerLiteralType_ParityTests: XCTestCase {
  
  static let evens: [Int] = [Int.min, -2, 0, 4, Int.max-1]
  static let odds: [Int] = [Int.min+1, -3, 1, Int.max]

  func testIsEven_true() {
    Self.evens.forEach {
      XCTAssertTrue($0.isEven, "\($0) is expected to be even")
    }
  }

  func testIsEven_false() {
    Self.odds.forEach {
      XCTAssertFalse($0.isEven, "\($0) is expected NOT to be even")
    }
  }

  func testIsOdd_true() {
    Self.odds.forEach {
      XCTAssertTrue($0.isOdd, "\($0) is expected to be odd")
    }
  }

  func testIsOdd_false() {
    Self.evens.forEach {
      XCTAssertFalse($0.isOdd, "\($0) is expected NOT to be odd")
    }
  }

  func testIntTypes() {
    let int8: Int8 = 4
    let int16: Int16 = Int16(Int8.max) + 3
    let int32: Int32 = Int32(Int16.max) + 5

    XCTAssertTrue(int8.isEven)
    XCTAssertTrue(int16.isEven)
    XCTAssertTrue(int32.isEven)
  }
}
