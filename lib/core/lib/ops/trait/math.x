trait Add<R = self> {
    type Output;
    func add(this, other: R) -> self::Output;
}

trait Substract<R = self> {
    type Output;
    func substract(this, other: R) -> self::Output;
}

trait Multiply<R = self> {
    type Output;
    func multiply(this, other: R) -> self::Output;
}

trait Divide<R = self> {
    type Output;
    func divide(this, other: R) -> self::Output;
}

trait Modulo<R = self> {
    type Output;
    func modulo(this, other: R) -> self::Output;
}

trait AddAssign<R = self> {
    func addAssign(this: mut, other: R);
}

trait SubstractAssign<R = self> {
    func substractAssign(this: mut, other: R);
}

trait MultiplyAssign<R = self> {
    func multiplyAssign(this: mut, other: R);
}

trait DivideAssign<R = self> {
    func divideAssign(this: mut, other: R);
}

trait ModuloAssign<R = self> {
    func moduloAssign(this: mut, other: R);
}