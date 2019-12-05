module Main exposing (main)

import Browser exposing (sandbox)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg
    = Increment
    | Decrement


type alias Model =
    { counter : Int }


initModel : Model
initModel =
    { counter = 1 }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , p [] [ text (String.fromInt model.counter) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }


main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
