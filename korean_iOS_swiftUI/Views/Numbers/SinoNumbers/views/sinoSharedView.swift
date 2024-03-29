//
//  sharedView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// Reusable configurable view for the play view
struct SinoPlayView: View {
	// Should the image be displayed
	@State var isImageHidden: Bool = true
	// The name of the image to display
	@State var displayedImageName: String = "grandma1"
	// The text in the label
	@State var numberLabel: String = ""
	// The color of the text label
	@State var textColor: Color = .black
	// The input of the text field
	@State var inputAnswer: String = ""
	// The accept button children view
	@State var acceptButtonView: AnyView = AnyView(acceptButton())
	// If the view is in the continue button view for the user to write the answer
	@State var continueState: Bool = false
	// It will store the choosen random number
	@State var randomNumber: Int?
	/**
	If the if value is true:
	it means the label will show a number in Korean.
	Then the user will need to write the answer in numeral
	
	If the value is false:
	the label will show a numeral.
	Then the user will need to write it in Korean
	**/
	var koreanOrNumber: Bool
	
	func checkForDarkMode() {
		if (UITraitCollection.current.userInterfaceStyle == .dark) {
			textColor = .white
		} else {
			textColor = .black
		}
	}
	
	/// This function will check if the view is in the continueState button
	func checkForContinue() {
		isImageHidden.toggle()
		if(continueState) {
			// If the view is in continue button
			showSinoNewNumber()
			continueState.toggle()
		} else {
			// If the view is not in the continue button
			checkAnswer()
			continueState.toggle()
		}
	}
	
	/// This function will reset the view for a new number
	func showSinoNewNumber() {
		let creatorFunctions = SinoNumbersCreatorFunctions()
		randomNumber = creatorFunctions.randomNumberNumbersPlay()
		inputAnswer = ""
		numberLabel = koreanOrNumber ? showNumeralRandomNum(randNumber: randomNumber!) : showKoreanRandomNum(randNumber: randomNumber!)
		acceptButtonView = AnyView(acceptButton(action: checkForContinue))
		checkForDarkMode()
	}
	
	/// This function will check if the answer is correct or incorrect
	func checkAnswer() {
		let images = Images()
		let functionToCallIf = koreanOrNumber ? checkAnswerKoreanToNumber(randNumber: randomNumber!, input: inputAnswer) : checkAnswerNumberToKorean(randNumber: randomNumber!, input: inputAnswer)
		if(functionToCallIf) {
			// If the answer is good
			acceptButtonView = AnyView(goodAnswerButton(action: checkForContinue))
			numberLabel = "That's the good answer"
			textColor = .green
			// Change the image to the correct one
			displayedImageName = images.correctImage()
		} else {
			acceptButtonView = AnyView(wrongAnswerButton(action: checkForContinue))
			let correctAnswer = koreanOrNumber ? String(randomNumber!) : sinoKoNumber(randNumber: randomNumber!)
			numberLabel = "The good answer for \(numberLabel) was \(correctAnswer)"
			textColor = .red
			displayedImageName = images.incorrectImage()
		}
	}
	
	var body: some View {
		Group {
			generalPlayView(isImageHidden: $isImageHidden,
					  displayedImageName: $displayedImageName,
					  numberLabel: $numberLabel,
					  textColor: $textColor,
					  inputAnswer: $inputAnswer,
					  acceptButtonView: $acceptButtonView,
					  koreanOrNumber: koreanOrNumber)
		}
		.onAppear {
			self.showSinoNewNumber()
		}
		.position(x: 190, y: 100)
		.padding()
	}
}


struct sharedView_Previews: PreviewProvider {
    static var previews: some View {
		Text("Hello world")
    }
}
