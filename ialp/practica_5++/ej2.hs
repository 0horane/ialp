type Año = Integer
type EsBisiesto = Bool

bisiesto :: Año -> EsBisiesto
bisiesto anio = anio `mod` 400 == 0  || 
                (anio `mod` 4 == 0 && 
                anio `mod` 100 /= 0 ) 


