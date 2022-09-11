# Korean-iOS
Completion date: Thursday, January 9, 2020 around 8:00 PM

# Description
This is the same as korean-iOS, but it will be remade using the swiftUI framework
This iOS app is a personal project to learn about the SwiftUI framework.
The goal of this application is to learn Korean trought random questions.

### Numbers
The Korean number system is separated in two system:
* Native
* Sino-Korean

In both of those categories the user will be presented with random number in Korean or Numeral and it needs to input the correct answer in Numeral or Korean respectively.

### Vocabulary
The user will be presented a random word in Korean or English and it needs to tap the correct answer from 3 buttons. If there is an avaible sound for the word a speaker button will show.

### Dictionary
There are all the Korean words with their english meaning that will appear in the Vocabulary category. If there is a sound disponible there will be a speaker button that will appear.

## Getting Started

1. Clone this github repo
1. Open korean-iOS-swiftUI.xcodeproj
1. Select Simulator or physical device to build for
	1. If you run it on a physical device you need to make sure sign it with your developper account
1. Click build

### Prerequisites

1. Xcode https://apps.apple.com/ca/app/xcode/id497799835?mt=12
1. An iOS device or simulator running iOS 13.3 (note: this application may not work with future versions of iOS)

## Built With

* Xcode Version 11.3 (11C29)
* macOS Catalina Version 10.15.2

## Tested with
* Simulator Iphone 11

## Bugs
This application has known bugs, I will not document them thoroughly but here is a sumary:
* Cannot reenter view after going back such as navigation links in the Play menu
* The audio playback crashes sometimes and takes some time to play when the button is clicked (hint: maybe it has something to do with threads?)
* The Korean native numbers don't go above 100, if there is a random generate number above 100 because the user set the options to something larger than 100
* Cannot close the option view in macOS
