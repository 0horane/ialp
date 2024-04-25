esPrimo ::Integer->Bool
esPrimo x 
    | x == 1 = False
    | otherwise = esPrimoProbar x 2
        where esPrimoProbar x n 
                | x == n = True
                | x `mod` n == 0 = False
                | otherwise = esPrimoProbar x (n+1) 


sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada (x:xs) = x:(sumaAcc x xs)

sumaAcc :: (Num t) => t -> [t] -> [t]
sumaAcc _ [] = []
sumaAcc acc (x:xs) = (accnuevo):(sumaAcc accnuevo xs)
    where accnuevo  = x+acc

descomponerNumEnPrimos :: Integer -> Integer -> [Integer]
descomponerNumEnPrimos 1 _ = []
descomponerNumEnPrimos n contador 
    | esPrimo contador && n `mod` contador == 0 = contador:descomponerNumEnPrimos (n `div` contador) contador 
    | otherwise = descomponerNumEnPrimos n (contador+1)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = descomponerNumEnPrimos x 1:descomponerEnPrimos xs