import Chs45
import Data.List

scoreHalve :: Int
scoreHalve = if test1 && test2  then 20  else 0
    where
        test1 = halve [1..10] == ([1..5],[6..10])
        test2 = halve ['a'..'z'] == (['a'..'m'],['n'..'z'])

scoreThird :: Int
scoreThird = if allPass  then 10  else 0
    where
        test1 = third [1..10] == 3
        test2 = third [-1,1..23] == 3
        test3 = third [-1..23] == 1
        test4 = third ['a'..'z'] =='c'
        allPass = test1 && test2 && test3 && test4

scoreThird' :: Int
scoreThird' = if allPass  then 10  else 0
    where
        test1 = third' [1..10] == 3
        test2 = third' [-1,1..23] == 3
        test3 = third' [-1..23] == 1
        test4 = third' ['a'..'z'] =='c'
        allPass = test1 && test2 && test3 && test4

scoreThird'' :: Int
scoreThird'' = if allPass  then 10  else 0
    where
        test1 = third'' [1..10] == 3
        test2 = third'' [-1,1..23] == 3
        test3 = third'' [-1..23] == 1
        test4 = third'' ['a'..'z'] =='c'
        allPass = test1 && test2 && test3 && test4

scoreGrid :: Int
scoreGrid = if allPass then 20 else 0
    where
        grid1 = sort $ grid 1 2
        ans1 = sort [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
        grid2 = sort $ grid 2 2
        ans2 = sort [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2)]
        allPass = grid1 == ans1 && grid2 == ans2 

scoreSquare :: Int
scoreSquare = if allPass then 15 else 0
    where
        sq1 = sort $ square 1 
        ans1 = sort [(0,1),(1,0)]
        sq2 = sort $ square 2
        ans2 = sort [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]
        allPass = sq1 == ans1 && sq2 == ans2 

scoreRepl :: Int
scoreRepl = if allPass then 15 else 0
    where
        test1 = replicate 3 4 == replicate' 3 4
        test2 = replicate 5 'a' == replicate' 5 'a'
        test3 = replicate 2 [1..4] ==  replicate' 2 [1..4]
        allPass = test1 && test2 && test3

main = do
    putStrLn( show sHalve )
    putStrLn( show sThird )
    putStrLn( show sThird' )
    putStrLn( show sThird'' )
    putStrLn( show sGrid )
    putStrLn( show sSquare )
    putStrLn( show sRepl )
    putStrLn( "Score = "++ show score)
    where
        sHalve = scoreHalve
        sThird = scoreThird
        sThird' = scoreThird'
        sThird'' = scoreThird''
        sGrid = scoreGrid
        sSquare = scoreSquare
        sRepl = scoreRepl
        score = sHalve+sThird+sThird' + sThird'' +sGrid+sSquare+sRepl
