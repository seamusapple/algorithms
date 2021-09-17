//: [Previous](@previous)

import Foundation

testStack()

// Mark: - Test Stack
func testStack() {
    var fruits = Stack<String>()
    fruits.name = "Fruits"
    fruits.push("Apple")
    fruits.push("Banana")
    fruits.push("Watermelon")
    fruits.push("Peach")
    print(fruits)
    
    var numbers = Stack<Int>()
    numbers.name = "Numbers"
    numbers.push(1)
    numbers.push(2)
    numbers.push(3)
    numbers.pop()
    print(numbers)
}
//: [Next](@next)
