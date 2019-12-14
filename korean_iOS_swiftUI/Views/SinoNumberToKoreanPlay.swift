//
//  SinoNumbers.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This view will present numbers and the user will write them in Korean
struct SinoNumberToKoreanPlay: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
	
	var body: some View {
		VStack {
			playViewReusable(isImageHidden: $isImageHidden,
							 displayedImageName: $displayedImageName,
							 numberLabel: $number,
							 textColor: $textColor,
							 inputAnswer: $inputAnswer,
							 acceptButtonView: $acceptButtonView,
							 continueState: $continueState,
							 // False because the label will show a number and the input will be in Korean
							 koreanOrNumber: false)
		}
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		SinoNumberToKoreanPlay()
	}
}
