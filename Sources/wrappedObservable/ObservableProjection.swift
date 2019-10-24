import Foundation

public class ObservableProjection<Value> {
    public typealias Observer = (_ observable: Value, Value) -> Void

    private var observers: [Observer] = []
    
    func observe(observer: @escaping Observer) {
        self.observers.append(observer)
    }
    
    func notifyObservers(oldValue: Value, newValue: Value) {
        observers.forEach { observer in
            observer(oldValue, newValue)
        }
    }
}
