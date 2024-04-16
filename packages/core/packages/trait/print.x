trait Printable {
    func print() -> string;
}

impl string : Printable {
    func print() { this }
}

impl bool : Printable {
    func print() { if this then "true" else "false" }
}

impl int : Printable {
    func print() { __intrinsic }
}