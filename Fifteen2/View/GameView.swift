//
//  GameView.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 20/02/2023.
//

import SwiftUI

struct GameView: View {
	@ObservedObject var viewModel: ViewModel
	var columns = [GridItem(), GridItem(), GridItem(), GridItem()]
	var body: some View {
		VStack(alignment: .leading) {
			Button {
				viewModel.changeView(.mainMenu)
				viewModel.saveGame()
			} label: {
				
					Text("<Back")
					
			}
			.padding(.horizontal)
			Spacer()
			HStack {
				LazyVGrid(columns: columns, alignment: .center) {
					ForEach(viewModel.field, id: \.self) {item in
						Button {
							print(viewModel.field)
							viewModel.intentTapNumber(item)
						} label: {
							Text("\(item)")
								.foregroundColor(.black)
								.frame(width: 70, height: 70)
								.background(Color(item == 0 ? .gray : .brown))
								.padding(5)
						}
					}
				}
			}
			.onAppear{
				if viewModel.currentView == .newGameView {
					viewModel.newGame()
				} 
			}
			Spacer()
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView(viewModel: ViewModel())
	}
}
