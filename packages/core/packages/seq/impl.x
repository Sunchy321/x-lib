impl<T> T[] : Sequence<T> {
    type Iterator = ArrayIterator<T>;

    func iterator() => ArrayIterator(this);
}

class ArrayIterator<T> {
    let index: uint;
    let array: T[]&;

    init(array: T[]&) {
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