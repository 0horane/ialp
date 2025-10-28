open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Empty using (⊥-elim)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_×_; Σ-syntax; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (true; false)
open import Data.Nat using (ℕ; zero; suc; _∸_; _!; _/_; NonZero; nonZero) renaming (_+_ to _+ℕ_; _*_ to _*ℕ_)  
open import Data.Integer using (1ℤ; ℤ; pos;  _+_; _≤_; _≟_; _≤?_; _*_; _-_; _^_; +_; -_) -- renaming (suc to ℤsuc)
open import Data.Integer.Properties using (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ; n⊖n≡0; +-comm; m-n≡m⊖n; +-identityˡ; *-distribˡ-+; *-distribʳ-+; neg-distribʳ-*; *-assoc; *-comm)
-- open import Data.Nat.Properties renaming (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ;)
open import Data.Nat.Properties using (n∸n≡0) renaming (+-assoc to +-assoc-ℕ; +-comm to +-comm-ℕ; +-identityʳ to +-identityʳ-ℕ; +-identityˡ to +-identityˡ-ℕ ; *-distribˡ-+ to  *-distribˡ-+-ℕ)   
open import Relation.Nullary using (Dec; yes; no; ¬_; _because_; ofⁿ; ofʸ)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Nat.Tactic.RingSolver using (solve; solve-∀)
open import Data.Integer.Tactic.RingSolver renaming (solve to solve-ℤ)
open import Tactic.Cong using (cong!)


infixr 200 ∑⟨_⟩_
∑⟨_⟩_ :   ℕ -> (ℕ -> ℤ) -> ℤ  
∑⟨ zero ⟩ f = f 0
∑⟨ suc b ⟩ f = f (suc b) + ∑⟨  b ⟩ f

infixr 201 ∑⟨_⦂_⟩_
∑⟨_⦂_⟩_ :  ℕ -> ℕ -> (ℕ -> ℤ) -> ℤ  
∑⟨ zero ⦂ b ⟩ f = ∑⟨ b ⟩ f
∑⟨ suc a ⦂ b ⟩ f = ∑⟨ b ⟩ f - ∑⟨ a ⟩ f



∑-high : (a b : ℕ) -> (f : ℕ → ℤ) -> ∑⟨ a ⦂ suc b  ⟩ f ≡ f (suc b) + ∑⟨ a ⦂ b ⟩ f
∑-high zero b f = refl
∑-high (suc a) b f = +-assoc (f (suc b)) (∑⟨ b ⟩ f) (- ∑⟨ a ⟩ f)


n-n≡0 : (n : ℤ) → n - n ≡ + 0
n-n≡0 n = solve-ℤ (n ∷ [])

tempaux : (a b fa : ℤ) -> b - a ≡ fa + (b - (fa + a))
tempaux a b fa = solve-ℤ (a ∷ b ∷ fa ∷ [])

∑-low : (a b : ℕ) -> (f : ℕ → ℤ) -> ∑⟨ a ⦂  b ⟩ f ≡ f a + ∑⟨ suc a ⦂ b ⟩ f
∑-low zero b f = sym (
  f 0 + (∑⟨ b ⟩ f - f 0)
    ≡⟨ cong (λ ■ → f 0 + ■) (+-comm (∑⟨ b ⟩ f) (- (f 0))) ⟩
  f 0 + (- f 0 + ∑⟨ b ⟩ f)
    ≡⟨ sym (+-assoc (f 0) (- f 0) (∑⟨ b ⟩ f)) ⟩
  (f 0 - f 0) + ∑⟨ b ⟩ f
    ≡⟨  cong (λ ■ → ■ + ∑⟨ b ⟩ f) (n-n≡0 (f 0)) ⟩
  + 0 + ∑⟨ b ⟩ f
    ≡⟨ +-identityˡ (∑⟨ b ⟩ f) ⟩
  ∑⟨ b ⟩ f ∎)

∑-low (suc a) b f = tempaux (∑⟨ a ⟩ f) (∑⟨ b ⟩ f) (f (suc a))

