//
//  images.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-05.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

class images: NSObject {
	// How much images they are for each category
	let grandmaTotalImages = 4
	let grandpaTotalImages = 3
	var maxImages = 0
	
	///This function will be called if the answer is good and will call imageChoice
	func correctImage() -> String {
		return imageChoice(imagesChoice: "grandma")
	}
	
	/// This function will be called if the answer is wrong and will set the images to grandpa
	func incorrectImage() -> String {
		return imageChoice(imagesChoice: "grandpa")
	}
	
	/// It will return a random image name
	func imageChoice(imagesChoice: String) -> String {
		switch imagesChoice {
		case "grandma":
			maxImages = grandmaTotalImages
		case "grandpa":
			maxImages = grandpaTotalImages
		default:
			print("Error: no case matching to imagesChoices")
		}
		let randomNumber = Int.random(in: 1...maxImages)
		let randomImageName = "\(imagesChoice)\(randomNumber)"
		return randomImageName
	}
}
