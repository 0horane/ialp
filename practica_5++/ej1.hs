type Punto2D = (Float, Float)
type Coordenada = Punto2D

prodInt :: Punto2D -> Punto2D -> Float
prodInt (x1,y1) (x2,y2) = x1*x2+y1*y2

todoMenor :: Punto2D -> Punto2D -> Bool
todoMenor (a,b) (x,y) = a < x && b < y

distanciaPuntos :: Punto2D -> Punto2D -> Float
distanciaPuntos (x1,y1) (x2,y2) = sqrt ((x2-x1)^2 + (y2-y1)^2)

crearPar :: a -> b -> Coordenada
crearPar a b = (a, b)

