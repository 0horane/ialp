    module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {DataWizards}
-- Integrante1: { 46030579,Sandoval Chirino Felipe}
-- Integrante2: { 46404134,Leandro Ernesto Horane Siracusa}
-- Integrante3: { 95272420,Luis Enrrique Roncal Aranda}
-- Integrante4: { 39463400,Nicolás Epstein}

-- Pendientes: corregir tests, 8/10/14/15, reescribir ejercicio 3 

-- AUXILIARES REUSABLES
abecedario :: String 
abecedario = "abcdefghijklmnopqrstuvwxyz"

posicion :: (Eq t) => t -> [t] -> Int
posicion letra [] = 0
posicion letra (x:xs) | letra == x = 0
                      | otherwise = 1 + posicion letra xs

contarApariciones :: String -> Char -> Int
contarApariciones "" _ =  0
contarApariciones (x:xs) a | x == a = 1 + contarApariciones xs a
                           | otherwise = contarApariciones xs a

soloMinusculas :: String -> String
soloMinusculas "" = ""
soloMinusculas (x:xs) | esMinuscula x = x:soloMinusculas xs
                      | otherwise = soloMinusculas xs

-- Devuelve el indice de un item en una lista sumado a m
--para que el índice arranque en la primera posición, m = 0
indice :: (Eq t) => [t] -> Int -> Int -> t
indice [x] _ _ = x
indice (x:xs) n m | n == m = x
                  | otherwise = indice xs n (m+1)


-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula letra = ord 'a' <= ord letra && ord letra <= ord 'z'

-- EJ 2
-- La letra entra primero en la funcion LetraANatural para despues entrar en la funcion 
-- posicion, en donde iniciara la recursion para determinar la posicion de la letra en la secuencia "ab..z".
-- Tambien se podria haber hecho con el mismo método que la anterior, restando ord 'a'
letraANatural :: Char -> Int
letraANatural letra = posicion letra abecedario


-- EJ 3
desplazar :: Char -> Int -> Char
desplazar letra n | esMinuscula letra = naturalALetradesplazada (letraANatural letra) n
                  | otherwise = letra

-- esta funcion toma un valor de un caracted de letraANatural, le suma el desplazamiento, y calcula su valor
-- No confundir la variable posicion con la funcion posicion de arriba.
naturalALetradesplazada :: Int -> Int -> Char 
naturalALetradesplazada posicion n 
                      | posicion + n <= -1 = naturalALetradesplazada (posicion + n + 26) 0
                      | posicion + n >= 26 = naturalALetradesplazada (posicion + n - 26) 0
                      | otherwise = chr (posicion + n + (ord 'a'))

-- EJ 4
cifrar :: String -> Int -> String
cifrar "" _ = ""
cifrar x 0 = x
cifrar (x:xs) n = desplazar x n : cifrar xs n

-- EJ 5
-- No es necesario usar guardas porque desplazar ya se fija si es minuscula
descifrar :: String -> Int -> String
descifrar "" _ = ""
descifrar (letra:letras) despNum = desplazar letra (-despNum):descifrar letras despNum  


-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista [] = []
cifrarLista (x:xs) = (cifrarListaAux (x:xs) 0)

cifrarListaAux :: [String] -> Int -> [String]
cifrarListaAux [] _ = []
cifrarListaAux (x:xs) n = cifrar x n : cifrarListaAux xs (n + 1)

-- EJ 7
frecuencia :: String -> [Float]
frecuencia x = frecuenciaAux1 x abecedario (cuantasLetrasMinusculas x)  

-- toma el string, las letras por losbre las cuales hace recursion, y la  longitud util (de minusculas) del string y genera la lista de frecuencias
frecuenciaAux1 :: String -> String -> Int -> [Float]
frecuenciaAux1 _ "" _ = []
frecuenciaAux1 palabra (_:abcs) 0 = 0.0:frecuenciaAux1 palabra abcs 0 
frecuenciaAux1 palabra (letra:abcs) lenMin = ((fromIntegral (contarApariciones palabra letra) / fromIntegral lenMin ) * 100) : frecuenciaAux1 palabra abcs lenMin 

