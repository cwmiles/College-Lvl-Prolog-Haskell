module HigherOrder where

--split into n-size lists and return as list. Return Nothing if not possible
-- split 3 [1..9] == Just [ [1,2,3],[4,5,6],[7,8,8] ]
-- split 4 [1..9] == Nothing
-- Maybe is in the Prelude and described in Chapter 8.
-- do this any way you like
splitH _ [] = []
splitH n xs = take n xs:(splitH n $drop n xs)

split :: Int -> [a] -> Maybe [[a]]
split n xs | length xs `mod` n == 0 = Just (splitH n xs) | otherwise = Nothing

--recursively: returns True if list xs can be broken into n-size pieces such 
-- such that all are the same sequence of values
-- use the split function, above, probably
-- returns False otheriwse
splitH' [] = False
splitH' (x:[]) = True
splitH' (x:xs) | x == head xs = splitH' xs | otherwise = False

isRepeats :: Eq a => Int -> [a] -> Bool 
isRepeats n xs = splitH' (splitH n xs)

--use map/filter: otherwise, as above
splitH'' [] = False
splitH'' xs = and $ map (== head xs) (tail xs)

isRepeats' :: Eq a => Int -> [a] -> Bool 
isRepeats' n xs = splitH'' (splitH n xs)

--use foldr: otherwise, as above
isRepeats'' :: Eq a => Int -> [a] -> Bool 
isRepeats'' _[] = False
isRepeats'' n xs = foldr (\x -> \y -> y&&(x == head (splitH n xs))) True (tail(splitH n xs))


--returns the LONGEST sequence s.t. xs is the concatenation of 
-- two  or more repeats  of the sequence (not one... obviously)
-- returns Nothing if such a sequence does not exist
-- repeats "fred" == Nothing
-- repeats "fredfred" == Just "fred"
-- repeats [1,2,1,2,1,2,1,2] == Just [1,2,1,2]  -- NOT [1,2]
repeats :: Eq a => [a] -> Maybe [a]
repeats [] = Nothing
repeats xs = if (take ((length xs) `div` 2) xs) == (drop ((length xs) `div` 2) xs) then Just (take ((length xs) `div` 2) xs) else Nothing
