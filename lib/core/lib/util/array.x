impl<T> T[] : Sequence<T> {
    type Iterator = ArrayIterator<T>;

    type<U> self = U[];

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

impl<T> T[] {
    func init<T>(repeating v: T, count n: usize) -> T[] {
        let mut array = [];

        for let i : 1 .. n {
            array <~ v;
        }

        this = array;
    }

    func entries() -> (uint, T)[] {
        this.map { ($index, $0) }
    }
}