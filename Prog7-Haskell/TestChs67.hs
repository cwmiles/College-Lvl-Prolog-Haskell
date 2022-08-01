import Debug.Trace

import Chs67

main = do
   putStrLn(msg)
   where
    msg = show score

score = s7_10+s7_9+s7_4+s6_9last+s6_9take+s6_9sum+s6_4+s6_2
  where
    s6_4 = test2 "test: 6.4 euclid " euclid [12,32,6] [13,6,12] [1,2,6] 10 
    s6_2 = test1 "test: 6.2 sumdown " (sumdown) [3,4] [6,10] 10
    s6_9sum = test1 "test: 6.9 sum' " sum' [[1,2,3], [4,3,1]] [6,8] 10
    s6_9take = test2 "test: 6.9 take' " take' [3,2,0] [[1,2,3,4,5,9], [4,3,1], []] [[1,2,3],[4,3],[]] 10
    s6_9last = test1 "test: 6.9 last' " last' [[1,2,3], [4,3,1]] [3,1] 10
    s7_4 = test1 "test: 7.4 dec2int' " dec2int' [ [2,3,4,5] ] [2345] 10
    s7_9 = test3altmap "test: 7.9 altmap " altmap [double',double'] [triple',triple'] [ [1,1,1,1],[1,2,3,2,1]] [ [2,3,2,3], [2,6,6,6,2] ]  20
    s7_10 = test1 "test: 7.10 luhn" luhn [[1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6],[1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,2]] [False,True] 20
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

double' x = x+x

triple' x = 3*x

test3altmap msg f [] [] [] [] value = trace (msg++" passed!") value
test3altmap msg f (arg1:args1) (arg2:args2) (arg3:args3) (expected:expecteds) value
  | result == expected = test3altmap msg f args1 args2 args3 expecteds value
  | otherwise = trace (msg ++ "on inputs double'" ++ " triple' "++ show arg3++" returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2 arg3

