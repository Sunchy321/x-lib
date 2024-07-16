enum LiteralError {
    OutOfRange
}

class IntegetLiteral {
    func intoInt8(this) throw(LiteralError) -> int<8>;
    func intoInt16(this) throw(LiteralError) -> int<16>;
    func intoInt32(this) throw(LiteralError) -> int<32>;
    func intoInt64(this) throw(LiteralError) -> int<64>;
    func intoInt128(this) throw(LiteralError) -> int<128>;

    func intoUint8(this) throw(LiteralError) -> uint<8>;
    func intoUint16(this) throw(LiteralError) -> uint<16>;
    func intoUint32(this) throw(LiteralError) -> uint<32>;
    func intoUint64(this) throw(LiteralError) -> uint<64>;
    func intoUint128(this) throw(LiteralError) -> uint<128>;

    func rawChars(this) -> string;
}

class FloatingLiteral {
    func intoFloat32(this) throw(LiteralError) -> float<32>;
    func intoFloat64(this) throw(LiteralError) -> float<64>;
    func intoFloat128(this) throw(LiteralError) -> float<128>;

    func rawChars(this) -> string;
}

class StringLiteral {
    func intoString(this) -> string;

    func rawChars(this) -> string;
    func rawInnerChars(this) -> string;
}

class CharLiteral {
    func toChar(this) -> char;

    func rawChars(this) -> string;
    func rawInnerChars(this) -> string;
}

trait IntegerSuffix<const S: Symbol> {
    const func fromLiteral(literal: IntegerLiteral) throw -> self;
}

trait FloatingSuffix<const S: Symbol> {
    const func fromLiteral(literal: FloatingLiteral) throw -> self;
}

trait StringSuffix<const S: Symbol> {
    const func fromLiteral(literal: StringLiteral) throw -> self;
}

trait CharSuffix<const S: Symbol> {
    const func fromLiteral(literal: CharLiteral) throw -> self;
}