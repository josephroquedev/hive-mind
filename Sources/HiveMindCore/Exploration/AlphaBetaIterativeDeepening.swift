//
//  AlphaBetaIterativeDeepening.swift
//  HiveEngine
//
//  Created by Joseph Roque on 2019-03-18.
//

import HiveEngine

class AlphaBetaIterativeDeepening: ExplorationStrategy {

	private let maxDepth: Int

	init(maxDepth: Int, support: GameStateSupport) {
		self.maxDepth = maxDepth
		self.support = support

	}

	// MARK: ExplorationStrategy

	var statesEvaluated: Int = 0
	var support: GameStateSupport

	func play(_ state: GameState, step: Step) {
		var currentDepth = 1
		while currentDepth <= maxDepth {
			alphaBetaRoot(depth: currentDepth, state: state, step: step)
			currentDepth += 1
		}
	}

	// MARK: Alpha Beta exploration

	/// Root of the exploration
	private func alphaBetaRoot(depth: Int, state: GameState, step: Step) {
		let moves = state.availableMoves
		var bestValue = Int.min
		var bestMove = moves.first!

		moves.forEach {
			state.apply($0)
			let value = alphaBetaEvaluate(depth: depth, state: state, alpha: Int.min, beta: Int.max)
			state.undoMove()
			if value > bestValue {
				bestValue = value
				bestMove = $0
				step(bestMove)

				logger.debug("Found new best move: \(bestMove)")
			}
		}
	}

	/// Exploration helper method
	private func alphaBetaEvaluate(depth: Int, state: GameState, alpha: Int, beta: Int) -> Int {
		if depth == 0 {
			return evaluate(state: state)
		}

		var updatedAlpha = alpha

		let isMinimizing = state.currentPlayer != support.hiveMindPlayer
		if isMinimizing {
			var updatedBeta = beta
			for move in state.sortedMoves() {
				state.apply(move)
				updatedBeta = min(updatedBeta, -alphaBetaEvaluate(depth: depth - 1, state: state, alpha: alpha, beta: updatedBeta))
				state.undoMove()
				if updatedBeta < alpha {
					return updatedBeta
				}
			}
			return updatedBeta
		} else {
			for move in state.sortedMoves().reversed() {
				state.apply(move)
				updatedAlpha = max(updatedAlpha, alphaBetaEvaluate(depth: depth - 1, state: state, alpha: updatedAlpha, beta: beta))
				state.undoMove()
				if beta < updatedAlpha {
					return updatedAlpha
				}
			}
			return updatedAlpha
		}
	}
}
