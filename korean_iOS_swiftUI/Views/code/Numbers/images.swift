//
//  images.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-05.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class image {
	/// This function will choose a random image name if it's the correct answer
	func goodImage() -> String {
		let maxCorrectImages = 4
		let randomImage = "grandma"
		let randomNumber = Int.random(in: 1...maxCorrectImages)
		let imageName = "\(randomImage)\(randomNumber)"
		return imageName
	}
	
	/// This functions will choose a random image name if it's the wrong answer
	func wrongImage() -> String {
		return ""
	}
}
