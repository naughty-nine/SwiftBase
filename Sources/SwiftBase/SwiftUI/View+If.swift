import SwiftUI


extension View {
  /// Conditional view modifier.
  ///
  /// Wraps  `self` in `content` if `condition` is `true`.
  /// - Parameters:
  ///   - conditional: Boolean condition
  ///   - content: The View to conditionally wrap `self` in
  /// - Returns: `AnyView`-type erased conditionally wrapped `self`.
  public func `if`<Content: View>(_ conditional: Bool,
                                  content: (Self) -> Content) -> some View {
    if conditional {
      return AnyView(content(self))
    }
    return AnyView(self)
  }
}
