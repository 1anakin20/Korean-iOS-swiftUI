//
//  VocabularyEnglishToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI
import AVFoundation

class AudioPlayer: NSObject, AVAudioPlayerDelegate {
	var audioPlayer: AVAudioPlayer?
	
	func fetchAudio(audioFile: String) {
		if(!(audioFile == "")) {
			let path = Bundle.main.path(forResource: audioFile, ofType: nil)!
			let url = URL(fileURLWithPath: path)
			do {
				audioPlayer = try AVAudioPlayer(contentsOf: url)
				audioPlayer!.delegate = self
				DispatchQueue.global(qos: .background).async {
					self.audioPlayer?.prepareToPlay()
				}
				//					audioPlayer().checkForFinish()
				
			} catch {
				print("Problem with chooseSound()")
			}
		}
	}
	
	func playAudio() {
		audioPlayer?.play()
	}
	
	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		audioPlayer?.prepareToPlay()
	}
}

struct VocabularyPlayView: View {
	@State private var buttonBackgroundColors: [Color] = [.gray, .gray, .gray]
	@State private var continueButton: Bool = true
	@State private var koreanAndEnglishWordsArray: [[String]] = [["", "", ""], ["", "", ""]]
	@State private var sounds: [String] = ["", "", ""]
	@State private var correctAnswer: Int = 0
	@State private var showSoundButton: Bool = false
	@State var audioPlayerClass: AudioPlayer = AudioPlayer()
	/**
	True:
	The label is in korean and the button are in english
	False:
	The label is in English and the buttons in Korean
	**/
	@State var koreanOrEnglish: Bool = false
	
	/// This string formater function will remove the <div> and </divs> tags
	func stringFormater() {
		for firstRowIndex in 0..<koreanAndEnglishWordsArray.count {
			for secondRowIndex in 0..<koreanAndEnglishWordsArray[firstRowIndex].count {
				// Remove the "<div>"
				koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex] = koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex].replacingOccurrences(of: "<div>", with: " ")
				// Remove the "</div>"
				koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex] = koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex].replacingOccurrences(of: "</div>", with: " ")
			}
		}
	}
	
	/// This function will get the sound of the corresponding Korean word in the label to play
	func prepareSound() {
		if(!koreanOrEnglish) {
			if(!(sounds[correctAnswer] == "")) {
				showSoundButton = true
				sounds[correctAnswer] = sounds[correctAnswer].replacingOccurrences(of: "[sound:", with: "")
				sounds[correctAnswer] = sounds[correctAnswer].replacingOccurrences(of: "]", with: "")
				let soundFile = sounds[correctAnswer]
				audioPlayerClass.fetchAudio(audioFile: soundFile)
			} else {
				showSoundButton = false
				audioPlayerClass.fetchAudio(audioFile: "")
			}
		}
	}
	
	func playSound() {
		audioPlayerClass.playAudio()
	}
	
	/// This function resets the view to a new word
	func resetView() {
		// Reset the colours of the buttons to gray
		for i in buttonBackgroundColors.indices {
			buttonBackgroundColors[i] = .gray
		}
		generateRandomArray()
		prepareSound()
		continueButton.toggle()
	}
	
	/// This function will take the parseJson() array and then create an array containing 3 elements from it
	func generateRandomArray() {
		let wordArrays = parseJson()
		let arrayWordCount = wordArrays.count
		var koreanWordsArray: [String] = []
		var englishWordsArray: [String] = []
		var soundsArray: [String] = []
		for _ in 0...2 {
			let randomNumberArray = Int.random(in: 0..<arrayWordCount)
			koreanWordsArray.append(wordArrays[randomNumberArray].fields[0])
			englishWordsArray.append(wordArrays[randomNumberArray].fields[1])
			soundsArray.append(wordArrays[randomNumberArray].fields[3])
		}
		sounds = soundsArray
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
		stringFormater()
		correctAnswer = Int.random(in: 0...2)
	}
	
	/// This function will return a string.
	/// If the label is is in Korean it will return a English word
	/// If the label is in English it will return a Korean word
	func setArrayToUse(index: Int) -> String {
		return koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][index] : self.koreanAndEnglishWordsArray[1][index]
	}
	
	/// This function will take care of the background color of the buttons
	/// If the answer is correct the background will be green
	/// If the answer is incorrect the background will be red and the correct answer will be in green
	func backgroundColorButton(buttonTapped: Int) {
		continueButton.toggle()
		
		if(buttonTapped == correctAnswer) {
			// The user tapped the correct answer
			buttonBackgroundColors[buttonTapped] = .green
		} else {
			// The user tapped the incorrect answer
			buttonBackgroundColors[buttonTapped] = .red
			buttonBackgroundColors[correctAnswer] = .green
		}
	}
	
	var body: some View {
		VStack(spacing: 10) {
			Toggle(isOn: $koreanOrEnglish) {
				if koreanOrEnglish {
					Text("English")
				} else {
					Text("Korean")
				}
			}.padding()
			Spacer()
			HStack {
				// Korean or English word label
				Text(!koreanOrEnglish ? self.koreanAndEnglishWordsArray[0][correctAnswer] : self.koreanAndEnglishWordsArray[1][correctAnswer])
					.font(.system(size: 28))
				Button(action: {
					self.playSound()
				}) {
					if showSoundButton {
						Image(systemName: "speaker.3.fill")
							.resizable()
							.frame(width: 28, height: 28)
					} else {
						EmptyView()
					}
				}
			}
			
			// 3 buttons to choose the correct answer
			ForEach(0..<3) { number in
				Button(action: {
					self.backgroundColorButton(buttonTapped: number)
				}) {
					Text(self.setArrayToUse(index: number))
						.modifier(buttonProperties(backgroundColor: self.$buttonBackgroundColors[number]))
				}
			}.disabled(continueButton)
			// Continue button
			if continueButton {
				Button(action: {
					self.resetView()
				}) {
					Text("Continue")
						.foregroundColor(.white)
						.frame(width: 300, height: 65)
						.background(Color.blue)
						.cornerRadius(10)
						.shadow(radius: 3, x: 0, y: 3)
				}
				.disabled(!continueButton)
			} else {
				EmptyView()
			}
			Spacer()
		}.onAppear {
			self.resetView()
		}
	}
}

/// Reusable view for buttons to choose the answer from, the background color is customizable
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

struct VocabularyEnglishToKorean_Previews: PreviewProvider {
	static var previews: some View {
		VocabularyPlayView(koreanOrEnglish: false)
	}
}
