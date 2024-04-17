tomaValorMax :: Int ->Int ->Int
tomaValorMax n1 n2 = maximoHastaAhora n1 0
    where maximoHastaAhora n1 maximoActual 
            | n1 > n2 = maximoActual
            | sumaActual > maximoActual = maximoHastaAhora (n1+1) sumaActual
            | otherwise = maximoHastaAhora (n1+1) maximoActual
            where sumaActual = sumaDivisores 1 n1

sumaDivisores :: Int -> Int -> Int
sumaDivisores contador n 
    | contador == n = n
    | n `mod` contador == 0 = contador + sumaDivisores (contador+1) n
    | otherwise = sumaDivisores (contador+1) n