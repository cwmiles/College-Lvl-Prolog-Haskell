import Data.Char
import Debug.Trace

import BC

main = do
  putStrLn(msg)
  where
   msg = show score

--TESTING CODE: DO NOT CHANGE    
score = scConvert + scVNString + scInt2Base + scNum2Char + scDig2Int + scIndexInto 
  where 
    scIndexInto = test2 "test: indexInto " indexInto [0,5,10] [[0..10],[0..10],[0..10]] [0,5,10] 10
    scDig2Int   = test1 "test: dig2Int " dig2Int ['0','9','A','Z'] [0,9,10,35] 10
    scNum2Char  = test1 "test: num2char " num2char [0,9,10,35] ['0','9','A','Z'] 10
    scInt2Base  = test2 "test: int2Base " int2Base [10,10,10,34,34,71,115] [2,16,30,35,34,35,11] ["1010","A","A","Y","10","21","A5"] 30
    scVNString  = test2 "test: valNumString " valNumString ["1010","A","A","Y","10","21","A5"] [2,16,30,35,34,35,11]  [10,10,10,34,34,71,115] 30
    scConvert  = test3 "test: convert " convert ["1010","1010","1010","1111","1111","13"] [2,2,2,2,2,12] [10,16,33,10,12,2] ["10","A","A","15","13","1111"] 10

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

test3 msg f [] [] [] [] value = trace (msg++" passed!") value
test3 msg f (arg1:args1) (arg2:args2) (arg3:args3) (expected:expecteds) value
  | result == expected = test3 msg f args1 args2 args3 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++ " " ++ show arg3 ++" returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2 arg3

   
    

    

    
