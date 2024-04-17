pitagoras :: Integer ->Integer ->Integer ->Integer
pitagoras m n r 
    | m == -1 = 0 
    | otherwise = sumaPitagorasN n + pitagoras (m-1) n r    
    where sumaPitagorasN n 
            | n == -1 = 0
            | m^2 + n^2 <= r^2 = 1 + sumaPitagorasN (n-1) 
            | otherwise = sumaPitagorasN (n-1)