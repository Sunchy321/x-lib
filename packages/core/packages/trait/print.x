trait Printable {
    func print() -> string;
}

impl string : Printable {
    func print() { this }
}