import this.iterator : RangeIterator, ClosedRangeIterator;

enum Error { InvalidBounds }

class Range<T> {
    let start: T;
    let end: T;

    init(start: T, end: T) {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

class ClosedRange<T> {
    let start: T;
    let end: T;

    init(start: T, end: T) {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }
}

impl<T> Range<T> : Iterator<T> {
    type Iterator = RangeIterator<T>;

    let iterator => RangeIterator(this.start, this.end);
    let size => this.end - this.start;
}

impl<T> Range<T> : Iterator<T> {
    type Iterator = ClosedRangeIterator<T>;

    let iterator => ClosedRangeIterator(this.start, this.end);
    let size => (this.end - this.start)+!;
}

public func<T> operator..(lhs: T, rhs: T) { Range(lhs, rhs); }
public func<T> operator..=(lhs: T, rhs: T) { ClosedRange(lhs, rhs); }