module FinalExamFall21 where

{- 
Rules
0. You are responsible for checking your final submission to GitHub
   or uploading the files to Blackboard if there is an issue (as a .zip)
   and/or emailing me your files promptly
1. You will lose at least half the points if you do not use the requested 
    language feature (recursion, patter matching, etc.), if one was
    requested.
3. Use of a where or helper function is basically always legal EXCEPT
    if you use it to avoid solving the problem as stated for problems 
    having a stated required feature to use. The litmus
    test for this is lenient -- if your use of the requested feature does
    USEFUL work, then that is sufficient.
4. You may NOT import any libraries to solve any of these, besides
   the Standard Prelude, which is loaded by default
5. The associated unit tests are not guarantees of a final score. I will
   look at these files to make sure you follow the instructions, etc. 
   Your solution should be general, i.e. not just solve the tests.
6. I am including the length of my solutions, in lines (~80 char width max).
   Most of my answers are really short. The shortest ones often use
   higher order functions and/or standard prelude functions we used a lot.
7. You may of course "reformat" a parameter such as converting
     length'  xs = ...
     to
     length'  (x:xs) = ...
     and add additional base cases, etc. (necessary, some times)
     but do not REORDER the arguments or CHANGE the types
-}


{- (q1, 10pts) Indicate your acknowledgment of the above rules, 
   i.e. "rule0" == "yes", "rule1" "yes" ... "rule7" == "yes"
   any other input returns "maybe"
   PATTERN MATCHING. 
    (My answer length = 8 lines)
-}
--maybe try using x to read the rule? and then changing response?
finalExamRules :: String -> String
finalExamRules "rule0" = "yes"
finalExamRules "rule1" = "yes"
finalExamRules "rule2" = "yes"
finalExamRules "rule3" = "yes"
finalExamRules "rule4" = "yes"
finalExamRules "rule5" = "yes"
finalExamRules "rule6" = "yes"
finalExamRules "rule7" = "yes"
finalExamRules x  = "maybe"





{-(q2, 10pts)  Using a guarded equation, define a 
    Define a max3 function using guarded equations 
    that takes three numbers and returns the/a maximum of the three 
  (My answer length = 3 lines)
-}
max3 :: (Num a, Ord a) => a -> a -> a-> a
max3 a b c | a > b && a > c = a
           | b > a && b > c = b
           | otherwise = c

{- (q3, 10 pts)
Use a list comprehension, define a negateV function that negates an input
list of Float (like a vector), e.g.
negateV [1,-2,3] ==  [-1,2,-3] --is true
(My answer length = 1 line)
You might consider putting any negative numbers in parentheses (Haskell parsing)
-}
negateV :: Num a =>  [a] -> [a]
negateV ns = [negate x | x <- ns]

{- (q4, 10 pts)
Define a lambda function to return the first four items of a list.
You may assume the list is at least four items long
replace the "id" functoin with your lambda function
(your answer is the defining the first4 with an anonymous function,
said differently, first4 is naming your anonymous function). 
(My answer length = 1 line)
You might consider putting any negative numbers in parentheses (Haskell parsing)
-}
first4 :: [a] -> [a]
first4 = \xs -> take 4 xs

{- (q5, 10 pts) Use recursion to hyphenate a list of strings, e.g.
hyphenate ["Smoot", "Hawley"]          == "Smoot-Hawley"
hyphenate []                           == ""
hyphenate ["too", "many","hyphenates"] == "too-many-hyphenates"

(My answer length = 3 lines)
-}
intersperse :: a -> [a] -> [a]
intersperse s [] = []
intersperse s [x] = [x]
intersperse s (x:xs) = x : s : (intersperse s xs)

hyphenate :: [String] -> String
hyphenate xs = ""++(concat $ intersperse "-" xs) ++""

