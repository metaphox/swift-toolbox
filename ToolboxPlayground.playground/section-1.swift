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

// Array.decompose test
var mem:[Int:Int] = [0:0]

func sum(input: [Int]) -> Int {
    if let (head, tail) = input.decompose {
        return head + sum(tail)
    } else {
        return 0
    }
}


/* string extension */

extension String {
    
    /// return the ith character as string. return nil if the index is out of range
    subscript(i: Int) -> String? {
        let cnt = countElements(self)
        if(i >= 0){
            return i > cnt - 1 ? nil : String(self[advance(startIndex, i)])
        }
        //else: i < 0
        return i < (-cnt) ? nil : String(self[advance(startIndex, cnt + i)])
    }
    
    /// return substring within the integer range. trim the input range if it's out of string length range.
    subscript(range: Range<Int>) -> String {
        let start = range.startIndex < 0 ? 0 : range.startIndex
        let cnt = countElements(self)
        let end = range.endIndex > cnt ? cnt : range.endIndex
        let r = Range<String.Index>(start: advance(startIndex, start), end:advance(startIndex, end))
        return self.substringWithRange(r)
    }
    
    subscript(strings: String) -> String? {
        return ""
    }
}

let testString = "abcdefghijk"
let cnt = countElements(testString)

""[0] == nil
""[-1] == nil
testString[cnt+1] == nil
testString[cnt] == nil
testString[cnt-1] == "k"
testString[0] == "a"
testString[-0] == "a"
testString[1] == "b"
testString[-1] == "k"
testString[-cnt] == "a"
testString[-cnt-1] == nil


println("123"[1])
println("123"[1111])
println("123123123"[-1...3])
println("123123123"[-1...23])
println("123123123"["123"])
println("123123123"["123"])