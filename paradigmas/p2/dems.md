Ejs 1,2,3 estan en carpeta

foldr _ b [] = b
foldr f b (a:as) = f a (foldr f b as) 

foldl _ b [] = b
foldl f b (a:as) = foldl f (f b a) as

{++0} [] ++ ys = ys
{++1} (x:xs) ++ ys = x : (xs ++ ys)

     reverse :: [a] -> [a]
{R0} reverse = foldl (flip (:)) []

### vii. reverse = foldr (\x rec -> rec ++ (x:[])) []

Por extensionalidad de funciones
∀m . reverse m = foldr (\x rec -> rec ++ (x:[])) [] m

Por induccióne structural sobre lista:
P(I) ≡ reverse I = foldr (\x rec -> rec ++ (x:[])) [] I
CB: P([]): reverse [] = foldr (\x rec -> rec ++ (x:[])) [] []

foldr (\x rec -> rec ++ (x:[])) [] []
= [] {Foldr1}

reverse []
foldl (flip (:)) [] {R0}
[] {Fl0}

PI: ∀y:a∀ys:[a]. P(ys) => P(y:ys)
reverse ys = foldr (\x rec -> rec ++ (x:[])) [] ys => reverse (y:ys) = foldr (\x rec -> rec ++ (x:[])) [] (y:ys)

foldr (\x rec -> rec ++ (x:[])) [] (y:ys)
(\x rec -> rec ++ (x:[])) y (foldr (\x rec -> rec ++ (x:[])) [] ys) {foldr1}
(\rec -> rec ++ (y:[])) (foldr (\x rec -> rec ++ (x:[])) [] ys) {β}
reverse ys ++ (y:[])  {HI}
reverse ys ++ (y:[])  {HI}



reverse (y:ys) 
foldl (flip (:)) [] (y:ys) {R0}
foldl (flip (:)) ((flip (:)) [] y) ys {foldl1}
foldl (flip (:)) ((:) y []) ys {flip}
foldl (flip (:)) [y] ys {:} 
foldl (flip (:)) [y] ys {:} 


Lema: foldl (flip (:)) [] ys ++ [y] = foldl (flip (:)) [] (y:ys)
CB: ys = []
foldl (flip (:)) [] [] ++ [y]
[] ++ [y] {foldl0}
[y] {++0}

foldl (flip (:)) [] (y:[])
foldl (flip (:)) (flip (:) [] y) [] {foldl1}
foldl (flip (:)) (y:[]) [] {flip}
y:[] {foldl0}
[y]

PI
foldl (flip (:)) [] (y:ys)
foldl (flip (:)) ((flip (:)) [] y) ys {foldl1}
foldl (flip (:)) [y] ys {flip}


## 5

zip :: [a] -> [b] -> [(a,b)]
{Z0} zip = foldr (\x rec ys ->
                    if null ys
                        then []
                        else (x, head ys) : rec (tail ys))
                    (const [])
zip’ :: [a] -> [b] -> [(a,b)]
{Z’0} zip’ [] ys = []
{Z’1} zip’ (x:xs) ys = if null ys then [] else (x, head ys):zip’ xs (tail ys)

zip' = zip
por extensionalidad funcional:
∀xs:[a]∀ys:[b].zip' xs ys = zip xs ys
Inducción sobre xs
CB: ∀ys.zip [] ys = zip' [] ys

zip’ [] ys
[] {z'1}

zip [] ys
foldr (\x rec ys ->
                    if null ys
                        then []
                        else (x, head ys) : rec (tail ys))
                    (const []) [] ys {z0}

(const []) ys {foldr0}
[] {const}

