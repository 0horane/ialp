import Ej1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = x:[]
sacarBlancosRepetidos (x:y:xs) 
    | x == ' ' && y == ' ' = sacarBlancosRepetidos (x:xs) 
    | otherwise = x:sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (' ':xs) = contarPalabras xs
contarPalabras (x:[]) = 1
contarPalabras (x:y:xs) 
    | x /= ' ' && y == ' ' = 1 + contarPalabras xs
    | otherwise = contarPalabras (y:xs)

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (' ':xs) = palabras xs
palabras xs = tomarpalabra xs:(palabras (soltarpalabra (sacarBlancosRepetidos xs)))  

tomarpalabra :: [Char] -> [Char]
tomarpalabra (' ':xs) = []
tomarpalabra (x:[]) = x:[]
tomarpalabra (x:xs) = x:tomarpalabra xs 


soltarpalabra :: [Char] -> [Char]
soltarpalabra [] = []
soltarpalabra (' ':xs) = xs
soltarpalabra (x:xs) = soltarpalabra xs 

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (palabras xs)


palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux (x:[]) = x
palabraMasLargaAux (x:y:xs) 
    | longitud x > longitud y = palabraMasLargaAux (x:xs)
    | otherwise = palabraMasLargaAux (y:xs)

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ (aplanar xs)



aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:[]) = x
aplanarConBlancos (x:xs) = x ++ (' ':aplanarConBlancos xs)

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]

aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:[]) _ = x
aplanarConNBlancos (x:xs) n = x ++ ((nBlancos n)++aplanarConNBlancos xs n)

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = ' ':nBlancos (n-1)


{-
b. no cambiartia. hay qecambiar cada [Char] por Texto en las declaraciones de tipo nada mas

-}