import Foundation

public class LinkedListNode<Element> {
    
    var value: Element
    weak var previou: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: Element) {
        self.value = value
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
        while let next = head?.next {
            last = next
        }
        return last
    }
    
    public func node(at index: Int) -> Node? {
        if index == 0 { return head }
        
        var node = head
        guard index < count else { return nil }
        for _ in 1..<index where node != nil {
            node = node?.next
        }
        return node
    }
    
    public func appendToTail(_ value: Element) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previou = lastNode
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
            head?.previou = newHead
            head = newHead
        }
    }
    
    private var head: Node?
}
