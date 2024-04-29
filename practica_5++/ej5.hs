type Texto = [Char]
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

existeElLocker :: Identificacion ->MapaDeLockers ->Bool
existeElLocker _ [] = False
existeElLocker id ((idL,_):xs) 
    | id == idL = True
    | otherwise = existeElLocker id xs

ubicacionDelLocker :: Identificacion ->MapaDeLockers ->Ubicacion
ubicacionDelLocker id ((idL,(_, ubic)):xs) 
    | id == idL = ubic
    | otherwise = ubicacionDelLocker id xs

estaDisponibleElLocker :: Identificacion ->MapaDeLockers ->Bool
estaDisponibleElLocker id ((idL,(disp, _)):xs) 
    | id == idL = disp == Libre
    | otherwise = estaDisponibleElLocker id xs


ocuparLocker :: Identificacion ->MapaDeLockers ->MapaDeLockers
ocuparLocker id (locker@(idL,(disp, ubic)):xs) 
    | id == idL = (idL,(Ocupado, ubic)):xs
    | otherwise = locker:ocuparLocker id xs