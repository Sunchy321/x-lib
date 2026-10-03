class Quantity<U : Unit, N : Numeric> {
    let value: N,
}

impl<U, N> Quantity<U, N> {
    type Value = N;
    type Unit = U;

    init() => self(value: N::default);

    init<N>(value: N) => self<U, N>(value: value);
}

impl<U, N, I: Into<Quantity<U, N>>> Quantity<U, N> : AddAssign<I> {
    func addAssign(&mut this, other: I) -> void {
        this.value += other.value;
    }
}

impl<U, N, I: Into<Quantity<U, N>>> Quantity<U, N> : SubtractAssign<I> {
    func subtractAssign(&mut this, other: I) -> void {
        this.value -= other.value;
    }
}

impl<U, N, I: Into<Quantity<U, N>>> Quantity<U, N> : MultiplyAssign<I> {
    func multiplyAssign(&mut this, other: I) -> void {
        this.value *= other.value;
    }
}

impl<U, N, I: Into<Quantity<U, N>>> Quantity<U, N> : DivideAssign<I> {
    func divideAssign(&mut this, other: I) -> void {
        this.value /= other.value;
    }
}

impl<U, N : Numeric> N : Into<Quantity<U, N>> {
    func into(this) => Quantity<U>(this);
}