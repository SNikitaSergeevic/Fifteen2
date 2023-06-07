//
//  ViewModel.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 20/02/2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
	private var model: Model = Model()
	
	@Published var currentView: CurrentView = .mainMenu
	
	@Published var field: [Int8] = []
	
	func newGame() {
		field = model.newGame()
	}
	
	func continueGame() {
		field = model.continueGame()
	}
	
	func saveGame() {
		model.saveGame()
	}
	
	func changeView(_ currentView: CurrentView) {
		if currentView == .continueGameView {
			let defaults = UserDefaults.standard
			if let _ = defaults.object(forKey: "Field") {
				continueGame()
				self.currentView = .continueGameView
			}
		} else {
			self.currentView = currentView
		}
	}
	
	func intentTapNumber(_ number: Int8) {
		field = model.tappedNumber(number)
	}
	
	
	
	
}

enum CurrentView {
	case mainMenu
	case newGameView
	case continueGameView
}
