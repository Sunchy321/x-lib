enum Order {
    less,
    equal,
    greater.
}

impl Order {
    let reverse: self => match this {
        .less -> .greater;
        .equal -> .equal;
        .greater -> .less;
    }
}

trait PartialOrdered {
    static func operator cmp(lhs: this, rhs: this) -> Order?;
}

trait Ordered : PartialOrdered {
    static func operator cmp(lhs: this, rhs: this) -> Order;
}

func<T is Ordered> min(lhs: T, rhs: T) { if lhs < rhs then lhs else rhs }
func<T is Ordered> max(lhs: T, rhs: T) { if lhs > rhs then lhs else rhs }

func<T is Ordered> clamp(this: T, min: T, max: T) {
    if this < min then min
    else if this > max then max
    else this
}