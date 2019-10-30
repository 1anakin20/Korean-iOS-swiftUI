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

