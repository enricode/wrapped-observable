import Foundation

public class ObservableProjection<Value> {
    public typealias Observer = (_ observable: Value, Value) -> Void

    private let lock: Lock = Mutex()
    private var uniqueID = (0...).makeIterator()
    private var observers: [Int: Observer] = [:]
    
    private let initialValue: Value
    
    init(initialValue: Value) {
        self.initialValue = initialValue
    }
    
    public func observe(observer: @escaping Observer) -> Disposable {
        lock.lock()
        defer { lock.unlock() }

        let id = uniqueID.next()!
        
        observers[id] = observer
        
        let disposable = Disposable { [weak self] in
            self?.observers[id] = nil
        }
        
        observer(initialValue, initialValue)
        
        return disposable
    }
    
    func deleteObservers() {
        observers.removeAll()
    }
    
    func notifyObservers(oldValue: Value, newValue: Value) {
        observers.values.forEach { observer in
            observer(oldValue, newValue)
        }
    }
}
