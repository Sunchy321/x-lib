trait Printable {
    func print(&this) -> string;
}

impl string : Printable {
    func print(&this) => this;
}

impl char : Printable {
    func print(&this) => string::from([this]);
}

impl never : Printable {
    func print(&this) => this;
}

impl void : Printable {
    func print(&this) => "()";
}