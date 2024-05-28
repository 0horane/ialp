-- existe c en algun primer conponente de mapeo
hayQueCodificar :: Char -> [(Char, Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((c1,_):mapeo) = c == c1 || hayQueCodificar c mapeo

-- si c esta en algun cimponente primero de mapeo, la cantidad de veces que aparece en frase
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo 
  | hayQueCodificar c mapeo =  contar c frase
  | otherwise = 0


contar :: Char -> [Char] -> Int
contar _ [] = 0
contar c (c1:frase) 
    | c == c1 = 1 + contar c frase
    | otherwise = contar c frase

-- el caracter con mayor valor de la anterior, es decir, el que aparece mas veces en la frase que esta en primer componente mapeo .

laQueMasHayQueCodificar :: [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificar frase mapeo = laQueMasHayQueCodificarAux frase frase mapeo

laQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char, Char)] -> Char
laQueMasHayQueCodificarAux [caracter] _ _ = caracter
laQueMasHayQueCodificarAux (caracter1:caracter2:caracteres) frase mapeo
  | cuantasVecesHayQueCodificar caracter1 frase mapeo < cuantasVecesHayQueCodificar caracter2 frase mapeo = laQueMasHayQueCodificarAux (caracter2:caracteres) frase mapeo
  | otherwise = laQueMasHayQueCodificarAux (caracter1:caracteres) frase mapeo

--codificarFrase :: [Char] -> [(Char, Char)] -> [Char]

