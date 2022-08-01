module Chs45 where

-- Problem 4.1
halve :: [a] -> ([a],[a])
halve xs = splitAt(length xs `div` 2) xs

-- Problem 4.2 a with head and tail
third :: [a] -> a
third xs = head (tail (tail xs))

-- Problem 4.2 b with indexing !!
third' :: [a] -> a
third' xs = xs !! 2

-- Problem 4.2 c with pattern matching
third'' :: [a] -> a
third'' (_:_:x:_) = x

-- Problem 5.2
grid :: Int -> Int -> [(Int,Int)]
grid x y = [(w,z) | z <- [0..y], w <- [0..x]]

-- Problem 5.3
square :: Int -> [(Int,Int)]
square n = [(w,z) | (w,z) <- grid n n, w/=z]

-- Problem 5.4
replicate' :: Int -> a -> [a]
replicate' i x = [x | _ <- [1..i]]
