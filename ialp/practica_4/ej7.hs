todosDigitosIguales :: Int->Bool
todosDigitosIguales x 
    | ax < 10 = True
    | otherwise = (ax `mod` 10 == (ax `div` 10) `mod` 10) && todosDigitosIguales (ax `div` 10)
    where ax = abs xL