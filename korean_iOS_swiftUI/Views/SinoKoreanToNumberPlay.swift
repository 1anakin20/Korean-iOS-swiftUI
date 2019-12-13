//
//  SinoKoreanToNumberPlay.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-05.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct SinoKoreanToNumberPlay: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
	
	var body: some View {
		playViewReusable(isImageHidden: $isImageHidden,
						 displayedImageName: $displayedImageName,
						 numberLabel: $number,
						 textColor: $textColor,
						 inputAnswer: $inputAnswer,
						 acceptButtonView: $acceptButtonView,
						 continueState: $continueState,
						 // True because the label will be in Korean
						 koreanOrNumber: true)
	}
}

struct SinoKoreanToNumberPlay_Previews: PreviewProvider {
	static var previews: some View {
		SinoKoreanToNumberPlay()
	}
}
