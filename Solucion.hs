module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {}
-- Integrante1: { DNI1,apellidoYNombre1}
-- Integrante2: { DNI2,apellidoYNombre2}
-- Integrante3: { DNI3,apellidoYNombre3}
-- Integrante4: { DNI4,apellidoYNombre4}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío}

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
cifrar _ _ = "frpsxwdflrq"

-- EJ 5
-- No es necesario usar guardas porque desplazar ya se fija si es minuscula
descifrar :: String -> Int -> String
descifrar "" _ = ""
descifrar (letra:letras) despNum = desplazar letra (-despNum):descifrar letras despNum  


-- EJ 6
cifrarLista :: [String] -> [String]
cifrarLista _ = ["compu", "mbcp", "kpvtq"]

-- EJ 7
frecuencia :: String -> [Float]
frecuencia _ = [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0]

-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente _ _ = ('o', 33.333336)

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
expandirClave _ _ = "compucom"

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ _ = "kdueciirqdv"

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere string clave = descifrarVigenereAux string (expandirClave clave (length string)) 


descifrarVigenereAux :: String -> String -> String
descifrarVigenereAux "" _ = ""
descifrarVigenereAux (letra:string) (letraClave:claveExp) = desplazar letra (-n):descifrarVigenereAux string claveExp
    where n = letraANatural letraClave

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ _ = "asdef"

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere _ _ _ = [("hola", "b")]
