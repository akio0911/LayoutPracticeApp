//
//  CustomModifiers.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI


struct TitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25 * SCREEN_SCALE))
    }
}

struct HeadlineFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20 * SCREEN_SCALE))
    }
}

struct MainFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12 * SCREEN_SCALE))
    }
}




/// HomeViewでの問題画面へ移るStartボタンのためのModifier
struct StartButtonModifier: ViewModifier {
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.6, height: screenHeight * 0.1, alignment: .center)
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(10)
            .padding()
    }
}

struct NextButtonModifier: ViewModifier {
    let screenWidth: CGFloat
    let screenHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.3, height: screenHeight * 0.06, alignment: .center)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding()
    }
}
