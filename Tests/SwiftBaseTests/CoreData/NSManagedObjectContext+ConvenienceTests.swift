
import CoreData
import XCTest
@testable import SwiftBase


class TestableNSManagedObjectContext: NSManagedObjectContext {
  var saveCalled = false

  override func save() throws {
    saveCalled = true
    try super.save()
  }

  static func createModel() -> NSManagedObjectModel {
    let bundle = Bundle(for: TestableNSManagedObjectContext.self)
    return NSManagedObjectModel.mergedModel(from: [bundle])!
  }

  static func createContext() -> TestableNSManagedObjectContext {
    TestableNSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
  }

  static func createContainer(forContext: NSManagedObjectContext) -> NSPersistentContainer {
    let model = createModel()
    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
    try! coordinator.addPersistentStore(ofType: NSInMemoryStoreType,
                                        configurationName: nil, at: nil, options: nil)
    forContext.persistentStoreCoordinator = coordinator
    return NSPersistentContainer(name: "Model", managedObjectModel: model)
  }
}



class NSManagedObjectContext_ConvenienceTests: XCTestCase {

  func test_saveIfNeeded_saveIsNotCalled_whenSelf_hasNoChanges() {
    let sut = TestableNSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    sut.saveIfNeeded()
    XCTAssertFalse(sut.saveCalled)
  }

  func test_saveIfNeeded_saveIsCalled_whenSelf_hasChanges() {
    let sut = TestableNSManagedObjectContext.createContext()
    let container = TestableNSManagedObjectContext.createContainer(forContext: sut)
    let semaphore = DispatchSemaphore(value: 0)
    container.loadPersistentStores { (nsPersistentStoreDescription, error) in
      _ = TestObject(context: sut)
      _ = NSEntityDescription.insertNewObject(forEntityName: "TestObject",
                                              into: sut) as! SwiftBaseTests.TestObject
      sut.saveIfNeeded()
      XCTAssertTrue(sut.saveCalled)
      semaphore.signal()
    }
    semaphore.wait()
  }

  func test_saveIfNeededThrowing_throws_orNot() {
    let sut = TestableNSManagedObjectContext.createContext()
    let container = TestableNSManagedObjectContext.createContainer(forContext: sut)
    let semaphore = DispatchSemaphore(value: 0)
    container.loadPersistentStores { (_, _) in
      let object = TestObject.init(context: sut)
      do {
        XCTAssertThrowsError(try sut.saveIfNeededThrowing())
        object.testName = "name"
        XCTAssertNoThrow(try sut.saveIfNeededThrowing())
        try sut.saveIfNeededThrowing()
        semaphore.signal()
      } catch {
      }
    }
    semaphore.wait()
  }
}
