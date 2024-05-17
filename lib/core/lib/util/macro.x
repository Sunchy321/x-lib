macro unimplemented {
    (#message: Expression) -> {
        panic("not implemented: \(#message)")
    }
}

macro todo {
    (#message: Expression) -> {
        panic("todo: \(#message)")
    }
}

macro unreachable {
    () => { __intrinsic }
}