import Foundation

@propertyWrapper
public struct Observable<Value> {
    
    public init(wrappedValue value: Value) {
        self.wrappedValue = value
        projectedValue = ObservableProjection(initialValue: value)
    }
    
    public var wrappedValue: Value {
        didSet {
            projectedValue.notifyObservers(oldValue: oldValue, newValue: wrappedValue)
        }
    }
    
    public func cancelAll() {
        projectedValue.deleteObservers()
    }
    
    private(set) public var projectedValue: ObservableProjection<Value>
}
