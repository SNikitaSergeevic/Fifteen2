//
//  MenuButtonStyle.swift
//  Fifteen2
//
//  Created by NikitaSergeevich on 27/02/2023.
//

import Foundation
import SwiftUI

struct MenuButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack {
			Spacer()
			configuration.label.foregroundColor(.white)
				.shadow(
					color: configuration.isPressed ? Color.blue : Color.blue.opacity(0.4),
					radius: 4, x: 0, y: 5
				)
			Spacer()
		}
		.padding()
		.background(Color.blue.cornerRadius(8).opacity(0.4))
		.scaleEffect(configuration.isPressed ? 0.95 : 1)
		
		
	}
	
}


