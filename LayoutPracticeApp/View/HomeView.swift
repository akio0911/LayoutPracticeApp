//
//  HomeView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct HomeView: View {
    @Binding var path: [ScreenNames]
    @Binding var screenWidth: CGFloat
    @Binding var screenHeight: CGFloat

    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center, spacing: screenHeight * 0.6) {
                Text("準備ができましたら、\n\"Start Test\"をタップしてください。")
                    .font(.largeTitle)
                Button {
                    path.append(ScreenNames.preparation)
                } label: {
                    Text("Start Test")
                        .font(.largeTitle)
                        .modifier(
                            StartButtonModifier(
                                screenWidth: screenWidth,
                                screenHeight: screenHeight))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private struct Preview: View {
    @State var path = [ScreenNames.home]
    @State var screenWidth: CGFloat = 800
    @State var screenHeight: CGFloat = 1000

    var body: some View {
        HomeView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
