type usize = __intrinsic;
type isize = __intrinsic;

func operator ""usize(value: int) -> usize {
    value as! usize
}

func operator ""isize(value: int) -> isize {
    value as! isize
}