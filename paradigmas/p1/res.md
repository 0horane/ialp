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

normaVectorial :: Float -> Float -> FLoat
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
--otra posibilidad es hacer foldr ... [sum xs] e ir restando, y luego eliminar el primer elemento
```




me olvide de sicnronizar. unificar despues.

```haskell
sumaAlt n = sum $ zipWith (*) n (cycle [1, -1])
```

E4::
```haskell
permutaciones :: [a] -> [[a]]
permutaciones ns = foldr (\n perms -> concatMap (\perm -> map (\i -> take i perm ++ [n] ++ drop i perm) [0..(length perm)] ) perms  ) [[]] ns
permutaciones ns = foldr (\n perms -> perms >>= (\perm -> map (\i -> take i perm ++ [n] ++ drop i perm) [0..(length perm)] ) ) [[]] ns

partes ns = foldr (\n perms -> concatMap (\perm -> [perm, n:perm]) perms) [[]] ns

prefijos a = map (flip take a) [0..(length a)]
sufijos a = map (flip drop a) [0..(length a)]
sublistas n  = []: filter (/=[]) ( concatMap prefijos (sufijos n) )
```

cada permutación es una lista de digitos no repetidos de 1 a n
De estas existen n!
si encuentro una función biyectiva [0..n!-1] -> permutaiones de n, sirve. TODO


TODO falta rec estructural
e5)
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares n  
   | even (length n) = main False n
   | otherwise = main True n
   where main iseven = snd.foldr (\e (a,b)-> if a then (False, e:b) else (True,b)) (iseven,[])

e6
si foldr es inducción, recr es inducción completa.
recr no existe en hoogle??
```haskell
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)
sacarUna n = reverse.recr (\x xs acc -> if elem n xs || n /= x then x:acc else acc) [].reverse

```
No es adecuada porque es imposible saber cual es el primer elemento si estás haciendo una recursión desde atras. tendría que usarse un recl donde la primer aparicion entra en xs y de ahí se puede utilizar en las condiciones.

```haskell
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e l = if e < head l 
                       then e:l 
                       else recr (\n ns acc ->
                         case acc of
                           [] -> if e >= n then n:e:ns else acc
                           otherwise -> n:acc) [] l

```

[1,3,5,7]











