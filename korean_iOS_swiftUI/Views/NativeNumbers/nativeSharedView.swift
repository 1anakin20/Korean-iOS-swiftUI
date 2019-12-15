//
//  NumberToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// Reusable configurable native numbers play view
struct nativePlayView: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
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
	
	func checkForContinue() {
		isImageHidden.toggle()
		if(continueState) {
			// If the view is in continue button
			showNativeNewNumber()
			textColor = .black
			continueState.toggle()
		} else {
			// If the view is not in the continue button
			nativeCheckAnswer()
			continueState.toggle()
		}
	}
	
	func showNativeNewNumber() {
		let creatorFunctions = NativeNumbersCreatorFunctions()
		randomNumber = creatorFunctions.nativeRandomNumber()
		inputAnswer = ""
		number = koreanOrNumber ? nativeKoreanNumber(randNumber: randomNumber!) : nativeNumberNumeral(randNumber: randomNumber!)
		acceptButtonView = AnyView(acceptButton(action: checkForContinue))
	}
	
	/// Check the answer for the native numbers
	func nativeCheckAnswer() {
		let images = Images()
		let functionToCallIf = koreanOrNumber ? nativeCheckKoreanToNumber(randomNumber: randomNumber!, input: inputAnswer) : nativeCheckAnswerNumberToKorean(randomNumber: randomNumber!, input: inputAnswer)
		if(functionToCallIf) {
			// If the answer is good
			acceptButtonView = AnyView(goodAnswerButton(action: checkForContinue))
			number = "That's the good answer"
			textColor = .green
			// Change the image to the correct one
			displayedImageName = images.correctImage()
		} else {
			acceptButtonView = AnyView(wrongAnswerButton(action: checkForContinue))
			let correctAnswer = koreanOrNumber ? String(randomNumber!) : sinoKoNumber(randNumber: randomNumber!)
			number = "The good answer for \(number) was \(correctAnswer)"
			textColor = .red
			displayedImageName = images.incorrectImage()
		}
	}
	
	
	var body: some View {
		Group {
			generalPlayView(isImageHidden: $isImageHidden,
							displayedImageName: $displayedImageName,
							numberLabel: $number,
							textColor: $textColor,
							inputAnswer: $inputAnswer,
							acceptButtonView: $acceptButtonView,
							koreanOrNumber: koreanOrNumber)
		}.onAppear() {
			self.showNativeNewNumber()
		}
		.position(x: 190, y: 100)
		.padding()
	}
}

struct NumberToKorean_Previews: PreviewProvider {
	static var previews: some View {
		nativePlayView(koreanOrNumber: true)
	}
}