cuantasLetrasMinusculas :: String -> Int
cuantasLetrasMinusculas palabra = length (soloMinusculas palabra)

--Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente (x:xs) n = (letra, indice ((frecuencia (cifrar (x:xs) n))) (letraANatural letra) 0)
                        where
                            letra = letraMasFrecuente (cifrar (soloMinusculas(x:xs)) n)

letraMasFrecuente :: String -> Char
letraMasFrecuente [x] = x
letraMasFrecuente (x:xs) = indice (abecedario) (posicion (maximaFrecuencia (frecuencia (x:xs))) (frecuencia (x:xs))) 0

maximaFrecuencia :: [Float] -> Float
maximaFrecuencia [x] = x
maximaFrecuencia (x:y:xs) | x >= y = maximaFrecuencia (x:xs)
                          | otherwise = maximaFrecuencia (y:xs)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado s1 s2 = esDescifradoAux s1 s2 0

esDescifradoAux :: String -> String -> Int -> Bool
esDescifradoAux _ _ 26 = False
esDescifradoAux s1 s2 despNum = s2 == cifrar s1 despNum || esDescifradoAux s1 s2 (despNum + 1) 

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados (cif:cifs) = (listarDescifrados cif cifs) ++ (todosLosDescifrados cifs)

listarDescifrados :: String -> [String] -> [(String, String)]
listarDescifrados _ [] = []
listarDescifrados s1 (s2:s2s) 
    | s1 /= s2 && esDescifrado s1 s2 = (s1,s2):(s2,s1):pasoRecursivo
    | otherwise = pasoRecursivo
    where pasoRecursivo = listarDescifrados s1 s2s

-- EJ 11
expandirClave :: String -> Int -> String
expandirClave (x:xs) 0 = []
expandirClave (x:xs) n = x : expandirClave (xs ++ [x]) (n - 1) 

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere s clave = cifrarVigenereAux s (expandirClave clave (length s))

-- Funcion auxiliar
cifrarVigenereAux :: String -> String -> String
cifrarVigenereAux [] _ = []
cifrarVigenereAux (x:xs) (y:ys) = (desplazar x (letraANatural y)) : cifrarVigenereAux xs ys

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere string clave = descifrarVigenereAux string (expandirClave clave (length string)) 


descifrarVigenereAux :: String -> String -> String
descifrarVigenereAux "" _ = ""
descifrarVigenereAux (letra:string) (letraClave:claveExp) = desplazar letra (-n):descifrarVigenereAux string claveExp
    where n = letraANatural letraClave

-- EJ 14
-- Si ingresan s = [] recuerden que res es igual a un elemento que pertenece a claves.
-- Res es igual a "alguno" de los que deja el mensaje s a menor distancia de su cifrado Vigere.
peorCifrado :: String -> [String] -> String
peorCifrado s [x] = x
peorCifrado s (x:y:xs) | distancia s (cifrarVigenere s x) > distancia s (cifrarVigenere s y) = peorCifrado s (y:xs)
                       | otherwise = peorCifrado s (x:xs)

distancia :: String -> String -> Int
distancia "" "" = 0
distancia (y:xs) (x:ys) = absoluto (letraANatural y - letraANatural x) + distancia ys xs

absoluto :: Int -> Int
absoluto n | n >= 0 = n
           | otherwise = -n

-- EJ 15
-- resEsp es resultado esperado
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere [] _ _ = []
combinacionesVigenere (mesj:mesjs) claves resEsp = (probarClavesVigenere mesj claves resEsp)++(combinacionesVigenere mesjs claves resEsp)


probarClavesVigenere :: String -> [String] -> String -> [(String, String)]
probarClavesVigenere _ [] _ = []
probarClavesVigenere mesj (clave:claves) resEsp 
    | cifrarVigenere mesj clave == resEsp = (mesj,clave):pasoRecursivo
    | otherwise = pasoRecursivo
    where pasoRecursivo = probarClavesVigenere mesj claves resEsp
