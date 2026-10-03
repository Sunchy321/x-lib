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

    func indexRefMut(&mut this, #expandParameter(F::Parameter)) -> Output mut&
}

trait Increment {
    func inc(&mut this);
}

trait Decrement {
    func dec(&mut this);
}