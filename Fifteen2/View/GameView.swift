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
			
			if viewModel.winGame {
				Spacer()
				HStack {
					Spacer()
					Text("You Win !!!")
						.font(.system(size: 40))
						.padding(.horizontal)
					Spacer()
				}
				Spacer()
				Button {
					viewModel.changeView(.mainMenu)
					viewModel.deleteSaveGame()
				} label: {
					HStack {
						Spacer()
						Text("Back in main menu")
						Spacer()
					}
				}
				.padding(.horizontal)
				Spacer()
			} else {
				Button {
					viewModel.changeView(.mainMenu)
					viewModel.saveGame()
				} label: {
					
					Text("<Back")
						.foregroundColor(.black)
					
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
								
								if item == 0 {
									Text("")
								} else {
									ZStack {
										RoundedRectangle(cornerRadius: 5)
											.frame(width: 70, height: 70)
											.foregroundColor(Color("NumberButtonColor"))
											.opacity(0.6)
											.shadow(color: Color("ShadowButtonColor") ,radius: 2, x: 1, y: 2)
											.shadow(color:.white, radius: 2, x: -1, y: -2)
										Text("\(item)")
											.foregroundColor(.black)
									}
								}
							}
						}
					}
				}
				.onAppear{
					if viewModel.currentView == .newGameView {
						viewModel.newGame()
					}
				}
			}
			
			Spacer()
		}
		.background(Color("NumberButtonColor"))
		.background(ignoresSafeAreaEdges: .all)
		
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView(viewModel: ViewModel())
	}
}
