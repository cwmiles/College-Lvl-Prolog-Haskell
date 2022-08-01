module Chs67 where

--don't delete the import, obviously
--remember to include function types (3 points each)

sumdown 0 = 0
sumdown n = n + sumdown (n-1)

euclid x y | x == y = x | x < y  = euclid x (y-x) | y < x = euclid (x-y) y

sum' [] = 0 
sum' (x:xs) = x + sum' xs

take' 0_= []
take' n [] = []
take' n (x:xs) = x : take' (n-1) xs 

last' [x] = x
last' (x:xs) = last' xs

dec2int' xs = sum [x * y | (x,y) <- zip weights (reverse xs)] where weights = iterate (*10) 1

altmap _ _ [] = []
altmap x _ (a:[]) = x a : []
altmap x y (a:b:[]) = x a : y b : []
altmap x y (a:b:xs) = x a : y b : altmap x y xs

--define your own function(s) to help with luhn
luhnDouble x = if n < 10 then n else n-9 where n = x*2
mod10NORemainder x = (mod x 10) == 0
luhn = mod10NORemainder . sum . (altmap luhnDouble id)