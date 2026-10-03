class Quantity<U : Unit, N : Numeric> {
    value: N,
}

impl<U, N> Quantity<U, N> {
    type Value = N;
    type Unit = U;

    init() => self(value: N::default);

    init<N>(value: N) => self<U, N>(value: value);

    static func operator+=(&mut this, rhs: impl Into<self>) {
        this.value += rhs.value;
    }

    static func operator-=(&mut this, rhs: impl Into<self>) {
        this.value -= rhs.value;
    }

    static func operator*=(&mut this, rhs: impl Into<self>) {
        this.value *= rhs.value;
    }

    static func operator/=(&mut this, rhs: impl Into<self>) {
        this.value /= rhs.value;
    }
}

impl<U, N : Numeric> N : Into<Quantity<U, N>> {
    func into(this) => Quantity<U>(this);
}