trait LogicAnd<R = self> {
    type Output;
    func logicAnd(this, lazy rhs: R) -> Output;
}

trait LogicOr<R = self> {
    type Output;
    func logicOr(this, lazy rhs: R) -> Output;
}