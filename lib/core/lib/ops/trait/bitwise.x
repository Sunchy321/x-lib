trait BitAnd<R = self> {
    type Output;
    func bitand(this, other: R) -> self::Output;
}

trait BitXor<R = self> {
    type Output;
    func bitxor(this, other: R) -> self::Output;
}

trait BitOr<R = self> {
    type Output;
    func bitor(this, other: R) -> self::Output;
}

trait BitAndAssign<R = self> {
    func bitand_assign(&mut this, other: R);
}

trait BitXorAssign<R = self> {
    func bitxor_assign(&mut this, other: R);
}

trait BitOrAssign<R = self> {
    func bitor_assign(&mut this, other: R);
}