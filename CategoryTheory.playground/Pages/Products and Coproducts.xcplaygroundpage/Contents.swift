/*: [Previous: Kleisli Categories](@previous)
# Products and Coproducts
----
#### 1. Show that the terminal object is unique up to unique isomorphism.
----
To prove this, say that we have two terminal objects `a` and `b`. There must be some morphism `f:a->b`, and another `g:b->a`. This means that there is some morphism from `a->a`, `f∙g=ida` and from `b->b`, `g∙f=idb`. Since the terminal object is in a category we know there is an identity morphism, and we know that morphism is the only morphism from `a->a` and `b->b`. Thus, `a` must be equal to `b`.
#### 2. What is the product of two objects in a poset?
----
Call the objects `a` and `b`. In a `poset`, any object "smaller" than both `a` and `b` will have to be considered. However, the product `c` will be the largest object that is smaller than both `a` and `b` with morphisms `p:c->a` and `q:c->b`. To see this, imagine any other product `c'`, `c'` is smaller than both `a` and `b`, and by hypothesis smaller than `c`. Thus there must be a morphism `m:c'->c` that factorizes `p` and `q`. Thus `c` is "better."
#### 3. What is the coproduct of two objects in a poset?
----
The reasoning is similar to that above, but the result is `c` is the smallest object larger than both `a` and `b`.
#### 4. Implement the equivalent of Haskell Either as a generic type in your favorite language.
----
*/
enum Either<T, V> {
  case Left(T)
  case Right(V)
}
/*:
#### 5. Show that Either is a "better" coproduct than `int` equipped with two injections:

    int i(int n) { return n; }
    int j(bool b) { return b ? 0 : 1; } 
----
*/
func factorizer(x: Either<Int, Bool>) -> Int {
  switch x {
    case .Left(let y): return y
    case .Right(let y): return y ? 0 : 1
  }
}
/*:
#### 6. How would you argue that `int` with the two injections `i` and `j` cannot be "better" than `Either`?
----
Since `j` collapses `true` into 0 and `false` into 1. 
#### 7. What about these injections:

    int i(int n) {
      if (n < 0) return n;
      return n+2;
    }
    int j(bool b) { return b ? 0 : 1; }
----
`j` still has the same issue, but since now `i` doesn't return `0` or `1`, we know that they came from `false` and `true`. Thus these injections are the same as `Either` up to isomorphism.
#### 8. Come up with an inferior candidate for a coproduct of `int` and `bool` that cannot be better than `Either` because it allows multiple acceptable morphisms from it to `Either`. 
----
Use `int` and the injections defined in `5`.
*/
func inferiorInjection(x: Int) -> Either<Int, Bool> {
  switch x {
  case let i where i == 0: return Either.Right(false)
  case let i where i == 1: return Either.Right(true)
  default: return Either.Left(x)
  }
}
func inferiorInjection2(x: Int) -> Either<Int, Bool> {
  return Either.Left(x)
}
//: [Next: Simple Algebraic Data Types](@next)
