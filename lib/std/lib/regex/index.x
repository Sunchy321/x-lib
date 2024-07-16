class Regex {

}

impl Regex : StringSuffix<'r> {
    func fromLiteral(lit: StringLiteral) throw -> self {
        let chars = lit.rawInnerChars();
    }
}