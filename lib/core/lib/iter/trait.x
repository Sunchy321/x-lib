trait Iterable {
    type Iter: core::Iterator;

    let iter: Iter;
}

trait Iterator {
    type Item;

    func next(&mut this) -> Item?;

    let sizeHint: (usize, usize?) => (0, nil);

    func count(&mut this) -> usize => this.fold(0) { $0 + 1 };

    func last(&mut this) -> Item? => this.fold(nil) { $1 };

    func advance(&mut this, n: usize) throw(IterError::NotEnoughItem) -> void {
        for let i : 0..n {
            if this.next() == nil {
                throw IterError::NotEnoughItem { need: n - i };
            }
        }
    }

    func nth(&mut this, n: usize) -> Item? {
        this.advance(n)?;
        this.next()
    }

    func step_by(this, step: usize) -> StepBy<self> {
        StepBy(this, step)
    }

    func fold<R>(&mut this, initial: R, accumulator: (R, Item) mut -> R>) -> R {
        let mut acc = initial;

        while let v = self.next(); v != nil {
            acc = accumulator(acc, v);
        }

        acc
    }
}

enum IterError: ErrorCode {
    NotEnoughItem { need: usize }
}