### 1)

max2 :: (Float, Float) -> Float
normaVectorial :: (Float, Float) -> Float
substract :: Float -> Float -> Float
predecessor :: Float -> Float
evaluarEnCero :: (Float -> a) -> Float 
dosVeces :: (a -> a) -> a -> a
flipAll ::  [a -> b -> c] -> [b -> a -> c] 
flip: (a->b->c)
a: (a -> b -> c) -> 
b: b -> 
c: (a -> c)
flipRaro:: b -> a -> c ==  b -> (a->b->c) -> a->c


flip :: (a -> b -> c) -> b -> a -> c 
map :: (a -> b) -> [a] -> [b]


max2, normaVectorial no estan currificadas. 

```haskell
max2:: Float -> Float -> Float
max2 x y | x >= y = x
         | otherwise = y

normaVectorial :: Float -> Float -> Float
normaVectorial x y = sqrt (x^2+y^2)
```


### 2)
```haskell
curry :: ((a, b)->c) -> a -> b -> c
curry f = (\x y -> f (x,y))
curry f x y = f(x,y) -- alternativamente

uncurry :: (a -> b -> c) -> (a,b) -> c 
uncurry f (x,y) = f x y 

```

no se puede definir curryN. No tendria un tipo fijo. 


### 3) 

```haskell
sum = foldr (+) 0
elem x = foldr (\n b  -> n == x || b) False 
a ++ b = foldr (:) b a
filter f = foldr (\item list -> if f item then item:list else list) [] 
map f = foldr (\item list -> (f item) : list) []


mejorSegun f = foldr1 (\i max -> if f max i then max else i)
sumasParciales xs = reverse $ foldl (\list i -> case list of [] -> [i]
                                                             (x:xs) -> (i+x:x:xs)) [] xs 
sumasParciales2 xs = drop 1 . foldr (\a (x:xs) -> (x-a):x:xs ) [(sum xs)] xs

sumaAlt = foldr (-) 0
sumaAlt2 n = sum $ zipWith (*) n (cycle [1, -1])

sumaAltAtras xs 
  | even (length xs) = foldr (-) 0 (0:xs)
  | otherwise =        foldr (-) 0 xs

sumaAltAtras2 = foldl (flip (-)) 0

```
para el inverso, nos convendria foldl. foldr tiene el problema de que no podes asegurar que el primer elemento se este sumando, así que tenes que hacer 2 casos, según paridad de lista. 




me olvide de sicnronizar. unificar despues.

```haskell
```

E4::
```haskell
permutaciones :: [a] -> [[a]]
permutaciones ns = foldr (\n perms -> concatMap (\perm -> map (\i -> take i perm ++ [n] ++ drop i perm) [0..(length perm)] ) perms  ) [[]] ns
permutaciones ns = foldr (\n perms -> perms >>= (\perm -> map (\i -> take i perm ++ [n] ++ drop i perm) [0..(length perm)] ) ) [[]] ns
ghci> permutaciones = foldr (\n -> concatMap (\perm -> map (\i -> take i perm ++ [n] ++ drop i perm) [0..(length perm)] )  ) [[]]

partes xs = foldr (\n perms -> concatMap (\perm -> [perm, n:perm]) perms) [[]] xs
partes = foldr (\n -> concatMap (\perm -> [perm, n:perm])) [[]]

prefijos a = map (flip take a) [0..(length a)]
prefijos = foldr (\a b -> []:(map (a:) b)) [[]]
sufijos a = map (flip drop a) [0..(length a)]
sublistas n  = []: filter (/=[]) ( concatMap prefijos (sufijos n) )


```

cada permutación es una lista de digitos no repetidos de 1 a n
De estas existen n!
si encuentro una función biyectiva [0..n!-1] -> permutaiones de n, sirve. pero no es la mejor idea


e5)
```haskell
--no es estructural, se usa xs para mas cosas que recursión sobre función original
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares n  
   | even (length n) = main False n
   | otherwise = main True n
   where main iseven = snd.foldr (\e (a,b)-> if a then (False, e:b) else (True,b)) (iseven,[])
   {-
entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr (\a b -> \ys ->  if null ys then a:b else a:head ys:b) id
entrelazar [] a = a
entrelazar (x:xs) ys = if null ys
then x : entrelazar xs []
else x : head ys : entrelazar xs (tail ys) TODO hoy vimos como se hace
 -}
```



e6
si foldr es inducción, recr es inducción completa.
recr no existe en hoogle??
```haskell
:{
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)
:}
--sacarUna n = reverse.recr (\x xs acc -> if elem n xs || n /= x then x:acc else acc) [].reverse
sacarUna n = recr (\x xs acc -> if n == x then xs else x:acc) [] 
```
No es adecuada porque es imposible saber cual es el primer elemento si estás haciendo una recursión desde atras. mas formalmente, estamos usando a xs no solo en la llamada recursiva. 

```haskell 
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e l = if e < head l 
                       then e:l 
                       else recr (\n ns acc ->
                         case acc of
                           [] -> if e >= n then n:e:ns else acc
                           otherwise -> n:acc) [] l


insertarOrdenado item = recr (\x xs acc -> if item:xs /= acc then x:acc else if item >= x then x:item:xs else item:x:xs) [item]
-- TOOO [item] correcto?

```

7)
```haskell
mapPares = map . uncurry 
--armarPares l1 = map (\x -> \y -> (x,y)) l1
--armarPares l1 = (\y -> map (\x -> (x,y)) l1)
--armarPares xs ys = snd $ foldl (\(ys, pares) x -> if ys == [] then ([],pares) else (tail ys, pares ++ [(x,head ys)]) ) (ys,[]) xs
--armarPares l1 l2 = map (\x -> (l1 !! x, l2 !! x)) [0..(min (length l1) (length l2) - 1)]
armarPares xs ys = foldr (\a b -> (\n -> if n==[] then [] else (a,head n):(b (tail n)))) (const []) xs ys
mapDoble f l1 l2 = map (\(x,y)-> f x y) $ zip l1 l2
```

