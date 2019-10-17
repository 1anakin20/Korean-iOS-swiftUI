//
//  playView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct playView: View {
	var body: some View {
		VStack(spacing: 30) {
			squareButton(backgroundColor: .purple, text: "Sino-Korean numbers", action: LMAO)
			squareButton(backgroundColor: .blue, text: "Native-Korean numbers")
			squareButton(backgroundColor: .green, text: "Vocabulary")
		}
	}
}

func LMAO() {
	print("LMAO IT WORKED")
}

struct playView_Previews: PreviewProvider {
	static var previews: some View {
		playView()
	}
}
