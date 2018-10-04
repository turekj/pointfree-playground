func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in
        { a in f(a)(b) }
    }
}

func flip<A, B, C, D>(_ f: @escaping (A) -> (B, C) -> D) -> (B, C) -> (A) -> D {
    return { b, c in
        { a in f(a)(b, c) }
    }
}
