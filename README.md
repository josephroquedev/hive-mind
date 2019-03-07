# HiveMind

An AI developed to play the Hive board game.

## Components

There are 4 main components which make up the HiveMind AI. This repository contains the main AI logic.

* Client (**Swift**)
    * [hive-client](https://github.com/josephroqueca/hive-client)
    * iOS app to process state and display moves
    * Lightweight -- primarily encodes basic state and movements
    * GUI to display movements

* Server (**Ruby on Rails**)
    * [hive-server](https://github.com/josephroqueca/hive-server)
    * Lightweight
    * Receives the game state from the client and forwards it to the engine
    * Passes the suggested move from the engine back to the client

* Engine (**Swift**)
    * [hive-engine](https://github.com/josephroqueca/hive-engine)
    * Maintains the state of a game
    * Encodable & decodable to pass from client to server and back
    * Provides rules of the games to the AI to allow it to determine valid, playable moves

* HiveMind (**Swift**)
    * Given a game state, explores various moves to determine best play
    * Relies on alpha-beta pruning

---

## Getting Started

1. First, you'll need to grab a couple other repos to build the entire system and play a game of Hive against the HiveMind.
    * [Hive Client](https://github.com/josephroqueca/hive-client)
    * [Hive Server](https://github.com/josephroqueca/hive-server)
    * [HiveMind](https://github.com/josephroqueca/hivemind)
2. Run `swift build` to build a debug version of the app you can use
3. See the available commands with `.build/debug/HiveMind`

### Requirements

* Swift 4.2+

## Contributing

1. Install SwiftLint for styling conformance:
    * `brew install swiftlint`
    * Run `swiftlint` from the root of the repository.
    * There should be no errors or violations. If there are, please fix them before opening a PR.
2. Open a PR with your changes 👍
