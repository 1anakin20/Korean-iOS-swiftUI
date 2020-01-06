//
//  viewFunctions.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-30.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

/// This function will create a random number with the min

/// It will create a random number and will return it as a string to display it in the text view (label)
func showKoreanRandomNum(randNumber: Int) -> String {
//	let numbersCreator = SinoNumbersCreatorFunctions()
//	let randNumber = numbersCreator.randomNumberNumbersPlay()
	let randStringNumber = String(randNumber)
	return randStringNumber
}

/// show Korean number
func showNumeralRandomNum(randNumber: Int) -> String {
	let koreanNumber = sinoKoNumber(randNumber: randNumber)
	return koreanNumber
}

/// It will translate a decimal number to korean
func sinoKoNumber(randNumber: Int) -> String {
	let numbersCreator = SinoNumbersCreatorFunctions()
	let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
	return koNumber
}

/// this function will take the input of the text field and will check if rhe input is equal to the random number
func checkAnswerNumberToKorean(randNumber: Int, input: String) -> Bool {
//	let numbersCreator = SinoNumbersCreatorFunctions()
//	let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
	if(input == sinoKoNumber(randNumber: randNumber)) {
		// The answer was good
		return true
	} else {
		// The answer was wrong
		return false
	}
}

/// this function check the number for a numeric input when the label shows a Korean number
func checkAnswerKoreanToNumber(randNumber: Int, input: String) -> Bool {
//	let numbersCreators = SinoNumbersCreatorFunctions()
//	let koreanNumber = numbersCreators.numberDecimaltoStringKorean(decimalNumber: randNumber)
	if(Int(input) == randNumber) {
		return true
	} else {
		return false
	}
}
