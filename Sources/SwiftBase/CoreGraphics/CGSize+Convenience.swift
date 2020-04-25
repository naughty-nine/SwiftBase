
import CoreGraphics


extension CGSize {
  /// Convenience initializer for creating a **square** size.
  /// - Parameter square: Width/height of the square to create.
  public init(square: CGFloat) {
    self.init(width: square, height: square)
  }
}
