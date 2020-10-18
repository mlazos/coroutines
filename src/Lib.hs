module Lib
    ( someFunc,
      produce,
      p1,
      p2,
      consume
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
type Coroutine s = s -> (s -> (s, s -> s)) -> (s, s -> s)

--produce :: Coroutine [Integer]
produce ((x:xs), k0) k1 = k0 ((x:(x:xs)), k1)

--p1 :: Coroutine [Integer]
p1 ((x:xs), k0) k1 = k0 (xs, k1)

--p2 :: Coroutine [Integer]
p2 ((x:xs), k0) k1 = k0 ((1:xs), k1)

consume = id
-- consume (s, k) = k ([2 .. 3], (\(x, k2) -> k2 ([1 .. 5], id)))
--


