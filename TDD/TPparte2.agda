open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Empty using (⊥-elim; ¬)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_×_; Σ-syntax; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Data.Bool using (true; false)
open import Data.Nat using (ℕ; zero; suc; _∸_; _!; _/_; NonZero; nonZero) renaming (_+_ to _+ℕ_; _*_ to _*ℕ_; _≤_ to _≤ℕ_)  
open import Data.Integer using (1ℤ; ℤ; pos;  _+_; _≤_; _≟_; _≤?_; _*_; _-_; _^_; +_; -_) -- renaming (suc to ℤsuc)
open import Data.Integer.Properties using (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ; n⊖n≡0; +-comm; m-n≡m⊖n; +-identityˡ; *-distribˡ-+; *-distribʳ-+; neg-distribʳ-*; *-assoc; *-comm)
-- open import Data.Nat.Properties renaming (≤-step; ≤-refl; ≤-trans; +-monoʳ-≤; +-assoc; +-identityʳ;)
open import Data.Nat.Properties using (n∸n≡0; 1+n≢0; ∸-suc) renaming (+-assoc to +-assoc-ℕ; +-comm to +-comm-ℕ; +-identityʳ to +-identityʳ-ℕ; +-identityˡ to +-identityˡ-ℕ ; *-distribˡ-+ to  *-distribˡ-+-ℕ; m≤n⇒m≤1+n to m≤ℕn⇒m≤ℕ1+n; ≤-refl to ≤ℕ-refl)   
open import Relation.Nullary using (Dec; yes; no; ¬_; _because_; ofⁿ; ofʸ)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Nat.Tactic.RingSolver using (solve; solve-∀)
open import Data.Integer.Tactic.RingSolver renaming (solve to solve-ℤ)
open import Tactic.Cong using (cong!)

-- TODO
-- fix all lambdas to be the same symbol
-- extract long congs into wheres so you can see whats happening
-- see what parts can be redone better with ∑-cong
-- see what things can be made implicit, probably the functions in ∑-cong and whatever takes ≡ as arg
-- replace all the solve macros and manually do all the comms and assocs
-- same argument order in the different ∑-congs

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


b-a≡c+[b-[c+a]] : (a b fa : ℤ) -> b - a ≡ fa + (b - (fa + a))
b-a≡c+[b-[c+a]] a b fa = solve-ℤ (a ∷ b ∷ fa ∷ [])

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

∑-low (suc a) b f = b-a≡c+[b-[c+a]] (∑⟨ a ⟩ f) (∑⟨ b ⟩ f) (f (suc a))

∑0-cong : (a : ℕ) (f g : ℕ → ℤ) -> ((x : ℕ) → f x ≡ g x) -> ∑⟨ a ⟩ f ≡ ∑⟨ a ⟩ g
∑0-cong zero f g fx≡gx = fx≡gx 0
∑0-cong (suc a) f g fx≡gx =
  f (suc a) + ∑⟨ a ⟩ f
    ≡⟨ cong (_+_ (f (suc a))) (∑0-cong a f g fx≡gx) ⟩
  f (suc a) + ∑⟨ a ⟩ g
    ≡⟨ cong (λ ■ → ■ + ∑⟨ a ⟩ g) (fx≡gx (suc a)) ⟩
  ∑⟨ suc a ⟩ g ∎

∑-cong : (a b : ℕ) (f g : ℕ → ℤ) -> ((x : ℕ) → f x ≡ g x) -> ∑⟨ a ⦂ b ⟩ f ≡ ∑⟨ a ⦂ b ⟩ g
∑-cong zero b f g fx≡gx = ∑0-cong b f g fx≡gx
∑-cong (suc a) b f g fx≡gx =
   ∑⟨ b ⟩ f - ( ∑⟨ a ⟩ f)
    ≡⟨ cong (λ ■ → ∑⟨ b ⟩ f - ■) (∑0-cong a f g fx≡gx) ⟩
  ∑⟨ b ⟩ f - ∑⟨ a ⟩ g
    ≡⟨ cong (λ ■ → ■ - ∑⟨ a ⟩ g) (∑0-cong b f g fx≡gx) ⟩
  ∑⟨ suc a ⦂ b ⟩ g
    ∎

