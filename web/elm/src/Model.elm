module Model exposing (..)

import Date exposing (Date)

import Model.Page exposing (Page(..))

type alias Model =
  { currentPage : Page }


initialModel : Model
initialModel =
  { currentPage = Home }
