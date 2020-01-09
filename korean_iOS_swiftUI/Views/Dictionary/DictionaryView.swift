//
//  DictionaryView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2020-01-06.
//  Copyright © 2020 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct DictionaryView: View {
	let wordsArray: [koreanWordsJson] = parseJson()
	
	var body: some View {
		List(wordsArray) { dictionaryRow in
			DictionaryRow(dictionaryRow: dictionaryRow)
		}
	}
}

struct DictionaryRow: View {
	var dictionaryRow: koreanWordsJson
	
	var body: some View {
		VStack {
			HStack {
				Text(stringFormater(stringToFormat: dictionaryRow.fields[0]))
				Spacer()
			}
			HStack {
				Text(stringFormater(stringToFormat: dictionaryRow.fields[1]))
				Spacer()
			}
		}.padding()
	}
}

struct DictionaryView_Previews: PreviewProvider {
	static var previews: some View {
		DictionaryView()
	}
}