∑0-cong-i≤a : (a : ℕ) (f g : ℕ → ℤ) -> ((i : ℕ) → i ≤ℕ a → f i ≡ g i) -> ∑⟨ a ⟩ f ≡ ∑⟨ a ⟩ g
∑0-cong-i≤a zero f g p = p 0 _≤ℕ_.z≤n
∑0-cong-i≤a (suc a) f g fx≡gx =
  f (suc a) + ∑⟨ a ⟩ f
    ≡⟨ cong (_+_ (f (suc a))) (∑0-cong-i≤a a f g λ i x → fx≡gx i (m≤ℕn⇒m≤ℕ1+n x )) ⟩
  f (suc a) + ∑⟨ a ⟩ g
    ≡⟨ cong (λ ■ → ■ + ∑⟨ a ⟩ g) (fx≡gx (suc a) (_≤ℕ_.s≤s ≤ℕ-refl)) ⟩
  ∑⟨ suc a ⟩ g ∎

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
 

∑+∑≡∑ : (b c : ℕ) (f g : ℕ → ℤ ) -> ∑⟨ b ⦂ c ⟩ f + ∑⟨ b ⦂ c ⟩ g  ≡  ∑⟨ b ⦂ c ⟩ (λ i → f i + g i)
∑+∑≡∑ zero c f g = ∑0+∑0≡∑0 {c} {f} {g}
∑+∑≡∑ (suc b) c f g =
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

id : ℤ → ℤ
id n = n


a+k-k≡a : (a k : ℤ) ->  a + k - k ≡ a
a+k-k≡a a k =
  a + k + (- k)
    ≡⟨ +-assoc a k (- k) ⟩
  a + (k - k)
    ≡⟨ cong (_+_ a) (n-n≡0 k) ⟩
  a + + 0
    ≡⟨ +-identityʳ a ⟩
  a ∎ 

-- la definicion con factorial usa division. por ahora lo quiero evitar. 
binom : ℕ → ℕ → ℕ
binom _ zero = 1
binom zero (suc _) = 0 --nunca deberia llegar a este caso si n ≥ k. tal vez hay que pasar eso como argumento?
binom (suc n) (suc k) = binom n k +ℕ binom n (suc k)

binom-sep : (n k : ℕ) -> + binom n k ≡ + binom (suc n) (suc k) - + binom n (suc k)
binom-sep n k = sym (a+k-k≡a (+ binom n k) (+ binom n (suc k)))

binom-join : (n k : ℕ) -> ¬ k ≡ 0 -> + binom n k + + binom (n) (k ∸ 1) ≡ + binom (suc n) k
binom-join n zero ¬0≡0 = ⊥-elim (¬0≡0 refl)
binom-join n (suc k) _ = cong (λ ■ → + ■) (+-comm-ℕ (binom n (suc k)) (binom n k))

∑-cong>0 : (f g : ℕ -> ℤ) (n : ℕ) -> ((i : ℕ) -> ¬ (i ≡ 0) -> f i ≡ g i) -> ∑⟨ 1 ⦂ suc n ⟩ f ≡ ∑⟨ 1 ⦂ suc n ⟩ g
∑-cong>0 f g zero i≢0→f≡g =
  f 1 + f 0 - f 0
    ≡⟨ a+k-k≡a (f 1) (f 0) ⟩
  f 1
    ≡⟨ i≢0→f≡g (1) (λ ()) ⟩
  g 1
    ≡⟨ sym (a+k-k≡a (g 1) (g 0)) ⟩
  ∑⟨ 1 ⦂ 1 ⟩ g ∎
