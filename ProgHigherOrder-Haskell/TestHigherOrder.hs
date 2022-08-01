import Debug.Trace

import HigherOrder

main = do
   putStrLn(msg)
   where
    msg = show score

score = sc_repeats+sc_isR_foldr+sc_isR_mf + sc_isR_rec + sc_split
    where
        sc_split     = test2 "test: split " split [2,3] [[1..4],[1..4]] [ (Just [[1,2],[3,4]]), Nothing ] 20 
        sc_isR_rec   = test2 "test: isRepeats (Recursive)  " isRepeats [2,3,2,4,1] [[1,2,1,2],[1,2,1,2],[1..4],[1..4]++[1..4],[]] [ True, False,False,True,False ] 20 
        sc_isR_mf    = test2 "test: isRepeats (map/filter) " isRepeats' [2,3,2,4,1] [[1,2,1,2],[1,2,1,2],[1..4],[1..4]++[1..4],[]] [ True, False,False,True,False ] 20
        sc_isR_foldr = test2 "test: isRepeats (foldr)      " isRepeats'' [2,3,2,4,1] [[1,2,1,2],[1,2,1,2],[1..4],[1..4]++[1..4],[]] [ True, False,False,True,False ] 20  
        sc_repeats   = test1 "test: repeats     " repeats  [[1,2,1,2],[1..4],[1..4]++[1..4],[]] [ (Just [1,2]), Nothing, (Just [1..4]) , Nothing ] 20  
          
test1 msg f [] [] value = trace (msg++" passed!") value
test1 msg f (arg:args) (expected:expecteds) value
  | result == expected = test1 msg f args expecteds value
  | otherwise = trace (msg ++ "on input "++ show arg ++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg
       
test2 msg f [] [] [] value = trace (msg++" passed!") value
test2 msg f (arg1:args1) (arg2:args2) (expected:expecteds) value
  | result == expected = test2 msg f args1 args2 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2