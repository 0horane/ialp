fact ::  Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n = n * fact (n-1) 


eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = 1/(fromIntegral (fact n)) + eAprox (n-1)


e ::Float 
e = eAprox 10