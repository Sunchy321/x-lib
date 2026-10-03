impl<T> T[] : Sequence {
    type Item = T;

    type Iterator = ArrayIterator<T>;

    let isEmpty => this.size == 0;

    let iter => ArrayIterator(this);
}

class ArrayIterator<T> {
    let mut index: usize;
    let array: T[];
}

impl<T> ArrayIterator<T> {
    init(array: T[]) => self(index: 0, array);
}

impl<T> ArrayIterator<T> : Iterator {
    type Item = T;

    func next(&mut this) -> Item? {
        if this.index < this.array.size {
            let value = this.array[this.index];
            this.index++;
            value
        } else {
            nil
        }
    }
}

impl<T: Clone> T[] {
    func init<T>(value v: T, count n: usize) -> T[] {
        let mut array = [];

        for let i : 1 .. n {
            array <~ v.clone();
        }

        array
    }

    func entries(this) -> (usize, T)[] {
        this.map { ($index, $0) }
    }
}