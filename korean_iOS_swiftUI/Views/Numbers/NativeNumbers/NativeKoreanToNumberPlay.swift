//
//  NativeKoreanToNumberPlay.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-14.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This view will show Native Korean numbers and the user will write them in numerals
struct NativeKoreanToNumberPlay: View {
    var body: some View {
        nativePlayView(koreanOrNumber: true)
    }
}

struct NativeKoreanToNumberPlay_Previews: PreviewProvider {
    static var previews: some View {
        NativeKoreanToNumberPlay()
    }
}
