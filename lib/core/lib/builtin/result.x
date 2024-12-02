@__intrinsic(result)
enum Result<T, E> {
    Okay(T),
    Error(T),
}

impl<T, E> T !! E {
    let isOK => match this {
        .Okay(_) => true,
        .Error(_) => false,
    };

    let isError => !this.isOK;

    func ok(this) => this?;
    func error(this) => try this catch let e { e } else { nil };

    func asRef(&this) => try this catch let ref e { &e } else let ref v { &v };

    func unwrapOr(this, default: T) => this? ?? default;

    func map<U>(this, f: T -> U) throw => f(try this);
    func map<U>(this, f: T -> U, or or: U) => f(this? ?? or);

    func inspect(this, f: T -> void) => f(this?);

    func expect(this, failMessage: string) => try this catch { panic(failMessage) };
    func expectError(this, failMessage: string) try this catch let e { e } else { panic(failMessage) };

    func and<U>(this, other: U !! E) throw => try this catch let e { throw e } else { try other };
    func andThen(this, f: T -> U !! E) throw => try f(try this);

    func or<F>(this, other: T !! F) throw => this? ?? try other;
    func orElse<F>(this, f: E -> T !! F) throw => try this catch let e { try f(e) };
}

impl<T, E> T !! E if T is Default {
    func unwrapOrDefault(this) => try this catch { T.default };
}

impl<T> T !! never {
    func toOK(this) => try this;
}

impl<E> never !! E {
    func toError(this) => try this;
}

impl<T, E> (T !! E) !! E {
    func flatten(this) throw => this!!;
}

impl<T, E, F: From<E>> T !! F : FromResidual<never !! E> {
    func fromResidual(residual: never !! E) -> self {
        match residual {
            .Error(e) => .Error(From::from(e)),
        }
    }
}

impl<T, E> T !! E : Try {
    type Output = T;
    type Residual = never !! E;

    func from_output(output: self::Output) -> self {
        .Okay(output)
    }

    func branch(self) -> ControlFlow<self::Residual, self::Output> {
        match self {
            .Okay(v) => .Continue(v),
            .Error(e) => .Break(.Error(e)),
        }
    }
}

impl<T, E> T !! E : Iterable {
    type Iter = Iter<T, E>;

    let iter => Iter(inner: this.asRef().ok());
}

class<T, E> Iter {
    let inner: T&?;
}

impl<T, E> Iter<T, E> {
    func next(&mut this) => this.inner.take();
}