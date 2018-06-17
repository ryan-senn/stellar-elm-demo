module Stellar.Endpoints.AllLedgers exposing
    ( requestBuilder, send
    , setCursor, setLimit, setSorting
    , Response (..)
    )

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Resources.Page as Page exposing (Page)
import Stellar.Resources.Ledger as Ledger exposing (Ledger)

import Stellar.Errors.Error as Error exposing (Error)


requestBuilder : Endpoint -> RequestBuilder Response
requestBuilder endpoint =

    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)


send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


setCursor : String -> RequestBuilder Response -> RequestBuilder Response
setCursor cursor requestBuilder =
    requestBuilder
        |> withQueryParams [("cursor", cursor)]


setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [("limit", toString limit)]


setSorting : Sorting -> RequestBuilder Response -> RequestBuilder Response
setSorting sorting requestBuilder =
    requestBuilder
        |> withQueryParams [("order", Sorting.toString sorting)]


url : Endpoint -> String
url endpoint =
    Endpoint.toString endpoint ++ "/ledgers"


type Response
    = Error Error
    | Success (Page Ledger)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Ledger.decoder)
        ]