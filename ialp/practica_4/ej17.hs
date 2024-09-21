esFibonacci :: Integer ->Bool
esFibonacci x  = esFibonacciProbar x 0 1
    where esFibonacciProbar x fib1 fib2 
            | fib1 > x = False
            | fib1 == x = True
            | otherwise = esFibonacciProbar x fib2 (fib1+fib2)
