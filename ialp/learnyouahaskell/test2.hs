fib (x:y:_) = x:(fib [y,(x+y)]) 

main:: IO ()
main = do
    putStrLn . show $ take 10 (fib [0,1])



    

