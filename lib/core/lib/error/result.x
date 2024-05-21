impl<T, E> T throw E {
    let isOK => try this catch { false } else { true };
    let isError => !this.isOK;

    func ok() => this?;
    func error() => try this catch let e { e } else { nil };

    func asRef() => try this catch let ref e { &e } else let ref v { &v };

    func unwrapOr(default: T) => this? ?? default;

    func map<U>(f: T -> U) throw => f(try this);
    func map<U>(f: T -> U, or or: U) => f(this? ?? or);

    func inspect(f: T -> void) => f(this?);

    func expect(failMessage: string) => try this catch { panic(failMessage) };
    func expectError(failMessage: string) try this catch let e { e } else { panic(failMessage) };

    func and<U>(other: U throw E) throw => try this catch let e { throw e } else { try other };
    func andThen(f: T -> U throw E) throw => try f(try this);

    func or<F>(other: T throw F) throw => this? ?? try other;
    func orElse<F>(f: E -> T throw F) throw => try this catch let e { try f(e) };
}

impl<T, E> T throw E if T is Default {
    func unwarpOrDefault() => try this catch { T.default };
}

impl<T> T throw never {
    func toOK() => try this;
}

impl<E> never throw E {
    func toError() => try this;
}

impl<T, E> (T throw E) throw E {
    func flatten() throw => this!!;
}

impl<T, E> T throw E : Iterable {
    type Iter = Iter<T, E>;

    let iter => Iter { inner: this.asRef().ok() };
}

class<T, E> Iter {
    let inner: T&?;
}

impl<T, E> Iter<T, E> {
    func next() => this.inner.take();
}