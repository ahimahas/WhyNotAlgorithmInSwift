import Foundation

public class Queue<T> {
    private lazy var values: [T] = []
    
    public init() {}
    
    public func enqueue(value: T) {
        values.append(value)
    }
    
    public func dequeue() -> T? {
        guard let rtn: T = values.first else {
            return nil
        }
        
        values.removeFirst()
        return rtn
    }
    
    public func isEmpty() -> Bool {
        if values.count == 0 {
            return true
        }
        
        return false
    }
    
    public func peek() -> T? {
        guard let rtn: T = values.first else {
            return nil
        }
        return rtn
    }
}
