import mem;

@__intrinsic(optional)
enum Optional<T> {
    @__intrinsic(nil)
    Nil,

    @__intrinsic(some)
    Some(T),
}

impl<T> T? {
    let isSome => this != nil;
    let isNil => this == nil;

    func asRef(&this) => &this?;

    func map<U>(this, f: T -> U) => f(this?);
    func map<U>(this, f: T -> U, or or: U) => f(this ?? or);

    func inspect(this, f: T -> ()) => f(this?);

    func expect(this, failMessage: string) => if this == nil then panic(failMessage) else this!;

    func and<U>(this, other: U?) => if this == nil then nil else other;
    func andThen<U>(this, f: T -> U?) => if this == nil then nil else f(this!);

    func or(this, other: T?) => this ?? other;
    func orElse(this, f: () -> T?) => this ?? f();

    func xor(this, other: T?) => match (this, other) {
        (some let a, nil) -> some a,
        (nil, some let b) -> some b,
        _ -> nil,
    };

    func someOr<E>(this, err: E) throw => this ?? throw err;
    func someOrElse<E>(this, f: () -> E) throw => this ?? throw f();

    func filter(this, p: T -> bool) => pred(this?) ?? false;

    func take(&mut this) => mem::replace(this, nil),

    func zip<U>(this, other: U?) => match (this, other) {
        let (some a, some b) -> some (a, b),
        _ -> nil
    };

    func zipWith<U, R>(this, other: U?, f: (T, U) -> R) => match (this, other) {
        let (some a, some b) -> some f(a, b),
        _ -> nil,
    };
}

impl<T, U> (T, U)? {
    func unzip(this) => match this {
        some let (a, b) -> (some a, some b),
        _ -> (nil, nil),
    };
}

impl<T, E> (T !! E)? {
    func transpose(this) throw => match this {
        some let v -> try v,
        nil -> nil,
    };
}

impl<T> T?? {
    func flatten(this) => (this?)?;
}

impl<T> T? : FromResidual<never?> {
    func fromResidual(residual: never?) -> self {
        nil
    }
}

impl<T> T? : Try {
    type Output = T;
    type Residual = never?;

    func fromOutput(output: T) -> self {
        some output
    }

    func branch(self) -> ControlFlow<self::Residual, self::Output> {
        match self {
            some let v -> .Continue(v),
            nil -> .Break(nil),
        }
    }
}

impl<T> T? : Iterable {
    type Iter = Iter<T>;

    let iter => Iter(inner: this.asRef());
}

private class<T> Iter {
    let inner: T mut&?;
}

impl<T> Iter : Iterator {
    type Item = T;

    func next(&mut this) => this.inner.take();
}