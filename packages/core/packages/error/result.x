enum Result<T, E is Error = any Error> {
    OK(T),
    Error(E)
}

impl<T, E> Result<T, E> {
    let unwrap throw(E) => match this {
        .OK(let value) => value,
        .Error(let error) => throw error
    }
}