estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = (-a^2) `mod` (a * b) == 0 