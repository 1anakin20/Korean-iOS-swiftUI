//
//  NativeViewsFunctions.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

/// Show numeral number
func nativeNumberNumeral(randNumber: Int) -> String {
	let stringNumber = String(randNumber)
	return stringNumber
}

/// Show Korean number
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
