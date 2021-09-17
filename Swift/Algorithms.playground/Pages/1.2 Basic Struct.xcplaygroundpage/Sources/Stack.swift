import Foundation
import UIKit

public struct Stack<Elememt> {
    public mutating func push(_ element: Elememt) {
        array.append(element)
    }
    
    public mutating func pop() -> Elememt? {
        return array.popLast()
    }
    
    public func peak() -> Elememt? {
        return array.last
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

extension Stack: CustomStringConvertible where Elememt: CustomStringConvertible {
    public var description: String {
        let title = name.isEmpty ? "Stack" : name
        let prefixDes = "-----\(title)-----\n"
        var innerDes = ""
        for _ in 1...title.count {
            innerDes += "-"
        }
        let suffixDes = "\n-----" + innerDes + "-----\n"
        let stackElements = array.map { $0.description }.reversed().joined(separator: "\n")
        return prefixDes + stackElements + suffixDes
    }
}
