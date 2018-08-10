module Primes exposing (primes, maxPrime)

import Set exposing (Set)


-- returns of all prime divisors of a number


primes : Int -> Set Int
primes num =
    primesHelp num 2 []
        |> Set.fromList


primesHelp : Int -> Int -> List Int -> List Int
primesHelp num trial primes =
    if trial ^ 2 > num then
        num :: primes
    else if num % trial == 0 then
        primesHelp (num // trial) trial (trial :: primes)
    else
        primesHelp num (trial + 1) primes



-- returns the max prime divisor of a number


maxPrime : Int -> Int
maxPrime num =
    primes num
        |> Set.foldl max 0



-- unfortunately we cannot use these functions on an Int as
-- large as 600851475143 as asked in the problem because the
-- Int type cannot store large intergers (overflow problem)
-- and will return meaningless values
