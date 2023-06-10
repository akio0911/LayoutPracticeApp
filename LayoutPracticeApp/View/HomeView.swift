//
//  HomeView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct HomeView: View {
    @Binding var path: [ScreenNames]

    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center, spacing: geometry.size.height * 0.6) {
                Text("準備ができましたら、\n\"Start Test\"をタップしてください。")
                    .font(.largeTitle)
                Button {
                    path.append(ScreenNames.preparation)
                } label: {
                    Text("Start Test")
                        .font(.largeTitle)
                        .modifier(
                            StartButtonModifier(
                                screenWidth: geometry.size.width,
                                screenHeight: geometry.size.height))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

private struct Preview: View {
    @State var path = [ScreenNames.home]
    var body: some View {
        HomeView(path: $path)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
