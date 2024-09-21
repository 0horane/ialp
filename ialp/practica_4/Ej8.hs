module Ej8 (iesimoDigito, cantDigitos) where

iesimoDigito :: Integer -> Integer -> Integer 
iesimoDigito n i = (n `div` (10^((cantDigitos n) - i ))) `mod` 10

cantDigitos :: Integer -> Integer
cantDigitos n 
    | n < 10 = 1
    | otherwise = 1 + cantDigitos (n `div` 10)

-- segun requerimientos, cantdigitos da 0 apara 1 digito