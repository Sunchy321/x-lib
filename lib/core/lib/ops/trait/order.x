enum Order {
    Less,
    Equal,
    Greater.
}

impl Order {
    let reverse: self => match this {
        .Less -> .Greater;
        .Equal -> .Equal;
        .Greater -> .Less;
    }
}

trait PartialEqual<R = self> {
    func partialEqual(&this, rhs: R&) -> bool;

    func partialNotEqual(&this, rhs: R&) -> bool {
        !this.partialEqual(rhs)
    }
}

trait Equal : PartialEqual<self> {
    func equal(&this, rhs: self&) -> bool {
        this.partialEqual(rhs)
    }

    func notEqual(&this, rhs: self&) -> bool {
        this.partialNotEqual(rhs)
    }
}

trait PartialOrdered<R = self> {
    func partialCompare(&this, rhs: R&) -> Order?;

    func lessThan(&this, rhs: R&) -> bool {
        this.partialCompare(rhs) == .Less
    }

    func lessEqual(&this, rhs: R&) -> bool {
        this.partialCompare(rhs) != .Greater
    }

    func greaterThan(&this, rhs: R&) -> bool {
        this.partialCompare(rhs) == .Greater
    }

    func greaterEqual(&this, rhs: R&) -> bool {
        this.partialCompare(rhs) != .Less
    }
}

trait Ordered : PartialOrdered<self> {
    func compare(&this, rhs: self&) -> Order {
        this.partialCompare(rhs)!
    }

    func min(lhs: self, rhs: self) -> self {
        if lhs < rhs then lhs else rhs
    }

    func max(lhs: self, rhs: self) -> self {
        if lhs > rhs then lhs else rhs
    }

    func clamp(this, min: self, max: self) -> self {
        if this < min then min
        else if this > max then max
        else this
    }
}