import Foundation

public class ObservableProjection<Value> {
    public typealias Observer = (_ observable: Value, Value) -> Void

    private var observers: [Observer] = []
    
    public func observe(observer: @escaping Observer) {
        observers.append(observer)
    }
    
    func deleteObservers() {
        observers = []
    }
    
    func notifyObservers(oldValue: Value, newValue: Value) {
        observers.forEach { observer in
            observer(oldValue, newValue)
        }
    }
}
