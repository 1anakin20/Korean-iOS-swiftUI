//
//  SubViews.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// This contains configurable views to be reused in the code

import SwiftUI


/// A square navigation link, note that the destination parameter requires of type "AnyView". So cast the view to "AnyView". AnyView(view()).
struct squareNavigationLink: View {
	var backgroundColor: Color?
	var text: String?
	var destination: AnyView?
	var body: some View {
		NavigationLink(destination: destination) {
			Text(text ?? "Button")
				.foregroundColor(.black)
				.frame(width: 200, height: 100)
				.background(backgroundColor ?? .blue)
				.cornerRadius(10)
				.shadow(radius: 3, x: 0, y: 3)
		}
	}
}

/// This is a rectangular navigation link, note that the destination parameter requires of type "AnyView". So cast the view to "AnyView". AnyView(view()).
struct longNavigationLink: View {
	// The background of the button
	var backgroundColor: Color?
	// The text
	var text: String?
	// Which view will it go to
	var destination: AnyView?
	var body: some View {
		NavigationLink(destination: destination) {
			Text(text ?? "Button")
				.foregroundColor(.black)
				.frame(width: 350, height: 70)
				.background(backgroundColor ?? .purple)
				.cornerRadius(10)
				.shadow(radius: 3, x: 0, y: 3)
		}
	}
}

/// This view shows a black button with the tittle accept
/// This view will be shown for the user to accept the input
struct acceptButton: View {
	// Void function parameter
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Accept")
				.foregroundColor(.black)
		}
	}
}

/// This view shows a green button with the text Continue
/// This view will be shown if the answer is good
struct goodAnswerButton: View {
	// Void function parameter
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Continue")
				.foregroundColor(.green)
		}
	}
}

/// This view shows a red button with the text Continue
/// This view will be shown if the answer is wrong
struct wrongAnswerButton: View {
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Continue")
				.foregroundColor(.red)
		}
	}
}

/// Subview of image that will change depening if the answer is correct or wrong
/// In Sino Number to Korean
struct numbersImage: View {
	var imageName: String
	
	var body: some View {
		Image(imageName)
			.resizable()
			.scaledToFit()
			.frame(width: 200, height: 200)
	}
}


/// Reusable configurable view for the play view
struct generalPlayView: View {
	// Should the image be displayed
	@Binding var isImageHidden: Bool
	// The name of the image to display
	@Binding var displayedImageName: String
	// The text in the label
	@Binding var numberLabel: String
	// The color of the text label
	@Binding var textColor: Color
	// The input of the text field
	@Binding var inputAnswer: String
	// The accept button children view
	@Binding var acceptButtonView: AnyView
	// If the view is in the continue button view for the user to write the answer
//	@Binding var continueState: Bool
	
	// It will store the choosen random number
//	@State var randomNumber: Int?
	
	/**
	If the if value is true:
	it means the label will show a number in Korean.
	Then the user will need to write the answer in numeral
	If the value is false:
	the label will show a numeral.
	Then the user will need to write it in Korean
	**/
	var koreanOrNumber: Bool
	
	var body: some View {
		VStack(spacing: 50) {
			// To show or not to show, that is the question
			// If the image should show or not
			if(isImageHidden) {
				numbersImage(imageName: displayedImageName).hidden()
			} else {
				numbersImage(imageName: displayedImageName)
			}
			Text("\(numberLabel)")
				.padding()
				.foregroundColor(textColor)
			HStack {
				if(koreanOrNumber) {
					customKeyboardTextField(inputAnswer: $inputAnswer, keyboardType: .numberPad)
				} else {
					customKeyboardTextField(inputAnswer: $inputAnswer, keyboardType: .default)
				}
				
				// The accept button children view
				acceptButtonView
			}
		}
	}
}

/// text field view that offers a customisable keyboard type
struct customKeyboardTextField: View {
	// input of the text field
	@Binding var inputAnswer: String
	// The custom keyboard type
	var keyboardType: UIKeyboardType
	var body: some View {
		TextField("Answer", text: $inputAnswer)
			.textFieldStyle(RoundedBorderTextFieldStyle())
			.disableAutocorrection(true)
			.keyboardType(keyboardType)
	}
}

/// This option modal view will determine the max and min of the random numbers
struct OptionsNumbers: View {
	@State var maximumNumber: String = ""
	@State var minimumNumber: String = ""
	/**
	If the value is true:
	It's the Sino options
	if the value is false:
	it's the native options
	**/
	var sinoOrNative: Bool
	
	/// This function saves the values after clicking save in the options view
	func saveValuesNumber() {
		if(sinoOrNative) {
			UserSettingsDefaultsSinoNumberToKorean().saveMaxMin(maxTextField: maximumNumber, minTextField: minimumNumber)
		} else {
			NativeUserDefaults().saveMaxMin(maxTextField: maximumNumber, minTextField: minimumNumber)
		}
	}
	
	func setValues() {
		if(sinoOrNative) {
			maximumNumber = String(UserSettingsDefaultsSinoNumberToKorean().checkMax())
			minimumNumber = String(UserSettingsDefaultsSinoNumberToKorean().checkMin())
		} else {
			maximumNumber = String(NativeUserDefaults().nativeCheckMax())
			minimumNumber = String(NativeUserDefaults().nativeCheckMin())
		}
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



struct SubViews_Previews: PreviewProvider {
	static var previews: some View {
		squareNavigationLink()
	}
}