{-(q6, 10 pts) Use a higher order function 
   (map, filter, or foldr sufficient)
   to define a function that
   prepends a list to every item in a list of lists 
   Examples:
     prepend "re" ["do","dress","write"] == [ ["redo","redress","rewrite"]]
     prepend "fred" []                   == []
    (My answer length = 1 line)
-}
prepend :: [a] -> [[a]] -> [[a]]
prepend xs yss = map(xs++) yss


{-(q7, 10 pts) Use a foldr, on ONE LINE (-4 if need more than that)  
   to define a function allZeros that goes through a list of Ints and returns 
   True if all Zeros, False otherwise
   Examples:
     allZeros [0,0,0,1,0] == False
     allZeros [0,0,0,0]       == True
     -- you do not have to worry about the empty list 
   -}
allZeros :: [Int] -> Bool
allZeros xs = (foldr (max) 0 xs) == 0


--Tree type for following question
--Note that this is slightly different than the one in book and
-- presented in class. There is no Leaf constructor. Nil constructor is like null
-- in Java/C++ in the sense it marks an absence (but it's not a pointer)
-- no duplicates in these trees (you don't need to test for that)
-- You should NOT change the type or any of the following tree definitions
-- Feel free to use a 'let' in GHCi to define others or define with your code
--
-- Note: I will define some other Trees in MY final tests, so pattern
-- matching them will fail and this question will get a 0.
data Tree a = Nil 
            | Node (Tree a) a (Tree a) deriving Show

bst1 :: Tree Int --a balanced, complete BST
bst1 = Node (Node (Node Nil 0 Nil) 1 (Node Nil 2 Nil) ) 3 (Node (Node Nil 4 Nil) 5 (Node Nil 6 Nil) )


bst2 :: Tree Int -- an imbalanced BST
bst2 = Node Nil 0  (Node Nil 1  (Node Nil 2  (Node Nil 3  (Node Nil 4  Nil ) ) ) )
{- end of Given Tree code 
(don't change anything above this but before above comment) 
-}

{- (q8,10) Solve the following problem anyway that makes sense.
    implement a layerBST function that returns all the nodes at a particular layer
        of a a BST, i.e. at a particular depth in the tree, see the examples
        1) each Node is greater than all of its left Node descendants
        2) likewise each Node is less than all of its right Node descendants
        3) a Nil is a valid BST (trivially)
        4) you may assume there are no duplicates in the tree
        5) your output must appear in sorted order (in order traversal)
        6) your query should not fail the the requested (0-indexed) layer is greater
           than the (0-indexed) depth of the tree

        Examples (see above for bst1, bst2):
        layerBST 0 bst1 == [3]
        layerBST 1 bst1 == [1,5]
        layerBST 1 bst2 == [1]
        layerBST 3 bst1 == []
        layerBST 3 bst2 == [3]
    Hint: for most of our examples pattern matching the CONSTUCTOR is 
          part of the answer, as in the examples given in class.
    
    (My answer length = 3 lines of code)
-}
layerBST :: Int -> Tree a -> [a]
layerBST _ _ = []
 
 


{- (q9,10) Solve the following Problem any way that makes sense
   (recursion, higher order functions likely desirable)
   maxLength returns the maximum length of any list in the input list of lists
   it returns -1 if the input list of lists is empty
      list of lists are of the same length
      maxLength ["ab","bc","abcde","de"] == 5
      maxLength ["red","fred","bed"] == 4
      maxLength [] = -1

      (it is occasionally useful to parenthesize negative numbers...)

      (My answer length = 1 line of code)
-}
maxLength :: [[a]] -> Int
maxLength xss
   | length xss == 0 = -1
   | otherwise = maximum $ map length xss



{- (q10,10) Solve the following Problem any way that makes sense
   (recursion, higher order functions likely desirable)
   hasDuplicates returns true if the input list has a duplicate item

      hasDuplicates [1..10] == False
      hasDuplicates ([1..6]++[5]) ==True

      (My answer length = 4 lines of code, including a where)
-}
hasDuplicates :: Eq a => [a] -> Bool
hasDuplicates xs = False

