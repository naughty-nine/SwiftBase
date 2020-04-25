
import Foundation


/// Represents the parity of an integer type.
public enum Parity {
  case even, odd
}


public extension FixedWidthInteger {

  var isEven: Bool { self % 2 == 0 }

  var isOdd: Bool { !isEven }

  /// Parity of self.
  var parity: Parity { isEven ? .even : .odd }
}