tempaux2 : (a b c d : ℤ) -> a - b + (c - d) ≡ (a + c) - (b + d)
tempaux2 a b c d = solve-ℤ (a ∷ b ∷ c ∷ d ∷ [])

∑0+∑0≡∑0 : {c : ℕ} { f g : ℕ → ℤ } -> ∑⟨ c ⟩ f + ∑⟨ c ⟩ g  ≡  ∑⟨ c ⟩ (λ i → f i + g i)
∑0+∑0≡∑0 {zero} {f} {g} = refl
∑0+∑0≡∑0 {suc c} {f} {g} = 
   (f (suc c) + ∑⟨ c ⟩ f) + (g (suc c) + ∑⟨ c ⟩ g)
    ≡⟨ +-assoc (f (suc c)) (∑⟨ c ⟩ f) (g (suc c) + ∑⟨ c ⟩ g) ⟩
  f (suc c) + (∑⟨ c ⟩ f + (g (suc c) + ∑⟨ c ⟩ g))
    ≡⟨ cong (λ ■ → f (suc c) + ■) (sym (+-assoc (∑⟨ c ⟩ f) (g (suc c)) (∑⟨ c ⟩ g))) ⟩
  f (suc c) + ((∑⟨ c ⟩ f + g (suc c)) + ∑⟨ c ⟩ g)
    ≡⟨ cong (λ ■ → f (suc c) + (■ + ∑⟨ c ⟩ g)) (+-comm (∑⟨ c ⟩ f) (g (suc c)) ) ⟩
  f (suc c) + ((g (suc c) + ∑⟨ c ⟩ f ) + ∑⟨ c ⟩ g)
    ≡⟨ cong (λ ■ → f (suc c) + ■) (+-assoc (g (suc c)) (∑⟨ c ⟩ f) (∑⟨ c ⟩ g)) ⟩
  f (suc c) + (g (suc c) + (∑⟨ c ⟩ f  + ∑⟨ c ⟩ g))
    ≡⟨ cong (λ ■ → f (suc c) + (g (suc c) + ■)) (∑0+∑0≡∑0 {c} {f} {g}) ⟩
  f (suc c) + (g (suc c) + ∑⟨ c ⟩ (λ n → f n + g n )  )
    ≡⟨ sym (+-assoc (f (suc c)) (g (suc c)) (∑⟨ c ⟩ (λ i → f i + g i))) ⟩
  f (suc c) + g (suc c) + ∑⟨ c ⟩ (λ i → f i + g i)  ∎
 

∑+∑≡∑ : {b c : ℕ} { f g : ℕ → ℤ } -> ∑⟨ b ⦂ c ⟩ f + ∑⟨ b ⦂ c ⟩ g  ≡  ∑⟨ b ⦂ c ⟩ (λ i → f i + g i)
∑+∑≡∑ {zero} {c} {f} {g} = ∑0+∑0≡∑0 {c} {f} {g}
∑+∑≡∑ {suc b} {c} {f} {g} =
    ∑⟨ c ⟩ f - ∑⟨ b ⟩ f + (∑⟨ c ⟩ g - ∑⟨ b ⟩ g)
    ≡⟨ tempaux2 (∑⟨ c ⟩ f) ( ∑⟨ b ⟩ f)  (∑⟨ c ⟩ g) ( ∑⟨ b ⟩ g)  ⟩
  ∑⟨ c ⟩ f + ∑⟨ c ⟩ g - (∑⟨ b ⟩ f + ∑⟨ b ⟩ g)
    ≡⟨ cong (λ ■ → ■ - (∑⟨ b ⟩ f + ∑⟨ b ⟩ g)) (∑0+∑0≡∑0 {c} {f} {g}) ⟩
  ∑⟨ c ⟩ (λ i → f i + g i) - (∑⟨ b ⟩ f + ∑⟨ b ⟩ g)
    ≡⟨ cong (λ ■ → ∑⟨ c ⟩ (λ i → f i + g i) - ■) (∑0+∑0≡∑0 {b} {f} {g}) ⟩
   ∑⟨ c ⟩ (λ i → f i + g i) - ∑⟨ b ⟩ (λ i → f i + g i) ∎
 

