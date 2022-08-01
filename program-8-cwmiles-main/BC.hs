module BC where

--indexInto returns the index of the first argument in a list 
--(don't worry about error checking -- can assume in list)
indexInto :: Eq a => a -> [a] -> Int
indexInto x (y:ys) | x == y = 0 | otherwise = indexInto x ys + 1


--converts a character into its corresponding integer value
-- e.g. '0' to 0, 'A' to 10, 'Z' to 35 
-- like hex, except with more digits
-- (consider using elem -- look it up)
dig2Int :: Char -> Int
digChars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D',
            'E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S',
            'T','U','V','W','X','Y','Z']
dig2Int dChar = indexInto dChar digChars


--converts an integer in range 0..35 into its 
-- corresponding digit (0,1..Z)
-- again, don't care about ints out of bounds
num2char :: Int -> Char
num2char n = digChars!!n


--converts an integer value to a string representing
-- the number in base b
-- suggest looking up repeated division strategy
-- for how to convert base 10 to binary and 
-- then generalize
int2Base :: Int -> Int -> String
int2Base n b = reverse $ intLog2 n b
intLog2 num base | num == 0 = "" | otherwise = num2char(num `mod` base) : intLog2 (num `div` base) base


--convert a number string in base b1 into an Int
-- can assume input is valid
valNumString :: String -> Int -> Int
valNumString (xs) b1 | xs == [] = 0 | otherwise = (valNumString (tail xs) b1) + (dig2Int(head(xs)) * b1^(length(tail(xs))))

--convert String of numbers in base b1 into 
-- equivalent value in base b2, as a String
-- again, all input will be valid
convert :: String -> Int -> Int -> String
convert numString b1 b2 = int2Base (valNumString numString b1) b2