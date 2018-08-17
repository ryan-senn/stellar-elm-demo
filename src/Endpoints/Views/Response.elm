module Endpoints.Views.Response exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Lazy exposing (..)

import VirtualDom

import Http

import RecordFormatter

import Config exposing (sdkVersion)

import Msg exposing (Msg)

import Endpoints.Styles as Css


view : String -> Maybe (Result Http.Error record) -> Bool -> Html Msg
view link response isLoading =

    div
        []
        [ div
            [ Css.pageTitleContainer ]
            [ h2
                []
                [ text "Response" ]
            , a
                [ Css.pageTitleLink, href <| "http://package.elm-lang.org/packages/ryan-senn/stellar-elm-sdk/" ++ sdkVersion ++ "/Stellar-Endpoints-AccountDetails#Response", target "_blank" ]
                [ text "View Reponse on Elm Packages Documentation" ]
            ]
            , lazy2 record response isLoading
        ]


record : Maybe (Result Http.Error record) -> Bool -> VirtualDom.Node Msg
record response isLoading =

    case (isLoading, response) of

        (True, _) ->
            p
                []
                [ text "Loading..." ]
                |> toUnstyled

        (_, Nothing) ->
            p
                []
                [ text "Not requested yet." ]
                |> toUnstyled

        (_, Just data) ->
            div
                []
                [ pre
                    []
                    [ code
                        [ class "elm" ]
                        [ text <| RecordFormatter.toString data ]
                    ]
                , node "script"
                    []
                    [ text "hljs.initHighlighting.called = false;hljs.initHighlighting();" ]
                ]
                |> toUnstyled