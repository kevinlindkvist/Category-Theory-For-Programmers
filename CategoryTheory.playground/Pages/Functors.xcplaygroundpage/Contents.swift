//: [Previous: Simple Algebraic Data Types](@previous)
/*:
# Functors
----
#### 1. Can we turn the `Maybe` type constructor into a functor by defining: `fmap _ _ = Nothing` which ignores both of its arguments?
----
We need to make sure that it preserves both identity and composition. First lets have a look at composition:
    fmap (f . g) Nothing = Nothing
    fmap g (fmap f Nothing) = fmap g Nothing = Nothing 
So far so good.
    fmap (f . g) (Just x) = Nothing

    (fmap g . fmap f) (Just x) = fmap g (fmap f (Just x))
    fmap g (fmap f (Just x)) = fmap g Nothing 
    fmap g Nothing = Nothing
It seems that it does indeed preserve composition. This may not be surprising since this `fmap` essentially collapses all morphisms.
Now let's have a look at if it preserves identity:
    fmap id Nothing = Nothing 
    id Nothing = Nothing 
Again, so far so good.
    fmap id (Just x) = Nothing
    id (Just x) = Just x
There it breaks down, since it does not preserve identity. Thus this implementation of `fmap` is not a functor.
#### 2. Prove functor laws for the reader functor.
    fmap :: (a -> b) -> (r -> a) -> (r -> b)
    fmap f g = f . g
----
To show that it preserves identity:
    fmap id ((->) r) = id . ((->) r) = ((->) r)
    id ((->) r) = ((->) r)
As for composition:
    fmap (f . g) ((->) r) = (f . g) . ((->) r)
    (f . g) . ((->) r) = f . g . ((->) r)

    (fmap f . fmap g) ((->) r) = fmap f (fmap g ((->) r))
    fmap f (fmap g ((->) r) = fmap f (g . ((->) r))
    fmap f (g . ((->) r)) = f . g . ((->) r)
Thus it is indeed a functor.
#### 3. Implement the reader functor in your second favorite language.
----
Swift doesn't support higher order types, so it seems that the type constructor is impossible to create in the same way that it is in Haskell. :(
#### 4. Prove the functor laws for the list functor.
    fmap f g :: (a -> b) -> (List a) -> (List b)
    fmap _ Nil = Nil
    fmap f (Cons x t) = Cons (f x) (fmap f t)
----
For the identity:
    fmap id Nil = Nil 
    id Nil = Nil 

    fmap id (Cons x t) = Cons (id x) (fmap id t)
    Cons (id x) (fmap id t) = Cons x (fmap id t) = Cons x t
    id (Cons x t) = Cons x t
For composition:
    fmap (f . g) Nil = Nil
    (fmap f . fmap g) Nil = fmap f (fmap g Nil) = Nil

    fmap (f . g) (Cons x t) = Cons ((f . g) x) (fmap (f . g) t)
    Cons ((f . g) x) (fmap (f . g) t) = Cons (f (g x)) (Cons (f (g t)))
    (fmap f . fmap g) (Cons x t) = fmap f (fmap g (Cons x t))
    fmap f (fmap g (Cons x t)) = Cons (f (g x)) (Cons (f (g t)))
*/
//: [Next: Functoriality](@next)
