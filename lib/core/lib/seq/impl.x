impl<T> Sequence {
    func map(f: T -> U) -> self<U> {
        let result = self<U>()

        for let v : this {
            result <~ f(v)
        }

        result
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

    func filter(p: T -> bool) -> self {
        let result = self()

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

    func findIndex(p: T -> bool) -> usize? {
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