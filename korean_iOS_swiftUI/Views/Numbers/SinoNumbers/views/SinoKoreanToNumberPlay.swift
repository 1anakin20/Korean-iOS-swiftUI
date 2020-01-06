//
//  SinoKoreanToNumberPlay.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-05.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This view will present numbers in Korean and the user will write them in numbers
struct SinoKoreanToNumberPlay: View {
	var body: some View {
		// True because the label will be in Korean and the input will be numbers
		SinoPlayView(koreanOrNumber: true)
	}
}

struct SinoKoreanToNumberPlay_Previews: PreviewProvider {
	static var previews: some View {
		SinoKoreanToNumberPlay()
	}
}
