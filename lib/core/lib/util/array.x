impl<T, dyn N> T[dyn N] : Sequence<T, dyn N> {
    type Iterator = ArrayIterator<T>;

    type<U, dyn M> self = U[dyn M];

    let isEmpty => this.size == 0;

    func iterator() => ArrayIterator(this);
}

class ArrayIterator<T> {
    let index: uint;
    let array: T[]&;

    init(ref array: T[]) {
        this.array = array;
        this.index = 0;
    }
}

impl<T> ArrayIterator : Iterator {
    func next(this: mut) -> T? {
        if this.index < this.array.size {
            let value = this.array[this.index];
            this.index++;
            value
        } else {
            nil
        }
    }
}

impl<T, dyn N> T{dyn N} {
    func init<T>(repeating v: T, count n: uint) -> T[dyn n] {
        let mut array = [];

        for let i : 1 .. n {
            array <~ v;
        }

        this = array;
    }

    func entries() -> (uint, T)[dyn N] {
        this.map { ($index, $0) }
    }
}