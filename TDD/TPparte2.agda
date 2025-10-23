open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Empty using (⊥-elim)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_×_; Σ-syntax; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (true; false)
open import Data.Nat using (ℕ; zero; suc; _+_; _≤_; _≟_; _≤?_; _*_; _!; _∸_; _^_)
open import Data.Nat.Properties using (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ; ∸-self)
open import Relation.Nullary using (Dec; yes; no; ¬_; _because_; ofⁿ; ofʸ)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Nat.Tactic.RingSolver using (solve; solve-∀)
open import Tactic.Cong using (cong!)


sumbelow : ℕ → (ℕ → ℕ) → ℕ
sumbelow zero f    =  0 
sumbelow (suc b) f = f b + sumbelow b f

-- agregar una base lo hacia mucho mas complicado.
infixr 200 ∑⟨_⟩_
∑⟨_⟩_ :  ℕ -> (ℕ -> ℕ) -> ℕ  
(∑⟨ b ⟩ f) = f b + sumbelow b f

-- esta def supone que los terminos de la sumatoria son positivos. como es entre naturales funciona bien
infixr 201 ∑⟨_⦂_⟩_
∑⟨_⦂_⟩_ :  ℕ -> ℕ -> (ℕ -> ℕ) -> ℕ  
(∑⟨ zero ⦂ b ⟩ f) = ∑⟨ b ⟩ f
(∑⟨ suc a ⦂ b ⟩ f) = ∑⟨ b ⟩ f ∸ ∑⟨ a ⟩ f

∑-high : (a b : ℕ) -> (f : ℕ → ℕ) -> ∑⟨ a ⦂ suc b ⟩ f ≡ f (suc b) + ∑⟨ a ⦂ b ⟩ f
∑-high zero b f = refl
∑-high (suc a) b f =
  ∑⟨ suc a ⦂ suc b ⟩ f
    ≡⟨ cong (λ ■ → ■ ∸  ∑⟨ a ⟩ f) (∑-high zero b f) ⟩ -- ∑⟨ a ⦂ suc b ⟩ f ≡ f (suc b) + ∑⟨ a ⦂ b ⟩ f
  
  f (suc b) + ∑⟨ b ⟩ f ∸ ∑⟨ a ⟩ f
    ≡⟨ {!!} ⟩
  
  f (suc b) + (∑⟨ b ⟩ f ∸ ∑⟨ a ⟩ f)   
 ∎


∑-low : (a b : ℕ) -> (f : ℕ → ℕ) -> ∑⟨ a ⦂  b ⟩ f ≡ f a + ∑⟨ suc a ⦂ b ⟩ f
∑-low zero zero f = sym (
  f zero + (∑⟨ zero ⟩ f ∸ ∑⟨ 0 ⟩ f)
    ≡⟨ cong! (∸-self (∑⟨ zero ⟩ f)) ⟩
  f zero + zero
    ≡⟨ refl ⟩
  ∑⟨ zero ⟩ f  ∎ )
∑-low zero (suc b) f = {!!}
∑-low (suc a) b f = {!!}

∑+∑≡∑ : {b c : ℕ} { f g : ℕ → ℕ } -> ∑⟨ b ⦂ c ⟩ f + ∑⟨ b ⦂ c ⟩ g  ≡  ∑⟨ b ⦂ c ⟩ (λ i → f i + g i)
∑+∑≡∑ {zero} {zero} {f} {g} =
  f zero + zero + (g zero + zero)  
    ≡⟨ cong! (+-identityʳ (f zero)) ⟩
  f zero + (g zero + zero)
    ≡⟨ sym (+-assoc (f zero) (g zero) zero) ⟩
  f zero + g zero + zero
    ≡⟨ refl ⟩
  ∑⟨ zero ⟩ (λ i → f i + g i)
  ∎



∑+∑≡∑ {zero} {suc c} {f} {g} =
  ∑⟨ suc c ⟩ f + ∑⟨ suc c ⟩ g
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!} ∎

-- ∑⟨ c ⟩ f + ∑⟨ c ⟩ g ≡ ∑⟨ c ⟩ (λ i → f i + g i)
∑+∑≡∑ {suc b} {c} {f} {g} = {!!}

n*∑=∑n* : {a b c : ℕ} { f : ℕ → ℕ } -> a * ∑⟨ b ⦂ c ⟩ f  ≡  ∑⟨ b ⦂ c ⟩ (λ i → a *  f i)
n*∑=∑n* {zero} {b} {c} = {!!}
n*∑=∑n* {suc a} {b} {c} = {!!}

id : ℕ → ℕ
id n = n

-- la definicion con factorial usa division. por ahora lo quiero evitar. 
binom : ℕ → ℕ → ℕ
binom _ zero = 1
binom zero (suc _) = 0 --nunca deberia llegar a este caso si n ≥ k. tal vez hay que pasar eso como argumento?
binom (suc n) (suc k) = binom n k + binom n (suc k)

binomialTheorem : {x y n : ℕ} -> (x + y) ^ n ≡ ∑⟨ n ⟩ λ k → binom n k * x ^ (n ∸ k) * y ^ k
binomialTheorem {x} {y} {zero} = refl
binomialTheorem {x} {y} {suc n} = {!!}
-- record Prime

-- fermatsLittleTheorem : {a : ℕ} {p : Prime} -> a ** p ≡[p] a
