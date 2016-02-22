import Darwin
//: ## The essence of composition.
//: #### 1. Implement the identity function.
func id<T>(x: T) -> T {
  return x;
}
//: #### 2. Implement the composition function.
infix operator ∘ { associativity left }
func ∘<A, B, C>(f: B->C, g: A->B) -> A -> C {
  return { x in f(g(x)) }
}

func f(x: Int) -> String {
  return String(x)
}

func g(x: String) -> [String] {
  return [x]
}

let h = g ∘ f

h(1)
//: #### 3. Check that composition respects identity.
let leftIdentity = f ∘ id
let rightIdentity = id ∘ f

leftIdentity(2) == rightIdentity(2)
leftIdentity(2) == f(2)
//: #### 4. Is the world-wide web a category in any sense? Are links morphisms?
//: Treating websites as objects and links as morphisms, it would seem that the world-wide web is not a category. Since there is no requirement for a page to link to itself, nor is there a requirement that there is a link to any "grandchild" page.
//: #### 5. Is Facebook a category, with people as objects and friendships as morphisms?
//: No, for similar reasons from above. Even if you considered everyone to be a friend of themselves (identity), there is still no guarantee that you are a friend of all of your friends friends.
//: #### 6. When is a directed graph a category?
//: When for every `v ∈ G` there is an edge `e(v,v)`, and `∀ p,q,r ∈ G ∣ e(p,q) ∧ e(q,r)` theres is also an edge `e(p,r)`.

//: [Next: Types and Functions](@next)
