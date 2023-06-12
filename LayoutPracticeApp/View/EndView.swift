//
//  EndView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct EndView: View {
    @Binding var path: [ScreenNames]
    @Binding var screenWidth: CGFloat
    @Binding var screenHeight: CGFloat
    // TODO: 動作・仕組みを理解する
    @State private var selectedAnswers: [String?] = Array(repeating: nil, count: 10)

    var body: some View {
        VStack (spacing: 0) {
            // TODO: 動作・仕組みを理解して、正答数を適切に表示させる
            ResultView(correctAnswers: calculateCorrectAnswers(), totalQuestions: selectedAnswers.count)
            Button {
                path = [ScreenNames.home]
                
            } label: {
                Text("Back Home")
                    .modifier(
                        NextButtonModifier(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight)
                    )
            }
        }
    }
    // TODO: 動作・仕組みを理解する
    private func calculateCorrectAnswers() -> Int {
        let correctAnswers = selectedAnswers.compactMap { $0 }.filter { $0 == "2" }.count
        return correctAnswers
    }
}


struct ResultView: View {
    let correctAnswers: Int
    let totalQuestions: Int

    var body: some View {
        VStack {
            Text("回答結果")
                .modifier(TitleFontModifier())
                .padding()

            Text("Correct Answers: \(correctAnswers)")
                .modifier(HeadlineFontModifier())
                .padding()

            Text("Incorrect Answers: \(totalQuestions - correctAnswers)")
                .modifier(HeadlineFontModifier())
                .padding()

            Spacer()
        }
    }
}


private struct Preview: View {
    @State var path = [ScreenNames.end]
    // TODO: GeometryReaderでスクリーンの大きさを使用したい。
    @State var screenWidth: CGFloat = 800
    @State var screenHeight: CGFloat = 1000

    var body: some View {
        EndView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
