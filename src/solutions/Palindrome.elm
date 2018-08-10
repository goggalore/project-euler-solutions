module Palindrome exposing (makePalindrome)

-- takes a sequence of chars (second arg) and makes a symmetrical
-- string, and a bool (first arg) whether or not it should be
-- even in length (True) or not (False).


makePalindrome : Bool -> String -> String
makePalindrome even sequence =
    if even then
        String.reverse sequence
            |> String.append sequence
    else
        String.reverse sequence
            |> String.uncons
            |> Maybe.map (\( head, tail ) -> String.append sequence tail)
            |> Maybe.withDefault ""
