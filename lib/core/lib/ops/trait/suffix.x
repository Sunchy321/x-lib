trait Index<F is Function> {
    type Output = F::Return;

    func index(&this, #expandParameter(F::Parameter)) -> self::Output&;
}

trait IndexMut<F is Function> {
    type Output = F::Return;

    func index_mut(&mut this, #expandParameter(F::Parameter)) -> self::Output mut&;
}

trait Nullable {
    type Item;
    type Output : Nullable if Item is Output::Item;

    func null_chain(this) -> self::Output;
    func null_assert(this) -> self::Item;
}

trait Predecessor {
    type Output;

    func predecessor(this) -> self::Output;
}

trait Successor {
    type Output;

    func successor(this) -> self::Output;
}

trait Increment {
    func increment(&mut this);
}

trait Decrement {
    func decrement(&mut this);
}