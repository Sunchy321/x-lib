type<T if (T is Numeric) & (T !is Complex<_>)> Complex {
    let real: T;
    let imag: T;
}

func operator""i<T>(imag: T) -> Complex<T> { Complex { real: T{}, imag } }

impl<T is Numeric> Complex<T> {
    let conjugate => Complex { real: this.real, imag: -this.imag };
    let normSquare => this.real * this.real + this.imag * this.imag;
}

impl<T is Numeric> Complex<T> : Numeric {
    static func operator+(lhs: self, rhs: self) => self { real: lhs.real + rhs.real, imag: lhs.imag + rhs.imag }
    static func operator-(lhs: self, rhs: self) => self { real: lhs.real - rhs.real, imag: lhs.imag - rhs.imag }

    static func operator*(lhs: self, rhs: self) => self {
        real: lhs.real * rhs.real - lhs.imag * rhs.imag,
        imag: lhs.real * rhs.imag + lhs.imag * rhs.real
    }
}

func<T> operator*(lhs: Complex<T>, rhs: T) => Complex<T> { real: lhs.real * rhs, imag: lhs.imag * rhs }
func<T> operator*(lhs: T, rhs: Complex<T>) => Complex<T> { real: lhs * rhs.real, imag: lhs * rhs.imag }