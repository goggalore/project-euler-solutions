module Main exposing (..)

-- what we use to display the result
-- substitute desired modules into imports, and results into init

import Html exposing (Html, text)
import FibonacciM as Fibonacci


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { result : String }


init : ( Model, Cmd Msg )
init =
    let
        fibonacci =
            Fibonacci.evenSequence 4000000
                |> Fibonacci.sum
                |> toString
    in
        ( Model fibonacci, Cmd.none )



-- UPDATE


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    text model.result



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
