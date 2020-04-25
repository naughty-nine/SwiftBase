
import Foundation


public enum Parity {
  case even, odd
}


public extension FixedWidthInteger {

  var isEven: Bool { self % 2 == 0 }

  var isOdd: Bool { !isEven }

  var parity: Parity { isEven ? .even : .odd }
}
