absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | otherwise  = -x

maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y | ax >= ay = ax
                   | otherwise = ay 
                   where ax = absoluto x 
                         ay = absoluto y



maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z = maximo2 x (maximo2 y z)
                where maximo2 x y | x > y = x
                                  | otherwise = y 

algunaEs0 :: Float -> Float -> Bool
algunaEs0 0 _ = True
algunaEs0 _ 0 = True
algunaEs0 _ _ = False

algunaEs0' :: Float -> Float -> Bool
algunaEs0' x y = x * y == 0

ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 _ _ = False

ambosSon0' :: Float -> Float -> Bool
ambosSon0' x y = x == y && x == 0

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True  
                   | x > 7 && y > 7 = True  
                   | x > 3 && y > 3 && x <= 7 && y <= 7 = True
                   | otherwise = False

-- suponiendo que los repetidos se suman una sola vez
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | x ==y && y == z = x
                    | x == y = x + z
                    | x == z = x + y
                    | y == z = x + y
                    | otherwise = x + y + z 

-- suponiendo que los repetidos no se suman 
sumaDistintos2 :: Int -> Int -> Int -> Int
sumaDistintos2 | x == y && y == z = 0
               | x == y = z
               | x == z = y
               | y == z = x
               | otherwise x + y + z


esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = x `mod` y == 0

digitoUnidades :: Int -> Int
digitoUnidades x = x `mod` 10 

digitoDecenas :: Int -> Int
digitoDecenas x = (x `mod` 100) `div` 10 
