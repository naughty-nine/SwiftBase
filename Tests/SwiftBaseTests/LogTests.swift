
import XCTest
@testable import SwiftBase


final class LogTests: XCTestCase {

  func testLogLevel_Comparable() {
    XCTAssertTrue(Log.Level.info < .error)
  }

  func test_log() {
    let sut = Log()
    XCTAssertNoThrow(sut.log(level: .error, message: "msg"))
  }

  func test_global_log() {
    XCTAssertNoThrow(llog("msg"))
    Log.level = .debug
    XCTAssertNoThrow(llog(.debug, "msg"))
    XCTAssertNoThrow(llog(.info, "msg"))
    XCTAssertNoThrow(llog(.error, "msg"))
    XCTAssertNoThrow(llog(.fatal, "msg"))
  }
}
