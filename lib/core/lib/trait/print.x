trait Printable {
    func print() -> string;
}

impl string : Printable {
    func print() => this;
}

impl char : Printable {
    func print() => string.from([this]);
}

impl void : Printable {
    func print() => "()";
}