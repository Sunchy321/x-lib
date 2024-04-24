trait<T, dyn N> Sequence {
    type Value = T;
    type Iterator : core.Iterator<T>;

    func iterator() -> Iterator;
    func size() => N;
}

trait<T> Iterator {
    type Value = T;

    func next(this: mut) -> T?;
}