class<I: Iterator> StepBy<I> {
    iter: I,
    step: usize,
    firstTake: bool,
}

impl<I> StepBy<I> {
    internal init(iter: I, step: usize) -> self {
        #assert(step != 0);

        self { iter, step: step - 1, firstTake: true }
    }
}

impl<I> StepBy<I>: Iterator {
    type Item = I::Item;

    func next(this: mut) -> Item? {
        if this.firstTake {
            this.firstTake = false;
            this.iter.next()
        } else {
            this.iter.nth(self.step)
        }
    }
}