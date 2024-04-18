import this.iterator;

partial enum Error { InvalidBounds }

class Range<T: Numeric> {
    let start: T;
    let end: T;

    init(start: T, end: T) {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }

    func operator in(value: T) => value >= this.start && value < this.end;
}

class ClosedRange<T: Numeric> {
    let start: T;
    let end: T;

    init(start: T, end: T) {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }

    func operator in(value: T) => value >= this.start && value <= this.end;
}

impl<T> Range<T> : Sequence<T> {
    type Iterator = RangeIterator<T>;

    let iterator => RangeIterator(this.start, this.end);
    let size => this.end - this.start;
}

impl<T> ClosedRange<T> : Sequence<T> {
    type Iterator = ClosedRangeIterator<T>;

    let iterator => ClosedRangeIterator(this.start, this.end);
    let size => (this.end - this.start)+!;
}

public func<T> operator..(lhs: T, rhs: T) => Range(lhs, rhs);
public func<T> operator..=(lhs: T, rhs: T) => ClosedRange(lhs, rhs);