import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runNuestrosTests = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista,
    "frecuencia" ~: testsEjfrecuencia,
    "cifradoMasFrecuente" ~: testsEjcifradoMasFrecuente,
    "esDescifrado" ~: testsEjesDescifrado,
    "todosLosDescifrados" ~: testsEjtodosLosDescifrados,
    "expandirClave" ~: testsEjexpandirClave,
    "cifrarVigenere" ~: testsEjcifrarVigenere,
    "descifrarVigenere" ~: testsEjdescifrarVigenere,
    "peorCifrado" ~: testsEjpeorCifrado,
    "combinacionesVigenere" ~: testsEjcombinacionesVigenere
    ]

--eje 1
testsEjesMinuscula = test [
    esMinuscula 'd' ~?= True,
    esMinuscula 'a' ~?= True,
    esMinuscula 'z' ~?= True,
    esMinuscula 'ñ' ~?= False,
    esMinuscula 'ó' ~?= False,
    esMinuscula 'á' ~?= False,
    esMinuscula 'é' ~?= False,
    esMinuscula 'í' ~?= False,
    esMinuscula 'ú' ~?= False,
    esMinuscula 'A' ~?= False,
    esMinuscula 'Z' ~?= False,
    esMinuscula 'Á' ~?= False,
    esMinuscula '1' ~?= False,
    esMinuscula '@' ~?= False,
    esMinuscula ' ' ~?= False
    ]

{-eje 2
parametros y factores: c
categoria: es  no minuscula
elecciones: si->restricción=numero correspondiente, no->error
-}
testsEjletraANatural = test [
    letraANatural 'a' ~?= 0,
    letraANatural 'b' ~?= 1,
    letraANatural 'z' ~?= 25,
    letraANatural 'y' ~?= 24
    ]

{-eje 3
parametros y factores: c, n
categorias:
rango de letraANumero c + n
elecciones: 
    0 <= letraANumero c + n <=25  
    letraANumero c + n < 0
    letraANumero c + n < -26
    26 <= letraANumero c + n   
    2*26 <= letraANumero c + n  

ademas, pruebo por errores off by one
-}
testsEjdesplazar = test [
    desplazar 'a' 3 ~?= 'd',
    desplazar 'a' 26 ~?= 'a',
    desplazar 'a' (54*26+6) ~?= 'g',
    desplazar 'a' (54*26-6) ~?= 'u',
    desplazar 'a' (-54*26-6) ~?= 'u',
    desplazar 'a' (-54*26+6) ~?= 'g',
    desplazar 'a' (-1) ~?= 'z',
    desplazar 'a' 0 ~?= 'a',
    desplazar 'z' 0 ~?= 'z',
    desplazar 'z' 1 ~?= 'a',
    desplazar 'm' 5 ~?= 'r',
    desplazar 'm' (-5) ~?= 'h'
    ]

--eje 4
testsEjcifrar = test [
    cifrar "computacion" 3 ~?= "frpsxwdflrq",
    cifrar "computacion" 0 ~?= "computacion",
    cifrar "" 3 ~?= "",
    cifrar "" 0 ~?= "",
    cifrar "computacIon" 3 ~?= "frpsxwdfIrq",
    cifrar "computacIon" 29 ~?= "frpsxwdfIrq",
    cifrar "computacIon" 55 ~?= "frpsxwdfIrq"
    ]

-- eje 5
testsEjdescifrar = test [
    descifrar "frpsxwdflrq" 3 ~?= "computacion",
    descifrar "computacion" 0 ~?= "computacion",
    descifrar "" 3 ~?= "",
    descifrar "" 0 ~?= "",
    descifrar "frpsxwdfIrq" 3 ~?= "computacIon",
    descifrar "frpsxwdfIrq" 29 ~?= "computacIon",
    descifrar "frpsxwdfIrq" 55 ~?= "computacIon"
    ]

--eje 6
testsEjcifrarLista = test [
    cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"],
    cifrarLista [] ~?= [],
    cifrarLista ["compu"]  ~?= ["compu"],
    cifrarLista ["compu","compu","compu"]  ~?= ["compu","dpnqv","eqorw"],
    cifrarLista ["compu","compu","compu","labo","haskell","felipe","silla","mesa","mouse","compu","mesa","intro","labo"]  ~?= 
                ["compu","dpnqv","eqorw","oder","lewoipp","kjqnuj","yorrg","tlzh","uwcam","lxvyd","wock","tyecz","xmna"]
    ]

--eje 7
-- Creo que hay casos de prueba de mas
testsEjfrecuencia = test [
    expectlistProximity (frecuencia "taller") [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "1") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "@") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "tAller") [0.0,0.0,0.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0,40.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "Á") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "Z") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "ñ") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    expectlistProximity (frecuencia "ó") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    ]

--eje 8
testsEjcifradoMasFrecuente = test [
    cifradoMasFrecuente "HHa" 5 ~?= ('f', 100.0),
    cifradoMasFrecuente "rosa54@+/" 2 ~?= ('t', 25.0),
    cifradoMasFrecuente "y" 3 ~?= ('b', 100.0),
    cifradoMasFrecuente "taller" 3 ~?= ('o', 33.333336)
    ]

