trait<T> Sequence {
    type Value = T;
    type Iterator : core.Iterator<T>;

    func iterator() -> Iterator;
}

trait<T> Iterator {
    type Value = T;

    func next(this: mut) -> T?;
}