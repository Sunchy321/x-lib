trait ErrorCode {

}

enum CoreError {
    ArithmeticOverflow,
}

impl CoreError : ErrorCode;