//
//  options.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-22.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import Foundation

/// This class has functions that will save the user input from options of SinoNumbers
class UserSettingsDefaultsSinoNumberToKorean: NSObject {
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

/// It will detect the first launch of the app
final class FirstLaunch {
	
	let wasLaunchedBefore: Bool
	var isFirstLaunch: Bool {
		return !wasLaunchedBefore
	}
	
	init(getWasLaunchedBefore: () -> Bool, setWasLaunchedBefore: (Bool) -> ()) {
		let wasLaunchedBefore = getWasLaunchedBefore()
		self.wasLaunchedBefore = wasLaunchedBefore
		if !wasLaunchedBefore {
			setWasLaunchedBefore(true)
		}
	}
	
	convenience init(userDefaults: UserDefaults, key: String) {
		self.init(getWasLaunchedBefore: { userDefaults.bool(forKey: key) },
				  setWasLaunchedBefore: { userDefaults.set($0, forKey: key) })
	}
}

func firstLaunchDefaultValues() {
	let userSettings = UserSettingsDefaultsSinoNumberToKorean()
	let firstLaunch = FirstLaunch(userDefaults: .standard, key: userSettings.wasLaunchedBefore)
	if(firstLaunch.isFirstLaunch) {
		let sinoMaxKey = UserSettingsDefaultsSinoNumberToKorean().maxKey
		let sinoMinKey = UserSettingsDefaultsSinoNumberToKorean().minKey
		// Set default values
		UserSettingsDefaultsSinoNumberToKorean().defaults.set(100, forKey: sinoMaxKey)
		UserSettingsDefaultsSinoNumberToKorean().defaults.set(1, forKey: sinoMinKey)
		
		// The native numbers have not yet been added
		//			// Native numbers
		//			let nativeUserSettings = NativeUserDefaults()
		//			let nativeMaxKey = nativeUserSettings.nativeMaxKey
		//			let nativeMinKey = nativeUserSettings.nativeMinKey
		//			// Set default values
		//			NativeUserDefaults().defaults.set(99, forKey: nativeMaxKey)
		//			NativeUserDefaults().defaults.set(1, forKey: nativeMinKey)
	}
}

