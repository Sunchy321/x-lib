trait FunctorOnce<F: Function> {
    type Return = F::Return;

    func callOnce(this, #expandParameter(F::Parameter)) -> F::Return;
}

trait Functor<F: Function> {
    type Return = F::Return;

    func call(&this, #expandParameter(F::Parameter)) -> F::Return;
}

trait FunctorMut<F: Function> {
    type Return = F::Return;

    func callMut(&mut this, #expandParameter(F::Parameter)) -> F::Return;
}

impl<T, F> T : FunctorMut<F> if T is Functor<F> {
    func call(&mut this, #expandParameter(F::Parameter, args)) -> F::Return {
        this.Functor::<F>::call(#expandArgument(F::Parameter, args))
    }
}