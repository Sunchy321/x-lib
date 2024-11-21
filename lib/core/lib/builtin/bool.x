@__intrinsic(bool)
enum Bool {
    @__intrinsic(false)
    False,

    @__intrinsic(true)
    True,
}

impl bool : Not {
    type Output = self;

    func not(this) => match this {
        true => false,
        false => true,
    };
}

impl bool : LogicAnd {
    type Output = self;

    func logicAnd(this, lazy rhs: self) => match this {
        true => rhs,
        false => false,
    };
}

impl bool : LogicOr {
    type Output = self;

    func logicOr(this, lazy rhs: self) => match this {
        true => true,
        false => rhs,
    };
}

impl bool : Condition {
    func cond(this) => this;
}

impl bool : Boolean { }
