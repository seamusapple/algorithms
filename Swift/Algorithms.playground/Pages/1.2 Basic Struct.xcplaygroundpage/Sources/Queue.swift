import Foundation

public struct Queue<Elememt> {
    public mutating func enqueue(_ element: Elememt) {
        array.append(element)
    }
    
    public mutating func dequeue() -> Elememt? {
        guard !isEmpty else { return  nil }
        return array.removeFirst()
    }
    
    public func front() -> Elememt? {
        return array.first
    }
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public init() {
        array = []
    }
    
    public var name = ""
    private var array: [Elememt] = []
}

extension Queue: CustomStringConvertible where Elememt: CustomStringConvertible {
    public var description: String {
        let title = name.isEmpty ? "Queue" : name
        let prefixDes = "-----\(title)-----\n"
        var innerDes = ""
        for _ in 1...title.count {
            innerDes += "-"
        }
        let suffixDes = "\n-----" + innerDes + "-----\n"
        let queueElements = array.map { $0.description }.joined(separator: "\n")
        return prefixDes + queueElements + suffixDes
    }
}


public struct ImprovedQueue<Elememt> {
    public mutating func enqueue(_ element: Elememt) {
        array.append(element)
    }
    
    public mutating func dequeue() -> Elememt? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let currentPercentage = Double(head)/Double(array.count)
        if array.count > capacityThreshold && currentPercentage > percentageThreshold {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public func front() -> Elememt? {
        guard count != 0 else { return nil }
        return array[head]
    }
    
    public var count: Int {
        return array.count-head
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init() {
        array = []
    }
    
    public var name = ""
    private var array: [Elememt?] = []
    private var head = 0
    private var capacityThreshold = 50
    private var percentageThreshold: Double = 0.25
}

extension ImprovedQueue: CustomStringConvertible where Elememt: CustomStringConvertible {
    public var description: String {
        let title = name.isEmpty ? "Queue" : name
        let prefixDes = "-----\(title)-----\n"
        var innerDes = ""
        for _ in 1...title.count {
            innerDes += "-"
        }
        let suffixDes = "\n-----" + innerDes + "-----\n"
        let queueElements = array.compactMap { $0?.description }.joined(separator: "\n")
        return prefixDes + queueElements + suffixDes
    }
}
