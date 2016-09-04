module Update exposing (..)

import Task
import Navigation

import Model exposing (..)
import Model.Page exposing (Page(..))
import Msg exposing (..)

import Debug exposing (log)


update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    Navigate page ->
      let
          pathname =
            case page of
              Home ->
                "/"

              Play ->
                "/play"
          model' = { model | currentPage = page }
      in
          (model', Navigation.newUrl pathname)


urlUpdate : Page -> Model -> (Model, Cmd Msg)
urlUpdate page model =
  let
      model' = { model | currentPage = page }
  in
      (model', Cmd.none)
