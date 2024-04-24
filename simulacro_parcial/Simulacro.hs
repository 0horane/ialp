relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (rel:rels) = 
    noContieneRepetidas rel rels && 
    (fst rel) /= (snd rel) && 
    relacionesValidas rels

noContieneRepetidas :: (String, String) -> [(String, String)] -> Bool
noContieneRepetidas _ [] = True
noContieneRepetidas rel1 (rel2:rels) = 
    rel1 /= rel2 && 
    (snd rel1, fst rel1) /= rel2 && 
    noContieneRepetidas rel1 rels 

personas :: [(String, String)] -> [String]
personas [] = []
personas ((p1, p2):xs) 
--    | p1 == p2 && vaP1 = p1:personas xs
    | vaP1 && vaP2 = p1:p2:personas xs
    | vaP1 = p1:personas xs
    | vaP2 = p2:personas xs
    | otherwise = personas xs
    where vaP1 = noContieneRepetida p1 xs
          vaP2 = noContieneRepetida p2 xs

noContieneRepetida :: String -> [(String, String)] -> Bool
noContieneRepetida _ [] = True
noContieneRepetida persona ((p1, p2):rels) = 
    persona /= p1 && persona /= p2 && 
    noContieneRepetida persona rels 

amigosDe :: String -> [(String, String)] -> [String]
{-- suponiendo que admite repeticiones
amigosDe _ [] = []
amigosDe persona ((p1,p2):rels) 
    | persona == p1 || persona == p2 = p1:p2:amigosDe persona rels
    | otherwise = amigosDe persona rels
-}

-- si no admite repeticiones, recordar que o hay amistad repetida ni tu8plas iguales
amigosDe persona [] = persona:[]
amigosDe persona ((p1,p2):rels) 
    | persona == p1 = p2:amigosDe persona rels
    | persona == p2 = p1:amigosDe persona rels
    | otherwise = amigosDe persona rels





personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos rels = masAmigosHastaAhora ("", 0) rels    

masAmigosHastaAhora :: (String, Int) -> [(String, String)] -> String
masAmigosHastaAhora (persona,_) [] = persona
masAmigosHastaAhora (persona, cant) ((p2,p3):rels)
    | cant >= cantP2 && cant >= cantP3 = masAmigosHastaAhora (persona, cant) (rels)
    | cantP2 >= cant && cantP2 >= cantP3 = masAmigosHastaAhora (p2, cantP2) (rels)
    | cantP3 >= cantP2 && cantP3 >= cant = masAmigosHastaAhora (p3, cantP3) (rels)
    where cantP2 = cantidadDeAmigos p2 rels   
          cantP3 = cantidadDeAmigos p3 rels



{-
personaConMasAmigos ((p1,p2):[]) = p1
personaConMasAmigos ((p1,p2):(p3,p4):rels) 
    | cantP3 > cantP4 && cantP3 > cantP1 && cantP3 > cantP2 = personaConMasAmigos ((p3,p3):rels) 
    | cantP2 > cantP4 && cantP2 > cantP1 && cantP2 > cantP3 = personaConMasAmigos ((p2,p2):rels)
    | cantP1 > cantP4 && cantP1 > cantP3 && cantP1 > cantP2 = personaConMasAmigos ((p1,p1):rels) 
    | cantP4 > cantP3 && cantP4 > cantP1 && cantP4 > cantP2 = personaConMasAmigos ((p4,p4):rels)
    where cantP1 = cantidadDeAmigos p1 rels   
          cantP2 = cantidadDeAmigos p2 rels   
          cantP3 = cantidadDeAmigos p3 rels   
          cantP4 = cantidadDeAmigos p4 rels   
-}


cantidadDeAmigos :: String ->  [(String, String)] -> Int
cantidadDeAmigos _ [] = 0
cantidadDeAmigos nombre ((p1,p2):rels)
    | nombre == p1 || nombre == p2 = 1 + cantidadDeAmigos nombre rels
    | otherwise = cantidadDeAmigos nombre rels


