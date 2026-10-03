trait AddAssign<R = self> {
    func addAssign(&mut this, other: R) -> void;
}

trait SubtractAssign<R = self> {
    func subtractAssign(&mut this, other: R) -> void;
}

trait MultiplyAssign<R = self> {
    func multiplyAssign(&mut this, other: R) -> void;
}

trait DivideAssign<R = self> {
    func divideAssign(&mut this, other: R) -> void;
}

trait ModuloAssign<R = self> {
    func moduloAssign(&mut this, other: R) -> void;
}

trait ShiftLeftAssign<R = self> {
    func shiftLeftAssign(&mut this, other: R) -> void;
}

trait ShiftRightAssign<R = self> {
    func shiftRightAssign(&mut this, other: R) -> void;
}

trait BitwiseAndAssign<R = self> {
    func bitwiseAndAssign(&mut this, other: R) -> void;
}

trait BitwiseXorAssign<R = self> {
    func bitwiseXorAssign(&mut this, other: R) -> void;
}

trait BitwiseOrAssign<R = self> {
    func bitwiseOrAssign(&mut this, other: R) -> void;
}

trait AppendRight<T> {
    func appendRight(&mut this, other: T) -> void;
}

trait AppendLeft<T> {
    func appendLeft(&mut this, other: T) -> void;
}