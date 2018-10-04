precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition

func >>> <A, B, C>(_ f: @escaping (A) -> (B), _ g: @escaping (B) -> (C)) -> ((A) -> C) {
    return { a in
        return g(f(a))
    }
}

func |> <A, B>(_ a: A, _ f: @escaping (A) -> (B)) -> B {
    return f(a)
}

precedencegroup BackwardComposition {
    associativity: right
    higherThan: ForwardComposition
}

infix operator <<<: BackwardComposition

func <<< <A, B, C>(_ g: @escaping (B) -> C, _ f: @escaping (A) -> B) -> ((A) -> C) {
    return { a in
        g(f(a))
    }
}
