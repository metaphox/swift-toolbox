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