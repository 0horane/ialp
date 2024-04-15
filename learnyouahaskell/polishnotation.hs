import Data.Char (isNumber)
calc stack next  
  | all isNumber next = (read next):stack
calc (x:y:xs) next = ((op next) y x):xs
  where op next = maybe (+) id $ lookup next [("*", (*)),("+", (+)),("-", (-))] 
        -- should have just used pattern matching which also allows unary ops

solveRPN input = head.foldl calc [] $ words input

-- can remove input from both sides, use .words , 
