//
//  PreparationView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct PreparationView: View {
    @Binding var path: [ScreenNames]
    @Binding var screenWidth: CGFloat
    @Binding var screenHeight: CGFloat

    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: screenHeight * 0.05) {
                VStack (spacing: 0) {
                    Text("この数学力診断アプリでは、")
                        .font(.title)
                    Text("計算問題を10問、解いてもらいます。")
                        .font(.title)
                }
                Image("note")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.6)

                Button {
                    path.append(ScreenNames.question)
                } label: {
                    Text("next")
                        .font(.title)
                        .modifier(
                            NextButtonModifier(
                                screenWidth: screenWidth,
                                screenHeight: screenHeight))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private struct Preview: View {
    @State var path = [ScreenNames.preparation]
    @State var screenWidth: CGFloat = 800
    @State var screenHeight: CGFloat = 1000
    
    var body: some View {
        PreparationView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
