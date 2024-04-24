import std.seq;

partial enum core.Error {
    VectorSizeMismatch
}

class<T is Numeric, dyn N: uint> Vector {
    let array: T[];

    init(array: T[]) -> self<T, dyn array.size> {
        if array.size != N {
            throw .VectorSizeMismatch;
        }

        self.array = array;
    }

    func operator$() => N;
}

impl<T, N> Vector : Sequence<T> {
    type Iterator : core.ArrayIterator<T>;

    func iterator() => this.array.iterator();
}

impl<T, N> Vector : Numeric {
    static func operator+(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 + $0.1 });
    static func operator-(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 - $0.1 });
}