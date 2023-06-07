//
//  MainMenuView.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 20/02/2023.
//

import SwiftUI

struct MainMenuView: View {
	
	@ObservedObject var viewModel: ViewModel 
	
    var body: some View {
		NavigationView {
			VStack {
				Button {
					viewModel.changeView(.newGameView)
				} label: {
					Text("New Game")
				}
				Button {
					viewModel.changeView(.continueGameView)
				} label: {
					Text("Continue")
				}
				Button {
					
				} label: {
					Text("Settings")
				}
			}
			.padding()
			.navigationTitle("Fifteen")
		}
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(viewModel: ViewModel())
    }
}
