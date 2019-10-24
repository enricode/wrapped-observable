import Foundation

@propertyWrapper
public struct Observable<Value> {
    
    public init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
    
    public var wrappedValue: Value {
        didSet {
            projectedValue.notifyObservers(oldValue: oldValue, newValue: wrappedValue)
        }
    }
    
    private(set) public var projectedValue: ObservableProjection<Value> = ObservableProjection()
}
