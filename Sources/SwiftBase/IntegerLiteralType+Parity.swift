
import Foundation


public enum Parity {
  case even, odd
}


public extension IntegerLiteralType {

  var isEven: Bool { self % 2 == 0 }

  var isOdd: Bool { !isEven }

  var parity: Parity { isEven ? .even : .odd }
}
