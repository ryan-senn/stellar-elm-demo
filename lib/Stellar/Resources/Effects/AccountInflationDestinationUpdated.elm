module Stellar.Resources.Effects.AccountInflationDestinationUpdated exposing (AccountInflationDestinationUpdated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


type alias AccountInflationDestinationUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }


decoder : Decoder AccountInflationDestinationUpdated
decoder =
    Decode.decode AccountInflationDestinationUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder