class IntegetLiteral {

}

class FloatingLiteral {

}

class StringLiteral {

}

class CharLiteral {

}

trait IntegerSuffix<const S: Symbol> {
    func fromLiteral(literal: IntegerLiteral) -> self;
}

trait FloatingSuffix<const S: Symbol> {
    func fromLiteral(literal: FloatingLiteral) -> self;
}

trait StringSuffix<const S: Symbol> {
    func fromLiteral(literal: StringLiteral) -> self;
}

trait CharSuffix<const S: Symbol> {
    func fromLiteral(literal: CharLiteral) -> self;
}