
import CoreData


extension NSManagedObjectContext {

  /// Save the context if changed
  func saveIfNeededThrowing() throws {
    guard hasChanges else { return }
    do {
      try save()
    } catch(let error) {
      print(String(format: "ERROR: %@.%@: %@",
                   "\(type(of: self))", #function, error.localizedDescription))
      throw error
    }
  }

  /// Save the context if changed handling any error by logging
  func saveIfNeeded() {
    try? saveIfNeededThrowing()
  }
}
