class Linear<T>(T);

impl<T> Linear<T> {
    func init(value: T) => self(T);

    func take(self) => self.0;
}

impl<T> Linear<T> : Deinit = never;