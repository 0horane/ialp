data AT a = NilT | Tri a (AT a) (AT a) (AT a) deriving Show


at1 = Tri 1 (Tri 2 NilT NilT NilT) (Tri 3 (Tri 4 NilT NilT NilT) NilT NilT) (Tri 5 NilT NilT NilT)

foldAT :: b -> (a -> b -> b -> b -> b) -> AT a -> b 
foldAT cNilT cTri NilT = cNilT
foldAT cNilT cTri (Tri h i r d) = cTri h (rec i) (rec r) (rec d)
    where rec t = foldAT cNilT cTri t


preorder :: AT a -> [a]
preorder = foldAT [] (\h i r d -> h:i++r++d)

mapAT :: (a -> b) -> AT a -> AT b
mapAT f = foldAT NilT (\h i r d -> Tri (f h) i r d) 

nivel :: AT a -> Int -> [a]
nivel = foldAT (const []) (\h i r d n -> if n == 0 then [h] else (i (n-1)) ++ (r (n-1)) ++ (d (n-1)))





