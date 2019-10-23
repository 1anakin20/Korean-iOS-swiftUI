//
//  SinoNumbers.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This presents the navigation links for Korean to english and english to korean, it also shows an option button in the navigation bar to the option view
struct SinoNumbers: View {
	@State private var showOptions: Bool = false
	var body: some View {
		VStack(spacing: 30) {
			longNavigationLink(backgroundColor: .purple, text: "Korean to English")
		}
		.navigationBarItems(trailing:
			Button("Options") {
				// Present view options
				self.showOptions = true
			}.sheet(isPresented: self.$showOptions) {
				options()
			}
		)
	}
}


/// This option modal view will determine the max and min of the random numbers
struct options: View {
	@Environment(\.presentationMode) var presentationMode
	@State var maximumNumber: String = "100"
	@State var minimumNumber: String = "1"
	
	func passTextFieldValue() {
		UserSettingsDefaults().saveMaxMin(maxTextField: maximumNumber, minTextField: minimumNumber)
	}
	
	var body: some View {
		VStack(spacing: 50) {
			Button(action: {
				print("dismisses form")
				self.presentationMode.wrappedValue.dismiss()
			}) {
				Text("Done")
			}
			
			HStack {
				Text("Maximum number")
				Spacer()
				TextField("Max", text: $maximumNumber)
					.frame(width: 55)
			}
			HStack {
				Text("Minimum number")
				Spacer()
				TextField("Minimum number", text: $minimumNumber)
					.frame(width: 55)
				
			}
		}
		.textFieldStyle(RoundedBorderTextFieldStyle())
		.multilineTextAlignment(.center)
		.keyboardType(.numberPad)
		.padding()
		.offset(y: -170)
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		options()
	}
}
