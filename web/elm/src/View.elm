module View exposing (view)

import Html exposing (Html)

import Model exposing (..)
import Subscription exposing (..)


view : Model -> Html Msg
view model =
  Html.text model