n*∑0=∑0n* : {c : ℕ} {a : ℤ} { f : ℕ → ℤ } -> a * ∑⟨ c ⟩ f  ≡  ∑⟨ c ⟩ (λ i → a *  f i)
n*∑0=∑0n* {zero} {a} {f} = refl
n*∑0=∑0n* {suc c} {a} {f} =
  a * (f (suc c) + ∑⟨ c ⟩ f)
    ≡⟨ *-distribˡ-+ a (f (suc c)) (∑⟨ c ⟩ f) ⟩
  a * f (suc c) + a * ∑⟨ c ⟩ f
    ≡⟨ cong (_+_ (a * f (suc c))) (n*∑0=∑0n* {c} {a} {f}) ⟩
   a * f (suc c) + ∑⟨ c ⟩ (λ i → a * f i) ∎


n*∑=∑n* : {b c : ℕ} {a : ℤ} { f : ℕ → ℤ } -> a * ∑⟨ b ⦂ c ⟩ f  ≡  ∑⟨ b ⦂ c ⟩ (λ i → a *  f i)
n*∑=∑n* {zero} {c} {a} {f} = n*∑0=∑0n* {c} {a} {f}
n*∑=∑n* {suc b} {c} {a} {f} =
  a * (∑⟨ c ⟩ f - ∑⟨ b ⟩ f)
    ≡⟨ *-distribˡ-+ a (∑⟨ c ⟩ f) (- ∑⟨ b ⟩ f) ⟩
  a * ∑⟨ c ⟩ f + a * - ∑⟨ b ⟩ f
    ≡⟨ cong (_+_ (a * ∑⟨ c ⟩ f)) (sym (neg-distribʳ-* a (∑⟨ b ⟩ f)) ) ⟩
  a * ∑⟨ c ⟩ f + - (a * ∑⟨ b ⟩ f)
    ≡⟨ cong (λ ■ → a * ∑⟨ c ⟩ f + - ■) (n*∑0=∑0n* {b} {a} {f} )  ⟩
  (a * ∑⟨ c ⟩ f) + - ∑⟨ b ⟩ (λ i → a * f i)
    ≡⟨ cong (λ ■ → ■ + - ∑⟨ b ⟩ (λ i → a * f i)) (n*∑0=∑0n* {c} {a} {f}) ⟩ 
  ∑⟨ c ⟩ (λ i → a * f i) + - ∑⟨ b ⟩ (λ i → a * f i) ∎



cambioDeBase : (n : ℕ) (f : ℕ → ℕ → ℤ) -> ∑⟨ n ⟩ (f n) ≡ ∑⟨ 1 ⦂ suc n ⟩ (λ i → (f n (i ∸ 1)))
cambioDeBase zero f = sym (
   f0 + f0 - f0
    ≡⟨ +-assoc (f0) (f0) (- f0) ⟩
  f0 + (f0 + - f0)
    ≡⟨ cong (_+_ (f0)) (n-n≡0 (f0)) ⟩
  f0 + + 0
    ≡⟨ +-identityʳ (f0)  ⟩
  f0 ∎ )
    where f0 = f 0 0

cambioDeBase (suc n) f = 
  f (suc n) (suc n) + ∑⟨ n ⟩ f (suc n)
    ≡⟨ cong (_+_ (f (suc n) (suc n))) (cambioDeBase n (λ n → f (suc n))) ⟩
  f (suc n) (suc n) + (f (suc n) n + ∑⟨ n ⟩ (λ i → f (suc n) (i ∸ 1)) - f (suc n) 0)
    ≡⟨ sym (+-assoc (f (suc n) (suc n)) (f (suc n) n + ∑⟨ n ⟩ (λ i → f (suc n) (i ∸ 1))) (- f (suc n) 0))  ⟩
  ∑⟨ 1 ⦂ suc (suc n) ⟩ (λ i → f (suc n) (i ∸ 1)) ∎ 


