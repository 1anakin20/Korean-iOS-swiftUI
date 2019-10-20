//
//  SubViews.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// This contains configurable views to be reused in the code

import SwiftUI

struct squareNavigationLink: View {
	var backgroundColor: Color?
	var text: String?
	var destination: AnyView?
	var body: some View {
		NavigationLink(destination: destination) {
			Text(text ?? "Button")
				.foregroundColor(.black)
				.frame(width: 200, height: 100)
				.background(backgroundColor ?? .blue)
				.cornerRadius(10)
				.shadow(radius: 3, x: 0, y: 3)
		}
	}
}

struct longNavigationLink: View {
	var backgroundColor: Color?
	var text: String?
	var destination: AnyView?
	var body: some View {
		NavigationLink(destination: destination) {
			Text(text ?? "Button")
				.foregroundColor(.black)
				.frame(width: 350, height: 70)
				.background(backgroundColor ?? .purple)
				.cornerRadius(10)
				.shadow(radius: 3, x: 0, y: 3)
		}
	}
}

struct SubViews_Previews: PreviewProvider {
	static var previews: some View {
		longNavigationLink()
	}
}
