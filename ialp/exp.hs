
exp' x y 
  | y == 0 = 1
  | otherwise = x * exp' x (y-1)

fastexp x y
  | y == 0 = 1
  | even y = let z = fastexp x (y `div` 2) in z*z
  | otherwise = x * fastexp x (y-1)
