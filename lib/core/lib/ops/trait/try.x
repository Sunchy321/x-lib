enum ControlFlow<B, C = ()> {
    Continue(C),
    Break(B),
}

trait FromResidual<R = <self as Try>::Residual> {
    func fromResidual(residual: R) -> self;
}

trait Try: FromResidual {
    type Output;
    type Residual;

    func fromOutput(output: Output) -> self;

    func branch(self) -> ControlFlow<self::Residual, self::Output>;
}

trait Residual<O> {
    type TryType : Try<Output = O, Residual = self>;
}

impl<B, C> ControlFlow<B, C> : FromResidual<ControlFlow<B, never>> {
    func fromResidual(residual: ControlFlow<B, never>) -> self {
        match residual {
            .Break(b) => .Break(b),
        }
    }
}

impl<B, C> ControlFlow<B, C> : Try {
    type Output = C;
    type Residual = ControlFlow<B, never>;

    func fromOutput(output: self::output) -> self {
        .Continue(output)
    }

    func branch(self) -> ControlFlow<self::Residual, self::Output> {
        match self {
            .Continue(c) => .Continue(c),
            .Break(b) => .Break(.Break(b)),
        }
    }
}