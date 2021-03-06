module Endpoints.AllEffects.RequestBuilder exposing (requestBuilder)

import HttpBuilder exposing (RequestBuilder)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Endpoint exposing (Endpoint)

import Stellar.Endpoints.AllEffects as AllEffects

import Endpoints.Helpers as Helpers

import Endpoints.AllEffects.Model exposing (Settings)


requestBuilder : Endpoint -> Settings -> RequestBuilder AllEffects.Response
requestBuilder endpoint settings =

    AllEffects.requestBuilder endpoint
        |> Helpers.setIfChanged AllEffects.setCursor Input.getIsChanged Input.getValue settings.cursor
        |> Helpers.setIfChangedMaybe AllEffects.setLimit IntInput.getIsChanged IntInput.getValue settings.limit
        |> Helpers.setIfJust AllEffects.setSorting settings.sorting