∑-cong>0 f g (suc n) i≢0→f≡g = 
  f (suc (suc n)) + (f (suc n) + ∑⟨ n ⟩ f) - f 0 -- ∑⟨ 1 ⦂ suc (suc n) ⟩ f
    ≡⟨ +-assoc (f (suc (suc n))) (f (suc n) + ∑⟨ n ⟩ f) (- f 0) ⟩
  f (suc (suc n)) + (f (suc n) + ∑⟨ n ⟩ f - f 0)
    ≡⟨ cong (_+_ (f (suc (suc n)))) (∑-cong>0 f g n i≢0→f≡g)  ⟩
  f (suc (suc n)) + ∑⟨ 1 ⦂ suc n ⟩ g
    ≡⟨ cong (λ ■ → ■ + ∑⟨ 1 ⦂ suc n ⟩ g) (i≢0→f≡g (suc (suc n)) 1+n≢0 ) ⟩
  g (suc (suc n)) + ∑⟨ 1 ⦂ suc n ⟩ g
    ≡⟨ sym (+-assoc (g (suc (suc n))) (g (suc n) + ∑⟨ n ⟩ g) (- ∑⟨ 0 ⟩ g)) ⟩
   ∑⟨ 1 ⦂ suc (suc n) ⟩ g ∎



commassocl : (x y z : ℤ) -> x * (y * z) ≡ y * (x * z)
commassocl x y z = trans (sym (*-assoc x y z)) (trans (cong (λ ■ → ■ * z) (*-comm x y)) (*-assoc y x z))

∸doesNotBreaksumWith1Base : (n : ℕ) (x y : ℤ) ->
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → y * (+ binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ (i ∸ 1))) ≡
  ∑⟨ 1 ⦂ suc n ⟩ (λ i →      + binom n (i ∸ 1) * x ^ (suc n ∸ i)   * y ^  i)
∸doesNotBreaksumWith1Base n x y =
  ∑-cong>0
      (λ i → y * (+ binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ (i ∸ 1)))
      (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i)   * y ^  i)
      n
      ≢λi
      where ≢λi : (i : ℕ) → ¬ i ≡ 0 →
                  y * (+ binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ (i ∸ 1)) ≡
                  + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i
            ≢λi zero i≢0 = ⊥-elim (i≢0 refl)
            ≢λi (suc i) i≢0 = commassocl y (+ binom n (suc i ∸ 1) * x ^ (n ∸ (suc i ∸ 1))) (y ^ i) 


