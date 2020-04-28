
import SwiftUI


/// Wraps a view to be lazily loaded
public struct LazyView<Content: View>: View {
  let buildContent: () -> Content

  /// - Parameter build: Content to be lazily loaded
  public init(_ build: @autoclosure @escaping () -> Content) {
    self.buildContent = build
  }

  public var body: Content {
    buildContent()
  }
}
