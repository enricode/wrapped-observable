import Foundation
//
//public class Observation<T: AnyObject> {
//    
//    public let destination: WeakObserver<T>
//    
//    init(destination: T) {
//        self.destination = WeakObserver(destination)
//    }
//}
//
//
//final class WeakObserver<T: AnyObject> {
//    
//    weak var unbox: T?
//    
//    init(_ value: T) {
//        unbox = value
//    }
//    
//}
//
//
//struct WeakObserverList<Element: AnyObject> {
//    
//    private var items: [WeakObserver<Element>] = []
//
//    init(_ elements: [Element]) {
//        items = elements.map { WeakObserver($0) }
//    }
//    
//}
//
//extension WeakObserverList: Collection {
//    
//    var startIndex: Int { return items.startIndex }
//    var endIndex: Int { return items.endIndex }
//
//    subscript(_ index: Int) -> Element? {
//        return items[index].unbox
//    }
//
//    func index(after idx: Int) -> Int {
//        return items.index(after: idx)
//    }
//    
//}
