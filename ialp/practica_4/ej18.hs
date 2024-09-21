import Ej8

mayorDigitoPar :: Integer ->Integer
mayorDigitoPar x
    | digitoActual `mod` 2 == 0 = digitoActual
    | cantDigitos x == 1 = -1
    | otherwise = mayorDigitoPar proximoNumero 
    where 
        digitoActual = x `div` (10^((cantDigitos x) - 1))
        proximoNumero = x `mod` (10^((cantDigitos x) - 1))
