//
//  ContentView.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 20/02/2023.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel: ViewModel = ViewModel()
	
	var body: some View {
		if viewModel.currentView == .mainMenu {
			MainMenuView(viewModel: viewModel)
		} else if viewModel.currentView == .newGameView {
			GameView(viewModel: viewModel)
		} else if viewModel.currentView == .continueGameView {
			GameView(viewModel: viewModel)
		}
	}
}




struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
