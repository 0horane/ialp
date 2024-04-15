f1 :: Integer -> Integer
f1 (-1) = 0
f1 n = 2^n + f1 (n-1)

f2 :: Integer -> Integer -> Integer
f2 0 _ = 0
f2 n q = q^n + f2 (n-1) q

f3 :: Integer -> Integer -> Integer
f3 n q = f2 (2*n) q
    
f4 :: Integer -> Integer -> Integer
f4 n q= (f3 n q) - (f2 (n-1) q) -- medio ineficiente pero bueno