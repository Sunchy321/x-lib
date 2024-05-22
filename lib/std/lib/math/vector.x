import std.seq;

enum VectorError: ErrorCode {
    SizeMismatch
}

class<T is Numeric, N: usize> Vector {
    let array: T[];

    init(array: T[]) -> self<T> {
        if array.size != N {
            throw .SizeMismatch;
        }

        self.array = array;
    }

    func operator$() => N;
}

impl<T, N> Vector<T, N> : Iterable {
    type Iter : typeof(this.array)::Iter;

    let iter => this.array.iter();
}

impl<T, N> Vector<T, N> : Numeric {
    static func operator+(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 + $0.1 });
    static func operator-(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 - $0.1 });

    static func operator*(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 * $0.1 });
    static func operator*(lhs: self, rhs: T) => self(lhs.array.map { $0 * rhs });
    static func operator*(lhs: T, rhs: self) => self(rhs.array.map { lhs * $0 });

    static func operator/(lhs: self, rhs: self) => self(zip(lhs.array, rhs.array).map { $0.0 / $0.1 });
}