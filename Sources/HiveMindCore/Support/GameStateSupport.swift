//
//  GameStateSupport.swift
//  HiveMindCore
//
//  Created by Joseph Roque on 2019-03-13.
//

import HiveEngine

struct GameStateSupport {

	/// Player that the HiveMind is playing as
	let hiveMindPlayer: Player

	/// White player's queen
	let whiteQueen: HiveEngine.Unit
	/// Black player's queen
	let blackQueen: HiveEngine.Unit

	init(state: GameState) {
		hiveMindPlayer = state.currentPlayer
		whiteQueen = state.unitsInPlay[Player.white]?.first { $0.key.class == .queen }?.key ??
			state.unitsInHand[Player.white]!.first { $0.class == .queen }!
		blackQueen = state.unitsInPlay[Player.black]?.first { $0.key.class == .queen }?.key ??
			state.unitsInHand[Player.black]!.first { $0.class == .queen}!
	}
}
