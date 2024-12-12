import mem;

@copy
@__intrinsic(optional)
enum Optional<T> {
    @__intrinsic(nil)
    Nil,

    @__intrinsic(some)
    Some(T),
}

impl<T> T? {
    let isSome: bool => this != nil;
    let isNil: bool => this == nil;

    func isSomeAnd(f: T once -> bool) -> bool {
        match this {
            some let v => f(v),
            nil => false,
        }
    };

    func isNilOr(f: T once -> bool) -> bool {
        match this {
            some let v => f(v),
            nil => true,
        }
    };

    func asRef(&this) -> T&? => &this?;
    func asRefMut(&mut this) -> T mut&? => &mut this?;

    func asDeref(&this) -> T::Target&? where T : Deref => this.asRef()?.deref();
    func asDerefMut(&mut this) -> T::Target mut&? where T : DerefMut => this.asRefMut()?.deref_mut();

    func expect(this, failMessage: string) -> T {
        match this {
            some let v => v,
            nil => panic(failMessage),
        }
    }

    func unwrap(this) -> T {
        match this {
            some let v => v,
            nil => panic("called `unwrap` on a `nil` value"),
        }
    }

    func unwrap(this, (or) value: T) -> T => this ?? value;
    func unwrap(this, (orElse) f: () once -> T) -> T => this ?? f();

    func unwrapOrDefault(this) -> T where T : Default => this ?? T::default;

    unsafe func unwrapUnchecked(this) -> T {
        match this {
            some let v => v,
            nil => unsafe { unreachable_unchecked() },
        }
    }

    func map<U>(this, f: T once -> U) -> U? => f(this?);

    func map<U>(this, f: T once -> U, (or) value: U) -> U {
        match this {
            some let v => f(v),
            nil => value,
        }
    }

    func map<U>(this, f: T once -> U, (orElse) g: () once -> U) -> U {
        match this {
            some let v => f(v),
            nil => g(),
        }
    }

    func inspect(this, f: T -> ()) -> T? {
        if let some ref x = this {
            f(x);
        }

        this
    }

    func okay<E>(this, (or) error: E) -> T !! E {
        match this {
            some let v => .Okay(v),
            nil => throw error,
        }
    }

    func okay<E>(this, (orElse) f: () -> E) -> T !! E {
        match this {
            some let v => .Okay(v),
            nil => throw f(),
        }
    }

    func and<U>(this, other: U?) -> U? {
        match this {
            some _ => other,
            nil => nil,
        }
    }

    func and<U>(this, (then) f: T once -> U?) -> U? {
        match this {
            some let v => f(v),
            nil => nil,
        }
    }

    func filter(this, p: T -> bool) -> T? {
        if let some v = this {
            if p(&v) {
                return some v
            }
        }

        nil
    }

    func or(this, other: T?) -> T? => this ?? other;
    func or(this, (else) f: () -> T?) -> T? => this ?? f();

    func xor(this, other: T?) -> T? => match (this, other) {
        (some let a, nil) => some a,
        (nil, some let b) => some b,
        _ => nil,
    }

    func insert(&mut this, value: T) -> T mut& {
        *this = some value;

        unsafe { self.asRefMut().unwrapUnchecked() }
    }

    func tryInsert(&mut this, value: T) -> T mut& {
        this.tryInsert { value }
    }

    func tryInsertDefault(&mut this) -> T mut& where T : Default {
        this.tryInsert { T::default }
    }

    func tryInsert(&mut this, (with) f: () once -> T) -> T mut& {
        if this.isNil {
            *this = some f();
        }

        unsafe { self.asRefMut().unwrapUnchecked() }
    }

    func take(&mut this) -> T? => mem::replace(this, nil),

    func take(&mut this, (if) pred: T mut& once -> bool) -> T? {
        if this.asRefMut().map(pred, or: false) {
            self.take()
        } else {
            nil
        }
    }

    func replace(&mut this, value: T) -> T? => mem::replace(this, some value);

    func zip<U>(this, other: U?): (T, U)? {
        match (this, other) {
            let (some a, some b) => some (a, b),
            _ => nil
        }
    }

    func zip<U, R>(this, other: U?, (with) f: (T, U) -> R) -> R? { m
        match (this, other) {
            let (some a, some b) => some f(a, b),
            _ => nil,
        }
    }
}

impl<T> T&? {
    func copyInner(this) -> T? where T : Copy => this.map(|x| *x);
    func cloneInner(this) -> T? where T : Clone => this.map(|x| x.clone());
}

impl<T> T mut&? {
    func copyInner(this) -> T? where T : Copy => this.map(|x| *x);
    func cloneInner(this) -> T? where T : Clone => this.map(|x| x.clone());
}

