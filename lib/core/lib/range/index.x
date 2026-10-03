import this.iterator;

enum Error: ErrorCode {
    InvalidBounds
}

class Range<T : Numeric> {
    let start: T;
    let end: T;
}

impl<T> Range<T> {
    init<T>(start: T, end: T) throw(Error) -> self<T> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

impl<T> Range<T> : Include<T> {
    func include(&this, value: T) => this.start <= value && value <= this.end;
}

impl<T> Range<T> : Sequence<T> {
    type Iterator = RangeIterator<T>;

    let iter => RangeIterator(this.start, this.end);
    let size => this.end - this.start;
}

class ClosedRange<T : Numeric> {
    let start: T;
    let end: T;
}

impl<T> ClosedRange<T> {
    init<T>(start: T, end: T) throw(Error) -> self<T> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

impl<T> ClosedRange<T> : Include<T> {
    func include(&this, value: T) => this.start <= value && value <= this.end;
}

impl<T> ClosedRange<T> : Sequence<T> {
    type Iterator = ClosedRangeIterator<T>;

    let iter => ClosedRangeIterator(this.start, this.end);
    let size => (this.end - this.start) + 1;
}
