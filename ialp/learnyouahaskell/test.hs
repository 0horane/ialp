test x | x<=0 = 1 
  | otherwise = test (x-1) + test (x-2)

main:: IO ()
main = do
    putStrLn . show $  [test x | x <- [0..10]]

    

