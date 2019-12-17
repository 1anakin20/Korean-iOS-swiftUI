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
	@State private var koreanButtonText: [String] = ["안", "아니", "아", "ㅁ", "ㄴ", "ㅗ"]
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var textColor: Color = .black
//	@State private var buttonToShow: AnyView = AnyView(acceptButton())
	@State private var isAcceptButtonHidden: Bool = true
	
	/// Check the good button was checked
	func vocabularyCheckAnswer(number: Int) {
		isAcceptButtonHidden = false
		if(number == correctAnswer) {
			// Good answer
//			buttonToShow = AnyView(goodAnswerButton(action: showNewWord))
			textColor = .green
		} else {
			// Wrong answer
//			buttonToShow = AnyView(wrongAnswerButton(action: showNewWord))
			textColor = .red
		}
	}
	
	func showNewWord() {
		koreanButtonText.shuffle()
		correctAnswer = Int.random(in: 0...2)
		isAcceptButtonHidden = true
		textColor = .black
	}
	
	var body: some View {
		VStack(spacing : 10) {
			Text(koreanButtonText[correctAnswer])
				.foregroundColor(textColor)
			VStack(spacing: 10) {
				ForEach(0 ..< 3) { number in
					Button(action: {
						// Action to execute
						self.vocabularyCheckAnswer(number: number)
					}) {
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
