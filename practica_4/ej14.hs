sumaPotencias :: Integer ->Integer ->Integer ->Integer
sumaPotencias _ 0 _ = 0
sumaPotencias q n m = sumaPotenciasSerie q n m + sumaPotencias q (n-1) m

sumaPotenciasSerie :: Integer ->Integer ->Integer ->Integer
sumaPotenciasSerie _ _ 0 = 0
sumaPotenciasSerie q n m = q^(n+m) + sumaPotenciasSerie q n (m-1)