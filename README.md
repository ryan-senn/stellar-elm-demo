# Stellar Elm SDK / API Examples

This repository started as a proof of concept that the [Elm Language](http://elm-lang.org) could be an excellent candidate as a Stellar SDK with it's strong static types.

This Repository currently hosts 2 things:
- A Stellar SDK written in Elm
- An Example SPA (single page application) written in Elm, that uses the SDK to interact with the Stellar Network.

The SDK has now been extracted to it's [own package](https://github.com/ryan-senn/stellar-elm-sdk), leaving only the Demo SPA in this repository.

It is also published to the [official Elm Lang Package Manager](http://package.elm-lang.org/packages/ryan-senn/stellar-elm-sdk/latest).

To add the SDK to your existing Elm project, run `elm package install ryan-senn/stellar-elm-sdk`.

## Initial Goals

The initial goal is to provide a solid SDK and implement a [Stellar Laboratory Clone](https://www.stellar.org/laboratory/#explorer?resource=accounts&endpoint=single&network=test) in Elm (the official one is written is React/Redux).
Since Redux is strongly influenced by Elm (or the Elm Architecture rather), I wanted to see how things would go.

## Future Plans

I intend to beef up the SPA and make it more user friendly (better validation).

I also want to reduce some code duplication, especially around Pagination.

Eventually, I would like to also add the [API Reference like here](https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html).

I will strive to build the SPA Demo up to standards with the official Javascript SPA Demo, as I woud be honoured to have it shwocased/used on the official Stellar Website.

[The future plans for the SDK can be foud here](https://github.com/ryan-senn/stellar-elm-sdk#future-plans).

## Build

If you want to run the code locally, you'll need to run the following (skip steps if you already have Elm for example)

- If you don't have Elm tooling, install it:
    - `npm i -g elm elm-live`

- Clone the Repo
    - `git clone git@github.com:ryan-senn/stellar-elm-demo.git`
    - `cd stellar-elm-demo`

- Compile the Elm code: (it will prompt to install the dependencies, just hit enter)
    - On Osx: `./elm-live-osx.sh`
    - On Linux: `./elm-live-linux.sh`

- Pull in a a couple of Javscript dependencies (Clipboard js and Highlight js)
    - `npm install -g yarn gulp`
    - `yarn`
    - `gulp`

If you want to add the Time Traveller, open the shell script above and add `--debug` at the end.

You should now be able to open `./public/index.html` and have a working SPA!

## Examples / Live Demo

In case you missed the link further up, the live example runs on Github Pages (set up in `./docs`): https://ryan-senn.github.io/stellar-elm-demo
