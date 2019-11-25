//
//  playView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
/// This view contains the navigation links that will provide access to other views

import SwiftUI

struct playView: View {
	var body: some View {
		NavigationView {
			VStack(spacing: 30) {
				squareNavigationLink(backgroundColor: .purple, text: "Sino-Korean numbers", destination: AnyView(SinoNumberToKoreanMenu()))
				squareNavigationLink(backgroundColor: .blue, text: "Native-Korean numbers")
				squareNavigationLink(backgroundColor: .green, text: "Vocabulary")
			}
		}
	}
}

struct playView_Previews: PreviewProvider {
	static var previews: some View {
		playView()
	}
}
