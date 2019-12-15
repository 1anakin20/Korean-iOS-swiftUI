//
//  NativePlayMenu.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// Native menu leading to the play and option views
struct NativePlayMenu: View {
	@State private var showOptions: Bool = false
	var body: some View {
		VStack(spacing: 30) {
			// Destination has koreanOrNumber false for the time being, need to be changed
			longNavigationLink(backgroundColor: .blue, text: "Number to Korean", destination: AnyView(nativeNumberToKoreanPlay()))
			longNavigationLink(backgroundColor: .blue, text: "Korean to number", destination: AnyView(NativeKoreanToNumberPlay()))
		}
		.navigationBarItems(trailing:
			Button("Options") {
				// Present view options
				self.showOptions = true
			}.sheet(isPresented: self.$showOptions) {
				OptionsNumbers(sinoOrNative: false)
			}
		)
	}
}

struct NativePlayMenu_Previews: PreviewProvider {
	static var previews: some View {
		NativePlayMenu()
	}
}
