trait Add<R = self> {
    type Output;
    func add(this, other: R) -> Output;
}

trait Substract<R = self> {
    type Output;
    func substract(this, other: R) -> Output;
}

trait Multiply<R = self> {
    type Output;
    func multiply(this, other: R) -> Output;
}

trait Divide<R = self> {
    type Output;
    func divide(this, other: R) -> Output;
}

trait Modulo<R = self> {
    type Output;
    func modulo(this, other: R) -> Output;
}
