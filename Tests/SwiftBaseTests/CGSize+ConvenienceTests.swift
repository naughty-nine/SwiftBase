import XCTest
@testable import SwiftBase


final class CGSize_ConvenienceTests: XCTestCase {

  func testInitWithSquare() {
    let sut = CGSize(square: 3.5)

    XCTAssertEqual(sut.width, 3.5)
    XCTAssertEqual(sut.height, sut.width)
  }
}
