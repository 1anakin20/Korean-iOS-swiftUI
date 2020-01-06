//
//  VocabularyMenu.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// The menu leaading to the vocabulary views

import SwiftUI

/// Vocabulary menu view
struct VocabularyMenu: View {
	var body: some View {
		VStack {
			longNavigationLink(backgroundColor: .green, text: "English to Korean", destination: AnyView(VocabularyPlayView(koreanOrEnglish: false)))
		}
	}
}

struct VocabularyMenu_Previews: PreviewProvider {
	static var previews: some View {
		VocabularyMenu()
	}
}
