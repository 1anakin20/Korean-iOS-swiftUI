//
//  SinoNumbers.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This presents the navigation links for Korean to english and english to korean, it also shows an option button in the navigation bar to the option view
struct SinoNumberToKoreanMenu: View {
	@State private var showOptions: Bool = false
	var body: some View {
		VStack(spacing: 30) {
			longNavigationLink(backgroundColor: .purple, text: "Number to Korean", destination: AnyView(SinoNumberToKoreanPlay()))
		}
		.navigationBarItems(trailing:
			Button("Options") {
				// Present view options
				self.showOptions = true
			}.sheet(isPresented: self.$showOptions) {
				SinoOptionsNumbers()
			}
		)
	}
}


/// This option modal view will determine the max and min of the random numbers
struct SinoOptionsNumbers: View {
	@State var maximumNumber: String = ""
	@State var minimumNumber: String = ""
	
	/// This function saves the values after clicking save in the options view
	func saveValuesNumber() {
		UserSettingsDefaultsSinoNumberToKorean().saveMaxMin(maxTextField: maximumNumber, minTextField: minimumNumber)
	}
	
	func setValues() {
		maximumNumber = String(UserSettingsDefaultsSinoNumberToKorean().checkMax())
		minimumNumber = String(UserSettingsDefaultsSinoNumberToKorean().checkMin())
	}
	
	var body: some View {
		VStack(spacing: 50) {
			Button(action: {
				self.saveValuesNumber()
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
struct SinoNumberToKoreanPlay: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
	
	var body: some View {
		VStack {
			playViewReusable(isImageHidden: $isImageHidden,
							 displayedImageName: $displayedImageName,
							 numberLabel: $number,
							 textColor: $textColor,
							 inputAnswer: $inputAnswer,
							 acceptButtonView: $acceptButtonView,
							 continueState: $continueState)
		}
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		SinoNumberToKoreanPlay()
	}
}
