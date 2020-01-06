//
//  extensionView.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2020-01-06.
//  Copyright © 2020 Tomas Daniel Nieto. All rights reserved.
//

import SwiftUI

extension View {
	/// Whether the view is hidden.
	/// - Parameter bool: Set to `true` to hide the view. Set to `false` to show the view.
	func isHidden(_ bool: Bool) -> some View {
		modifier(HiddenModifier(isHidden: bool))
	}
}


/// Creates a view modifier that can be applied, like so:
///
/// ```
/// Text("Hello World!")
///     .isHidden(true)
/// ```
///
/// Variables can be used in place so that the content can be changed dynamically.
private struct HiddenModifier: ViewModifier {
	
	fileprivate let isHidden: Bool
	
	fileprivate func body(content: Content) -> some View {
		Group {
			if isHidden {
				content.hidden()
			} else {
				content
			}
		}
	}
}
