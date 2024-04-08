```haskell
f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0

f2 :: Float -> Float
f2 n | n == 1 = 15
     | n == -1 = -15

f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5

f4 :: Float -> Float -> Float
f4 x y = ( x + y )/2

f5 :: ( Float , Float ) -> Float
f5 (x , y ) = ( x + y )/2

f6 :: Float -> Int -> Bool
f6 a b = truncate a == b

```∧
f1
devuelve 1 si n es 0, 0 si no

problema f1 (n:R):R {
    requiere: {n = 0 ∨ n = 1}
    asegura: {res = 1 ↔ n = 0}
    asegura: {res = 0 ↔ n = 1}
} 

f2
devuelve 15 si n es 1 y -15 si n es -1

problema f2 (n:R):R {
    requiere: {n = 1 v n = -1}
    asegura: {res = 15 ↔ n = 1}
    asegura: {res = -15 ↔ n = -1}
} 

f3
devuelve 9 si n es menor o igual  a 7 y 5 si es mayor

problema f3 (n:R):R {
    requiere: {True}
    asegura: {res = 9 ↔ n <= 9}
    asegura: {res = 5 ↔ n > 9}
} 


f4
devuelve la diferencia entre la suma de x e y y 2
problema f3 (x:R, y:R):R {
    requiere: {True}
    asegura: {res = (x+y)/2}
} 


f5
devuelve la diferencia entre la suma de los dos elementos de la tupla y 2
problema f3 (t :RxR):R {
    requiere: {True}
    asegura: {res = (t_1+t_2)/2}
} 

f6
determina si b es la parte entera de a
problema f3 (a:R, b:Z):Bool {
    requiere: {True}
    asegura: {}
} 