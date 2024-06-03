trait ShiftLeft<R = self> {
    type Output;
    func shiftLeft(this, other: R) -> Output;
}

trait ShiftRight<R = self> {
    type Output;
    func shiftRight(this, other: R) -> Output;
}

trait BitAnd<R = self> {
    type Output;
    func bitand(this, other: R) -> Output;
}

trait BitXor<R = self> {
    type Output;
    func bitxor(this, other: R) -> Output;
}

trait BitOr<R = self> {
    type Output;
    func bitor(this, other: R) -> Output;
}
