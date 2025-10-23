open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Empty using (⊥-elim)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_×_; Σ-syntax; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (true; false)
open import Data.Nat using (ℕ; zero; suc; _+_; _≤_; _≟_; _≤?_; _*_; _!; _∸_; _^_)
open import Data.Nat.Properties using (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ)
open import Relation.Nullary using (Dec; yes; no; ¬_; _because_; ofⁿ; ofʸ)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Nat.Tactic.RingSolver using (solve; solve-∀)
open import Tactic.Cong using (cong!)

sumbelow : ℕ → (ℕ → ℕ) → ℕ
sumbelow zero f    =  0 -- no deberia pasar
sumbelow (suc b) f = f b + sumbelow b f

-- agregar una base lo hacia mucho mas complicado.
infixr 200 ∑⟨_⟩_
∑⟨_⟩_ :  ℕ -> (ℕ -> ℕ) -> ℕ  
(∑⟨ b ⟩ f) = f b + sumbelow b f


id : ℕ → ℕ
id n = n

aux1 : (n m : ℕ) -> 1 + n + m + (1 + n + m + zero) ≡ (n + n + 2) + (m + ( m + zero))
aux1 n m = solve (n ∷ m ∷ [])

test-proof : {n : ℕ} -> 2 * (∑⟨_⟩_ n id) ≡ (n + 1) * n
test-proof {zero} = refl
test-proof {suc n} =
  2 * (∑⟨ suc n ⟩ id)
    ≡⟨ refl ⟩
  1 + n + (∑⟨ n ⟩ id) + (1 + n + (∑⟨ n ⟩ id) + zero)
    ≡⟨ aux1 n (∑⟨ n ⟩ id) ⟩
  n + n + 2 + (∑⟨ n ⟩ id + (∑⟨ n ⟩ id + zero))
    ≡⟨ cong (λ ■ → n + n + 2 + ■ ) (test-proof {n}) ⟩
  n + n + 2 + (n + 1) * n
    ≡⟨ solve (n ∷ []) ⟩
  suc (n + (n + 1) * suc n) ∎


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
