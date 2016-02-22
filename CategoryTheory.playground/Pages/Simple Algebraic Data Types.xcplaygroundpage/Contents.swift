/*: [Previous: Products and Coproducts](@previous)
# Simple Algebraic Data Types
----
#### 1. Show the isomorphism between `Optional a` and `Either () a`.
*/
import Darwin
enum Either<T, V> {
  case Left(T)
  case Right(V)
}
func oToE<T>(a: Optional<T>) -> Either<Void, T> {
  switch a {
    case .Some(let x): return Either<Void, T>.Right(x)
    case .None: return Either<Void, T>.Left(Void())
  }
}
func eToO<T>(a: Either<Void, T>) -> Optional<T> {
  switch a {
    case .Left: return Optional<T>.None
    case .Right(let x): return Optional<T>.Some(x)
  }
}
/*: 
#### 2. Implement `Shape` as an interface and create two classes: `Circle` and `Rect`. Implement `area` as a virtual function.
----
I decided to use an enum with associated values for this example to mimick the Haskell implementation.
*/
enum Shape {
  case Rect(Double, Double)
  case Circle(Double)
  case Square(Double) // Added for `3`
}

func area(s: Shape) -> Double {
  switch s {
    case .Rect(let w, let h): return w * h
    case .Circle(let r): return r * r * M_PI
    case .Square(let w): return w * w
  }
}

/*:
#### 3. Add `circ` to the implementation, what parts of the original code did you have to touch?
----
All that is needed is to add a new function that acts on `Shape`.
*/
func circ(s: Shape) -> Double {
  switch s {
    case .Rect(let w, let h): return w * 2 + h * 2
    case .Circle(let r): return 2 * r * M_PI
    case .Square(let w): return w * 4
  }
}
/*:
#### 4. Add a new `Shape`, `Square`, to `Shape` and make all the necessary updates. What code did you have to touch in Haskell vs. Swift?
----
As seen above, using enums and functions that act on them , the implementation is very similar to the Haskell version, and the changes are almost identical.
#### 5. Show that `a+a=2*a` holds for types (up to isomorphism). Remember that 2 corresponds to Bool, according to our conversion table.
----
Once translated, the equation becomes:
    Either<a, a> = Either<Bool, a>


The conversion between these is outlined below.
*/
func lhsToRhs<T>(e: Either<T, T>) -> (Bool, T) {
  switch e {
    case .Left(let x): return (true, x)
    case .Right(let x): return (false, x)
  }
}
func rhsToLhs<T>(l: Bool, r: T) -> Either<T, T> {
  return l ? Either.Left(r) : Either.Right(r)
}
//: [Next: Functors](@next)
