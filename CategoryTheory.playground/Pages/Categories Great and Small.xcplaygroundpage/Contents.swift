/*: [Previous: Types and Functions](@previous)
----
# Categories Great and Small
#### 1. Generate a free category from:
----
1. A graph with one node and no edges.
    * Add one edge for the identity morphism.
2. A graph with one node and one (directed) edge.
    * Add an identity morphism, as well as infinitely many edges for `a,a∙a,a∙a∙a,...`.
3. A graph with two nodes and a single arrow between them.
    * Add an identity morphism for each node.
4. A graph with a single node and 26 arrows marked with the letters of the alphabet.
    * Add an identity morphism, and also all (infinitely many) morphisms constructed from the composition of the original morphisms.
#### 2. What kind of order is this?
----
1. A set of sets with the inclusions relation: `A` is included in `B` if every element of `A` is also an element of `B`.

    * a<=b, b<=c => a<=c: True
    * a<=b, b<=a => a=b: True **(Partial order)**
    * ∀x,y∈C x<=y or y<=x: False


2. C++ types with the following subtyping relation: T1 is a subtype of T2 if a pointer to T1 can be passed to a function that expects a pointer to T2 without triggering a compiler error.

    * a<=b, b<=c => a<=c: True
    * a<=b, b<=a => a=b: True **(Partial Order)**
    * ∀ (x,y) ∈ C x<=y or y<=x: False

#### 3. Considering that `Bool` is a set of two values `True` and `False`, show that it forms two (set-theoretical) monoids with respect to, respectively, operator `&&` and `||`.
----
* &&
    * mempty = True
* ||
    * mempty = False


In both cases the operators are clearly associative.
#### 4. Represent the `Bool` monoid with the `&&` operator as a category. List the morphisms and their rules of composition.
----
The morphisms are `negate` and `id`. The rules of composition are `negate ∙ id = negate` and `id ∙ negate = negate`.

#### 5. Represent addition modulo 3 as a monoid category. 
----
There are 3 morphisms, `add0`, `add1`, and `add2`, and they operate on a single object. `add0` is the identity morphism. `add1 ∙ add2 = add0`, `add2 ∙ add2 = add1`, `add1 ∙ add1 = add2`.

----
[Next: Kleisli Categories](@next)
*/
