//
//  SubViews.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

struct squareButton: View {
	var backgroundColor: Color?
	var text: String?
	var action: (() -> Void)?
	var body: some View {
		Button(action: action ?? {}) {
			Text(text ?? "Button")
				.foregroundColor(.black)
				.frame(width: 200, height: 100)
				.background(backgroundColor ?? .blue)
				.cornerRadius(10)
				.shadow(radius: 3, x: 0, y: 3)
		}
	}
}

struct SubViews_Previews: PreviewProvider {
    static var previews: some View {
		squareButton()
    }
}
