class RangeIterator<T> {
    let mut curr: T;
    let end: T;
}

impl<T> RangeIterator<T> {
    init(start: T, end: T) => self(curr: start, end);
}

impl<T> RangeIterator<T> : Iterator {
    type Item = T;

    func next(&mut this) -> Item? {
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
    let mut curr: T;
    let end: T;
    let mut exhausted: bool;
}

impl<T> ClosedRangeIterator<T> {
    init(start: T, end: T) => self(curr: start, end: end, exhausted: false);
}

impl<T> ClosedRangeIterator<T> : Iterator {
    type Item = T;

    func next(&mut this) -> Item? {
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