import Test.HUnit
import Simulacro

listanombres = [("Pedro", "Ana"), ("Pedro", "Jorge"), ("Jorge", "Ana"), ("Juan", "Lucas"), ("Ana", "Lucas")]
res = personas listanombres

main = runTestTT tests

tests = test [
-- "nombre" ~: (funcion parametros) ~?= resultado_esperado
                "componentes repetidas" ~: (relacionesValidas [("ana", "ana")]) ~?= False,
                "tupla repetida" ~: (relacionesValidas [("ana", "pedro"), ("ana", "pedro")]) ~?= False,
                "tupla repetida invertida" ~: (relacionesValidas [("ana", "pedro"), ("pedro", "ana")]) ~?= False,
                "todas diferentes" ~: (relacionesValidas [("ana", "pedro"), ("ana", "carlos")]) ~?= True,
                "sinrepetidas" ~: ( elem "Ana" (quitar "Ana" (personas [("Ana", "Pedro"), ("Pedro", "Ana")]))) ~?= False,
                "tienetodos" ~: (all (\(x, y) -> x `elem` res && y `elem` res ) listanombres) ~?= True
             ]
-- -- Ejemplos

-- usuario1 = "Juan"
-- usuario2 = "Natalia"
-- usuario3 = "Pedro"

-- relacion1_2 = (usuario1, usuario2)
-- relacion1_1 = (usuario1, usuario1)
-- relacion1_3 = (usuario1, usuario3)


-- -- FUNCIONES PARA TESTING, NO BORRAR
-- -- expectAny permite saber si el elemenot que devuelve la función es alguno de los esperados
--expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- -- sonIguales permite ver que dos listas sean iguales si no importa el orden
-- quitar :: (Eq t) => t -> [t] -> [t]
-- -- requiere x pertenece a y
quitar x (y:ys)
  | x == y = ys
  | otherwise = y : quitar x ys

-- incluido :: (Eq t) => [t] -> [t] -> Bool
incluido [] l = True
incluido (x:c) l = elem x l && incluido c (quitar x l)

sonIguales :: (Eq t) => [t] -> [t] -> Bool
sonIguales xs ys = incluido xs ys && incluido ys xs

 