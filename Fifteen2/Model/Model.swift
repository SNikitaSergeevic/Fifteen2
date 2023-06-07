//
//  Model.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 20/02/2023.
//

import Foundation

// +1 -1 +4 -4

struct Model {
	var field: [Int8] = []
	var winGame: Bool = false
	var winCondition: [Int8] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

	mutating func newGame() -> [Int8] {
		field = []
		for item in 0...15 {
			field.append(Int8(item))
		}
//		field[0] = 1
//		field[1] = 0
		field.shuffle()
		return field
	}
	
	mutating func tappedNumber(_ number: Int8) -> [Int8]{
		let indexZero = checkNumberIndex(0)
		
		let indexNumber = checkNumberIndex(number)
		print("number: \(number) with index: \(indexNumber) ")
		print("0 with index: \(indexZero) ")
		
		return changeNumberWithZero(indexZero: indexZero, indexNumber: indexNumber)
	}
	
	func checkWinGame() -> Bool{
		var result = false
		
		if field == winCondition {
			result = true
		}
		
		return result
	}
	
	private func checkNumberIndex(_ number: Int8) -> Int {
		var index = 0
		
		let _ = field.first { item in
			if item != number {
				index += 1
			}
			return item == number
		}
		return index
	}
	
	private mutating func changeNumberWithZero(indexZero: Int, indexNumber: Int) -> [Int8] {
		
		if (indexNumber - 1) == indexZero || (indexNumber - 4) == indexZero || (indexNumber + 4) == indexZero || (indexNumber + 1) == indexZero {
			
				self.field[indexZero] = self.field[indexNumber]
				self.field[indexNumber] = 0
			if checkWinGame() {
				winGame = true
			} else {
				winGame = false
			}
			
		}
		
		return field
		
		
	}
	
	func saveGame() {
		let defaults = UserDefaults.standard
		defaults.set(field, forKey: "Field")
		let saved = defaults.object(forKey: "Field")
		print("saved", saved as! Array<Int>)
	}
	
	mutating func continueGame() -> [Int8] {
		let defaults = UserDefaults.standard
		let saved = defaults.object(forKey: "Field")
		field = saved as! Array<Int8>
		return field
	}
	
	func checkUserDefaults() -> Bool {
		let defaults = UserDefaults.standard
		var toggle = false
		
		if let _ = defaults.object(forKey: "Field") {
			toggle = true
		}
		
		return toggle
	}
	
	func deleteSaveGame() {
		let defaults = UserDefaults.standard
		defaults.removeObject(forKey: "Field")
		
	}
	
}