binomialTheorem : {x y : ℤ} {n : ℕ} -> (x + y) ^ n ≡ ∑⟨ 0 ⦂ n ⟩ λ k → (+ (binom n k)) * x ^ (n ∸ k) * y ^ k
binomialTheorem {x} {y} {zero} = refl
binomialTheorem {x} {y} {suc n} =
  (x + y) ^ suc n
    ≡⟨ refl ⟩
  (x + y) * (x + y) ^ n 
    ≡⟨ inductiveHypothesis ⟩
  (x + y) * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k)
    ≡⟨ *-distribʳ-+ (∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k))  x y ⟩
  x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) +
  y * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k)
    ≡⟨ xy*∑=∑xy* ⟩
  ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) +
  ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))
    ≡⟨ cambioDeBaseAp ⟩
  ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → y * (+ binom n (i ∸ 1) * x ^ (n ∸ (i ∸ 1)) * y ^ (i ∸ 1)))
     ≡⟨ ∸doesNotBreaksumWith1BaseAp ⟩
  ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)
    ≡⟨ cong (λ ■ → ■ + ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)) (∑x*y*x^z≡∑y*x^[1+z] n x y) ⟩
  ∑⟨ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i) +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)
    ≡⟨ ∑-lowAp ⟩
  + binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +
  ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i) +
  ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)
    ≡⟨ ∑-highAp ⟩
  + binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +
  ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i) +
  (+ binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n +
  ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i))
    ≡⟨ [a+b]+[c+d]≡[a+c]+[b+d]Ap  ⟩
  + binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +
  + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n +
  (∑⟨ 1 ⦂ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i) +
  ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i))
    ≡⟨ ∑+∑≡∑Ap  ⟩
  + binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +
  + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n +
  ∑⟨ 1 ⦂ n ⟩ (λ i →
     + binom n i * x ^ (suc n ∸ i) * y ^ i +
     + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)
    ≡⟨ *-distribʳ-+Ap ⟩
   + binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +
   + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n +
   ∑⟨ 1 ⦂ n ⟩ (λ i → (+ binom n i + + binom n (i ∸ 1)) * x ^ (suc n ∸ i) * y ^ i)
    ≡⟨ cong (_+_ (+ binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +    + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n)) (∑-cong>0
                    {!(λ i → (+ binom n i + + binom n (i ∸ 1)) * x ^ (suc n ∸ i) * y ^ i)!}
                    {!!}
                    {!!}
                    {!!}) ⟩
  {!!}
     ≡⟨ {!!} ⟩
  {!!}
    ≡⟨ {!!} ⟩
  
  + (binom n n +ℕ binom n (suc n)) * x ^ (n ∸ n) * (y * y ^ n) +
      ∑⟨ n ⟩ (λ k → + binom (suc n) k * x ^ (suc n ∸ k) * y ^ k)
    ≡⟨ refl ⟩
    
  ∑⟨ 0 ⦂ suc n ⟩ (λ k → + binom (suc n) k * x ^ (suc n ∸ k) * y ^ k) ∎
  where
      inductiveHypothesis = cong (_*_ (x + y)) (binomialTheorem {x} {y} {n})
      
      xy*∑=∑xy* =
        x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) +
        y * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k)
          ≡⟨ cong (λ ■ →  x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) + ■) (n*∑0=∑0n* {n} {y} {λ k → + binom n k * x ^ (n ∸ k) * y ^ k}) ⟩
        x * ∑⟨ n ⟩ (λ k → + binom n k * x ^ (n ∸ k) * y ^ k) +
        ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))
          ≡⟨ cong (λ ■ → ■ + ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))) (n*∑0=∑0n* {n} {x} {λ k → + binom n k * x ^ (n ∸ k) * y ^ k}) ⟩
        ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) +
        ∑⟨ n ⟩ (λ i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i))  ∎
        
      cambioDeBaseAp =  cong (_+_ (∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)))) (cambioDeBase n (λ n i → y * (+ binom n i * x ^ (n ∸ i) * y ^ i)))
      
      ∸doesNotBreaksumWith1BaseAp =  cong (_+_ (∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)))) (∸doesNotBreaksumWith1Base n x y)
      
      ∑-lowAp = cong (λ ■ → ■ + ∑⟨ 1 ⦂ suc n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i)) (∑-low 0 n (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i))
      
      ∑-highAp = cong (_+_ (+ binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 + ∑⟨ 1 ⦂ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i)) ) (∑-high 1 n (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i))
      
      [a+b]+[c+d]≡[a+c]+[b+d] : (a b c d : ℤ) -> a + b + (c + d) ≡ a + c + (b + d)
      [a+b]+[c+d]≡[a+c]+[b+d] a b c d = solve-ℤ (a ∷ b ∷ c ∷ d ∷ [])

      [a+b]+[c+d]≡[a+c]+[b+d]Ap = [a+b]+[c+d]≡[a+c]+[b+d] (+ binom n 0 * x ^ (suc n ∸ 0) * y ^ 0) (∑⟨ 1 ⦂ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i)) (+ binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n) (∑⟨ 1 ⦂ n ⟩ (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i))

      x*y*x^z≡y*x^[1+z] : (x y : ℤ)  -> (n i : ℕ) -> i ≤ℕ n -> x * (+ binom n i * x ^ (n ∸ i) * y ^ i) ≡ + binom n i * x ^ (suc n ∸ i) * y ^ i
      x*y*x^z≡y*x^[1+z] x y n i i≤n =
        x * (+ binom n i * x ^ (n ∸ i) * y ^ i)
          ≡⟨ sym (*-assoc x (+ binom n i * x ^ (n ∸ i)) (y ^ i)) ⟩
        x * (+ binom n i * x ^ (n ∸ i)) * y ^ i
          ≡⟨ cong (λ ■ → ■ * y ^ i) (sym (*-assoc x (+ binom n i) (x ^ (n ∸ i)))) ⟩
        x * + binom n i * x ^ (n ∸ i) * y ^ i
          ≡⟨ cong (λ ■ → ■ * x ^ (n ∸ i) * y ^ i) (*-comm x (+ binom n i)) ⟩
        + binom n i * x * x ^ (n ∸ i) * y ^ i
          ≡⟨ cong (λ ■ → ■ * y ^ i) (*-assoc (+ binom n i) x (x ^ (n ∸ i))) ⟩
        + binom n i * x ^ (suc (n ∸ i)) * y ^ i
        
          ≡⟨ cong (λ ■ → + binom n i * x ^ ■ * y ^ i) (sym (∸-suc  i≤n )) ⟩
        + binom n i * x ^ (suc n ∸ i) * y ^ i ∎
        
      ∑x*y*x^z≡∑y*x^[1+z] : (n : ℕ) (x y : ℤ) -> ∑⟨ n ⟩ (λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i)) ≡ ∑⟨ n ⟩ (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i)
      ∑x*y*x^z≡∑y*x^[1+z] n x y = ∑0-cong-i≤a n ((λ i → x * (+ binom n i * x ^ (n ∸ i) * y ^ i))) ((λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i)) (x*y*x^z≡y*x^[1+z] x y n)

      ∑+∑≡∑Ap = cong (_+_ (+ binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +   + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n)) (∑+∑≡∑ 1 n (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i) (λ i → + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i))


      -- perdon
      *-distribʳ-+Ap = cong (_+_ (+ binom n 0 * x ^ (suc n ∸ 0) * y ^ 0 +   + binom n (suc n ∸ 1) * x ^ (suc n ∸ suc n) * y ^ suc n)) (∑-cong 1 n (λ i → + binom n i * x ^ (suc n ∸ i) * y ^ i + + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i) (λ i → (+ binom n i + + binom n (i ∸ 1)) * x ^ (suc n ∸ i) * y ^ i)
        λ i → (+ binom n i * x ^ (suc n ∸ i) * y ^ i +
            + binom n (i ∸ 1) * x ^ (suc n ∸ i) * y ^ i
             ≡⟨ cong (_+_ (+ binom n i * x ^ (suc n ∸ i) * y ^ i)) (*-assoc (+ binom n (i ∸ 1)) (x ^ (suc n ∸ i)) (y ^ i)) ⟩
        + binom n i * x ^ (suc n ∸ i) * y ^ i +
        + binom n (i ∸ 1) * (x ^ (suc n ∸ i) * y ^ i)
          ≡⟨ cong (λ ■ → ■ + + binom n (i ∸ 1) * (x ^ (suc n ∸ i) * y ^ i)) (*-assoc (+ binom n i) (x ^ (suc n ∸ i)) (y ^ i)) ⟩
        + binom n i * (x ^ (suc n ∸ i) * y ^ i) +
        + binom n (i ∸ 1) * (x ^ (suc n ∸ i) * y ^ i)
          ≡⟨ sym (*-distribʳ-+ (x ^ (suc n ∸ i) * y ^ i) (+ binom n i) (+ binom n (i ∸ 1))) ⟩
        (+ binom n i + + binom n (i ∸ 1)) * (x ^ (suc n ∸ i) * y ^ i)
          ≡⟨ sym (*-assoc ((+ binom n i + + binom n (i ∸ 1))) (x ^ (suc n ∸ i)) (y ^ i)) ⟩
        (+ binom n i + + binom n (i ∸ 1)) * x ^ (suc n ∸ i) * y ^ i ∎))

-- record Prime

-- fermatsLittleTheorem : {a : ℕ} {p : Prime} -> a ** p ≡[p] a
