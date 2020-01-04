//
//  nativeNumberToKoreanPlay.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-14.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This view will show numeral numbers and the user will write them in the native Korean system
struct nativeNumberToKoreanPlay: View {
    var body: some View {
        nativePlayView(koreanOrNumber: false)
    }
}

struct nativeNumberToKoreanPlay_Previews: PreviewProvider {
    static var previews: some View {
        nativeNumberToKoreanPlay()
    }
}
