//
//  playMeny.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-12-13.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

/// This presents the navigation links for Korean to english and english to korean, it also shows an option button in the navigation bar to the option view
struct SinoNumberToKoreanMenu: View {
	@State private var showOptions: Bool = false
	var body: some View {
		VStack(spacing: 30) {
			longNavigationLink(backgroundColor: .purple, text: "Number to Korean", destination: AnyView(SinoNumberToKoreanPlay()))
			longNavigationLink(backgroundColor: .purple, text: "Korean to number", destination: AnyView(SinoKoreanToNumberPlay()))
		}
		.navigationBarItems(trailing:
			Button("Options") {
				// Present view options
				self.showOptions = true
			}.sheet(isPresented: self.$showOptions) {
				OptionsNumbers(sinoOrNative: true)
			}
		)
	}
}

struct playMeny_Previews: PreviewProvider {
	static var previews: some View {
		SinoNumberToKoreanMenu()
	}
}
