import Foundation

@propertyWrapper
public struct Observable<Value> {
    
    let projection: ObservableProjection<Value>
    
    public init(wrappedValue: Value) {
        projection = ObservableProjection(initialValue: wrappedValue)
    }
    
    public var wrappedValue: Value {
        get {
            return projection.currentValue
        }
        set {
            projection.currentValue = newValue
        }
    }
    
    public var projectedValue: ObservableProjection<Value> {
        return projection
    }
}
