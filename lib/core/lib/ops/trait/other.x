trait RangeTo<R = self> {
    type Output;
    func rangeTo(this, rhs: R) -> Output;
}

trait ClosedRangeTo<R = self> {
    type Output;
    func closedRangeTo(this, rhs: R) -> Output;
}

trait Concat<I> {
    type Output;
    func concat(this, rhs: I) -> Output;
}

trait Include<V> {
    func include(&this, value: V) -> bool;
}

trait RangeBound {
    type Output;
    func caret(&this) -> Output;
    func dollar(&this) -> Output;
}