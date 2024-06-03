import this.iterator;

enum Error {
    InvalidBounds
}

class Range<T is Numeric> {
    let start: T;
    let end: T;
}

impl<T> Range<T> {
    init<T>(start: T, end: T) -> self<T> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

impl<T> Range<T> : Include<T> {
    func include(&this, value: T) => this.start <= value <= this.end;
}

impl<T> Range<T> : Sequence<T> {
    type Iter = RangeIterator<T>;

    let iter => RangeIterator(this.start, this.end);
    let size => this.end - this.start;
}

class ClosedRange<T is Numeric> {
    let start: T;
    let end: T;
}

impl<T> ClosedRange<T> {
    init<T>(start: T, end: T) -> self<T> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

impl<T> ClosedRange<T> : Include<T> {
    func include(value: T) => this.start <= value <= this.end;
}

impl<T> ClosedRange<T> : Sequence<T> {
    type Iter = ClosedRangeIterator<T>;

    let iter => ClosedRangeIterator(this.start, this.end);
    let size => (this.end - this.start)+!;
}
