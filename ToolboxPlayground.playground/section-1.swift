// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Array {
    /// Decomposes an array into a tuple containing the first element,
    /// and the rest of the array. If the array is empty, it returns nil.
    ///
    var decompose: (car: T, cdr: [T])? {
        return self.count > 0 ? (self[0], Array(self[1..<self.count])) : nil
    }
}

// Array.ecompose test
var mem:[Int:Int] = [0:0]

func sum(input: [Int]) -> Int {
    if let (head, tail) = input.decompose {
        return head + sum(tail)
    } else {
        return 0
    }
}

for x in 1..<100 {
    if sum(Array(1...x)) == 300 {
        println(x)
        break
    }
}