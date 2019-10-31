import XCTest
@testable import WrappedObservable

final class ObservableTests: XCTestCase {
    
    var testStruct: TestStruct!
    var oldValue: String!
    var newValue: String!
    var disposable: Disposable!
    var observerCalled: Bool = false
    
    override func setUp() {
        testStruct = nil
        observerCalled = false
        oldValue = nil
        newValue = nil
        disposable = nil
    }
    
    struct TestStruct {
        @Observable var testValue: String
    }
    
    class TestClass {
        @Observable var testValue: String
        
        init(testValue: String) {
            self.testValue = testValue
        }
    }
    
    func testObservable() {
        givenAStructWithObservable(initialValue: "hello")
        givenAnObserver()
        whenChangingValue(to: "new value")
        thenObservableIsCalled()
        thenNewValue(is: "new value")
        thenOldValue(is: "hello")
    }
    
    func testObservableWithCallback() {
        givenAStructWithObservable(initialValue: "hello")
        givenAnObserverWithCallback()
        whenChangingValue(to: "new value")
        thenObservableIsCalled()
    }
    
//    func testRemovingObserver() {
//        givenAStructWithObservable(initialValue: "hello")
//        givenAnObserver()
//        whenCancelingObservation()
//        whenChangingValue(to: "new value")
//        thenObservableIsNotCalled()
//    }
//
//    func testMemoryManagementStruct() {
//        givenAStructWithObservable(initialValue: "hello")
//        whenRemovingStructFromMemory()
//        whenChangingValue(to: "new value")
//        thenObservablesAreNiled()
//    }
//
//    func testMemoryManagementClass() {
//        givenAStructWithObservable(initialValue: "hello")
//        whenRemovingStructFromMemory()
//        whenChangingValue(to: "new value")
//        thenObservablesAreNiled()
//    }
//
//    func testInitialObservation() {
//        givenAStructWithObservable(initialValue: "hello")
//        givenAnObserver(sendInitialValue: true)
//        thenObservableIsCalled(with: "hello")
//    }
//
    private func givenAStructWithObservable(initialValue: String) {
        testStruct = TestStruct(testValue: initialValue)
    }
    
    private func givenAnObserverWithCallback() {
        disposable = testStruct.$testValue.observe { oldValue, newValue in
            self.oldValue = oldValue
            self.newValue = newValue
            self.observerCalled = true
        }
    }
    
    private func givenAnObserver(sendInitialValue: Bool = false) {
        disposable = testStruct.$testValue.observe { oldValue, newValue in
            self.oldValue = oldValue
            self.newValue = newValue
            self.observerCalled = true
        }
    }
    
    private func givenAnObjectObserver() {
//        disposable = testStruct.$testValue.observe { observedObject in
//            self.observedObject = observedObject
//            self.observerCalled = true
//        }
    }
    
    private func whenChangingValue(to newValue: String) {
        testStruct.testValue = newValue
    }
    
    private func whenCancelingObservation() {
//        observation.cancel()
    }
    
    private func whenRemovingStructFromMemory() {
        testStruct = nil
    }
    
    private func thenObservableIsCalled(with value: String? = nil) {
        XCTAssertNotNil(observerCalled)
        XCTAssertTrue(observerCalled)
        
        if let value = value {
            XCTAssertEqual(newValue, value)
        }
    }
    
    private func thenNewValue(is newValue: String) {
        XCTAssertEqual(newValue, self.newValue)
    }
    
    private func thenOldValue(is oldValue: String) {
        XCTAssertEqual(oldValue, self.oldValue)
    }
    
    private func thenObservableIsNotCalled() {
        XCTAssertFalse(observerCalled)
    }
    
    private func thenObservablesAreNiled() {
        XCTFail()
    }
    
    static var allTests = [
        ("testObservable", testObservable),
    ]
}
