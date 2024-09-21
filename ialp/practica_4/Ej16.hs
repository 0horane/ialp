module Ej16 (esPrimo) where


menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorProbar 2
    where menorDivisorProbar m 
            | n `mod` m == 0 = m
            | otherwise = menorDivisorProbar (m+1)



-- esto es ineficiente, seria mejor hacerlo usando una lista y sacado factores repetidos
-- y usar sqrt como max
esPrimo ::Integer->Bool
esPrimo x 
    | x == 1 = False
    | otherwise = esPrimoProbar x 2
        where esPrimoProbar x n 
                | x == n = True
                | x `mod` n == 0 = False
                | otherwise = esPrimoProbar x (n+1)  

esPrimo' ::Integer->Bool
esPrimo' x 
    | x == 1 = False 
    | otherwise = menorDivisor x == x

sonCoprimos :: Integer ->Integer ->Bool
sonCoprimos x y
    | x == 1 || y == 1 = False
    | otherwise = sonCoprimosProbar x y 2
        where sonCoprimosProbar x y n 
                | (x+1) == n || (y+1) == n = True
                | x `mod` n == 0 && y `mod` n == 0 = False
                | otherwise = sonCoprimosProbar x y (n+1)

nEsimoPrimo :: Integer ->Integer
nEsimoPrimo x = proximoNPrimoDesde x 1
    where proximoNPrimoDesde x n 
            | esPrimo n && x /= 1 = proximoNPrimoDesde (x-1) (n+1)
            | esPrimo n = n
            | otherwise = proximoNPrimoDesde x (n+1)