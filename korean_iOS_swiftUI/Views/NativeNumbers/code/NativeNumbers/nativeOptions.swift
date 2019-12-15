//
//  NativeUserDefaults.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-27.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

/// This class saves the min and max of the native numbers
class NativeUserDefaults: NSObject {
	let defaults = UserDefaults.standard
	
	// Keys strings
	let nativeMaxKey = "userDefaultsNativeMaxKey"
	let nativeMinKey = "userDefaultsNativeMinKey"
	let wasLaunchedBefore = "com.korean.FirstLaunch.WasLaunchedBefore"
	
	func saveMaxMin(maxTextField: String, minTextField: String) {
		defaults.set(maxTextField, forKey: nativeMaxKey)
		defaults.set(minTextField, forKey: nativeMinKey)
	}
	
	func nativeCheckMax() -> Int {
		let intMax = defaults.integer(forKey: nativeMaxKey)
		return intMax
	}
	
	func nativeCheckMin() -> Int {
		let intMin = defaults.integer(forKey: nativeMinKey)
		return intMin
	}
}


