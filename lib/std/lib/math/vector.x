import std.seq;

enum Error {
    SizeMismatch
}

class<T is Numeric> Vector {
    let array: T[];

    init(array: T[]) -> self<T> {
        if array.size != N {
            throw .SizeMismatch;
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