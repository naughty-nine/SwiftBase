
import Foundation


extension Bundle {

  public var version: String? {
    infoDictionary?["CFBundleShortVersionString"] as? String
  }

  public var build: String? {
    infoDictionary?["CFBundleVersion"] as? String
  }

  public var buildInt: Int {
    guard let string = build, let int = Int(string) else { return 0 }
    return int
  }
}
