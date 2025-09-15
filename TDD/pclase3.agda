open import Data.Nat using (ℕ; zero; suc; _+_; _*_; _<?_; _<_)
open import Data.Product using (_×_ ; _,_ ; Σ-syntax)
open import Relation.Binary.PropositionalEquality
       using (_≡_; refl; sym; trans; cong)
open import Data.Nat.Properties using (+-comm)
open import Relation.Nullary.Decidable using (yes; no)


data List (A : Set) : Set where
  [] : List A
  _::_ : A -> List A -> List A

{-
data List : (A : Set) -> Set where
  [] : List A
  _::_ : A -> List A -> List A
-}

data Maybe (A : Set) : Set where 
 None : Maybe A
 Some : A -> Maybe A

-- tiene que ser completa 
head : {A : Set} -> List A -> Maybe A
head [] = None
head (x :: _) = Some x

{-
data Vec (A : Set) (n : ℕ) : Set where
  [] : Vec A 0   -- error, no podes poner un 0 pq no es n
-}

data Vec (A : Set) : (n : ℕ) -> Set where
  [] : Vec A 0
  _::_ : {n : ℕ} -> A -> Vec A n -> Vec A (suc n)

vec-head : {A : Set} {n : ℕ} -> Vec A (suc n) -> A
vec-head (x :: _) = x  

-- vec-head [] -- no tipa

_++_ : {A : Set} {n m : ℕ} -> Vec A n -> Vec A m -> Vec A (n + m)
[] ++ ys = ys
(x :: xs) ++ ys = x :: (xs ++ ys)

-- variable v : Vec A n
{-
reverse : {A : Set} {n : ℕ} -> Vec A n -> Vec A -> n
reverse [] = []
reverse  (x :: xs) = ? reverse xs ++ (x :: [])
-- no funciona pq tenemos que unificar n+1 y 1+n
-}

id-rara : ℕ -> ℕ
id-rara zero = zero
id-rara (suc n) = id-rara n + suc zero

reverse : {A : Set} {n : ℕ} -> Vec A n -> Vec A (id-rara n)
reverse [] = []
reverse  (x :: xs) = ? reverse xs ++ (x :: [])


transport : {A : Set} (B : A -> Set) {x y : A} (p : x ≡ y) -> B x -> B y
transport _ refl b = b



reverseT : {A : Set} {n : ℕ} -> Vec A n -> Vec A n
reverseT [] = []
reverseT {A} {suc n} (x :: xs) = transport (Vec A)
  (+-comm n 1)                                                -- ? Goal: n+1 ≡ suc n
  (reverseT xs ++ (x :: []))



-- todo esto es necesario pq 1+3 ≡ 3+1 pero 1+n ¬≡ n+1  

 -- ++-[] : {A : Set} {n : ℕ} 

reverseT-++ : {A : Set} {n m : ℕ} {xs : Vec A n} {ys : Vec A m} -> reverseT (xs ++ ys) ≡ transport (Vec A) 
                               (+-comm m n) 
                               (reverseT ys ++ reverseT xs) 

{-                            
reverseT-++ = ?
             --  | pattern matching dependiente debido a []
reverseT-++ {A} {.zero} {m} {[]} {ys}      = begin reverse ys ≡〈 〉 
  transport (Vec A) (+-comm m 0) (reverse ys ++ []) ≡〈 〉
  transport (Vec A) (+-comm m 0) (reverse ys ++ []) ≡〈 〉

reverseT-++ {A} {suc n} {m} {x :: xs} {ys} = {}
-}


lema : {A : Set} {n n' : ℕ} {x : A} {xs : Vec A n} -> (p : n ≡ n') -> (q : suc n ≡ suc n') -> x :: transport p xs ≡ transport q (x :: xs)
lema refl refl = refl



div-mod : (n m : ℕ) -> (0 < m) -> Σ[ q ∈ ℕ ] Σ[ r ∈ ℕ ] ((q * suc m  + r ≡ n) × (r < m))
{- div-mod zero m 0<m = zero , 
                     zero ,
                     refl ,
                     0<m 
-}

-- n < m : Set
-- n <? m : Decidable (n < m)
{-
div-mod n m 0<m with n <? m
... | yes p = zero , n , refl , p 
... | no  q = let (q' , r' , ) = div-mod (n ∸ m)
 -- etc. rec no estructural falla. agregar parametro n'' gasolina que se va restando por 1.  
-}