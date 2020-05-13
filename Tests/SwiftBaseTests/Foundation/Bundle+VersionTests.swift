
import Foundation
import XCTest
@testable import SwiftBase


class Bundle_VersionTests: XCTestCase {

  var sut: Bundle!

  override func setUp() {
    sut = Bundle(identifier: "SwiftBase")
  }

  func test_version() {
    XCTAssertEqual(sut.version, "1.3")
  }
  
  func test_build() {
    XCTAssertEqual(sut.build, "13")
  }

  func test_buildInt() {
    XCTAssertEqual(sut.buildInt, 13)
  }
}
