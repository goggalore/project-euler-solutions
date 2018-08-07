module Fibonacci exposing (sequence)

-- get Fibonacci sequences up to the nth term (term)


sequence : Int -> List Int
sequence term =
    sequenceHelp term []
        |> List.reverse


sequenceHelp : Int -> List Int -> List Int
sequenceHelp term prev =
    if term == List.length prev then
        prev
    else if List.isEmpty prev then
        sequenceHelp term [ 1, 0 ]
    else
        let
            next =
                List.take 2 prev
                    |> List.foldr (+) 0
        in
            sequenceHelp term (next :: prev)
