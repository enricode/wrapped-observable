import Foundation

public class ObservableProjection<Value> {
    public typealias ObserverCallback = (Value, Value) -> Void

    private let lock: Lock = Mutex()
    private var observers: [String: ObserverCallback] = [:]

    private let initialValue: Value
    var currentValue: Value {
        didSet {
            notifyObservers(oldValue: oldValue, newValue: currentValue)
        }
    }

    public init(initialValue: Value) {
        self.initialValue = initialValue
        self.currentValue = initialValue
    }

    public func observe(_ observer: @escaping ObserverCallback) -> Disposable {
        lock.lock()
        defer { lock.unlock() }

        let id = UUID().uuidString
        
        observers[id] = observer

        let disposable = Disposable { [weak self] in
            self?.observers[id] = nil
        }

        observer(initialValue, initialValue)

        return disposable
    }

    public func deleteObservers() {
        observers.removeAll()
    }

    func notifyObservers(oldValue: Value, newValue: Value) {
        observers.values.forEach { observer in
            observer(oldValue, newValue)
        }
    }

}
