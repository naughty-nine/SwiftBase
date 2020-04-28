import SwiftUI
import XCTest
import ViewInspector
@testable import SwiftBase


extension LazyView: Inspectable {}


class LazyViewTests: XCTestCase {

  struct TestView: View, Inspectable {
    var body: some View {
      LazyView (
        Text("Hi")
      )
    }
  }

  func test_lazyView_hasWrappedContent() {
    let view = TestView()
    let wrappedText = try? view.inspect().view(LazyView<Text>.self).text().string()
    XCTAssertEqual(wrappedText, "Hi")
  }
}
