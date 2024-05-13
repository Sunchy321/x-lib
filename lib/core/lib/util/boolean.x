trait Boolean {
    func operator prefix!() -> bool;
    static func operator&(lazy lhs: self, lazy rhs: self) -> bool;
    static func operator|(lazy lhs: self, lazy rhs: self) -> bool;

    func operator if() -> bool;
}

impl Boolean {
    func toggle(this: mut) {
        this = !this;
    }
}

impl bool : Boolean {
    func operator prefix!() => __intrinsic;
    static func operator&(lazy lhs: self, lazy rhs: self) => __intrinsic;
    static func operator|(lazy lhs: self, lazy rhs: self) => __intrinsic;

    func operator if() => self;
}

impl bool? : Boolean {
    func operator prefix!() => !self?;

    static func operator&(lazy lhs: self, lazy rhs: self) => match lhs {
        true -> true,
        nil -> match rhs { true -> true, _ -> nil },
        false -> rhs,
    }

    static func operator|(lazy lhs: self, lazy rhs: self) => match lhs {
        true -> rhs,
        nil -> match rhs { false -> false, _ -> nil },
        false -> false,
    }

    func operator if() => self ?? false;
}