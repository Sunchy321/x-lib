trait Default {
    static let default: self;
}

impl void : Default {
    static let default = ();
}

impl bool : Default {
    static let default = false;
}

impl int : Default {
    static let default = 0;
}

impl<B> int<B> : Default {
    static let default = 0;
}

impl<W> float<W> : Default {
    static let default = 0.0;
}

impl char : Default {
    static let default = '\0';
}

impl string : Default {
    static let default = "";
}

impl<'S> 'S : Default {
    static let default = 'S;
}

impl<T> T? : Default {
    static let default = nil;
}

impl<T> T[] : Default {
    static let default = [];
}

impl<T, U> T[U] : Default {
    static let default = {||};
}

impl<T...> (T...) : Default if (T is Default & ...) {
    static let default = (T::default...);
}

impl<T, E> T throw E : Default if T is Default {
    static let default = do! throw { T::default };
}