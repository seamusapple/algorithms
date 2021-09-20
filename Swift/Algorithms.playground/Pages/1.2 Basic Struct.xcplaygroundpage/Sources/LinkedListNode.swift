import Foundation

public class LinkedListNode<Element> {
    
    public var value: Element
    public weak var previous: LinkedListNode?
    public var next: LinkedListNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
        return previous == nil
            ? "First and Current: \(value)"
            : next == nil ? "Previous: \(previous!.value), Current: \(value) and Last" : "Previous: \(previous!.value), Current: \(value), Next: \(next!.value)"
    }
}

public class LinkedList<Element> {
    public typealias Node = LinkedListNode<Element>
    
    public var isEmpty: Bool { head == nil }
    
    public var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var first: Node? { head }
    public var last: Node? {
        guard !isEmpty else { return nil }
        
        var last = head
        while let next = last?.next {
            last = next
        }
        return last
    }
    
    public func node(at index: Int) -> Node? {
        if index == 0 { return head }
        
        var node = head?.next
        guard index < count else { return nil }
        for _ in 1..<index where node != nil {
            node = node?.next
        }
        return node
    }
    
    // Insert Node
    public func appendToTail(_ value: Element) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func insertToHead(_ value: Element) {
        let newHead = Node(value: value)
        if head == nil {
            head = newHead
        } else {
            newHead.next = head
            head?.previous = newHead
            head = newHead
        }
    }
    
    public func insert(_ value: Element, at index: Int) {
        guard index >= 0 else {
            print("\nInvalid Input Index")
            return
        }
        
        let newNode = Node(value: value)
        
        guard !isEmpty else { head = newNode; return }
        
        if index == 0 {
            insertToHead(value)
        } else {
            guard index <= count else {
                print("\nIndex Out Of Range")
                return
            }
            
            let previous = node(at: index-1)
            let next = previous?.next
            previous?.next = newNode
            newNode.previous = previous
            newNode.next = next
            next?.previous = newNode
        }
    }
    
    // Remove Node
    public func removeAll() {
        head = nil
    }
    
    public func removeLast() -> Element? {
        guard !isEmpty else { return nil }
        return removeNode(last!)
    }
    
    public func removeNode(_ node: Node) -> Element? {
        guard head != nil else {
            print("\nLinked list is Empty")
            return nil
        }
        
        let prev = node.previous
        let next = node.next
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func remove(at index: Int) -> Element? {
        guard head != nil else {
            print("\nLinked list is Empty")
            return nil
        }
        
        guard let node = node(at: index) else { return nil }
        return removeNode(node)
    }
    
    public init() { }
    
    private var head: Node?
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        return printAllNodes()
    }
    
    private func printAllNodes() -> String {

        guard head != nil else { return "\nLinked list is Empty" }

        var description = "\nStart printing all nodes:"
        var node = head
        for index in 0..<count where node != nil {
            description.append("\n[\(index)]: \(node!.description)")
            node = node!.next
        }
        return description
    }
}