8) 
```haskell
sumaMat = zipWith (zipWith (+))
--transponer mat = map (map ()) [0..length (head mat)]
transponer mat = foldr (\row cmat -> zipWith (:) row cmat) (take (length (head mat)) $ repeat []) mat
-- TODO foldr1?

```


9)
```haskell
:{
foldNat _ cNull 0 = cNull 
foldNat cPos cNull n = cPos n (foldNat cPos cNull (n-1))  
:}
potencia b = foldNat (\a c -> c*b) 1
```

10)
```haskell
genLista init f len = reverse . foldr (\_ (acc:accs) -> f acc:acc:accs ) [init] $ replicate len ()
-- TODO preguntar replicate, reverse
desdeHasta inicio fin = genLista inicio (+1) (fin - inicio)
```

11)
```haskell
data Polinomio a = X
| Cte a
| Suma (Polinomio a) (Polinomio a)
| Prod (Polinomio a) (Polinomio a)

eval n = foldPolinomio n id (+) (*) 

foldPolinomio :: b (\a -> b) (\b -> b -> b) (\b -> b -> b) -> Polinomio a -> b
foldPolinomio fX _ _ _ X = fX 
foldPolinomio _ fCte _ _ (Cte a) = fCte a 
foldPolinomio fX fCte fSuma fProd (Suma a b) = fSuma (rec a) (rec b) 
foldPolinomio fX fCte fSuma fProd (Prod a b) = fProd (rec a) (rec b) 
   where rec = foldPolinomio fX fCte fSuma fProd

--con tantos casos repetidos queda mas lindo un case. 

```

12) 
```haskell
data AB a = Nil | Bin (AB a) a (AB a) deriving Show
foldAB :: b -> (b -> a -> b -> b) -> (AB a) -> b 
foldAB cNil _ Nil = cNil
foldAB cNil cBin (Bin ab1 c ab2) = cBin (foldAB cNil cBin ab1) c (foldAB cNil cBin ab2)

recAB :: b -> (b -> a -> b -> (AB a) -> b) -> (AB a) -> b 
recAB cNil _ Nil = cNil
recAB cNil cBin (Bin r c l) = cBin (rec r) c (rec l) cur 
   where rec = recAB cNil cBin
         cur = (Bin r c l)
-- TODO preguntar bien recAB


esNil (Bin _ _ _) = False
esNil Nil = True

altura = foldAB 0 (\racc _ lacc -> max racc lacc + 1) 
cantNodos = foldAB 0 (\n _ m -> 1+n+m)

(Bin (Bin Nil 7 Nil) 2 (Bin (Bin Nil 3 Nil) 5 Nil))


:{

mejorMaybe f Nothing Nothing = Nothing
mejorMaybe f Nothing (Just n ) = Just n
mejorMaybe f (Just n) Nothing = Just n
mejorMaybe f (Just n) (Just m) = Just (if f n m then n else m )

mejorSegun f = foldAB Nothing (\a n b -> mejorMaybe f (mejorMaybe f a b) (Just n))
:}

esABB = recAB True (\a n b (Bin at _ bt) -> a && b && mejorSegun (>) (Bin at n Nil) == Just n && mejorSegun (<) (Bin Nil n bt) == Just n)


```
esABB es el único que necesita recursión primitiva, porque no alcanza con saber que un arbol anterior sea válido, sino que también necesitas saber el mayor del de la izquierda y el menor del de la derecha, con lo que hay que acceder a la estructura

13)
```haskell
ramas :: AB a -> [a]
ramas = foldAB [[]] (\resl c resr -> map (c:) (resl ++ resr)) 
-- debatible. los nulls son ramas?
ramas = foldAB [] (\resl c resr -> if resl == [] && resr == [] then [[c]] else map (c:) (resl ++ resr)) 


cantHojas = foldAB 0 (\a _ b -> a+1+b)
espejo = foldAB Nil (\a n b -> Bin b n a)

mismaEstructura :: (Eq a) => AB a -> AB a -> Bool
mismaEstructura = foldAB (\s2 -> esNil s2) (\fa n fb -> \s2 -> case s2 of Nil -> False; (Bin a2 n2 b2) -> fa a2 && fb b2 && n == n2)
```

14)
```haskell

data AIH a = Hoja a | Bin (AIH a) (AIH a) deriving Show

foldAIH :: (a -> b) -> (b -> b -> b) -> (AIH a) -> b 
foldAIH fHoja _ (Hoja a) = fHoja a
foldAIH fHoja fBin (Bin r l) = fBin (foldAIH fHoja fBin r) (foldAIH fHoja fBin l)

altura = foldAIH (const 1) (\r l -> max r l + 1)
tamaño = foldAIH (const 1) (\r l -> r + l)
```

15)
```haskell
data RoseTree a = Rose a [RoseTree a] 
deriving instance (Show a) => Show (RoseTree a)

foldRT :: (a -> [b] -> b) -> RoseTree a -> b 
foldRT f (Rose a rts) = f a (map (foldRT f) rts) 

hojas :: RoseTree a -> [a]
hojas = foldRT (\a b -> a:concat b)

sample = Rose 5 [Rose 3 [],Rose 2 [Rose 11 [],Rose 7 [],Rose 9 []]]

distancias :: RoseTree a -> [Int] -- TODO, tambien hacer ramas, recomendado por prof. 

altura :: RoseTree a -> Int
altura = foldRT (\a n -> if n == [] then 1 else maximum n + 1)


```












































