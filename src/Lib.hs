module Lib
    ( someFunc,
      produce1,
      consume1,
      consume2,
      chainCPS
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- A coroutine is a function which can be suspended and resumed
-- type Suspended a b = (a, b)

-- Suspend


-- Resume
--
--
-- runCoroutine :: (a, b) -> Either (
-- coroutine type is a restricted continuation in our case
type Coroutine s = s -> (s -> s) -> s

produce1 :: [Integer] -> ([Integer] -> [Integer]) -> [Integer]
produce1 (x:xs) k = k (1:(x:xs))

consume1 :: [Integer] -> ([Integer] -> [Integer]) -> [Integer]
consume1 [] _ = []
consume1 (x:xs) k = k (xs)

consume2 :: [Integer] -> ([Integer] -> [Integer]) -> [Integer]
consume2 [] _ = []
consume2 (_:[]) _ = []
consume2 (_:(_:xs)) k = k (xs)

chainCPS :: ((a -> r) -> r) -> (a -> ((b -> r) -> r)) -> ((b -> r) -> r)
chainCPS s f = \k -> s $ \x -> f x $ k
