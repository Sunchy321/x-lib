type<T if (T is Numeric) & (T !is Complex<_>)> Complex {
    let real: T;
    let imag: T;
}

impl Complex<float> : FloatingSuffix<'i> {
    func fromLiteral(literal: FloatingLiteral) -> self {
        self(real: float::default, imag: literal.floatValue)
    }
}

impl Complex<float> : FloatingSuffix<'j> {
    func fromLiteral(literal: FloatingLiteral) -> self {
        self(real: float::default, imag: literal.floatValue)
    }
}

impl<T> Complex<T> {
    let conjugate => Complex(real: this.real, imag: -this.imag);
    let normSquare => this.real * this.real + this.imag * this.imag;
}

impl<T> Complex<T> : Default {
    static let default = Complex(real: T::default, imag: T::default);
}


impl<T> Complex<T> : Add {
    type Output = self;
    func add(this, rhs: self) -> self {
        Complex(real: this.real + rhs.real, imag: this.imag + rhs.imag)
    }
}

impl<T> Complex<T> : Subtract {
    type Output = self;
    func subtract(this, rhs: self) -> self {
        Complex(real: this.real - rhs.real, imag: this.imag - rhs.imag)
    }
}

impl<T> Complex<T> : Multiply {
    type Output = self;
    func multiply(this, rhs: self) -> self {
        Complex(
            real: this.real * rhs.real - this.imag * rhs.imag,
            imag: this.real * rhs.imag + this.imag * rhs.real
        )
    }
}

impl<T> Complex<T> : Multiply<T> {
    type Output = self;
    func multiply(this, rhs: T) -> self {
        Complex(real: this.real * rhs, imag: this.imag * rhs)
    }
}

impl<T> T : Multiply<Complex<T>> {
    type Output = Complex<T>;
    func multiply(this, rhs: Complex<T>) -> Complex<T> {
        Complex(real: this * rhs.real, imag: this * rhs.imag)
    }
}