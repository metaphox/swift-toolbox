// Some tools & snippets

extension Array {
    /// Decomposes an array into a tuple containing the first element,
    /// and the rest of the array. If the array is empty, it returns nil.
    ///
    var decompose: (car: T, cdr: [T])? {
        return self.count > 0 ? (self[0], Array(self[1..<self.count])) : nil
    }
}