-- HI = ∑⟨ n ⟩ f n ≡ f n n + ∑⟨ n ⟩ (λ i → f n (i ∸ 1)) - f n 0
-- HI = ∑⟨ n ⟩ (λ i → f n (i ∸ 1)) ≡ f n (n ∸ 1) + ∑⟨ n ⟩ (λ i → f n (i ∸ 1 ∸ 1)) - f n 0
-- ∑⟨ n ⟩ f (suc n) ≡ f (suc n) n + ∑⟨ n ⟩ (λ i → f (suc n) (i ∸ 1)) - f (suc n) 0

id : ℤ → ℤ
id n = n

-- la definicion con factorial usa division. por ahora lo quiero evitar. 
binom : ℕ → ℕ → ℕ
binom _ zero = 1
binom zero (suc _) = 0 --nunca deberia llegar a este caso si n ≥ k. tal vez hay que pasar eso como argumento?
binom (suc n) (suc k) = binom n k +ℕ binom n (suc k)

{-
fact-nonzero : (n : ℕ) -> NonZero (n !)
fact-nonzero n = ?

binom-fac-def : (n k : ℕ) → binom n k ≡ _/_ (n !) ((k !) *ℕ ((n ∸ k) !)) { fact-nonzero k * fact-nonzero (n ∸ k) }
binom-fac-def = ?
-}

{-
aux3real : (x y : ℤ) (n : ℕ) -> ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) ≡ ∑⟨ n ⟩ (λ i →  (+ binom n i * x ^ (suc (n ∸ i)) * y ^ i))
aux3real x y n =
  ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i))
    ≡⟨ cong {!λ ■ → ∑⟨ n ⟩ (λ i → ■ i)!} (λ i → (sym (*-assoc x (+ binom n i * x ^ (n ∸ i)) (y ^ i)))) ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!} ∎
-}

tempaux4 : (a b c : ℤ) -> a + b - b ≡ a + c - c
tempaux4 a b c = solve-ℤ (a ∷ b ∷ c ∷ [])

∸doesNotBreaksumWith1Base : (n : ℕ) (x y : ℤ) ->
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom (suc n) (i ∸ 1) * x ^ ((suc n) ∸ (i ∸ 1)) * y ^ suc (i ∸ 1)) ≡ 
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom (suc n) (i ∸ 1) * x ^ (suc (suc n ∸ i) ) * y ^ i)
∸doesNotBreaksumWith1Base zero x y = tempaux4 (+ 1 * (x * 1ℤ) * (y * 1ℤ)) ( + 1 * (x * 1ℤ) * (y * 1ℤ)) ( + 1 * (x * (x * 1ℤ)) * 1ℤ)
∸doesNotBreaksumWith1Base (suc n) x y = 
  ∑⟨ 1 ⦂ suc (suc n) ⟩ (λ i → + binom (suc (suc n)) (i ∸ 1) * x ^ (suc (suc n) ∸ (i ∸ 1)) * y ^ suc (i ∸ 1))
    ≡⟨ ∑-high 1 (suc n) (λ i → + binom (suc (suc n)) (i ∸ 1) * x ^ (suc (suc n) ∸ (i ∸ 1)) * y ^ suc (i ∸ 1)) ⟩
  takenOut +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom (suc (suc n)) (i ∸ 1) * x ^ (suc (suc n) ∸ (i ∸ 1)) * y ^ suc (i ∸ 1))
    ≡⟨ refl ⟩
  takenOut + 
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom (suc (suc n)) (i ∸ 1) * (x ^ (suc (suc n) ∸ (i ∸ 1))) * (y * y ^ (i ∸ 1)))
    ≡⟨ refl ⟩
  takenOut + (
  ∑⟨ suc n ⟩ (λ i → + binom (suc (suc n)) (i ∸ 1) * (x ^ (suc (suc n) ∸ (i ∸ 1))) * (y * y ^ (i ∸ 1))) -
   zeroTerm) 
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!} ∎
    where takenOut = + binom (suc (suc n)) (suc (suc n) ∸ 1) *
                   x ^ (suc (suc n) ∸ (suc (suc n) ∸ 1))
                   * y ^ suc (suc (suc n) ∸ 1)
          zeroTerm = + binom (suc (suc n)) (zero ∸ 1) * (x ^ (suc (suc n) ∸ (zero ∸ 1))) * (y * y ^ (zero ∸ 1))

