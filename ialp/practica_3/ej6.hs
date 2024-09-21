bisiesto :: Integer -> Bool
bisiesto anio = anio `mod` 4 == 0 && not (anio `mod` 100 == 0 && anio `mod` 400 /= 0 )  