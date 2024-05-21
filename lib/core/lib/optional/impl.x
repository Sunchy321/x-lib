impl<T> T? {
    let isSome => this != nil;
    let isNil => this == nil;

    func asRef() => &this?;

    func map<U>(f: T -> U) => f(this?);
    func map<U>(f: T -> U, or or: U) => f(this ?? or);

    func inspect(f: T -> ()) => f(this?);

    func expect(failMessage: string) => if this == nil then panic(failMessage) else this!;

    func and<U>(other: U?) => if this == nil then nil else other;
    func andThen<U>(f: T -> U?) => if this == nil then nil else f(this!);

    func or(other: T?) => this ?? other;
    func orElse(f: () -> T?) => this ?? f();

    func xor(other: T?) => match (this, other) {
        (nil, nil) => nil,
        (let a, nil) => a,
        (nil, let b) => b,
        (let a, let b) => nil,
    };

    func someOr<E>(err: E) throw => this ?? throw err;
    func someOrElse<E>(f: () -> E) throw => this ?? throw f();

    func filter(p: T -> bool) => pred(this?) ?? false;

    func take(this: mut) => T? {
        if this != nil {
            let old = this;
            this = nil;
            old
        } else {
            nil
        }
    }

    func zip<U>(other: U?) => match (this, other) {
        (nil, _) => nil,
        (_, nil) => nil,
        (let a, let b) => (a, b),
    };

    func zipWith<U, R>(other: U?, f: (T, U) -> R) => match (this, other) {
        (nil, _) => nil,
        (_, nil) => nil,
        (let a, let b) => f(a, b),
    };
}

impl<T, U> (T, U)? {
    func unzip() => match this {
        nil => (nil, nil),
        (let a, let b) => (a, b),
    };
}

impl<T, E> (T throw E)? {
    func transpose() throw => match this {
        nil => nil,
        let v => try v,
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