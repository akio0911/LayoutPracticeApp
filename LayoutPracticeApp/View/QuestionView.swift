//
//  QuestionView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct QuestionView: View {
    @Binding var path: [ScreenNames]
    @Binding var screenWidth: CGFloat
    @Binding var screenHeight: CGFloat

    // Math Questions
    let questions: [String] = [
        "1 + 1 = ?",
        "2 * 3 = ?",
        "4 - 2 = ?",
        "1 + 1 = ?",
        "2 * 3 = ?",
        "4 - 2 = ?",
        "1 + 1 = ?",
        "2 * 3 = ?",
        "4 - 2 = ?",
        "1 + 1 = ?",
    ]

    let options: [[String]] = [
        ["2", "3", "4", "5"],
        ["2", "3", "6", "9"],
        ["1", "2", "3", "4"],
        ["2", "3", "4", "5"],
        ["2", "3", "6", "9"],
        ["1", "2", "3", "4"],
        ["2", "3", "4", "5"],
        ["2", "3", "6", "9"],
        ["1", "2", "3", "4"],
        ["2", "3", "4", "5"]
    ]

    // TODO: 動作・仕組みを理解する
    @State private var selectedAnswers: [String?] = Array(repeating: nil, count: 10)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("計算問題")
                    .modifier(HeadlineFontModifier())
                    .padding()

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<questions.count, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 100) {
                                VStack (spacing: 20) {
                                    Text(questions[index])
                                        .font(.title)
                                    HStack(spacing: 40) {
                                        ForEach(0..<options[index].count, id: \.self) { optionIndex in
                                            RadioButton(
                                                id: optionIndex,
                                                groupId: index,
                                                label: options[index][optionIndex],
                                                isSelected: self.selectedAnswers[index] == options[index][optionIndex],
                                                callback: radioButtonSelected
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }

                Spacer()

                Button(action: {
                    // TODO: 動作・仕組みを理解する
                    let correctAnswers = selectedAnswers.compactMap { $0 }.filter { $0 == "2" }.count
                    let incorrectAnswers = questions.count - correctAnswers
                    let resultText = "Correct Answers: \(correctAnswers)\nIncorrect Answers: \(incorrectAnswers)"

                    path.append(ScreenNames.end)
                }) {
                    Text("Submit")
                        .modifier(
                            NextButtonModifier(
                                screenWidth: screenWidth,
                                screenHeight: screenHeight)
                        )
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }

    // TODO: 動作・仕組みを理解する
    private func radioButtonSelected(id: Int, groupId: Int) {
        selectedAnswers[groupId] = options[groupId][id]
    }
}


struct RadioButton: View {
    let id: Int
    let groupId: Int
    let label: String
    let isSelected: Bool
    let callback: (Int, Int) -> Void

    var body: some View {
        Button(action: {
            // TODO: 動作・仕組みを理解する
            self.callback(self.id, self.groupId)
        }) {
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)

                Text(label)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .foregroundColor(.primary)
        .padding(.vertical, 5)
    }
}


private struct Preview: View {
    @State var path = [ScreenNames.question]
    // TODO: GeometryReaderでスクリーンの大きさを使用したい。
    @State var screenWidth: CGFloat = 800
    @State var screenHeight: CGFloat = 1000
    
    var body: some View {
        QuestionView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
