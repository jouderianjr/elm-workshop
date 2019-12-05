module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



---- MODEL ----


type alias Model =
    { description : String
    , todos : List String
    }


init : ( Model, Cmd Msg )
init =
    ( { description = ""
      , todos = []
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = OnDescriptionChanged String
    | OnSaveTodo


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnDescriptionChanged newDescription ->
            ( { model | description = newDescription }, Cmd.none )

        OnSaveTodo ->
            ( { model
                | todos = model.description :: model.todos
                , description = ""
              }
            , Cmd.none
            )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ input
            [ onInput OnDescriptionChanged
            , value model.description
            ]
            []
        , button [ onClick OnSaveTodo ] [ text "Save " ]
        , todosView model.todos
        ]


todosView : List String -> Html Msg
todosView todos =
    ul [] (List.map todoView todos)


todoView : String -> Html Msg
todoView todo =
    li [] [ text todo ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
