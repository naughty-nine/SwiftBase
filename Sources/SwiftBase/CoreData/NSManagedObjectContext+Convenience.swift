
import CoreData


extension NSManagedObjectContext {

  /// Save the context if changed
  public func saveIfNeededThrowing() throws {
    guard hasChanges else { return }
    do {
      try save()
    } catch(let error) {
      llog(.error, "\(type(of: self)).\(#function): \(error.localizedDescription)")
      throw error
    }
  }

  /// Save the context if changed handling any error by logging
  public func saveIfNeeded() {
    try? saveIfNeededThrowing()
  }
}
