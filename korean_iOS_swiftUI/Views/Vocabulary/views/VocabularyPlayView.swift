//
//  VocabularyEnglishToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

//struct VocabularyPlayView: View {
//	// 2D array containing the Korean words and english words choosed randomly
//	// index 0: korean words, index 1: English words
//	@State private var koreanAndEnglishWordsArray: [[String]] = [["", "", ""], ["", "", ""]]
//	@State private var correctAnswer = 0
//	@State private var textColor: Color = .black
//	//	@State private var buttonToShow: AnyView = AnyView(acceptButton())
//	@State private var isAcceptButtonHidden: Bool = true
//	@State private var buttonListTextColor: Color = .blue
//	@State private var labelText: String = ""
//	@State var firstButtonColor: Color = .gray
//	@State private var secondButtonColor: Color = .gray
//	@State private var thirdButtonColor: Color = .gray
//	@EnvironmentObject var buttonPressed: TappedButton
//	/**
//	True:
//	The label shows the label in korean and the button are in english
//	False:
//	The label will be in English and the buttons in Korean
//	**/
//	var koreanOrEnglish: Bool = false
//
//	/// This function will reset the view after pressing the continue button
//	func resetView() {
//		//		backgroundColorButton()
//		//		isAcceptButtonHidden.toggle()
//	}
//
//	/// This function will take the parseJson() array and then create an array containing 3 elements from it
//	//	func generateRandomArray() {
//	//		let wordArrays = parseJson()
//	//		let arrayWordCount = wordArrays.count
//	//		var koreanWordsArray: [String] = []
//	//		var englishWordsArray: [String] = []
//	//		for _ in 1...3 {
//	//			let randomNumberArray = Int.random(in: 0..<arrayWordCount)
//	//			koreanWordsArray.append(wordArrays[randomNumberArray].fields[0])
//	//			englishWordsArray.append(wordArrays[randomNumberArray].fields[1])
//	//		}
//	//		// 2D array that contains the koreanWords
//	//		/*
//	//		koreanAndEnglishWordsArray[
//	//		0: [String] <- Korean words at index 0
//	//		1: [String] <- English words at index 1
//	//		]
//	//		*/
//	//		var koreanTemp: [[String]] = []
//	//		koreanTemp.append(koreanWordsArray)
//	//		koreanTemp.append(englishWordsArray)
//	//		koreanAndEnglishWordsArray = koreanTemp
//	//		correctAnswer = Int.random(in: 0...2)
//	//	}
//
//	/// Check the good button was checked
//	//	func vocabularyCheckAnswer(number: Int) {
//	//		isAcceptButtonHidden = false
//	//		if(number == correctAnswer) {
//	//			// Good answer
//	////			textColor = .green
//	//		} else {
//	//			// Wrong answer
//	////			textColor = .red
//	//		}
//	//	}
//
//	//	func backgroundColorButton() {
//	//		//		if(buttonPressed.tappedButton == 0) {
//	//		////			touchedButton = 1
//	//		//			//			return .green
//	//		//			print("Correct")
//	//		//			isAcceptButtonHidden.toggle()
//	//		//			return .red
//	//		//			print(firstButtonColor)
//	//		//		} else {
//	//		//			//				return .red
//	//		//			print("Incorrect")
//	//		//			return .gray
//	//		//			isAcceptButtonHidden.toggle()
//	//		//		}
//	//
//	//
//	//		switch buttonPressed.tappedButton {
//	//			case 0:
//	//				firstButtonColor = .red
//	//			case 1:
//	//				secondButtonColor = .red
//	//			case 2:
//	//				thirdButtonColor = .red
//	//			default:
//	//			print("default")
//	////				firstButtonColor = .red
//	////				secondButtonColor = .red
//	////				thirdButtonColor = .red
//	//		}
//	//	}
//
//	func setArrayToUse(index: Int) -> String {
//		return koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][index] : self.koreanAndEnglishWordsArray[1][index]
//	}
//
//	var body: some View {
//		VStack(spacing : 10) {
//			Text(!koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][correctAnswer] : self.koreanAndEnglishWordsArray[1][correctAnswer])
//				.foregroundColor(textColor)
//			VStack(spacing: 10) {
//				choiceButton()
//			}
//			Button(action: {
//				//				self.generateRandomArray()
//				self.resetView()
//			}) {
//				if(isAcceptButtonHidden) {
//					Text("Continue")
//						.hidden()
//				} else {
//					Text("Continue")
//				}
//			}.disabled(self.isAcceptButtonHidden)
//		}
//		.onAppear() {
//			//			self.generateRandomArray()
//		}
//	}
//}