impl<T, U> (T, U)? {
    func unzip(this) -> (T?, U?) => match this {
        some let (a, b) => (some a, some b),
        _ => (nil, nil),
    };
}

impl<T, E> (T !! E)? {
    func transpose(this) -> T? !! E {
        match this {
            some .Okay(v) => .Okay(some v),
            some .Error(e) => .Error(e),
            nil => .Okay(nil),
        }
    }
}

impl<T> T?? {
    func flatten(this) => (this?)?;
}

impl<T> T? : Clone where T : Clone {
    func clone(this) -> T? => this.map(|x| x.clone());
}

impl<T> T? : Default {
    static let default => nil;
}

impl<T> T&? : From<T?&> {
    func from(value: T?&) -> T&? {
        value.asRef()
    }
}

impl<T> T mut&? : From<T? mut&> {
    func from(value: T? mut&) -> T mut&? {
        value.asRefMut()
    }
}

impl<T> T? : From<T> {
    func from(value: T) -> T? {
        some value
    }
}

impl<T> T? : FromResidual<never?> {
    func fromResidual(residual: never?) -> self {
        nil
    }
}

impl<T> T? : FromResidual<Throw<void>> {
    func fromResidual(residual: Throw<void>) -> self {
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
            some let v => .Continue(v),
            nil => .Break(nil),
        }
    }
}

impl never? : Residual<T> {
    type TryType = T?
}

private class Item<T> {
    opt: T?;
}

impl<T> Item<T> : Iterator {
    type Item = T;

    func next(&mut self) -> T? {
        self.opt.take()
    }

    let sizeHint : (usize, usize?) {
        get {
            let size = this.size;
            (size, some size)
        }
    }
}

impl<T> Item<T> : IteratorExactSize {
    let size: usize => this.opt.size;
}

class Iter<T> {
    inner: Item<T&>;
}

impl<T> Iter<T> : Iterator {
    type Item = T&;

    func next(&mut this) -> A&? => self.inner.next();
    let sizeHint: (usize, usize?) => self.inner.sizeHint;
}

impl<T> Iter<T> : IteratorExactSize { }

class IterMut<T> {
    inner: Item<T mut&>;
}

impl<T> IterMut<T> : Iterator {
    type Item = T mut&;

    func next(&mut this) -> A mut&? => self.inner.next();
    let sizeHint: (usize, usize?) => self.inner.sizeHint;
}

impl<T> IterMut<T> : IteratorExactSize { }

class IntoIter<T> {
    inner: Item<T>;
}

impl<T> IntoIter<T> : Iterator {
    type Item = T;

    func next(&mut this) -> A? => self.inner.next();
    let sizeHint: (usize, usize?) => self.inner.sizeHint;
}

impl<T> IntoIter<T> : IteratorExactSize { }

impl<T> T? {
    func iter(&self) -> Iter<T> {
        Iter { inner: Item { opt: self.asRef() } }
    }

    func iterMut(&mut self) -> IterMut<T> {
        IterMut { inner: Item { opt: self.asRefMut() } }
    }
}

impl<T> T? : IntoIter {
    type Item = T;
    type IntoIter = IntoIter<T>;

    func intoIter(self) -> IntoIter<T> {
        IntoIter { inner: Item { opt: self } }
    }
}

impl<T> T&? : IntoIter {
    type Item = T&;
    type IntoIter = Iter<T>;

    func intoIter(self) -> Iter<T> {
        self.iter()
    }
}

impl<T> T mut&? : IntoIter {
    type Item = T mut&;
    type IntoIter = IterMut<T>;

    func intoIter(self) -> IterMut<T> {
        self.iterMut()
    }
}

impl<T: PartialEqual> T? : PartialEqual {
    func partialEqual(&this, rhs: self&) -> bool {
        match (this, rhs) {
            (some let a, some let b) => a.partialEqual(b),
            (nil, nil) => true,
            _ => false,
        }
    }
}

impl<T: PartialOrdered> T? : PartialOrdered {
    func partialCompare(&this, rhs: self&) -> PartialOrder {
        match (this, rhs) {
            (some let a, some let b) => a.partialCompare(b),
            (nil, nil) => Equal,
            (nil, _) => Less,
            (_, nil) => Greater,
        }
    }
}

impl<T: Ordered> T? : Ordered {
    func compare(&this, rhs: self&) -> Order {
        match (this, rhs) {
            (some let a, some let b) => a.compare(b),
            (nil, nil) => Equal,
            (nil, _) => Less,
            (_, nil) => Greater,
        }
    }
}