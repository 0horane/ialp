module Ej2 (quitar) where
import Ej1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (s:ss) = e == s || pertenece e ss 

todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:[]) = True
todosIguales (x:y:xs) = x == y && todosIguales (y:xs)

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:[]) = True
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos xs = not (todosDistintos xs) 

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) 
    | x == e = xs
    | otherwise = x:quitar e xs

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs) 
    | x == e = quitarTodos e xs
    | otherwise = x:quitarTodos e xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y = subconjunto x y && subconjunto y x
    
subconjunto :: (Eq t) => [t] -> [t] -> Bool
subconjunto [] _ = True
subconjunto (x:xs) y = x `pertenece` y && subconjunto xs y

capicua :: (Eq t) => [t] -> Bool
capicua x = reverso x == x 