prodFloat :: (Float, Float) -> (Float, Float) -> Float
prodFloat (a,b) (x,y) = (a * x) + (b * y)

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a,b) (x,y) = a < x && b < y

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt ((x2-x1)^2 + (y2-y1)^2)

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (x,y,z) = x + y + z

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) m = xm + ym + zm
                           where xm = if x `mod` m == 0 then x else 0
                                 ym = if y `mod` m == 0 then y else 0
                                 zm = if z `mod` m == 0 then z else 0

sumarSoloMultiplos' :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos' (x, y, z) m = (soloMul x) + (soloMul y) + (soloMul z)
                           where soloMul n = if n `mod` m == 0 then n else 0

posPrimerPar ::(Int, Int, Int) -> Int
posPrimerPar (x,y,z) | par x = x
                     | par y = y
                     | par z = z 
                     | otherwise = 4
                     where par n = n `mod` 2 == 0 

crearPar :: a -> b -> (a,b)
crearPar a b = (a, b)

invertir :: (a,b) -> (b,a)
invertir (a, b) = (b, a)