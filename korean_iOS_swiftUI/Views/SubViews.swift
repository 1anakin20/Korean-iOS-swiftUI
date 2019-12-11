//
//  SubViews.swift
//  korean_iOS_swiftUI
//
//  Created by Tomas Daniel Nieto on 2019-10-17.
//  Copyright © 2019 Tomas Daniel Nieto. All rights reserved.
//
// This contains configurable views to be reused in the code

import SwiftUI


/// A square navigation link, note that the destination parameter requires of type "AnyView". So cast the view to "AnyView". AnyView(view()).
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

/// This is a rectangular navigation link, note that the destination parameter requires of type "AnyView". So cast the view to "AnyView". AnyView(view()).
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

/// This view shows a black button with the tittle accept
/// This view will be shown for the user to accept the input
struct acceptButton: View {
	// Void function parameter
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Accept")
				.foregroundColor(.black)
		}
	}
}

/// This view shows a green button with the text Continue
/// This view will be shown if the answer is good
struct goodAnswerButton: View {
	// Void function parameter
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Continue")
				.foregroundColor(.green)
		}
	}
}

/// This view shows a red button with the text Continue
/// This view will be shown if the answer is wrong
struct wrongAnswerButton: View {
	var action: (() -> ()) = {}
	var body: some View {
		Button(action: action) {
			Text("Continue")
				.foregroundColor(.red)
		}
	}
}

/// Subview of image that will change depening if the answer is correct or wrong
/// In Sino Number to Korean
struct numbersImage: View {
	var imageName: String
	
	var body: some View {
		Image(imageName)
			.resizable()
			.scaledToFit()
			.frame(width: 200, height: 200)
	}
}

struct playViewReusable: View {
	@Binding var isImageHidden: Bool
	@Binding var displayedImageName: String
	@Binding var numberLabel: String
	@Binding var textColor: Color
	@Binding var inputAnswer: String
	@Binding var acceptButtonView: AnyView
	
	var body: some View {
		VStack(spacing: 50) {
			if(isImageHidden) {
				numbersImage(imageName: displayedImageName).hidden()
			} else {
				numbersImage(imageName: displayedImageName)
			}
			//			labelNumber(numberLabel: numberLabel, textColor: textColor)
			Text(numberLabel)
				.padding()
				.foregroundColor(textColor)
			HStack {
				TextField("Answer", text: $inputAnswer)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.disableAutocorrection(true)
				acceptButtonView
			}
		}
		.position(x: 190, y: 100)
		.padding()
	}
}




struct SubViews_Previews: PreviewProvider {
	static var previews: some View {
		squareNavigationLink()
	}
}
