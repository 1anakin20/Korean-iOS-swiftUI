//
//  SinoNumbers.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct SinoNumbers: View {
	var body: some View {
		NavigationView {
			VStack(spacing: 30) {
				longNavigationLink(backgroundColor: .purple, text: "Korean to English")
			}
		}
	}
}

struct SinoNumbers_Previews: PreviewProvider {
	static var previews: some View {
		SinoNumbers()
	}
}
