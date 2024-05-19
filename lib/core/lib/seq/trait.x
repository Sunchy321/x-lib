trait<T> Sequence {
    type Value = T;
    type Iterator : core::Iterator<T>;

    type<U> self;

    let isEmpty: bool;

    func iter() -> Iterator;
    func size() => N;
}

trait<T> Iterator {
    type Value = T;

    func next(this: mut) -> T?;
}
