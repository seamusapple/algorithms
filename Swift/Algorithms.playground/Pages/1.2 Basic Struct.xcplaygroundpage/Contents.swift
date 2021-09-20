//: [Previous](@previous)

import Foundation

testStack()
testQueue()
testImprovedQueue()
testLinkedList()

// Mark: - Test Stack
func testStack() {
    var fruits = Stack<String>()
    fruits.name = "Stack Fruits"
    fruits.push("Apple")
    fruits.push("Banana")
    fruits.push("Watermelon")
    fruits.push("Peach")
    print(fruits)
    
    var numbers = Stack<Int>()
    numbers.name = "Stack Numbers"
    numbers.push(1)
    numbers.push(2)
    numbers.push(3)
    numbers.pop()
    print(numbers)
}

func testQueue() {
    var fruits = Queue<String>()
    fruits.name = "Queue Fruits"
    fruits.enqueue("Apple")
    fruits.enqueue("Banana")
    fruits.enqueue("Watermelon")
    fruits.enqueue("Peach")
    fruits.dequeue()
    fruits.dequeue()
    fruits.dequeue()
    fruits.dequeue()
    fruits.dequeue()
    print(fruits)
    
    var nunbers = Queue<Int>()
    nunbers.name = "Queue Numbers"
    nunbers.enqueue(1)
    nunbers.enqueue(2)
    nunbers.enqueue(3)
    nunbers.dequeue()
    print(nunbers)
}

func testImprovedQueue() {
    var names = ImprovedQueue<String>()
    names.enqueue("Ramsey")
    print(names.count)
    print(names)
    
    names.enqueue("Dong")
    names.enqueue("Pan")
    print(names.count)
    print(names)
    
    names.dequeue()
    print(names.count)
    print(names)
    
    names.dequeue()
    print(names.count)
    print(names)
    
    names.dequeue()
    print(names.count)
    print(names)
    
    names.enqueue("Will")
    print(names.count)
    print(names)
    
    names.dequeue()
    print(names.count)
    print(names)
}

func testLinkedList() {
    let list = LinkedList<String>()
    list.isEmpty   // true
    list.first     // nil
    list.count     // 0

    list.appendToTail("Swift")
    list.isEmpty         // false
    list.first!.value    // "Swift"
    list.last!.value     // "Swift"
    list.count           //1

    list.appendToTail("is")
    list.first!.value    // "Swift"
    list.last!.value     // "is"
    list.count           // 2

    list.appendToTail("great")
    list.first!.value    // "Swift"
    list.last!.value     // "great"
    list.count           // 3

    print(list)
    //[0]Swift
    //[1]is
    //[2]Great

    list.node(at: 0)?.value // Swift
    list.node(at: 1)?.value // is
    list.node(at: 2)?.value // great
    list.node(at: 3)?.value // nil


    list.insert("language", at: 1)
    print(list)
    //[0]Swift
    //[1]language
    //[2]is
    //[3]great


    list.removeNode(list.first!)
    print(list)
    //[0]language
    //[1]is
    //[2]great


    list.remove(at: 1)
    print(list)
    //[0]language
    //[1]great

    list.removeLast()
    print(list)
    //[0]language

    list.insertToHead("study")
    list.count             // 2
    print(list)
    //[0]study
    //[1]language


    list.removeAll()
    print(list) //linked list is empty

    list.insert("new", at: 3)
    print(list)
    //[0]new

    list.insert("new", at: 3) //out of range
    print(list)
    //[0]new

    list.insert("new", at: 1)
    print(list)
    //[0]new
    //[1]new

}
//: [Next](@next)
