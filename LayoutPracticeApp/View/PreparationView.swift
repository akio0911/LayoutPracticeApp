//
//  PreparationView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct PreparationView: View {
    @Binding var path: [ScreenNames]

    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: geometry.size.height * 0.6) {
                VStack (spacing: 0) {
                    Text("この数学力診断アプリでは、")
                        .font(.title)
                    Text("計算問題を10問、解いてもらいます。")
                        .font(.title)
                }
                Button {
                    path.append(ScreenNames.question)
                } label: {
                    Text("next")
                        .font(.title)
                        .modifier(
                            NextButtonModifier(
                                screenWidth: geometry.size.width,
                                screenHeight: geometry.size.height))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private struct Preview: View {
    @State var path = [ScreenNames.preparation]
    var body: some View {
        PreparationView(path: $path)
    }
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
