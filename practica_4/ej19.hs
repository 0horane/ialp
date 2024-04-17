import Ej16

esSumaInicialDePrimos :: Integer ->Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosDesde 1 0
    where esSumaInicialDePrimosDesde contador sumaDePrimos 
            | sumaDePrimos > n = False
            | sumaDePrimos == n = True
            | esPrimo contador = esSumaInicialDePrimosDesde  (contador+1) (contador+sumaDePrimos)
            | otherwise = esSumaInicialDePrimosDesde  (contador+1) sumaDePrimos