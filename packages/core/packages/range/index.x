import this.iterator;

partial enum Error { InvalidBounds }

class Range<T is Numeric, dyn S: T, dyn E: T> {
    let start: T;
    let end: T;

    init(start: T, end: T) -> self<T, dyn start, dyn end> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }

    func operator in(value: T) => this.start <= value < this.end;
}

class ClosedRange<T is Numeric, dyn S: T, dyn E: T> {
    let start: T;
    let end: T;

    init(start: T, end: T) -> self<T, dyn start, dyn end> {
        if start > end {
            throw .InvalidBounds;
        }

        this.start = start;
        this.end = end;
    }

    func operator in(value: T) => this.start <= value <= this.end;
}

impl<T, dyn S, dyn E> Range<T, dyn S, dyn E> : Sequence<T, dyn E - S> {
    type Iterator = RangeIterator<T>;

    let iterator => RangeIterator(this.start, this.end);
    let size => this.end - this.start;
}

impl<T, dyn S, dyn E> ClosedRange<T, dyn S, dyn E> : Sequence<T, dyn E - S> {
    type Iterator = ClosedRangeIterator<T>;

    let iterator => ClosedRangeIterator(this.start, this.end);
    let size => (this.end - this.start)+!;
}

public func<T> operator..(lhs: T, rhs: T) => Range(lhs, rhs);
public func<T> operator..=(lhs: T, rhs: T) => ClosedRange(lhs, rhs);