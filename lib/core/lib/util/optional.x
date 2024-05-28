impl<T> T? {
    let isSome => this != nil;
    let isNil => this == nil;

    func asRef(&this) => &this?;

    func map<U>(f: T -> U) => f(this?);
    func map<U>(f: T -> U, or or: U) => f(this ?? or);

    func inspect(f: T -> ()) => f(this?);

    func expect(failMessage: string) => if this == nil then panic(failMessage) else this!;

    func and<U>(other: U?) => if this == nil then nil else other;
    func andThen<U>(f: T -> U?) => if this == nil then nil else f(this!);

    func or(other: T?) => this ?? other;
    func orElse(f: () -> T?) => this ?? f();

    func xor(other: T?) => match (this, other) {
        (some let a, nil) -> some a,
        (nil, some let b) -> some b,
        _ -> nil,
    };

    func someOr<E>(err: E) throw => this ?? throw err;
    func someOrElse<E>(f: () -> E) throw => this ?? throw f();

    func filter(p: T -> bool) => pred(this?) ?? false;

    func take(this: mut) => match this {
        some let v -> { this = nil; some v },
        nil -> nil,
    }

    func zip<U>(other: U?) => match (this, other) {
        let (some a, some b) -> some (a, b),
        _ -> nil
    };

    func zipWith<U, R>(other: U?, f: (T, U) -> R) => match (this, other) {
        let (some a, some b) -> some f(a, b),
        _ -> nil,
    };
}

impl<T, U> (T, U)? {
    func unzip() => match this {
        some let (a, b) -> (some a, some b),
        _ -> (nil, nil),
    };
}

impl<T, E> (T throw E)? {
    func transpose() throw => match this {
        some let v -> try v,
        nil -> nil,
    };
}

impl<T> T?? {
    func flatten() => this??;
}

impl<T> T? : Iterable {
    type Iter = Iter<T>;

    let iter => Iter { inner: this.asRef() };
}

class<T> Iter {
    let inner: T&?;
}

impl<T> Iter : Iterator {
    type Item = T;

    func next(this: mut) => this.inner.take();
}