//
//  EndView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct EndView: View {
    @Binding var path: [ScreenNames]
    @State private var selectedAnswers: [String?] = Array(repeating: nil, count: 10)

    var body: some View {
        VStack (spacing: 0) {
            ResultView(correctAnswers: calculateCorrectAnswers(), totalQuestions: selectedAnswers.count)
            Button {
                path.append(ScreenNames.home)
            } label: {
                Text("back to Home")
            }
        }
    }
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
                .font(.title)
                .padding()

            Text("Correct Answers: \(correctAnswers)")
                .font(.headline)
                .padding()

            Text("Incorrect Answers: \(totalQuestions - correctAnswers)")
                .font(.headline)
                .padding()

            Spacer()
        }
    }
}


private struct Preview: View {
    @State var path = [ScreenNames.end]
    var body: some View {
        EndView(path: $path)
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
