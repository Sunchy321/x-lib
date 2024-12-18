trait<T> Sequence {
    type Value = T;
    type Iterator : core::Iterator<T>;

    let isEmpty: bool;

    func iter(&this) -> Iterator;
    let size: usize { get };
}

impl Sequence : RangeBound {
    type Output = usize;

    func caret(&this) => 0;
    func dollar(&this) => this.size;
}