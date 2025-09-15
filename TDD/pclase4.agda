open import Data.Empty
       using (⊥; ⊥-elim)
open import Data.Bool
       using (Bool; true; false)
open import Data.Nat
       using (ℕ; zero; suc; _+_; _≤_; _<_)
open import Data.Nat.Properties
       using (+-comm)
open import Data.Product
       using (_,_; Σ-syntax)
open import Relation.Binary.PropositionalEquality
       using (_≡_; refl; cong; sym; trans)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning



{-
trans' : {A : Set} {a b c : A} → a ≡ b → b ≡ c → a ≡ c
trans' {A} {a} {b} {c} p q  = ind≡ {A} {\ a b p -> b ≡ c -> a ≡ c } (\ a c r -> r) a b p c q
-}


{-
indℕ : (C : ℕ → Set)
    (c0 : C zero)
    (cS : (n : ℕ) → C n → C (suc n))
    (n : ℕ)
    → C n
indℕ C c0 cS zero    = c0
indℕ C c0 cS (suc n) = cS n (indℕ C c0 cS n)



-- <-suc : ...
-- ¬zero<n .... ()

+-suc-right : {a b : nat} -> a + suc b ≡ suc (a + b)
+-suc-right = ?

¬zero<n : {n : Nat} -> zero < n -> ⊥
¬zero<n {n} (k , p)  = zero-no-es-suc {k+n} (trans (sym +-suc-right) p) 

ind-completa : (C : ℕ → Set)
         (f : (n : ℕ)
            → ((m : ℕ) → suc m ≤ n → C m) -- m < n
            → C n)
         (n : ℕ)
         → C n
ind-completa C f n = f n (indℕ D D-zero D-suc n)
        w = z n
    in f n z
 ?
 where 
    D : nat -> set
    D n = (m: nat) -> m < n -> C m

    D-zero : D zero
    D-zero _ m<zero = ⊥-elim (¬zero<n m<zero)
    
    D-suc : (n:Nat) -> ((n : Nat) -> m < n -> C m) -> ((m:Nat) -> m < suc n -> C m)
    D-suc n HI m (zero, refl) = f n HI 
    D-suc n HI m (suc k, refl) = HI m (k , refl) 

-}


_~_ : {A : Set} {B : A -> Set} -> (f g : (a : A) -> B a) -> Set
(f ~ g) = ∀ a -> f a ≡ g a
--(f ~ g) = (a : _) -> f a ≡ g a


~refl : {A : Set} {B : A -> Set} {f : (a : A) -> B a} -> f ~ f
~refl _ = refl


~sym : {A : Set} {B : A -> Set} {f g : (a : A) -> B a} -> f ~ g -> g ~ f
~sym H a = sym (H a)

~trans : {A : Set} {B : A -> Set} {f g h : (a : A) -> B a} -> f ~ g -> g ~ h -> f ~ h 
~trans f~g g~h a = trans (f~g a) (g~h a) 





id : {A : Set} -> A -> A
id a = a 

record seria como un tipo sigma con nombres para los campos

_∘_ : ...
(g ∘ f) a = g (f a )

record qinv (f: A -> B) : set where
    field
            inv: B -> A
            inv∘f (inv ∘ f ) ~ id
            f∘inv

record isEquiv {A B : Set} (f : A -> B) : Set where
    field
        izq: B -> A
        izq∘f : (inf ∘ f) ~ id
        der: A-> B
        f∘der
        
record _≅_ (A B : Set) : Set where
    field
        iso : A -> B
        eqv : isEquiv iso


open qinv
open isEquiv

qinv⇒isEquiv : ... -> qinv f -> isEquiv f
--co-pattern-matching dependiente
izq (qinv⇒isEquiv qinvF) = inv qinvF
izq∘f (qinv⇒isEquiv qinvF) = inv∘f qinvF
der (qinv⇒isEquiv qinvF) = inv qinvF
der∘f (qinv⇒isEquiv qinvF) = f∘inv qinvF



_□ : {A B : Set} -> (f : A -> B) -> f ~ f
_ □ = ~-refl

_~≡⟨_⟩_ : {A : Set} {B : A -> Set} ->
            (f : (a : A) -> B a)
            {g : (a : A) -> B a} ... misma definicion que razonamiento ecuacional


~-cong-∘-left : {f g : A -> B) -> (h: B -> C) -> f ~ g -> h ∘ f ~ h ∘ g
~-cong-∘-left : {f g : A -> B) -> (h: B -> C) -> f ~ g -> h ∘ f ~ h ∘ g

isEquiv⇒qinv : ... ->  isEquiv f -> qinv f 
--co-pattern-matching dependiente
inv (isEquiv⇒qinv isEquivF) = izq isEquivF -- se puede elejir cualquiera de las dos, ya que van a ser homotópicas
inv (isEquiv⇒qinv isEquivF) = izq∘f isEquivF 
inv (isEquiv⇒qinv {A} {B} {f} isEquivF) = 
    (f ∘ inv (isEquiv⇒qinv isEquiv F))
    < ~-refl >
    (f ∘ izq isEquivF)
    < ~-refl >
    ((f ∘ izq isEquivF) ∘ id {B})
    < ~-cong--left (f ∘ izq isEquivF) (~-sym∘ f∘der isEquivF) >
    ((f ∘ izq isEquivF) ∘ (f ∘ der isEquivF)))


