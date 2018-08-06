module Multiples exposing (sum)

import Tuple


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
