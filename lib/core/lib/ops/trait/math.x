trait Add<R = self> {
    type Output;
    func add(this, other: R) -> Output;
}

trait Subtract<R = self> {
    type Output;
    func subtract(this, other: R) -> Output;
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
