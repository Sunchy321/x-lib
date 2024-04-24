class Error {
    let message { get => __intrinsic; }
}

enum Result<T> {
    OK(T),
    Error(Error)
}