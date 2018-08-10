module Multiples exposing (sum)

import Tuple


-- sums any multiples of numbers provided as a list within a range
-- so sum [3, 5] (0, 15) will sum 3, 5, 6, 9, 12, and 15

sum : List Int -> ( Int, Int ) -> Int
sum nums range =
    List.range (Tuple.first range) (Tuple.second range)
        |> List.foldr
            (\mult accum ->
                if (List.any (\num -> mult % num == 0) nums) then
                    accum + mult
                else
                    accum
            )
            0
