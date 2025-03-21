import GHC.Utils.Misc (countWhile)

valorAbsoluto :: Float -> Float
valorAbsoluto n
  | n >= 0 = n
  | otherwise = -n

-- suponiendo años no negativos, calendario gregoriano
bisiesto :: Int -> Bool
bisiesto anio = anio `mod` 400 == 0 || (anio `mod` 4 == 0 && anio `mod` 100 /= 0)

factorial :: Int -> Int 
factorial n = product.take n $ iterate (+1) 1 

-- ambigua la consigna, 4 tiene 1 o 2?
cantDivisoresPrimos :: Int -> Int
--cantDivisoresPrimos n = sum $ take n (map (\p -> countWhile (==0) (map (\t -> n `mod` p^t) (iterate (+1) 1))) (iterate (+1) 2))
cantDivisoresPrimos n = cdp2 n 2
    where cdp2 n m 
            | n == 1 = 0
            | n `mod` m == 0 = 1 + cdp2 (n `div` m) m
            | otherwise = cdp2 n (m+1)


