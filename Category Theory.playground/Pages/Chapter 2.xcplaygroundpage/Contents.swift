//: [Previous](@previous)

/*
 Define a higher-order function (or a function object) memoize in your favorite language.
 This function takes a pure function f as an argument and returns a function that behaves almost exactly like f, except that it only calls the original function once for every argument, stores the result internally, and subsequently returns this stored result every time it’s called with the same argument.
 You can tell the memoized function from the original by watching its performance. For instance, try to memoize a function that takes a long time to evaluate.
 You’ll have to wait for the result the first time you call it, but on subsequent calls, with the same argument, you should get the result immediately.
 */

func memoize<T: Hashable, U>(f: @escaping (T) -> U) -> (T) -> U {
    var cache: [T: U] = [:]

    return { x in
        if let u = cache[x] {
            return u
        } else {
            let u = f(x)
            cache[x] = u
            return u
        }
    }
}

func fibonacci(x: Int) -> Int {
    if x == 0 || x == 1 { return x }
    else {
        return fibonacci(x: x - 1) + fibonacci(x: x - 2)
    }
}

let memoizedFibonacci = memoize(f: fibonacci)

let memoizedFibonacci2 = memoize { (x: Int) -> Int in
    if x == 0 || x == 1 { return x }
    else {
        return fibonacci(x: x - 1) + fibonacci(x: x - 2)
    }
}

memoizedFibonacci(20)
memoizedFibonacci(20)
memoizedFibonacci(20)
memoizedFibonacci(20)

memoizedFibonacci2(20)
memoizedFibonacci2(20)
memoizedFibonacci2(20)
memoizedFibonacci2(20)

//: [Next](@next)
