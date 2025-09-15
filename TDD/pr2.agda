{-# OPTIONS --show-implicit #-}
----
---- Práctica 2: Naturales e igualdad
----

open import Agda.Primitive using (Level)

open import Data.Empty
    using (⊥; ⊥-elim)
open import Data.Bool
    using (Bool; true; false)
open import Data.Nat
    using (ℕ; zero; suc)
open import Data.Product
    using (_,_; Σ-syntax)
open import Relation.Binary.PropositionalEquality
    using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

infixl 20 _+_
infixl 30 _*_

---- Parte A ----

-- Considerar las siguientes definiciones de la suma y el producto:

_+_ : ℕ → ℕ → ℕ
zero  + b = b
suc a + b = suc (a + b)

_*_ : ℕ → ℕ → ℕ
zero  * _ = zero
suc a * b = b + a * b

-- A.1) Demostrar que la suma es asociativa.
+-assoc : {a b c : ℕ} → (a + b) + c ≡ a + (b + c)
+-assoc {0} = refl
+-assoc {suc a} = cong suc (+-assoc {a}) 

-- A.2) Demostrar que la suma es conmutativa.
-- Sugerencia: demostrar lemas auxiliares que prueben que:
--   a + zero = a
+-zero-left : {a : ℕ} -> a + zero ≡ a 
+-zero-left {zero} = refl
+-zero-left {suc n} = cong suc (+-zero-left {n})

--   a + suc b = suc (a + b)
+-sucsumr : {a b : ℕ} -> a + suc b ≡ suc (a + b)
+-sucsumr {zero} = refl
+-sucsumr {suc a} = cong suc (+-sucsumr {a})


+-comm : {a b : ℕ} → a + b ≡ b + a
+-comm {zero} {b} = sym (+-zero-left {b})
+-comm {suc a} {b} =  begin suc (a + b) ≡⟨ cong suc (+-comm {a} {b}) ⟩ suc (b + a) ≡⟨ sym +-sucsumr ⟩ b + suc a ∎   

*-zero-right : {a : ℕ} -> a * zero ≡ zero
*-zero-right {zero} = refl
*-zero-right {suc a} = begin suc a * 0  ≡⟨ *-zero-right {a} ⟩ zero  ∎

-- C-c C-, ; C-c C-= C-c C-r
-- A.3) Demostrar que el producto distribuye sobre la suma (a izquierda).
*-+-distrib-l : {a b c : ℕ} → (a + b) * c ≡ a * c + b * c
*-+-distrib-l {zero} {b} {c} =  refl
*-+-distrib-l {suc a} {b} {c} =    
    c + (a + b) * c     
        ≡⟨ cong (λ x -> c + x ) (*-+-distrib-l {a} {b} {c}) ⟩ 
    c + (a * c + b * c) 
        ≡⟨ sym (+-assoc {c} {a * c} {b * c}) ⟩ 
    c + a * c + b * c  ∎ 


-- A.4) Demostrar que el producto es asociativo:
*-assoc : {a b c : ℕ} → (a * b) * c ≡ a * (b * c)
*-assoc {zero} {b} {c} = refl
*-assoc {suc a} {b} {c} = 
    (b + a * b) * c 
        ≡⟨ *-+-distrib-l {b} {a * b} {c} ⟩ 
    b * c + a * b * c 
        ≡⟨ cong (λ x -> b * c + x) (*-assoc {a} {b} {c}) ⟩ 
    b * c + a * (b * c) ∎

-- A.5) Demostrar que el producto es conmutativo.
-- Sugerencia: demostrar lemas auxiliares que prueben que:
--   a * zero = zero
--   a * suc b = a + a * b

