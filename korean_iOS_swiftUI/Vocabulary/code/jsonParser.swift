//
//  jsonParser.swift
//  Korean-iOS
//
//  Created by Tomas Daniel Nieto on 2019-05-28.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import UIKit

struct koreanWordsJson: Codable {
//	let __type__: String
	let fields: [String]
}

/// This function will parse  the Korean_Vocabulary json file which contains an array of Korean words and their english meaning
func parseJson() -> Array<koreanWordsJson> {
	do {
		let url = Bundle.main.url(forResource: "Korean_Vocabulary shorter", withExtension: "json")
		let data = try! Data(contentsOf: url!)
		let vocabulary = try JSONDecoder().decode([koreanWordsJson].self, from: data)
		return vocabulary
	} catch {
//		return [koreanWordsJson.init(from: ["Error in parseJson()"])]
		print("Error parsing json: \(error)")
		return error as! Array<koreanWordsJson>
	}
}

//func printData() {
//	let wordArrays = parseJson()
//	let arrayMaxNumber = wordArrays.count
//	let randomNumber = Int.random(in: 0..<arrayMaxNumber)
//	let randomKoreanWord = wordArrays[randomNumber]
//	let koreanWord = randomKoreanWord.fields[0]
//	let englishWord = randomKoreanWord.fields[1]
//	print("Korean word: \(koreanWord)")
//	print("English word: \(englishWord)")
//}
