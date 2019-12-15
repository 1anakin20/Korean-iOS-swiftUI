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
	var body: some View {
			// False because the label will show a number and the input will be in Korean
			SinoPlayView(koreanOrNumber: false)
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		SinoNumberToKoreanPlay()
	}
}
