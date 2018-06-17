module Endpoints.AllOperations.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Sorting as Sorting exposing (Sorting)

import Stellar.Endpoints.AllOperations as AllOperations

import Form.Input as Input
import Form.IntInput as IntInput


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error AllOperations.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { cursor : Input.Model
    , limit : IntInput.Model
    , sorting : Maybe Sorting
    }


initialSettings : Settings
initialSettings =
    { cursor = Input.init
    , limit = IntInput.init
    , sorting = Nothing
    }