module Update exposing (..)

import Model exposing (..)
import Subscription exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  (model, Cmd.none)
