//
//  VocabularyEnglishToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI
import AVFoundation

/// This class manages the audio player
class AudioPlayer: NSObject, AVAudioPlayerDelegate {
	var audioPlayer: AVAudioPlayer?
	
	/// This function makes sure the audio file is not an empty string and gets the audio ready to play
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
				print("Problem with chooseSound(): \(error)")
			}
		}
	}
	
	/// This function is used to play the audio
	func playAudio() {
		audioPlayer?.play()
	}
	
	/// It will get the audio ready to be replayed after it finishes
	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		audioPlayer?.prepareToPlay()
	}
}

/// The play view of the vocabulary feature, it will show a word in Korean or English and the user will choose between 3 buttons
struct VocabularyPlayView: View {
	// The background color of the 3 buttons
	@State private var buttonBackgroundColors: [Color] = [.gray, .gray, .gray]
	// If the contintinue buttons is displayed
	@State private var continueButton: Bool = true
	/*
	Array of words
	koreanAndEnglishWordsArray[
	0: [String] <- Korean words at index 0
	1: [String] <- English words at index 1
	]
	*/
	@State private var koreanAndEnglishWordsArray: [[String]] = [["", "", ""], ["", "", ""]]
	// Array of the sounds of the Korean words
	@State private var sounds: [String] = ["", "", ""]
	// The correct button for the displayed word
	@State private var correctAnswer: Int = 0
	// If the sound for a Korean word is avaible
	@State private var showSoundButton: Bool = false
	// Object of the AudioPlayer() class which manages the audio player
	@State var audioPlayerClass: AudioPlayer = AudioPlayer()
	/**
	True:
	The label is in korean and the button are in english
	False:
	The label is in English and the buttons in Korean
	**/
	@State var koreanOrEnglish: Bool = false
	
	/// This function will format the all words in the array
	func vocabularyStringFormater() {
		for firstRowIndex in 0..<koreanAndEnglishWordsArray.count {
			for secondRowIndex in 0..<koreanAndEnglishWordsArray[firstRowIndex].count {
				koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex] =  stringFormater(stringToFormat: koreanAndEnglishWordsArray[firstRowIndex][secondRowIndex])
			}
		}
	}
	
	/// This function will get the sound of the corresponding Korean word in the label to play
	func prepareSound() {
		// If it's on Korean words
		if(!koreanOrEnglish) {
			// If there is an avible sound
			if(!(sounds[correctAnswer] == "")) {
				showSoundButton = true
				
				sounds[correctAnswer] = soundStringFormater(stringToFormat: sounds[correctAnswer])
				let soundFile = sounds[correctAnswer]
				audioPlayerClass.fetchAudio(audioFile: soundFile)
			} else {
				// No avaible sound
				showSoundButton = false
			}
		}
	}
	
	/// Play the sound
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
		// 2D temporal array that contains the koreanWords
		var koreanTemp: [[String]] = []
		koreanTemp.append(koreanWordsArray)
		koreanTemp.append(englishWordsArray)
		koreanAndEnglishWordsArray = koreanTemp
		vocabularyStringFormater()
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
			// Toggle for switching between Korean and English words
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
					.font(.system(size: 24))
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
