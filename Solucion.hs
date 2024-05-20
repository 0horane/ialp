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
-- Integrante4: { DNI4,apellidoYNombre4}

-- EJ 1
esMinuscula :: Char -> Bool
esMinuscula letra = ord 'a' <= ord letra && ord letra <= ord 'z'

-- EJ 2
-- La letra entra primero en la funcion LetraANatural para despues entrar en la funcion 
-- posicion, en donde iniciara la recursion para determinar la posicion de la letra en la secuencia "ab..z".
letraANatural :: Char -> Int
letraANatural letra = posicion letra "abcdefghijklmnopqrstuvwxyz"

-- La funcion auxiliar posicion.
posicion :: Char -> [Char] -> Int
posicion letra [] = 0
posicion letra (x:xs) | letra == x = 0
                      | otherwise = 1 + posicion letra xs


-- EJ 3
desplazar :: Char -> Int -> Char
desplazar letra n | esMinuscula letra == True = abecedario (letraANatural letra) n
                  | otherwise = letra

-- esta funcion toma un valor de un caracted de letraANatural, le suma el desplazamiento, y calcula su valor
-- No confundir la variable posicion con la funcion posicion de arriba.
abecedario :: Int -> Int -> Char 
abecedario posicion n | posicion + n <= -1 = abecedario (posicion + n + 26) 0
                      | posicion + n >= 26 = abecedario (posicion + n - 26) 0
                      | otherwise = chr (posicion + n + (ord 'a'))

-- EJ 4
cifrar :: String -> Int -> String
cifrar "" _ = ""
cifrar x 0 = x
cifrar (x:xs) n | esMinuscula x == True = desplazar x n : cifrar xs n
                | otherwise = x : cifrar xs n

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
frecuencia "" = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
frecuencia x | todasMayusculas x == False = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
frecuencia x = frecuenciaAux1 x "abcdefghijklmnopqrstuvwxyz" (cuantasLetrasMinusculas x)  

frecuenciaAux1:: String -> String -> Int -> [Float]
frecuenciaAux1 _ "" _ = []
frecuenciaAux1 palabra (x:xs) n = ((fromIntegral (contarApariciones palabra x) / fromIntegral n ) * 100) : frecuenciaAux1 palabra xs n 

todasMayusculas :: String -> Bool
todasMayusculas [x] = esMinuscula x
todasMayusculas (x:xs) = esMinuscula x || todasMayusculas xs

cuantasLetrasMinusculas:: String -> Int
cuantasLetrasMinusculas "" = 0
cuantasLetrasMinusculas (x:xs) | esMinuscula x == True = 1 + cuantasLetrasMinusculas xs
                               | otherwise = cuantasLetrasMinusculas xs   

contarApariciones:: String -> Char -> Int
contarApariciones "" _ =  0
contarApariciones (x:xs) a | x == a = 1 + contarApariciones xs a
                           | otherwise = contarApariciones xs a

--Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente (x:xs) n = (letraMasFrecuente (cifrar (soloMinusculas(x:xs)) n), (frecuencia (cifrar (x:xs) n)) !!(letraANatural (letraMasFrecuente(cifrar (soloMinusculas(x:xs)) n))))

letraMasFrecuente :: String -> Char
letraMasFrecuente [x] = x
letraMasFrecuente (x:y:xs) | contarApariciones  (x:y:xs) x >= contarApariciones (x:y:xs) y = letraMasFrecuente (x : xs)
                           | otherwise = letraMasFrecuente (y:xs)

soloMinusculas :: String -> String
soloMinusculas "" = ""
soloMinusculas (x:xs) | esMinuscula x == True = x: soloMinusculas xs
                      | otherwise = soloMinusculas xs

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado s1 s2 = esDescifradoAux s1 s2 0

esDescifradoAux :: String -> String -> Int -> Bool
esDescifradoAux _ _ 26 = False
esDescifradoAux s1 s2 despNum = s2 == cifrar s1 despNum || esDescifradoAux s1 s2 (despNum + 1) 

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados _ = [("compu", "frpsx"), ("frpsx", "compu")]

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
cifrarVigenereAux (x:xs) (y:ys) = [desplazar x (letraANatural y)] ++ cifrarVigenereAux xs ys

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