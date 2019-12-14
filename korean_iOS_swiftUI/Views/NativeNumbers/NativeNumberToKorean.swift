//
//  NumberToKorean.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct NativeNumberToKorean: View {
	@State private var inputAnswer: String = ""
	@State private var number: String = ""
	@State private var acceptButtonView: AnyView = AnyView(acceptButton())
	@State private var continueState: Bool = false
	@State private var textColor: Color = .black
	@State private var isImageHidden: Bool = true
	@State private var displayedImageName: String = "grandma1"
	
	
    var body: some View {
        generalPlayView(isImageHidden: $isImageHidden,
						displayedImageName: $displayedImageName,
						numberLabel: $number,
						textColor: $textColor,
						inputAnswer: $inputAnswer,
						acceptButtonView: $acceptButtonView,
						koreanOrNumber: false)
    }
}

struct NumberToKorean_Previews: PreviewProvider {
    static var previews: some View {
        NativeNumberToKorean()
    }
}
