//
//  DictionaryView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2020-01-06.
//  Copyright © 2020 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

class wordsArrayClass {
	var wordsArray: [[String]] = [[""], [""]]
	
	func getKoreanWord() {
		let parseJsonWordsArray = parseJson()
		var tempArray: [[String]] = [[], []]
		for item in 0..<parseJsonWordsArray.count {
			tempArray[0].append(parseJsonWordsArray[item].fields[0])
			tempArray[1].append(parseJsonWordsArray[item].fields[1])
		}
		wordsArray[0] = tempArray[0]
		wordsArray[1] = tempArray[1]
	}
	
}

struct DictionaryView: View {
	@State var wordsArrayObj = wordsArrayClass()
	@State var wordsArray: [[String]] = [["", ""], ["", ""]]
	
	
	func fillWordsArray() {
		wordsArrayObj.getKoreanWord()
		wordsArray = wordsArrayObj.wordsArray
	}
	
	
	var body: some View {
		HStack {
			ForEach(koreanWordsJson, id: koreanWordsJson.id) { item in
				DictionaryRow(koreanWord: self.wordsArray[0][item], englishWord: self.wordsArray[1][item])
			}
		}.onAppear {
			self.fillWordsArray()
		}
	}
}

struct DictionaryRow: View {
	var koreanWord: String
	var englishWord: String
	var body: some View {
		VStack {
			HStack {
				Text(koreanWord)
				Spacer()
			}
			HStack {
				Text(englishWord)
				Spacer()
			}
		}.padding()
	}
}


struct DictionaryDetail: View {
	var koreanWord: String
	var englishWord: String
	
	var body: some View {
		HStack {
			VStack {
				Text(koreanWord)
					.font(.largeTitle)
				Text(englishWord)
					.font(.title)
				Spacer()
			}.padding()
			Spacer()
		}
	}
}

struct DictionaryView_Previews: PreviewProvider {
	static var previews: some View {
		DictionaryRow(koreanWord: "Korean word", englishWord: "english word")
	}
}
