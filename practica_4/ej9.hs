import Ej8

esCapicua :: Integer -> Bool
esCapicua n 
    | n < 0 = esCapicua (abs n) 
    | n < 10 = True
    | otherwise = (iesimoDigito n 1) == (iesimoDigito n len) && esCapicua ((n `mod` 10^(len-1)) `div` 10) 
    where len = cantDigitos n




