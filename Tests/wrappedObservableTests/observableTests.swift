import XCTest
@testable import wrappedObservable

final class observableTests: XCTestCase {
    
    var testStruct: TestStruct!
    var oldValue: String!
    var newValue: String!
    var observerCalled: Bool = false
    
    override func setUp() {
        testStruct = nil
        observerCalled = false
        oldValue = nil
        newValue = nil
    }
    
    struct TestStruct {
        @Observable var testValue: String
    }
    
    func testObservable() {
        // Given
        givenAStructWithObservable(initialValue: "hello")
        givenAnObserver()
        whenChaingingValue(to: "new value")
        thenObservableIsCalled()
        thenNewValue(is: "new value")
        thenOldValue(is: "hello")
    }
    
    func testRemovingObserver() {
        
    }

    private func givenAStructWithObservable(initialValue: String) {
        testStruct = TestStruct(testValue: initialValue)
    }
    
    private func givenAnObserver() {
        testStruct.$testValue.observe { oldValue, newValue in
            self.oldValue = oldValue
            self.newValue = newValue
            self.observerCalled = true
        }
    }
    
    private func whenChaingingValue(to newValue: String) {
        testStruct.testValue = newValue
    }
    
    private func thenObservableIsCalled() {
        XCTAssertNotNil(observerCalled)
        XCTAssertTrue(observerCalled)
    }
    
    private func thenNewValue(is newValue: String) {
        XCTAssertEqual(newValue, self.newValue)
    }
    
    private func thenOldValue(is oldValue: String) {
        XCTAssertEqual(oldValue, self.oldValue)
    }
    
    static var allTests = [
        ("testObservable", testObservable),
    ]
}
