data AB a = Nil | Bin (AB a) a (AB a) deriving (Show)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin c1 a c2) = Bin (negacionAB c1) (not a) (negacionAB c2)

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin c1 n c2) = (productoAB c1) * n * (productoAB c2) 
