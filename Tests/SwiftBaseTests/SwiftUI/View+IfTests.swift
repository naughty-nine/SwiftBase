import SwiftUI
import ViewInspector
import XCTest
@testable import SwiftBase


final class View_IfTests: XCTestCase {

  func testIfModifier(){
    [true, false].forEach {
      let sut = Text("a text")
        .if($0) { content in
          content.overlay(Text("overlay"))
        }
      let result = try? sut.inspect().anyView().text().overlay().text().string()
      if $0 {
        XCTAssertEqual(result, "overlay")
      } else {
        XCTAssertNil(result)
      }
    }
  }
}
