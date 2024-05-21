trait Iterable {
    type Iter: core::Iterator;

    let iter: Iter;
}

trait Iterator {
    type Item;

    func next(this: mut) -> Item?;

    let sizeHint: (usize, usize?) => (0, nil);

    func count(this: mut) -> usize => this.fold(0) { $0 + 1 };

    func last(this: mut) -> Item? => this.fold(nil) { $1 };

    func advance(this: mut, n: usize) throw(IterError::NotEnoughItem) -> void {
        for let i : 0..n {
            if this.next() == nil {
                throw IterError::NotEnoughItem(need: n - i);
            }
        }
    }

    func nth(this: mut, n: usize) -> Item? {
        this.advance(n)?;
        this.next()
    }

    func step_by(step: usize) -> StepBy<self> {
        StepBy(self, step)
    }

    func fold<R>(this: mut, initial: R, accumulator: some (R, Item) -> R,) -> R {
        let mut acc = initial;

        while let v = self.next(); v != nil {
            acc = accumulator(acc, v);
        }

        acc
    }
}

enum IterError: ErrorCode {
    NotEnoughItem(need: usize)
}