/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0.0, green: 0.0, blue: 0.0)
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {

    if (verticalSizeClass == .regular && horizontalSizeClass == .compact) {
        // horizontal (portrait) orientation
        VStack {
          Text("Color Picker")
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
            .bold()
          RoundedRectangle(cornerRadius: 0)
            .foregroundColor(foregroundColor)
            .border(.black)
            .overlay(
              RoundedRectangle(cornerRadius: 0)
                .stroke(Color.brown, lineWidth: Constants.General.colorRectBoarderWidth)
            )
            .padding(.bottom)
          VStack {
            ColorSlider(color: $redColor, colorName: "Red", colorTint: Color(.systemRed))
          }
          VStack {
            ColorSlider(color: $greenColor, colorName: "Green", colorTint: Color(.systemGreen))
          }
          VStack {
            ColorSlider(color: $blueColor, colorName: "Blue", colorTint: Color(.systemBlue))
          }
          Button {
            foregroundColor = Color(red: redColor / Constants.General.colorMaxValue, green: greenColor / Constants.General.colorMaxValue, blue: blueColor / Constants.General.colorMaxValue)
          } label: {
            ButtonText(text: "Set Color", color: "BlueButtonColor")
          }
        }
      .padding(Constants.General.contentViewPadding)
      .background(Color("BackgroundColor"))

    } else {
      // landscape orientation
        HStack {
          VStack {
            Text("Color Picker")
              .font(.largeTitle)
              .foregroundColor(Color("TextColor"))
              .bold()
            RoundedRectangle(cornerRadius: 0)
              .foregroundColor(foregroundColor)
              .border(.black)
              .overlay(
                RoundedRectangle(cornerRadius: 0)
                  .stroke(Color.brown, lineWidth: Constants.General.colorRectBoarderWidth)
              )
              .padding(.bottom)
          }
          VStack {
            
            HStack {
              ColorSlider(color: $redColor, colorName: "Red", colorTint: Color(.systemRed))
            }
            HStack {
              ColorSlider(color: $greenColor, colorName: "Green", colorTint: Color(.systemGreen))
            }
            HStack {
              ColorSlider(color: $blueColor, colorName: "Blue", colorTint: Color(.systemBlue))
            }
            Button {
              foregroundColor = Color(red: redColor / Constants.General.colorMaxValue, green: greenColor / Constants.General.colorMaxValue, blue: blueColor / Constants.General.colorMaxValue)
            } label: {
              ButtonText(text: "Set Color", color: "BlueButtonColor")
            }
          }
          .padding(Constants.General.contentViewPadding)
          .padding(.bottom)
        }
        .padding(Constants.General.contentViewPadding)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
  }
}