--eje 9
testsEjesDescifrado = test [
    esDescifrado "" "" ~?= True,
    esDescifrado "" "ala" ~?= False,
    esDescifrado "taller" "compu" ~?= False,
    esDescifrado "COLA@" "COLA@" ~?= True
    ]

--eje 10
testsEjtodosLosDescifrados = test [
    todosLosDescifrados [] ~?= [],
    todosLosDescifrados ["compu", "frpsx", "mywza"] ~?= [("compu", "frpsx"), ("frpsx", "compu")]
    ]

{-eje 11
parametros y factores: clave, n
categoria: logitud de clave, valor de n
elecciones: logitud de clave =1, >1, n=1, n>1
-}
testsEjexpandirClave = test [
    "n > |clave|" ~: expandirClave "compu" 8 ~?= "compucom",
    "n < |clave|" ~: expandirClave "compu" 1 ~?= "c",
    "n == |clave|" ~: expandirClave "rompu" 5 ~?= "rompu", 
    "|clave| = 1" ~: expandirClave "b" 1 ~?= "b",
    "n > 2*|clave|" ~: expandirClave "test" 22 ~?= "testtesttesttesttestte" 
    ]

--eje 12
{-
parametros:s, clave
-}
testsEjcifrarVigenere = test [
    "Normal" ~: cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv",
    "Tilde" ~: cifrarVigenere "á" "ip" ~?= "á", -- casos con diferentes caracteres no validos
    "Mayus" ~: cifrarVigenere "A" "ip" ~?= "A",
    "Mayus Tilde" ~: cifrarVigenere "Á" "ip" ~?= "Á",
    "Enie" ~: cifrarVigenere "ñ" "ip" ~?= "ñ",
    "Numerico" ~: cifrarVigenere "113413" "ip" ~?= "113413",
    "caracteres validos e invalidos mezclados" ~: cifrarVigenere "@@áóóóúñAdÁg" "az" ~?= "@@áóóóúñAcÁf", -- caso caracteres validos e invalidos mezclados
    "clave mas larga que s" cifrarVigenere "hzhzh" "dldldldl" ~?= "kkkkk", -- caso clave mas larga que s
    "|s|=1" ~: cifrarVigenere "z" "baisalpi" ~?= "a",
    "|clave|=1" ~: cifrarVigenere "baisalpi" "b" ~?= "cbjtbmqj",
    "nulo" ~: cifrarVigenere "" "ippppp" ~?= "" --caso nulo
    ]

--eje 13
{-
parametros:s, clave
-}
testsEjdescifrarVigenere = test [
    "Normal" ~: descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion",
    "Tilde" ~: descifrarVigenere "á" "ip" ~?= "á", -- casos con diferentes tipos de caracteres no validos
    "Mayus" ~: descifrarVigenere "A" "ip" ~?= "A",
    "Mayus Tilde" ~: descifrarVigenere "Á" "ip" ~?= "Á",
    "Enie" ~: descifrarVigenere "ñ" "ip" ~?= "ñ",
    "Numerico" ~: descifrarVigenere "113413" "ip" ~?= "113413",
    "caracteres validos e invalidos mezclados" ~: descifrarVigenere "@@áóóóúñAcÁf" "az" ~?= "@@áóóóúñAdÁg",  
    "clave mas larga que s" ~: descifrarVigenere "kkkkk" "dldldldl" ~?= "hzhzh",
    "|s|=1" ~: descifrarVigenere "a" "baisalpi" ~?= "z", 
    "|clave|=1" ~: descifrarVigenere "cbjtbmqj" "b" ~?= "baisalpi",
    "nulo" ~: descifrarVigenere "" "ippppp" ~?= "" 
    ]

--eje 14
{-
parametros: s, claves
-}

testsEjpeorCifrado = test [
    peorCifrado "logistica" ["datawizard"] ~?= "datawizard",
    peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef",
    peorCifrado "a" ["a", "b", "c"] ~?= "a",
    peorCifrado "ccc" ["c", "d","z"] ~?= "z" 
    ]

--eje 15
{-
parametros: claves, msjs, cifrado
-}

testsEjcombinacionesVigenere = test [
    "longitud > 1, hay solucion "     ~: combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")], 
    "longitud > 1, no hay solucion"   ~: combinacionesVigenere ["hola", "mundo"] ["a", "c"] "ipmb" ~?= [], 
    "longitud > 1, no hay solucion"   ~:   combinacionesVigenere ["hola", "mundo"] ["a", "c"] "ipmb" ~?= [], 
    "longitud = 1, unica solucion"    ~:    combinacionesVigenere ["hola"] ["b"] "ipmb" ~?= [("hola", "b")], 
    "longitud > 1, varias soluciones" ~: expectPermutacion (combinacionesVigenere ["hola", "djfw", "emds"] ["asd", "b", "fgh"] "ipmb") [("hola", "b"), ("djfw", "fgh")]  
    ]

-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)
