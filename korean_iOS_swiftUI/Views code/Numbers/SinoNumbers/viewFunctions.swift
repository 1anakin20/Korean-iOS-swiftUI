//
//  viewFunctions.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-30.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

func showKoreanRandomNum() -> String {
	let numbersCreator = SinoNumbersCreatorFunctions()
	let randNumber = numbersCreator.randomNumber()
	let randStringNumber = String(randNumber)
	return randStringNumber
}

func koNumber(randNumber: Int) -> String {
	let numbersCreator = SinoNumbersCreatorFunctions()
	let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
	return koNumber
}

func checkAnswerNumberToKorean(randNumber: Int, input: String) -> Bool {
//	let numbersCreator = SinoNumbersCreatorFunctions()
//	let koNumber = numbersCreator.numberDecimaltoStringKorean(decimalNumber: randNumber)
	if(input == koNumber(randNumber: randNumber)) {
		// The answer was good
		return true
	} else {
		// The answer was wrong
		return false
	}
}
