import Foundation

@propertyWrapper
struct Observable<Value> {
    
    init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
    
    var wrappedValue: Value {
        didSet {
            projectedValue.notifyObservers(oldValue: oldValue, newValue: wrappedValue)
        }
    }
    
    private(set) var projectedValue: ObservableProjection<Value> = ObservableProjection()
}
