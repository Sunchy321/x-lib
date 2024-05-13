class RangeIterator<T> {
    let mut curr: T;
    let end: T;

    init(start: T, end: T) {
        this.curr = start;
        this.end = end;
    }
}

class ClosedRangeIterator<T> {
    let mut curr: T;
    let end: T;
    let exhausted = false;

    init(start: T, end: T) {
        this.curr = start;
        this.end = end;
    }
}

impl RangeIterator<T> : Iterator<T> {
    func next(this: mut) -> T? {
        if this.curr >= this.end {
            nil
        } else {
            let curr = this.curr;
            this.curr++;
            curr
        }
    }
}

impl ClosedRangeIterator<T> : Iterator<T> {
    func next(this: mut) -> T? {
        if this.curr >= this.end {
            if this.exhausted then nil else { this.exhausted = true; this.end }
        } else {
            let curr = this.curr;
            this.curr++;
            curr
        }
    }
}