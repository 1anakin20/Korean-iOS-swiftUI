//
//  NumberToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct NativeNumberToKorean: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
	/**
	If the if value is true:
	it means the label will show a number in Korean.
	Then the user will need to write the answer in numeral
	
	If the value is false:
	the label will show a numeral.
	Then the user will need to write it in Korean
	**/
	var koreanOrNumber: Bool
	
	func showNativeNewNumber() {
		let creatorFunctions = NativeNumbersCreatorFunctions()
		let randomNumber = creatorFunctions.nativeRandomNumber()
		inputAnswer = ""
		number = koreanOrNumber ? nativeKoreanNumber(randNumber: randomNumber) : nativeNumberNumeral(randNumber: randomNumber)
	}
	
	
	var body: some View {
		Group {
			generalPlayView(isImageHidden: $isImageHidden,
							displayedImageName: $displayedImageName,
							numberLabel: $number,
							textColor: $textColor,
							inputAnswer: $inputAnswer,
							acceptButtonView: $acceptButtonView,
							koreanOrNumber: false)
		}.onAppear() {
			self.showNativeNewNumber()
		}
	}
}

struct NumberToKorean_Previews: PreviewProvider {
	static var previews: some View {
		NativeNumberToKorean(koreanOrNumber: true)
	}
}
