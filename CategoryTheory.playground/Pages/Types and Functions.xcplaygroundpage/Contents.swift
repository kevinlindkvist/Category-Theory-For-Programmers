//: [Previous: The Essence of Composition](@previous)
import Darwin
//: ## Types and functions.
//: #### 1. Define memoize for any function f.
//:     Note: In order to insert into dictionary, A needs to be hashable, so this technically wont memoize any function f.
func memoize<A: Hashable, B>(f: A -> B) -> A -> B {
  var memTable: Dictionary<A,B> = Dictionary<A, B>()
  return { x in
    if let r = memTable[x] {
      return r
    }
    else {
      let r = f(x)
      memTable[x] = r
      return r
    }
  }
}

func looping(n: Int) -> Int {
  for _ in 1...n {
    // This should be executed 5 times.
  }
  return n
}

let memLoop = memoize(looping)
//: This makes the loop execute 5 times
memLoop(5)
//: This makes the loop execute 0 times
memLoop(5)
//: #### 2. Memoize random number generator.
//: Note: This is a bit messy due to what seems to be a swift limitation. Ideally we would be able to memoize a function of type `()->A`, but this would require a memoization function different than the one defined above, that was specialized to memoize functions with no parameters. Thus we used `arc4random_uniform` as opposed to `arc4random`.
let memArc4Random = memoize(arc4random_uniform)
memArc4Random(2)
memArc4Random(2)
/*: Memoizing this defeats the purpose of a "random" function.
#### 3. Memoize a random number generator initialized with a seed.
This is very similar to the above, since we used `arc4random_uniform` which gives us one random number per unique argument to the function.
#### 4. Which of these C++ functions are pure?
    1. Pure.
    2. Not pure (will return different results for same argument).
    3. Not pure (has side effect).
    4. Not pure (will return different results for same argument).
#### 5. How many different functions are there from `Bool` to `Bool`? Can you implement them all?
    There are 2 different functions from Bool -> Bool:
*/
func negate(x: Bool) -> Bool {
  return !x
}

func boolId(x: Bool) -> Bool {
  return x
}
/*: 
#### 6. Draw a picture of a category whose only objects are the types Void, () (unit), and Bool; with arrows corresponding to all possible functions between these types. Label the arrows with the names of the functions.

     Void -(absurd)-> ()
     Void -(absurd)-> Bool
     Void -(id)-> Void

     Bool -(discard)-> ()
     Bool -(negate)-> Bool
     Bool -(id)-> Bool

     () -(false)-> Bool
     () -(true)-> Bool
     () -(id)-> ()

[Next: Categories Great and Small](@next)
*/
