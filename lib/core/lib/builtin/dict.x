@__intrinsic(dict)
type Dictionary<K: Hashable, V> = __intrinsic;

impl<K, V> Dictionary<K, V> {
    init() => [:]

    init((capacity): usize) => __intrinsic

    let size: usize => __intrinsic
    let capacity: usize => __intrinsic

    let isEmpty: bool => this.size == 0

    let keys: K[] { get => __intrinsic }
    let values: V[] { get => __intrinsic }

    func tryGet(key: K) -> V&? => __intrinsic
    func update((key): K, (value): V) => __intrinsic

    func reserve(capacity: usize) => __intrinsic
}

impl<K, V> Dictionary<K, V> : Default {
    static let default => [:]
}

impl<K, V> Dictionary<K, V> : IndexRef<K -> V> {
    func indexRef(&this, key: K) -> V& {
        this.tryGet(key)!
    }
}

impl<K, V> Dictionary<K, v> : IndexAssign<K -> V> {
    func indexAssign(&mut this, key: K, value: V) {
        this.update(key: key, value: value)
    }
}

impl<K, V> Dictionary<K, V> : Index<(K, lazy (default): V) -> V {
    func index(&this, key: K, lazy (default): V) -> V {
        this.tryGet(key) ?? default
    }
}