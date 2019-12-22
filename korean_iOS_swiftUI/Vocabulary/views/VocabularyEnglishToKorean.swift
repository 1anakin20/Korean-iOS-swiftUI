//
//  VocabularyEnglishToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

//struct VocabularyEnglishToKorean: View {
//	var body: some View {
//		VStack(spacing: 50) {
//			Text("Hello, world")
//
//			choiceButtons()
//		}
//	}
//}

//struct choiceButtons: View {
struct VocabularyEnglishToKorean: View {
	@State private var koreanButtonText: [String]  = ["", "", ""]
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var textColor: Color = .black
//	@State private var buttonToShow: AnyView = AnyView(acceptButton())
	@State private var isAcceptButtonHidden: Bool = true
	@State private var buttonListTextColor: Color = .blue
	@State private var labelText: String = ""
	
	func getRandomArray() -> koreanWordsJson {
		let wordArrays = parseJson()
		let arrayMaxNumber = wordArrays.count
		let randomNumber = Int.random(in: 0..<arrayMaxNumber)
		let randomArray = wordArrays[randomNumber]
		return randomArray
	}
	
	func getEnglishWord() {
		let randomArray = getRandomArray()
		let englishWord = randomArray.fields[1]
		print("English word: \(englishWord)")
		print("korean Word: \(randomArray.fields[0])")
		labelText = englishWord
		makeKoreanWordsArray(randomArray: randomArray)
	}
	
	func makeKoreanWordsArray(randomArray: koreanWordsJson) {
		let correctWord = randomArray.fields[0]
//		let firstNoCorrectWord = getRandomArray().fields[0]
		let secondNoCorrectWord = getRandomArray().fields[0]
		let thirdWord = getRandomArray().fields[0]
		let arrayOfKoreanWords: [String] = [correctWord, secondNoCorrectWord, thirdWord].shuffled()
		correctAnswer = arrayOfKoreanWords.firstIndex(of: correctWord)!
//		correctAnswer = arrayOfKoreanWords.firstIndex(of: correctWord)!
		koreanButtonText = arrayOfKoreanWords
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
	
	func showNewWord() {
		koreanButtonText.shuffle()
//		correctAnswer = Int.random(in: 0...2)
		isAcceptButtonHidden = true
		textColor = .black
		getEnglishWord()
	}
	
	var body: some View {
		VStack(spacing : 10) {
			Text(labelText)
				.foregroundColor(textColor)
			VStack(spacing: 10) {
				ForEach(0 ..< 3) { number in
					Button(action: {
						// Action to execute
						self.vocabularyCheckAnswer(number: number)
					}) {
//						Text(self.koreanButtonText[number].fields[1])
						Text(self.koreanButtonText[number])
					}
				}
				Button(action: {
					self.showNewWord()
				}) {
					if(isAcceptButtonHidden) {
						Text("Continue")
							.hidden()
					} else {
						Text("Continue")
					}
				}
			}
			
		}.onAppear() {
			self.showNewWord()
		}
	}
}

struct VocabularyEnglishToKorean_Previews: PreviewProvider {
	static var previews: some View {
		VocabularyEnglishToKorean()
	}
}
