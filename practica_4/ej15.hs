sumaRacionales :: Integer ->Integer ->Float
sumaRacionales 0 _ =  0
sumaRacionales n m = sumaRacionales (n-1) m + subSuma m n

subSuma :: Integer -> Integer-> Float
subSuma 0 _ = 0
subSuma m p = fromInteger p / fromInteger m +  subSuma (m-1) p

