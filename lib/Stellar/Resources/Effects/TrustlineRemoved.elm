module Stellar.Resources.Effects.TrustlineRemoved exposing (TrustlineRemoved, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)
import Stellar.AssetType as AssetType exposing (AssetType)


type alias TrustlineRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , assetType : AssetType
    , limit : String
    , links : Links
    }


decoder : Decoder TrustlineRemoved
decoder =
    Decode.decode TrustlineRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "asset" AssetType.decoder
        |> Decode.required "limit" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder