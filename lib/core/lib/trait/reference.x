trait Reference {
    type Target;

    func operator prefix*() -> Target&;
}

impl<T> T& : Reference {
    type Target = T;

    func operator prefix*() -> T& {
        return this;
    }
}