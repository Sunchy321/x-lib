trait Condition {
    func cond(this) -> bool;
}

impl bool {
    func toggle(&mut this) {
        *this = !*this;
    }
}
