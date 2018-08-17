module Endpoints.AllEffects.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Sorting as Sorting

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.RequestTitle as RequestTitle
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.AllEffects.Msg as AllEffects
import Endpoints.AllEffects.MsgFactory as AllEffects
import Endpoints.AllEffects.Model as AllEffects

import Endpoints.AllEffects.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> AllEffects.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "All Effects" "https://www.stellar.org/developers/horizon/reference/endpoints/effects-all.html"
        , div
            [ Css.page ]
            [ RequestTitle.view "AllEffects"
            , Endpoint.view endpoint
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Cursor" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 1)" ]
                    ]
                , model.settings.cursor
                    |> Input.view
                    |> Input.render
                    |> Html.map (AllEffects.UpdateCursor >> AllEffects.SettingsMsg >> AllEffects.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Limit" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 200, default: 10)" ]
                    ]
                , model.settings.limit
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.map (AllEffects.UpdateLimit >> AllEffects.SettingsMsg >> AllEffects.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Sorting" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(default: asc)" ]
                    ]
                , div
                    []
                    [ span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Asc)
                        , onClick (AllEffects.UpdateSorting Sorting.Asc |> AllEffects.SettingsMsg |> AllEffects.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (AllEffects.UpdateSorting Sorting.Desc |> AllEffects.SettingsMsg |> AllEffects.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) model.settings)
            , Button.view model.isLoading (AllEffects.Request (endpointFromInput endpoint) model.settings |> AllEffects.composeMsg)
            , Response.view "AllEffects" model.response model.isLoading
            ]
        ]