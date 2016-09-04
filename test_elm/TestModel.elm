module TestModel exposing (testModel)

import Test exposing (Test,test,describe)
import Expect

import Helpers.Stubs exposing (..)

import Model exposing (..)
import Model.Page exposing (Page(..))



testModel : Test
testModel =
  describe "Model"
    [ describe "initialModel" describeInitialModel
    ]


describeInitialModel : List Test
describeInitialModel =
  [ test "starts on home page" <|
    \() ->
      initialModel.currentPage |> Expect.equal Home
  ]
