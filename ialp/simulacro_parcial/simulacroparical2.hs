votosEnBlanco :: [(String, String)] -> [Int] -> Int -> Int
votosEnBlanco _ votos total = total - (suma votos)

suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs

formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas ((p1, p2):xs) = sinRepetir p1 xs && sinRepetir p2 xs && p1 /= p2 && formulasValidas xs  

sinRepetir :: String -> [(String, String)] -> Bool
sinRepetir _ [] = True
sinRepetir x ((p1, p2):xs) = x /= p1 && x /= p2 && sinRepetir x xs

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos pres forms vts = 100 * division (votosPresidente pres forms vts) (suma vts)   

votosPresidente :: String -> [(String, String)] -> [Int] -> Int
votosPresidente pres ((nom, _):forms) (votos:vts)  
    | pres == nom = votos
    | otherwise = votosPresidente pres forms vts

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

proximoPresidente :: [(String, String)] -> [Int] -> String
proximoPresidente ((cand,vice):[]) (vts:[]) = cand
proximoPresidente ((maxActual, vice0):(cand,vice):forms ) (votosActual:candVts:vts) 
    | candVts > votosActual = proximoPresidente ((cand,vice):forms) (candVts:vts)
    | otherwise =  proximoPresidente ((maxActual, vice0):forms) (votosActual:vts)
