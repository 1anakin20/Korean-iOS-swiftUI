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
			longNavigationLink(backgroundColor: .purple, text: "Number to Korean", destination: AnyView(sinoNumberToKorean()))
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
	@State var maximumNumber: String = ""
	@State var minimumNumber: String = ""
	
	func saveValues() {
		UserSettingsDefaults().saveMaxMin(maxTextField: maximumNumber, minTextField: minimumNumber)
	}
	
	func setValues() {
		maximumNumber = String(UserSettingsDefaults().checkMax())
		minimumNumber = String(UserSettingsDefaults().checkMin())
	}
	
	var body: some View {
		VStack(spacing: 50) {
			Button(action: {
				self.saveValues()
			}) {
				Text("Save")
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
		.onAppear {
			self.setValues()
		}
		.textFieldStyle(RoundedBorderTextFieldStyle())
		.multilineTextAlignment(.center)
		.keyboardType(.numberPad)
		.padding()
		.offset(y: -170)
	}
}

/// This view will present numbers and the user will write them in Korean
struct sinoNumberToKorean: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	
	// Properties variables
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	
	func showNewNumber() {
		number = showKoreanRandomNum()
		acceptButtonView = AnyView(acceptButton())
	}
	
	var body: some View {
		VStack {
			Image("Test1")
				.resizable()
				.scaledToFit()
				.frame(width: 200, height: 200)
			Text(number)
				.padding()
			HStack {
				TextField("Answer", text: $inputAnswer)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.disableAutocorrection(true)
				acceptButtonView
			}
			.position(x: 190, y: 100)
			.padding()
		}
		.onAppear {
			self.showNewNumber()
		}
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		sinoNumberToKorean()
	}
}
