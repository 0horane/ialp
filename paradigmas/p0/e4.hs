-- se puede solucionar en O(n log n) si se ordenan ya hacen búsqueda binaria sobre caracteres originales. no tengo ganas
limpiar :: String -> String -> String
limpiar [] res = res
limpiar (c:cs) str2 = limpiar cs $ filter (/=c) str2

difPromedio:: [Float] -> [Float]
difPromedio x = map (\y -> sum x / (fromIntegral (length x)) - y) x

todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales (x:xs) = all (==x) xs
