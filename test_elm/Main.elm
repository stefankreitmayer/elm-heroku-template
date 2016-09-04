port module Main exposing (..)

import Test exposing (Test,describe)
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)

import TestModel exposing (testModel)
import TestUpdate exposing (testUpdate)


main : Program Value
main =
  run emit completeSuite


completeSuite : Test
completeSuite =
  describe "Elm Client"
    [ testModel, testUpdate ]


port emit : ( String, Value ) -> Cmd msg
