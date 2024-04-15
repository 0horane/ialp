parteEntera :: Float -> Integer
--parteEntera = floor
parteEntera x = parteEnteraIter x 0
    where parteEnteraIter x test 
            | test <= x && x <= test + 1 = test
            | -test <= x && x <= -test + 1 = -test
            | otherwise = parteEnteraIter x (test+1)
