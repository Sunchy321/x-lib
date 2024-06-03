trait Positive {
    type Output;
    func positive(this) -> Output;
}

trait Negative {
    type Output;
    func negative(this) -> Output;
}

trait Not {
    type Output;
    func not(this) -> Output;
}

trait Complement {
    type Output;
    func compl(this) -> Output;
}

trait Deref {
    type Target;
    func deref(&this) -> Target&;
}

trait DerefMut {
    type Target;
    func derefMut(&mut this) -> Target mut&;
}