*-def-left : {a b : ℕ} -> a * suc b ≡ a + a * b
*-def-left {zero} {b} = refl
*-def-left {suc a} {b} = 
    suc (b + a * suc b) 
        ≡⟨ cong (λ x -> suc (b + x)) (*-def-left {a} {b}) ⟩ 
    suc (b + (a + a * b)) 
        ≡⟨ cong suc (sym (+-assoc {b} {a} {a * b})) ⟩ 
    suc ((b + a) + a * b) 
        ≡⟨ cong (λ x -> suc (x + a * b)) (+-comm {b} {a} ) ⟩ 
    suc ((a + b) + a * b) 
        ≡⟨ cong suc (+-assoc {a} {b} {a * b}) ⟩ 
    suc (a + (b + a * b)) ∎

*-comm : {a b : ℕ} → a * b ≡ b * a
*-comm {zero} {b}= sym (*-zero-right {b})
*-comm {suc a} {b}= 
    (b + a * b) 
        ≡⟨ cong (λ x -> b + x) (*-comm {a} {b}) ⟩ 
    (b + b * a)  
        ≡⟨ sym (*-def-left {b} {a} ) ⟩ 
    b * suc a ∎
    


-- A.6) Demostrar que el producto distribuye sobre la suma (a derecha).
-- Sugerencia: usar la conmutatividad y la distributividad a izquierda.
*-+-distrib-r : {a b c : ℕ} → a * (b + c) ≡ a * b + a * c
*-+-distrib-r {zero} {b} {c} = refl
*-+-distrib-r {suc a} {b} {c} = 
    (b + c + a * (b + c))  
        ≡⟨ cong (λ x → b + c + x) (*-comm {a} {b + c}) ⟩ 
    b + c + (b + c) * a 
        ≡⟨ cong (λ x → b + c + x) (*-+-distrib-l {b} {c} {a}) ⟩ 
    b + c + (b * a + c * a)
        ≡⟨ {!!} ⟩ -- do +-comm and +-assoc 5 more times and it solves  
    {!   !} ∎


--------------------------------------------------------------------------------

---- Parte B ----

-- Considerar la siguiente definición del predicado ≤ que dados dos números
-- naturales devuelve la proposición cuyos habitantes son demostraciones de que
-- n es menor o igual que m, y la siguiente función ≤? que dados dos
-- números naturales devuelve un booleano que indica si n es menor o igual que
-- n.

_≤_ : ℕ → ℕ → Set
n ≤ m = Σ[ k ∈ ℕ ] k + n ≡ m

_≤?_ : ℕ → ℕ → Bool
zero  ≤? m     = true
suc _ ≤? zero  = false
suc n ≤? suc m = n ≤? m

-- B.1) Demostrar que la función es correcta con respecto a su especificación.
-- Sugerencia: seguir el esquema de inducción con el que se define la función _≤?_.

-- primero necesitamos constructors de ≤
≤-refl : {n : ℕ} -> n ≤ n
≤-refl = zero , refl 

≤-suc : {n : ℕ} -> n ≤ suc n
≤-suc = 1 , refl

≤-np : {n m : ℕ} -> n ≤ m -> suc n ≤ suc m
≤-np {n} {m} (dif , proof)  = dif , (
    dif + suc n  
        ≡⟨ +-comm {dif} {suc n} ⟩ 
    suc n + dif 
        ≡⟨ cong suc (+-comm {n} {dif}) ⟩  
    suc (dif + n) 
        ≡⟨ cong suc (proof) ⟩ 
    suc m ∎ 
    )

≤-zero : {n : ℕ} -> zero ≤ n
≤-zero {n} = n , +-zero-left

≤-trans : {n m p : ℕ} -> n ≤ m -> m ≤ p -> n ≤ p
≤-trans {n} {m} {p} (nmDif , nmProof) (mpDif , mpProof) = (mpDif + nmDif) , (
    mpDif + nmDif + n  
        ≡⟨ +-assoc {mpDif} {nmDif} {n} ⟩ 
    mpDif + (nmDif + n)
        ≡⟨ cong (λ x → mpDif + x) (nmProof) ⟩ 
    mpDif + m
        ≡⟨ mpProof ⟩ 
    p ∎ 
    )