{- IH

binom n n * x ^ (suc n ∸ n) * (y * y ^ n) +
∑⟨ n ⟩
(λ i →
   + binom n (i ∸ 1) * x ^ (suc n ∸ (i ∸ 1)) * (y * y ^ (i ∸ 1)))
- + 1 * (x * x ^ n) * (y * 1ℤ)
≡
+ binom n n * (x * x ^ (n ∸ n)) * (y * y ^ n) +
∑⟨ n ⟩ (λ i → + binom n (i ∸ 1) * (x * x ^ (suc n ∸ i)) * y ^ i)
- + 1 * (x * (x * x ^ n)) * 1ℤ

-}

binomialTheorem : {x y : ℤ} {n : ℕ} -> (x + y) ^ n ≡ ∑⟨ 0 ⦂ n ⟩ λ k → (+ (binom n k)) * x ^ (n ∸ k) * y ^ k
binomialTheorem {x} {y} {zero} = refl
binomialTheorem {x} {y} {suc n} =
  (x + y) ^ suc n
    ≡⟨ refl ⟩
  (x + y) * (x + y) ^ n 
    ≡⟨ cong (_*_ (x + y)) (binomialTheorem {x} {y} {n}) ⟩
  (x + y) * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k)
    ≡⟨ *-distribʳ-+ (∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k))  x y ⟩
  x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) +
  y * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k)
    ≡⟨ cong (λ ■ →  x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) + ■) (n*∑0=∑0n* {n} {y} {λ k → + binom n k * x ^ (n ∸ k) * y ^ k}) ⟩
   x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) +
  ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))
    ≡⟨ cong (λ ■ → ■ + ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))) (n*∑0=∑0n* {n} {x} {λ k → + binom n k * x ^ (n ∸ k) * y ^ k}) ⟩
  ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) +
  ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))
  {- ≡⟨ refl ⟩
  ∑⟨ n ⟩ (binomxi n y x ) +
  ∑⟨ n ⟩ (binomyi n x y ) -}
    ≡⟨ {!!} ⟩
  ∑⟨ n ⟩ (λ i → + binom n i * x ^ (suc (n ∸ i)) * y ^ i) +
  ∑⟨ n ⟩ (λ i → + binom n i * x ^ (n ∸ i) * y ^ (suc i))
    ≡⟨ cong (λ ■ → ∑⟨ n ⟩ (λ i → + binom n i * x ^ (suc (n ∸ i)) * y ^ i) + ■) (cambioDeBase n λ n i → + binom n i * x ^ (n ∸ i) * y ^ (suc i)) ⟩
  ∑⟨ n ⟩ (λ i → + binom n i * x ^ suc (n ∸ i) * y ^ i) +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ suc (i ∸ 1))
    ≡⟨ cong (λ ■ → ∑⟨ n ⟩ (λ i → + binom n i * x ^ suc (n ∸ i) * y ^ i) + ■) (∑-high 1 n (λ i → + binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ suc (i ∸ 1))) ⟩
  ∑⟨ n ⟩ (λ i → + binom n i * x ^ suc (n ∸ i) * y ^ i) +
  (+ binom n (suc n ∸ 1) * x ^ (n ∸ (suc n ∸ 1)) * y ^ suc (suc n ∸ 1) +
  ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ suc (i ∸ 1)))
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  ∑⟨ 0 ⦂ suc n ⟩ (λ k → + binom (suc n) k * x ^ (suc n ∸ k) * y ^ k) ∎

-- record Prime

-- fermatsLittleTheorem : {a : ℕ} {p : Prime} -> a ** p ≡[p] a
