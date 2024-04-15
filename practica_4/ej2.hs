{-}
parteEntera :: Float -> Integer
--parteEntera = floor
parteEntera x = parteEnteraIter x 0
    where parteEnteraIter x test 
            | test <= x && x <= test + 1 = test
            | -test <= x && x <= -test + 1 = -test
            | otherwise = parteEnteraIter x (test+1)
-}
parteEntera :: Float -> Integer
parteEntera x 
    | 0 <= x && x < 1 = 0
    | x < 0 = (-1) + parteEntera (x + 1)
    | otherwise = 1 + parteEntera (x - 1)