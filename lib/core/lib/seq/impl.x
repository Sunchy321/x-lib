impl<T, dyn N> Sequence {
    func map(f: T -> U) -> self<U, dyn N> {
        let result = self<U>()

        for let v : this {
            result <~ f(v)
        }

        result as self<U, dyn N>
    }

    func forEach(f: T -> void) -> void {
        for let v : this {
            f(v)
        }
    }

    func allOf(p: T -> bool) -> bool {
        for let v : this {
            if !p(v) {
                return false;
            }
        }

        true
    }

    func anyOf(p: T -> bool) -> bool {
        for let v : this {
            if p(v) {
                return true;
            }
        }

        false
    }

    func noneOf(p: T -> bool) => this.allOf { !p($0) };

    func filter(p: T -> bool) -> self<T, dyn _> {
        let result = self<T, dyn _>()

        for let v : this {
            if p(v) {
                result <~ v;
            }
        }

        result
    }

    func find(p: T -> bool) -> T? {
        for let v : this {
            if p(v) {
                return v;
            }
        }

        nil
    }

    func findIndex(p: T -> bool) -> uint? {
        let mut i = 0;
        for let v : this {
            if p(v) {
                return i;
            }
            i++;
        }

        nil
    }
}