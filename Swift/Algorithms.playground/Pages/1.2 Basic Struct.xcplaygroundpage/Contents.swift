//: [Previous](@previous)

import Foundation

testStack()
testQueue()
testImprovedQueue()

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
//: [Next](@next)
