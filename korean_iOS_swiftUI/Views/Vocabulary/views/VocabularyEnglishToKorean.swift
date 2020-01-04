//
//  VocabularyEnglishToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct VocabularyEnglishToKorean: View {
	// 2D array containing the Korean words and english words choosed randomly
	// index 0: korean words, index 1: English words
	@State private var koreanAndEnglishWordsArray: [[String]] = [["", "", ""], ["", "", ""]]
	@State private var correctAnswer = 0
	@State private var textColor: Color = .black
	//	@State private var buttonToShow: AnyView = AnyView(acceptButton())
	@State private var isAcceptButtonHidden: Bool = true
	@State private var buttonListTextColor: Color = .blue
	@State private var labelText: String = ""
	
	/// This function will reset the view after pressing the continue button
	func resetView() {
		textColor = .black
		isAcceptButtonHidden = true
	}
	
	/// This function will take the parseJson() array and then create an array containing 3 elements from it
	func generateRandomArray() {
		let wordArrays = parseJson()
		let arrayWordCount = wordArrays.count
		var koreanWordsArray: [String] = []
		var englishWordsArray: [String] = []
		for _ in 1...3 {
			let randomNumberArray = Int.random(in: 0..<arrayWordCount)
			koreanWordsArray.append(wordArrays[randomNumberArray].fields[0])
			englishWordsArray.append(wordArrays[randomNumberArray].fields[1])
		}
		// 2D array that contains the koreanWords
		/*
		koreanAndEnglishWordsArray[
		0: [String] <- Korean words at index 0
		1: [String] <- English words at index 1
		]
		*/
		var koreanTemp: [[String]] = []
		koreanTemp.append(koreanWordsArray)
		koreanTemp.append(englishWordsArray)
		koreanAndEnglishWordsArray = koreanTemp
		correctAnswer = Int.random(in: 0...2)
	}
	
	/// Check the good button was checked
	func vocabularyCheckAnswer(number: Int) {
		isAcceptButtonHidden = false
		if(number == correctAnswer) {
			// Good answer
			textColor = .green
		} else {
			// Wrong answer
			textColor = .red
		}
	}
	
	var body: some View {
		VStack(spacing : 10) {
			Text(self.koreanAndEnglishWordsArray[1][correctAnswer])
				.foregroundColor(textColor)
			VStack(spacing: 10) {
				ForEach(0 ..< 3) { number in
					Button(action: {
						self.vocabularyCheckAnswer(number: number)
					}) {
						Text(self.koreanAndEnglishWordsArray[0][number])
					}.disabled(!self.isAcceptButtonHidden)
				}
				Button(action: {
					self.generateRandomArray()
					self.resetView()
				}) {
					if(isAcceptButtonHidden) {
						Text("Continue")
							.hidden()
					} else {
						Text("Continue")
					}
				}.disabled(self.isAcceptButtonHidden)
			}
			
		}.onAppear() {
			//			self.showNewWord()
			self.generateRandomArray()
		}
	}
}

struct VocabularyEnglishToKorean_Previews: PreviewProvider {
	static var previews: some View {
		VocabularyEnglishToKorean()
	}
}
