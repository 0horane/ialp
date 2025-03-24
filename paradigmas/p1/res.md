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




