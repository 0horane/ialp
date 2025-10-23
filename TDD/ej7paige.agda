open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Empty using (⊥-elim)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_×_; Σ-syntax; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (true; false)
open import Data.Nat using (ℕ; zero; suc; _+_; _≤_; _≟_)
open import Data.Nat.Properties using (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤)
open import Relation.Nullary using (Dec; yes; no; ¬_; _because_; ofⁿ; ofʸ)
open import Function.Bundles using (_⇔_)


isContr : Set -> Set
isContr A = Σ[ cntr ∈ A ] ( (t : A) → t ≡ cntr )

isOfHLevel : Set -> ℕ -> Set
isOfHLevel A 0 = isContr A
isOfHLevel A (suc n) = (x y : A) -> isOfHLevel (x ≡ y) n

isAProp : Set -> Set
isAProp A = isOfHLevel A 1

ej7a : (A : Set) -> isAProp A -> ((x y : A) -> x ≡ y)
ej7a A isprop x y  with isprop x y
...| (a , b) =  a 

contrIsProp : (A : Set) -> isContr A -> isAProp A
contrIsProp A (fst , snd) = λ x y → {!!} , {!!}

ej7b : (A : Set) ->((x y : A) -> x ≡ y) -> isAProp A
ej7b A =f  = {!!} 
