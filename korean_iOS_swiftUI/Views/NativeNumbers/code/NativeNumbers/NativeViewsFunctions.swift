//
//  NativeViewsFunctions.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

/// Show native numeral number
func nativeNumberNumeral(randNumber: Int) -> String {
	let stringNumber = String(randNumber)
	return stringNumber
}

/// Show native Korean number
func nativeKoreanNumber(randNumber: Int) -> String {
	let koreanNumber = nativeTranslationKorean(randNumber: randNumber)
	return koreanNumber
}

/// Translate decimal number to korean
func nativeTranslationKorean(randNumber: Int) -> String {
	let numberCreator = NativeNumbersCreatorFunctions()
	let nativeKoreanNumber = numberCreator.native(number: randNumber)
	return nativeKoreanNumber
}

/// Native numbers. It will compare the Korean input to the native korean and return true or false
func nativeCheckAnswerNumberToKorean(randomNumber: Int, input: String) -> Bool {
	// Create the Native korean number to compare the input to
	let nativeKoreanNumber = nativeTranslationKorean(randNumber: randomNumber)
	if(nativeKoreanNumber == String(randomNumber)) {
		// The answer is good
		return true
	} else {
		// The answer is wrong
		return false
	}
}

/// Native number. This function will comapre the numeral input to the random number and return true or false
func nativeCheckKoreanToNumber(randomNumber: Int, input: String) -> Bool {
	if(String(randomNumber) == input) {
		// The answer is good
		return true
	} else {
		// The answer is wrong
		return false
	}
}
