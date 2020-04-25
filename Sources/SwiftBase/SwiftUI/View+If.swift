import SwiftUI


extension View {

  public func `if`<Content: View>(_ conditional: Bool,
                                  content: (Self) -> Content) -> some View {
    if conditional {
      return AnyView(content(self))
    } else {
      return AnyView(self)
    }
  }
}
