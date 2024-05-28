trait Boolean {
    func operator prefix!(this) -> bool;
    func operator&(lhs: self, lazy rhs: self) -> bool;
    func operator|(lhs: self, lazy rhs: self) -> bool;

    func operator if(this) -> bool;
}

impl Boolean {
    func toggle(&mut this) {
        this = !this;
    }
}

impl bool : Boolean {
    func operator prefix!(this) => __intrinsic;
    func operator&(lhs: self, lazy rhs: self) => __intrinsic;
    func operator|(lhs: self, lazy rhs: self) => __intrinsic;

    func operator if(this) => this;
}

impl bool? : Boolean {
    func operator prefix!(this) => !self?;

    func operator&(lhs: self, lazy rhs: self) => match lhs {
        some true -> some true,
        nil -> match rhs { some true -> some true, _ -> nil },
        some false -> rhs,
    }

    func operator|(lhs: self, lazy rhs: self) => match lhs {
        some true -> rhs,
        nil -> match rhs { some false -> some false, _ -> nil },
        some false -> some false,
    }

    func operator if(this) => self ?? false;
}