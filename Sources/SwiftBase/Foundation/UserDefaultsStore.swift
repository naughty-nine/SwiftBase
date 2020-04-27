
import Foundation


/// Property wrapper storing the  wrapped value to `UserDefaults`
///
/// Can handle all  (optional)`Codable`
///
/// - Important: Stores all values as `Data`.
@propertyWrapper
public struct UserDefaultsStore<T: Codable> {

  private let key: String
  private let defaultValue: T

  /// Default initializer
  /// - Parameters:
  ///   - key: `UserDefaults` key
  ///   - defaultValue: Default value if the `key` doesn't exist
  public init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }

  public var wrappedValue: T {
    get {
      guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
        return defaultValue
      }
      guard let value = try? JSONDecoder().decode(T.self, from: data) else {
        return defaultValue
      }
      return value
    }
    set {
      let data = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(data, forKey: key)
    }
  }
}
