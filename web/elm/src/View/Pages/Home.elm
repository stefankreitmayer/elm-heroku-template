module View.Pages.Home exposing (view)

import Html exposing (Html,div,h1,button)
import Html.Attributes exposing (id,class)
import Html.Events exposing (onClick)

import Model exposing (..)
import Model.Page exposing (Page(..))
import View.Common exposing (..)
import Msg exposing (..)


view : Model -> Html Msg
view model =
  div
    []
    [ h1 [] [ Html.text "Home" ]
    , button [ onClick (Navigate Play) ]
      [ Html.text "Play" ] ]
