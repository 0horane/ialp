sumaDigitos:: Integer->Integer
sumaDigitos x 
  | x < 10 = x
  | otherwise = (x `mod` 10) + sumaDigitos (x `div` 10)
