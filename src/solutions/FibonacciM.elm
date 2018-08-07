module FibonacciM exposing (sum, sequence, evenSequence)

-- get Fibonacci sequences that do not exceed a maximum (max) value


sum : List Int -> Int
sum sequence =
    List.foldr (+) 0 sequence


sequence : Int -> List Int
sequence max =
    sequenceHelp max []
        |> List.reverse


sequenceHelp : Int -> List Int -> List Int
sequenceHelp max prev =
    if List.isEmpty prev then
        sequenceHelp max [ 1, 0 ]
    else
        let
            next =
                List.take 2 prev
                    |> List.foldr (+) 0
        in
            if max < next - 1 then
                prev
            else
                sequenceHelp max (next :: prev)


evenSequence : Int -> List Int
evenSequence max =
    evenSequenceHelp max []
        |> List.reverse


evenSequenceHelp : Int -> List Int -> List Int
evenSequenceHelp max prev =
    if List.isEmpty prev then
        evenSequenceHelp max [ 2, 0 ]
    else
        let
            next =
                List.take 2 prev
                    |> List.foldl
                        (\current accum ->
                            4 * accum + current
                        )
                        0
        in
            if max < next - 1 then
                prev
            else
                evenSequenceHelp max (next :: prev)
