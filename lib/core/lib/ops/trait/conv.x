trait Into<T> {
    func into(this) -> T;
}

trait From<T> {
    func from(value: T) -> self;
}

impl<T> T : Into<T> {
    func into(this) => this;
}

impl<T, U> T : Into<U> if U is From<T> {
    func into(this) => U::from(this);
}

impl<T> T : From<T> {
    func from(value: T) => value;
}

impl<T> T : From<never> {
    func from(_value: never) => unreachable!();
}

trait TryInto<T> {
    type Error;

    func tryInto(this) throw(Error) -> T;
}

trait TryFrom<T> {
    type Error;

    func tryFrom(value: T) throw(Error) -> self;
}

impl<T, U> T : TryInto<U> if U is TryFrom<T> {
    type Error = U::Error;

    func tryInto(this) throw(Error) -> U {
        try U::tryFrom(this)
    }
}

impl<T, U> T : TryFrom<U> if U is Into<T> {
    type Error = never;

    func tryFrom(value: U) -> self {
        value.into()
    }
}