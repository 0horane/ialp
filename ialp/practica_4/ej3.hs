esDivisible :: Integer -> Integer -> Bool
esDivisible x y 
  -- | x < 0 = esDivisible (-x) y 
  -- | y < 0 = esDivisible x (-y)
  | x < y = False
  | x == y = True
  | x > y = esDivisible (x-y) y

-- en realidad necesitamos primero volver ambos positivo y recien ahi entrar en recursion
