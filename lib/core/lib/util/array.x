impl<T> T[] : Sequence {
    type Item = T;

    type Iterator = ArrayIterator<T>;

    let isEmpty => this.size == 0;

    func iterator() => ArrayIterator(&this);
}

class ArrayIterator<T> {
    let index: usize;
    let array: T[]&;

    init<T>(array: T[]&) -> self<T> {
        this.array = &array;
        this.index = 0;
    }
}

impl<T> ArrayIterator<T> : Iterator {
    type Item = T;

    func next(this: mut) {
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

    func entries() -> (usize, T)[] {
        this.map { ($index, $0) }
    }
}