impl<T> Sequence {
    func map(&this, f: (T, (index): usize) mut -> U) -> self<U> {
        let result = self<U>()

        let i = 0

        for let v : this.iter() {
            result <~ f(v, index: i)

            i++
        }

        result
    }

    func forEach(&this, f: T mut -> void) -> void {
        for let v : this.iter() {
            f(v)
        }
    }

    func all(&this, p: T mut -> bool) -> bool {
        for let v : this.iter() {
            if !p(v) {
                return false
            }
        }

        true
    }

    func any(&this, p: T mut -> bool) -> bool {
        for let v : this.iter() {
            if p(v) {
                return true;
            }
        }

        false
    }

    func none(&this, p: T mut -> bool) => this.allOf { !p($0) };

    func filter(&this, p: T mut -> bool) -> self {
        let result = self()

        for let v : this.iter() {
            if p(v) {
                result <~ v;
            }
        }

        result
    }

    func find(&this, p: T mut -> bool) -> T? {
        for let v : this.iter() {
            if p(v) {
                return v;
            }
        }

        nil
    }

    func findIndex(&this, p: T mut -> bool) -> usize? {
        let mut i = 0;
        for let v : this.iter() {
            if p(v) {
                return i;
            }
            i++;
        }

        nil
    }
}