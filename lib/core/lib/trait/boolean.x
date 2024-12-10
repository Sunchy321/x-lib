trait Condition {
    func cond(this) -> bool;
}

trait Boolean : Not + LogicAnd + LogicOr + Condition { }

impl Boolean {
    func toggle(&mut this) {
        *this = !*this;
    }
}
