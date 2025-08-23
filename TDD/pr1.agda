-- 1)

flip : {A B C : Set} -> (A -> B -> C) -> B -> A -> C
flip f a b = f b a 

compose : {A B C : Set} -> (B -> C) -> (A -> B) -> A -> C
compose f g a = f (g a) 

-- computacionalmnente es equivalente a haskell, composicion de fuinciones y cambiar orden de argumentos. lógicamente, propiedades de la implicación

-- 2 ) a)

data Bool : Set where
    false : Bool
    true : Bool

recBool : {C : Set} -> C -> C -> Bool -> C
recBool ifFalse _ false = ifFalse
recBool _ ifTrue true = ifTrue

-- b)
not : Bool -> Bool
not = recBool true false


-- 3)

data _×_ (A B : Set) : Set where
    _,_ : A -> B -> A × B


-- no me lo permite con solo {C : Set}, le pongo a b 

recProduct : {A B C : Set} -> (A -> B -> C) -> A × B -> C
recProduct f (a , b) = f a b 

{-
recDepProduct : {A B : Set} {ab : A × B} -> {C : A × B -> Set} -> (A -> B -> C ab) -> A × B -> C ab
recDepProduct f (a , b ) = f a b
-}

-- no estoy para anda seguro que esto sea correcto ni si se puede reducir la sintaxis.
recDepProduct : {A B : Set} {C : A × B -> Set} -> ((a : A) -> (b : B) -> C (a , b)) -> (ab : A × B) -> C ab
recDepProduct f (a , b) = f a b 

demoi : {A B : Set} -> A × B → A
demoi = recProduct (λ x _ → x)    

demoii : {A B : Set} -> A × B → B
demoii = recProduct (λ _ y → y)

-- (Πx:A×B. C(x)) → Πa:A Πb:B. C((a, b))
-- esto cuenta como sin hacer pattern matching? o se refiere a sin argumentos?
demoiii : {A B : Set} {C : A × B -> Set} -> ((x : A × B) -> C x ) →  (a : A) (b : B) -> C (a , b) 
demoiii f a b = f (a , b)

-- iv. (Πa:A Πb:B C((a, b))) → Πx:A×B C(x)
demoiv : {A B : Set} {C : A × B -> Set} ->  ((a : A) (b : B) -> C (a , b)) -> (x : A × B) -> C x
demoiv {A1} {B1} {C1} f a = recDepProduct {A1} {B1} {C1} f a  


-- 4)

data ⊥ : Set where
-- ???
⊥-elim : {C : Set} -> ⊥ -> C
⊥-elim ()  

demoBot : {A B : Set} -> (A → ⊥) → A → B
demoBot f a = ⊥-elim (f a)

-- 5) 

data ⊤ : Set where
    tt : ⊤

indUnit : {C : ⊤ -> Set} → C tt -> (x : ⊤) → C x
indUnit f tt = f 


data Σ (A : Set) (B : A → Set) : Set where
    _,_ : (a : A) → B a → Σ A B
    
indΣ : {A : Set} {B : A -> Set} {C : Σ A B -> Set} -> ((a : A) -> (b : B a) -> C (a , b)) -> (ab : Σ A B) -> C ab
indΣ f (a , b) = f a b  

proj₁ : {A : Set} {B : A -> Set} -> Σ A B -> A
proj₁ = indΣ ( λ x _  -> x )

-- cant do pattern matching in type def! no (a , b : Σ A B). or maybe i can with {}??
proj₂ : {A : Set} {B : A -> Set} -> (p : Σ A B) -> B (proj₁ p)
proj₂ {A1} {B1}  x = indΣ {A1} {B1} {λ x -> B1 (proj₁ x)} (λ a b -> b) x