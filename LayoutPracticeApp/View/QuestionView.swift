//
//  QuestionView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct QuestionView: View {
    @Binding var path: [ScreenNames]

    // Math Questions
    let questions: [String] = [
        "1 + 1 = ?",
        "2 * 3 = ?",
        "4 - 2 = ?",
        // ... Add more questions here
    ]

    let options: [[String]] = [
        ["2", "3", "4", "5"],
        ["2", "3", "6", "9"],
        ["1", "2", "3", "4"],
        // ... Add options for each question here
    ]

    @State private var selectedAnswers: [String?] = Array(repeating: nil, count: 10)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("■問題　１０問")
                    .font(.largeTitle)
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
                    // Perform any action after submitting answers, e.g., show results
                    let correctAnswers = selectedAnswers.compactMap { $0 }.filter { $0 == "2" }.count
                    let incorrectAnswers = questions.count - correctAnswers
                    let resultText = "Correct Answers: \(correctAnswers)\nIncorrect Answers: \(incorrectAnswers)"

                    // Show the result in the next view or perform any other action
                    // For demonstration, printing the result
                    print(resultText)
                    // Go to next page
                    path.append(ScreenNames.end)
                }) {
                    Text("Submit")
                        .modifier(
                            NextButtonModifier(
                                screenWidth: geometry.size.width,
                                screenHeight: geometry.size.height))
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }

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
            self.callback(self.id, self.groupId)
        }) {
            HStack {
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
    var body: some View {
        QuestionView(path: $path)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
