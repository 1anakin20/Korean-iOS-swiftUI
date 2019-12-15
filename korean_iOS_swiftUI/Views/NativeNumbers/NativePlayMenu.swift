//
//  NativePlayMenu.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct NativePlayMenu: View {
    var body: some View {
		// Destination has koreanOrNumber false for the time being, need to be changed
		longNavigationLink(backgroundColor: .blue, text: "Number to Korean", destination: AnyView(nativePlayView(koreanOrNumber: false)))
    }
}

struct NativePlayMenu_Previews: PreviewProvider {
    static var previews: some View {
        NativePlayMenu()
    }
}
