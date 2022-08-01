import Debug.Trace
import FinalExamFall21
main = do
    putStrLn("\nPlease:")
    putStrLn("Read the rules at the top of FinalExamFall21.hs")
    putStrLn("\"Code Incrementally\"++['!' | i<-[1..] ] \n")
    putStrLn("Tests:")
    putStrLn(msg)
        where
            msg = show score

score = s10+s9+s8+s7+s6+s5+s4+s3+s2+s1
    where  -- NOTE: Reading the test argument lists index-by-index helps
        q1args1     =  ["rule0","rule1","rule2","rule3","rule4","rule5","rule6","rule7","rule42"]
        q1expecteds =  ["yes",  "yes",  "yes",  "yes",  "yes",  "yes",  "yes",  "yes",  "maybe"]
        s1 = test1 "test: q1 (finalExamRules) " (finalExamRules) q1args1 q1expecteds 10
        
        q2args1    = [ 89,    22.0,   49.5  , 10]
        q2args2    = [ 79,    79.5,   59.5  , 10]
        q2args3    = [ 8 ,    13.1,   69.5  , 10 ]
        q2expecteds = [89,    79.5,   69.5  , 10 ]
        s2 = test3 "test: q2 (max3) " (max3) q2args1 q2args2 q2args3 q2expecteds 10
        
        q3args    =   [ [1,-2,3],  [-1,2,-3]]
        q3expecteds = [ [-1,2,-3], [1,-2,3]]
        s3 = test1 "test: q3 (negateV) " (negateV) q3args q3expecteds 10
        
        q4args    =   [ "freddy",  "abcdefg"]
        q4expecteds = [ "fred", "abcd"]
        s4 = test1 "test: q4 (first4) " (first4) q4args q4expecteds 10
        
        s5  = score5
        s6  = score6
        s7  = score7
        s8  = score8
        s9  = score9
        s10 = score10

--test helper functions (print messages and actually run tests)
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
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++" "++ show arg3++ " returned " ++ show result ++ ", expected " ++ show expected ) 0 
    where
       result = f arg1 arg2 arg3



score5 = test1 "test: q5 (hyphenate) " (hyphenate) args expecteds 10 
  where
    args =  [["Smoot", "Hawley"], [] , ["too", "many","hyphenates"]]
    expecteds =  ["Smoot-Hawley",  "", "too-many-hyphenates" ]
        


score6 = test2 "test: q6 (prepend) " (prepend) args1 args2 expecteds 10 
  where
        args1     =  ["re",                          "fred"]
        args2     =  [["do","dress","write"],        []]
        expecteds =  [ ["redo","redress","rewrite"], [] ]


score7 = test1 "test: q7 (allZeros) " (allZeros) args expecteds 10
  where
    args     =  [[0,0,0,1,0], [0,0,0,0]   ]
    expecteds =  [False, True]




score8 = test2 "test: q8 (layerBST) " (layerBST) args1 args2 expecteds 10
  where
    args1     =  [0,    1,     1,    3,    3   ] 
    args2     =  [bst1, bst1,  bst2, bst1, bst2]
    expecteds =  [[3],  [1,5], [1],  [],   [3] ]


score9 =  test1 "test: q9 (maxLength) " (maxLength) args1 expecteds 10
  where
    args1 = [ ["ab","bc","abcde","de"] , ["red","fred","bed"], [] ]
    expecteds = [5,                      4,                   -1]



score10 = test1 "test: q10 (hasDuplicates) " (hasDuplicates) args1 expecteds 10 
  where
    args1     =  [[1..10],([1..6]++[5])]
    expecteds =  [ False,  True]

