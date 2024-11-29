trait Index<F is Function> {
    type Output = F::Return;

    func index(&this, #expandParameter(F::Parameter)) -> Output
}

trait IndexAssign<F is Function> {
    type Input = F::Return;

    func indexAssign(&mut this, #expandParameter(F::Parameter), value: Input)
}

trait IndexRef<F is Function> {
    type Output = F::Return;

    func indexRef(&this, #expandParameter(F::Parameter)) -> Output&
}

trait IndexRefMut<F is Function> {
    type Output = F::Return;

    func indexMut(&mut this, #expandParameter(F::Parameter)) -> Output mut&
}

trait Predecessor {
    type Output;
    func prev(this) -> Output;
}

trait Successor {
    type Output;
    func next(this) -> Output;
}

trait Increment {
    func inc(&mut this);
}

trait Decrement {
    func dec(&mut this);
}