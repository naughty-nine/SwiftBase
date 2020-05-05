
import Foundation


public func llog(_ message: Any) {
  Log.default.log(level: .debug, message: message)
}

public func llog(_ level: Log.Level, _ message: Any) {
  Log.default.log(level: level, message: message)
}


public struct Log {

  public static var level = Level.error
  public static let `default` = Log()

  func log(level: Level, message: Any) {
    #if DEBUG
    if level >= Self.level {
      print(String(format: "%@: %@", level.string, "\(message)"))
    }
    #endif
  }
}


public extension Log {

  enum Level: Int, Comparable {
    case debug = 0
    case info = 1
    case error = 2
    case fatal = 4

    var string: String {
      switch self {
      case .debug: return "debug "
      case .info:  return "info  "
      case .error: return "ERROR "
      case .fatal: return "FATAL "
      }
    }

    public static func < (lhs: Log.Level, rhs: Log.Level) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
}
