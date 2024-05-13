func<T...> zip(T[]... values) {
    if values.isEmpty {
        return [];
    }

    let size = values[0].size;

    for i in 0 .. values.size {
        if values[i].size != size {
            throw SequenceError.SizeMismatch;
        }
    }

    (1..size).map { (values[$0]... ) }
}