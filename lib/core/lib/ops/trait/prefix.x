trait Positive {
    type Output;

    func positive(this) -> self::Output;
}

trait Negative {
    type Output;

    func negative(this) -> self::Output;
}

trait Not {
    type Output;

    func not(this) -> self::Output;
}

trait Complement {
    type Output;

    func compl(this) -> self::Output;
}

trait Deref {
    type Target;

    func deref(&this) -> self::Target&;
}

trait DerefMut {
    type Target;

    func derefMut(&mut this) -> self::Target mut&;
}