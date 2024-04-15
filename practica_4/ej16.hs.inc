menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorProbar 2
    where menorDivisorProbar m 
            | n `mod` m == 0 = m
            | otherwise = menorDivisorProbar (m+1)


menorDivisorProbar m n
            | n `mod` m == 0 = n
            | otherwise = menorDivisorProbar (m+1) n