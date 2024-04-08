sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = x `mod` 10 + (x `div` 10) `mod` 10

comparar :: Int -> Int -> Int
comparar a b  | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
              | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
              | otherwise = 0