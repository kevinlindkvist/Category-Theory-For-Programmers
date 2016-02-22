//: [Previous: Categories Great and Small](@previous)
import Darwin
/*:
# Kleisli Categories
----
#### 1. Construct the Kleisli category for partial functions (define composition and identity).
----
*/
enum Optional<T> {
  case Some(T)
  case None
}

infix operator >=> { associativity left }
func >=><A, B, C>(f: B -> Optional<C>, g: A -> Optional<B>) -> A -> Optional<C> {
  return { x in
      switch g(x) {
        case .Some(let r): return f(r)
        default: return Optional<C>.None
      }
  }
}

func optionalId<A>(f: A) -> Optional<A> {
  return Optional.Some(f)
}

func optionalF(x: Int) -> Optional<String> {
  return x < 10 ? Optional.Some("Less than 10") : Optional.None
}

func optionalG(x: String) -> Optional<Int> {
  if let y = Int(x) {
    return Optional.Some(y)
  }
  return Optional.None
}

let optionalH = optionalF >=> optionalG
let optionalFI = optionalId >=> optionalF
let optionalIF = optionalF >=> optionalId

optionalFI(5)
optionalIF(5)
optionalF(5)

optionalH("5")
optionalH("12")
optionalH("notanint")
//:#### 2. Implement a safe_reciprocal that returns a valid reciprocal of its argument if it's different from zero.
//:----
func sReciprocal(x: Double) -> Optional<Double> {
  return x == 0 ? Optional.None : Optional.Some(1.0/x)
}

sReciprocal(2)
sReciprocal(0)
//:#### 3. Implement safe_root_reciprocal.
//:----
func sRoot(x: Double) -> Optional<Double> {
  return x < 0 ? Optional.None : Optional.Some(sqrt(x))
}

let sRootReciprocal = sReciprocal >=> sRoot

sRootReciprocal(4)
sRootReciprocal(0)
sRootReciprocal(-2)
//:----
//: [Next: Products and Coproducts](@next)
