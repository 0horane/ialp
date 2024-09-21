g :: Integer -> Integer
g x | x `mod` 2 == 0 = x `div` 2
    | otherwise = 3 * x + 1

f :: Integer -> Integer
f x | x > 7 = 2 * x - 1
    | otherwise = x^2

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x, y, z) = f x > g x && f y > g y && f z > g z  
