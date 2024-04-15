
test:: (Num a ) =>a ->a
test x = x

main::IO()
main = do
  putStrLn.show.test $ 5
  
  
