//
//  ContentView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-16.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
/// This view will contain the TabView, it's the root view

import SwiftUI

struct ContentView: View {
	@State private var selection = 0
	
	var body: some View {
		TabView(selection: $selection) {
			playMenu()
				.tabItem {
					VStack {
						Image(systemName: "play.fill")
							.foregroundColor(.green)
						Text("Play")
					}
			}
			.tag(0)
			DictionaryView()
				.tabItem {
					VStack {
						Image("second")
						Text("Second")
					}
			}
			.tag(1)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
