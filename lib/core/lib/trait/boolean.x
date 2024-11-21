trait Condition {
    func cond(this) -> bool;
}

trait Boolean : Not + LogicAnd + LogicOr + Condition { }

impl Boolean {
    func toggle(&mut this) {
        *this = !*this;
    }
}

impl bool! : Not {
    type Output = self;

    func not(this) => !this?;
}

impl bool? : LogicAnd {
    type Output = self;

    func logicAnd(this, lazy rhs: self) => match this {
        some true -> rhs,
        nil -> match rhs {
            some false -> some false,
            _ -> nil
        }
        some false -> some false
    };
}

impl bool? : LogicOr {
    type Output = self;

    func logicOr(this, lazy rhs: self) => match this {
        some true -> some true,
        nil -> match rhs {
            some true -> some true,
            _ -> nil
        }
        some false -> rhs
    };
}

impl bool? : Condition {
    func cond(this) => this ?? false;
}

impl bool? : Boolean { }