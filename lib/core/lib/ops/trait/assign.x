trait AddAssign<R = self> {
    func addAssign(&mut this, other: R);
}

trait SubstractAssign<R = self> {
    func substractAssign(&mut this, other: R);
}

trait MultiplyAssign<R = self> {
    func multiplyAssign(&mut this, other: R);
}

trait DivideAssign<R = self> {
    func divideAssign(&mut this, other: R);
}

trait ModuloAssign<R = self> {
    func moduloAssign(&mut this, other: R);
}

trait ShiftLeftAssign<R = self> {
    func shiftLeftAssign(&mut this, other: R);
}

trait ShiftRightAssign<R = self> {
    func shiftRightAssign(&mut this, other: R);
}

trait BitwiseAndAssign<R = self> {
    func bitwiseAndAssign(&mut this, other: R);
}

trait BitwiseXorAssign<R = self> {
    func bitwiseXorAssign(&mut this, other: R);
}

trait BitwiseOrAssign<R = self> {
    func bitwiseOrAssign(&mut this, other: R);
}

trait AppendRigth<T> {
    func appendRigth(&mut this, other: T);
}

trait AppendLeft<T> {
    func appendLeft(&mut this, other: T);
}