
sucesion :: Integer -> Float 
sucesion 1 = 2
sucesion n = 2 + 1/(sucesion (n-1))

raizDe2Approx :: Integer -> Float
raizDe2Approx n = sucesion n - 1