≤?-correcta : {n m : ℕ} → (n ≤? m) ≡ true → n ≤ m
≤?-correcta {zero} {m} p = ≤-zero {m}  
≤?-correcta {zero} {zero} _ =  ≤-refl 
≤?-correcta {suc n} {zero} () 
≤?-correcta {zero} {suc m} _ = ≤-zero  
≤?-correcta {suc n} {suc m} p = ≤-np (≤?-correcta {n} {m} p)  

-- B.2) Demostrar que es imposible que el cero sea el sucesor de algún natural:

zero-no-es-suc : {n : ℕ} → suc n ≡ zero → ⊥
zero-no-es-suc ()

-- B.3) Demostrar que la función es completa con respecto a su especificación.
-- Sugerencia: seguir el esquema de inducción con el que se define la función _≤?_.
-- * Para el caso en el que n = suc n' y m = zero, usar el ítem B.2 y propiedades de la suma.
-- * Para el caso en el que n = suc n' y m = suc m', recurrir a la hipótesis inductiva y propiedades de la suma.

≤?-completa : {n m : ℕ} → n ≤ m → (n ≤? m) ≡ true
≤?-completa {zero} {m} _ = refl
≤?-completa {suc n} {zero} = {!!} --( λ {k + suc n ≡ zero}  -> zero-no-es-suc ( (_+_ k (suc n)) ≡⟨ +-comm {k} {suc n} ⟩ suc (_+_ k n)  ∎) )
≤?-completa {suc n} {suc m} p = ≤?-completa {n} {m} {!!}

{-

zero  ≤? m     = true
suc _ ≤? zero  = false
suc n ≤? suc m = n ≤? m
-}

--------------------------------------------------------------------------------

---- Parte C ----

-- La siguiente función corresponde al principio de inducción en naturales:

indℕ : (C : ℕ → Set)
    (c0 : C zero)
    (cS : (n : ℕ) → C n → C (suc n))
    (n : ℕ)
    → C n
indℕ C c0 cS zero    = c0
indℕ C c0 cS (suc n) = cS n (indℕ C c0 cS n)

-- Definimos el predicado de "menor estricto" del siguiente modo:
_<_ : ℕ → ℕ → Set
n < m = suc n ≤ m

-- C.1) Demostrar el principio de inducción completa, que permite recurrir a la hipótesis
-- inductiva sobre cualquier número estrictamente menor.
ind-completa : (C : ℕ → Set)
         (f : (n : ℕ)
            → ((m : ℕ) → suc m ≤ n → C m)
            → C n)
         (n : ℕ)
         → C n
ind-completa C f n = {!!}


--------------------------------------------------------------------------------

---- Parte D ----

-- D.1) Usando pattern matching, definir el principio de inducción sobre la
-- igualdad:

ind≡ : {A : Set}
    {C : (a b : A) → a ≡ b → Set}
     → ((a : A) → C a a refl)
     → (a b : A) (p : a ≡ b) → C a b p
ind≡ {_} {C} a_to_Caar a b refl = a_to_Caar b

-- D.2) Demostrar nuevamente la simetría de la igualdad, usando ind≡:

sym' : {A : Set} {a b : A} → a ≡ b → b ≡ a
--sym' {A} {a} {b} ab = ind≡ {A} {(λ x y p -> y ≡ x )} (λ a -> a ≡ a) a b ab  
sym' = {!!}
-- D.3) Demostrar nuevamente la transitividad de la igualdad, usando ind≡:

trans' : {A : Set} {a b c : A} → a ≡ b → b ≡ c → a ≡ c
trans'  = {!!}

-- D.4) Demostrar nuevamente que la igualdad es una congruencia, usando ind≡:

cong' : {A B : Set} {a b : A} → (f : A → B) → a ≡ b → f a ≡ f b
cong' = {!!}