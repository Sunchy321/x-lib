import std.seq;

enum VectorError: ErrorCode {
    SizeMismatch
}

class<T is Numeric, N: usize> Vector {
    let array: T[];

    init(array: T[]) throw(VectorError) -> self<T> {
        if array.size != N {
            throw .SizeMismatch;
        }

        self(array: array);
    }
}

impl<T, N> Vector<T, N> : Dollar {
    func dollar() => N;
}

impl<T, N> Vector<T, N> : Iterable {
    type Iter : typeof(self::array)::Iter;

    let iter => this.array.iter();
}

impl<T, N> Vector<T, N> : Add {
    type Output = self;
    func add(this, rhs: self) => zip(this.array.intoIter(), rhs.array.intoIter()).map { $0.0 + $0.1 }.collect();
}

impl<T, N> Vector<T, N> : Subtract {
    type Output = self;
    func substract(this, rhs: self) => zip(this.array.intoIter(), rhs.array.intoIter()).map { $0.0 - $0.1 }.collect();
}

impl<T, N> Vector<T, N> : Multiply {
    type Output = self;
    func multiply(this, rhs: self) => zip(this.array.intoIter(), rhs.array.intoIter()).map { $0.0 * $0.1 }.collect();
}

impl<T, N> Vector<T, N> : Multiply<T> {
    type Output = self;
    func multiply(this, rhs: T) => this.array.map { $0 * rhs };
}

impl<T, N> T : Multiply<Vector<T, N>> {
    type Output = Vector<T, N>;
    func multiply(this, rhs: Vector<T, N>) => rhs.array.map { this * $0 };
}

impl<T, N> Vector<T, N> : Divide {
    type Output = self;
    func divide(this, rhs: self) => zip(this.array.intoIter(), rhs.array.intoIter()).map { $0.0 / $0.1 }.collect();
}