/*
 Implement, as best as you can, the identity function in your fa- vorite language
 (or the second favorite, if your favorite language happens to be Haskell).
*/

func identity<T, U>(f: @escaping (T) -> U) -> (T) -> U {
    return f
}

func double(x: Int) -> Int { return x * 2 }

let doubleIdentity = identity(f: double)

double(x: 5)
doubleIdentity(5)

/*
 Implement the composition function in your favorite language.
 It takes two functions as arguments and returns a function that is their composition.
*/

func composition<T, U, V>(f: @escaping (T) -> U, g: @escaping (U) -> V) -> (T) -> V {
    return { x in
        return g(f(x))
    }
}

func plusOne(x: Int) -> Int { return x + 1 }

let doubleAndThenPlusOne = composition(f: double, g: plusOne)

doubleAndThenPlusOne(5)

/*
 Write a program that tries to test that your composition function respects identity.
*/

let plusOneIdentity = identity(f: plusOne)

let doubleAndThenPlusOneIdentity = composition(f: doubleIdentity, g: plusOneIdentity)

doubleAndThenPlusOne(5) == doubleAndThenPlusOneIdentity(5)
