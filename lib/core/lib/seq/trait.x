trait<T> Sequence {
    type Value = T;
    type Iterator : core::Iterator<T>;

    type<U> self;

    let isEmpty: bool;

    func iter(&this) -> Iterator;
    func size(&this) -> usize;
}