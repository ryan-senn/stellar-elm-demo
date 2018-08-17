module Endpoints.Views.RequestTitle exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)

import Config exposing (sdkVersion)

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : String -> Html Msg
view title =

    div
        [ Css.pageTitleContainer ]
        [ h2
            []
            [ text "Response" ]
        , a
            [ Css.pageTitleLink, href <| "http://package.elm-lang.org/packages/ryan-senn/stellar-elm-sdk/" ++ sdkVersion ++ "/Stellar-Endpoints-" ++ title ++ "#Response", target "_blank" ]
            [ text "View Reponse on Elm Packages Documentation" ]
        ]