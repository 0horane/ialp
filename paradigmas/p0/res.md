1)


null:: Foldable t => t a -> Bool 
Es instancia vacía de foldable. 
en particular para listas termina siendo [a] -> bool
head:: [a] -> a
toma primer elemento de lista
tail:: [a] -> [a]
toma devuelve lista excluyendo primer elemento
init:: [a]->[a]
devuelve la lista excluyendo el ultimo elemento
last:: [a] -> a
toma ultimo elemento de lista
take:: Int -> [a] -> [a]
devuelve primeros n elementos de la lista
drop:: Int -> [a] -> [a]
lo opuesto, solo tomo depues de n elementos 
++:: [a] ->[a] -> [a]
concat:: Foldable t => t [a] -> a
concatena todas las listas contenidas en el foldable
reverse:: [a] -> [a]
invierte una lista
elem:: (Foldable t, Eq a) => a -> t a -> Bool
elem esta incluido en el foldable


