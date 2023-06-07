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
		let saveGameExist = viewModel.checkUserDefaults()
		NavigationView {
			VStack {
				
				if saveGameExist {
					Button {
						viewModel.changeView(.continueGameView)
					} label: {
						Text("Continue")
					}
					.buttonStyle(MenuButtonStyle())
				}
				
				Button {
					viewModel.changeView(.newGameView)
				} label: {
					Text("New Game")
				}
				.buttonStyle(MenuButtonStyle())
				
				Spacer()
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
