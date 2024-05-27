class RangeIterator<T> {
    mut curr: T;
    end: T;
}

impl<T> RangeIterator<T> {
    init(start: T, end: T) => self { curr: start, end };
}

impl RangeIterator<T> : Iterator {
    type Item = T;

    func next(this: mut) -> self::Item? {
        if this.curr >= this.end {
            nil
        } else {
            let curr = this.curr;
            this.curr++;
            some curr
        }
    }
}

class ClosedRangeIterator<T> {
    mut curr: T;
    end: T;
    mut exhausted: bool;
}

impl<T> ClosedRangeIterator<T> {
    init(start: T, end: T) => self { curr: start, end, exhausted: false };
}

impl ClosedRangeIterator<T> : Iterator {
    type Item = T;

    func next(this: mut) -> self::Item? {
        if this.curr >= this.end {
            if this.exhausted {
                nil
            } else {
                this.exhausted = true;
                some this.end
            }
        } else {
            let curr = this.curr;
            this.curr++;
            some curr
        }
    }
}