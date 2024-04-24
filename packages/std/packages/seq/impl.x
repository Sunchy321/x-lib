impl<T, dyn N> Sequence {
    func map(f: T -> U): U[dyn N] {
        let result = []

        for let v : this {
            result <~ f(v)
        }

        result as some _
    }
}