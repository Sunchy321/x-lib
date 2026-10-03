trait Sequence<T> : RangeBound {
    type Item = T;
    type Output = usize;
    type Iterator: core::Iterator;

    let isEmpty => this.size == 0;

    let iter: Iterator;
    let size: usize { get };

    func caret(&this) -> Output => 0;
    func dollar(&this) -> Output => this.size;
}