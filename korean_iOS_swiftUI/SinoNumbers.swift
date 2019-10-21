//
//  SinoNumbers.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct SinoNumbers: View {
	@State private var showOptions: Bool = false
	var body: some View {
		VStack(spacing: 30) {
			longNavigationLink(backgroundColor: .purple, text: "Korean to English")
		}
		.navigationBarItems(trailing:
			Button("Options") {
				// Present view options
				self.showOptions = true
			}.sheet(isPresented: self.$showOptions) {
				options()
			}
		)
	}
}

struct options: View {
	@State var max: String = "100"
	@State var min: String = "1"
	var body: some View {
		VStack(spacing: 50) {
			HStack {
				Text("Max")
				Spacer()
				TextField("Max", text: $max)
					.frame(width: 55)
			}
			HStack {
				Text("Min")
				Spacer()
				TextField("Min", text: $min)
					.frame(width: 55)
				
			}
		}
		.multilineTextAlignment(.center)
		.keyboardType(.numberPad)
		.padding()
		.offset(y: -170)
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		options()
	}
}
