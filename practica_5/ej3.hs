import Ej1
import Ej2
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs


productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs


maximo :: [Integer] -> Integer
maximo (x:[]) = x
maximo (x:y:xs) 
    | x > y = maximo (x:xs)
    | otherwise = maximo (y:xs)
 
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x+n):sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)


sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (ultimo xs) xs

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) 
    | x `mod` 2 == 0 = x:pares xs
    | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) 
    | x `mod` n == 0 = x:multiplosDeN n xs
    | otherwise = multiplosDeN n xs

ordenarRev :: [Integer] -> [Integer]
ordenarRev [] = []
ordenarRev xs = maxv:(ordenarRev (quitar maxv xs))
    where maxv = maximo xs


ordenar :: [Integer] -> [Integer]
ordenar xs = reverse (ordenarRev xs)