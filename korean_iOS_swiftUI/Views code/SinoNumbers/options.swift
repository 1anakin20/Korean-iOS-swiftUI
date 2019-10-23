//
//  options.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-22.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

/// This class has functions that will save the user input from options of SinoNumbers
class UserSettingsDefaults: NSObject {
	let defaults = UserDefaults.standard
	
	// Keys strings
	let maxKey = "userDefaultsMaxKey"
	let minKey = "userDefaultsMinKey"
	// Note
	let wasLaunchedBefore = "com.koreanSwiftUI.FirstLaunch.WasLaunchedBefore"
	
	func saveMaxMin(maxTextField: String, minTextField: String) {
		// For the max number
		defaults.set(maxTextField, forKey: maxKey)
		// For the minimum number
		defaults.set(minTextField, forKey: minKey)
	}
	
	func checkMax() -> Int {
		let intMax = defaults.integer(forKey: maxKey)
		return intMax
	}
	
	func checkMin() -> Int {
		let intMin = defaults.integer(forKey: minKey)
		return intMin
	}
	
	/// It transforms String to Int comming from an TextField
	func textFieldToInt() -> Int {
		// Here it will go the input of the textField
		// For the moment I will just put a random number
		let fromTextField: String? = "10"
		guard let text = fromTextField, let intNumber = Int(text) else {
			return 1
		}
		return intNumber
	}
}
