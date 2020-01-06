//
//  DictionaryView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2020-01-06.
//  Copyright © 2020 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct DictionaryView: View {
	
	func getKoreanWord() {
		let wordsArray = parseJson()
		koreanWords = wordsArray[1].fields[]
	}
	
	var body: some View {
		VStack {
			Text("Hello, World!")
		}
	}
}

struct DictionaryView_Previews: PreviewProvider {
	static var previews: some View {
		DictionaryView()
	}
}
