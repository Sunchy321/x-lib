trait<T> Sequence {
    type Value = T;
    type Iterator : core::Iterator<T>;

    type<U> self;

    let isEmpty: bool;

    func iter() -> Iterator;
    func size() -> usize;
}