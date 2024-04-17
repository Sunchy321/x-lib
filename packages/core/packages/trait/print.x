trait Printable {
    func print() -> string;
}

impl string : Printable {
    func print() => this;
}

impl void : Printable {
    func print() => "()";
}