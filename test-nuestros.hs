import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runCatedraTests = runTestTT allTests

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

{-

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

{-
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

testsEjcifrar = test [
    cifrar "computacion" 3 ~?= "frpsxwdflrq"
    ]

testsEjdescifrar = test [
    descifrar "frpsxwdflrq" 3 ~?= "computacion"
    ]

testsEjcifrarLista = test [
    cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"],
    cifrarLista [] ~?= [],
    cifrarLista ["compu"]  ~?= ["compu"],
    cifrarLista ["compu","compu","compu"]  ~?= ["compu","dpnqv","eqorw"],
    cifrarLista ["compu","compu","compu","labo","haskell","felipe","silla","mesa","mouse","compu","mesa","intro","labo"]  ~?= 
                ["compu","dpnqv","eqorw","oder","lewoipp","kjqnuj","yorrg","tlzh","uwcam","lxvyd","wock","tyecz","xmna"]
    ]

testsEjfrecuencia = test [
-- El falla viene porque la longitud de res es igual a 26.
    expectlistProximity (frecuencia "taller") [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    -- La longitud de res no es igual a 26 y todas las posiciones de res no tienen el valor 0.
    expectlistProximity (frecuencia "1") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    -- La longitud de res no es igual a 26 y todas las posiciones de res no tienen el valor 0.
    expectlistProximity (frecuencia "@") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    -- Luis: No termine de hacer los demas casos de test pero solucionen lo de arriba. Prueben la funcion con las vocales con tildes, mayusuculas y mayusuculas con tildes.
    -- Cuando regrese lo terminare
    expectlistProximity (frecuencia "tAller") [0.0,0.0,0.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0,40.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "á") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "Á") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "Z") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "A") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "ñ") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "é") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "í") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "ó") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    expectlistProximity (frecuencia "ú") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]







    

    ]

testsEjcifradoMasFrecuente = test [
    cifradoMasFrecuente "taller" 3 ~?= ('o', 33.333336)
    ]

testsEjesDescifrado = test [
    esDescifrado "taller" "compu" ~?= False
    ]

testsEjtodosLosDescifrados = test [
    todosLosDescifrados ["compu", "frpsx", "mywza"] ~?= [("compu", "frpsx"), ("frpsx", "compu")]
    ]

{-
parametros y factores: clave, n
categoria: logitud de clave, valor de n
elecciones: logitud de clave =1, >1, n=1, n>1

-}
testsEjexpandirClave = test [
    expandirClave "compu" 8 ~?= "compucom",
    expandirClave "compu" 1 ~?= "c",
    expandirClave "rompu" 5 ~?= "rompu",
    expandirClave "b" 1 ~?= "b",
    expandirClave "test" 22 ~?= "testtesttesttesttestte"

    ]

testsEjcifrarVigenere = test [
    cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv"
    ]

testsEjdescifrarVigenere = test [
    descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion"
    descifrarVigenere "á" "ip" ~?= "á"
descifrarVigenere "é" "ip" ~?= "é"
descifrarVigenere "í" "ip" ~?= "í"
descifrarVigenere "ó" "ip" ~?= "ó"
descifrarVigenere "ú" "ip" ~?= "ú"
descifrarVigenere "A" "ip" ~?= "A"
descifrarVigenere "Á" "ip" ~?= "Á"
descifrarVigenere "ñ" "ip" ~?= "ñ"
descifrarVigenere "113413" "ip" ~?= "113413"
descifrarVigenere "113413" "ipcomputacion" ~?= "113413"
descifrarVigenere "@@áóóóúñAcÁf" "az" ~?= "@@áóóóúñAcÁf"

descifrarVigenere "kkkkkkk" "dldldldl" ~?= 
"hzhzhzh"
descifrarVigenere "a" "baisalpi" ~?= "z"
descifrarVigenere " " ipip ~?=  " "
descifrarVigenere "áócompuña1Á" "be" 
~?= "áóbklltñz1Á.



    ]

testsEjpeorCifrado = test [
    peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef"
    ]

testsEjcombinacionesVigenere = test [
    combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")]
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