struct choiceButton: View {
	var firstButtonText: String = ""
	var secondButtonText: String = ""
	var thirdButtonText: String = ""
	//	var correctAnswer: Int = 0
	@State var firstButtonBackgroundColor: Color = .gray
	@State var secondButtonBackgroundColor: Color = .gray
	@State var thirdButtonBackgroundColor: Color = .gray
	@State var continueButton: Bool = false
	//	@Binding var isContinueButtonHidden: Bool
	var continueButtonAction: ()
	@State private var koreanAndEnglishWordsArray: [[String]] = [["", "", ""], ["", "", ""]]
	@State var correctAnswer: Int = 0
	//	let vocabularyPlayViewStruct = VocabularyPlayView()
	var action: ()
	/**
	True:
	The label shows the label in korean and the button are in english
	False:
	The label will be in English and the buttons in Korean
	**/
	var koreanOrEnglish: Bool = false
	//	@EnvironmentObject var buttonPressed: TappedButton
	
	func resetView() {
		firstButtonBackgroundColor = .gray
		secondButtonBackgroundColor = .gray
		thirdButtonBackgroundColor = .gray
		generateRandomArray()
		continueButton.toggle()
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
	
	func setArrayToUse(index: Int) -> String {
		return koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][index] : self.koreanAndEnglishWordsArray[1][index]
	}
	
	func backgroundColorButton(buttonTapped: Int) {
		continueButton.toggle()
		var backgroundColor: Color = .gray
		
		if(buttonTapped == correctAnswer) {
			backgroundColor = .green
		} else {
			backgroundColor = .red
		}
		
		switch buttonTapped {
			case 0:
				firstButtonBackgroundColor = backgroundColor
			case 1:
				secondButtonBackgroundColor = backgroundColor
			case 2:
				thirdButtonBackgroundColor = backgroundColor
			default:
				firstButtonBackgroundColor = backgroundColor
				secondButtonBackgroundColor = backgroundColor
				thirdButtonBackgroundColor = backgroundColor
		}
		
		switch correctAnswer {
			case 0:
				firstButtonBackgroundColor = .green
			case 1:
				secondButtonBackgroundColor = .green
			case 2:
				thirdButtonBackgroundColor = .green
			default:
				firstButtonBackgroundColor = .gray
				secondButtonBackgroundColor = .gray
				thirdButtonBackgroundColor = .gray
		}
	}
	
	var body: some View {
		VStack(spacing: 10) {
			Text(!koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][correctAnswer] : self.koreanAndEnglishWordsArray[1][correctAnswer])
			
			Group {
				Button(action: {
					//				self.buttonPressed.tappedButton = 0
					self.backgroundColorButton(buttonTapped: 0)
					self.action
				}) {
					Text(setArrayToUse(index: 0))
						.modifier(buttonProperties(backgroundColor: $firstButtonBackgroundColor))
				}
				Button(action: {
					//				self.buttonPressed.tappedButton = 1
					self.backgroundColorButton(buttonTapped: 1)
					self.action
				}) {
					Text(setArrayToUse(index: 1))
						.modifier(buttonProperties(backgroundColor: $secondButtonBackgroundColor))
				}
				Button(action: {
					//				self.buttonPressed.tappedButton = 2
					self.backgroundColorButton(buttonTapped: 2)
					self.action
				}) {
					Text(setArrayToUse(index: 2))
						.modifier(buttonProperties(backgroundColor: $thirdButtonBackgroundColor))
				}
			}.disabled(continueButton)
			// Continue button
			Button(action: {
				self.resetView()
			}) {
				Text("Continue")
			}.disabled(!continueButton)
		}.onAppear {
			self.generateRandomArray()
		}
	}
}

struct buttonProperties: ViewModifier {
	@Binding var backgroundColor: Color
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.frame(width: 300, height: 65)
			.background(backgroundColor)
			.cornerRadius(10)
			.shadow(radius: 3, x: 0, y: 3)
	}
}

class TappedButton: ObservableObject {
	@Published var tappedButton = 10
}

struct VocabularyEnglishToKorean_Previews: PreviewProvider {
	static var previews: some View {
		choiceButton(koreanOrEnglish: true)
	}
}
