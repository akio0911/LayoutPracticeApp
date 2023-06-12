//
//  ContentView.swift
//  LayoutPracticeApp
//
//  Created by Ryuga on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    @State var path: [ScreenNames] = []
    @State private var subjectID = ""
    @State private var password = ""
    @State var screenWidth: CGFloat = 0
    @State var screenHeight: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $path) {
                VStack(alignment: .center, spacing: screenHeight * 0.2) {
                    Text("数学力診断アプリ")
                        .modifier(TitleFontModifier())
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: screenHeight * 0.04) {
                            Text("Login ID")
                                .modifier(MainFontModifier())
                                .frame(width: screenWidth * 0.2)
                            Text("Password")
                                .modifier(MainFontModifier())
                                .frame(width: screenWidth * 0.2)
                        }
                        VStack(alignment: .trailing, spacing: screenHeight * 0.01) {
                            TextField("", text: $subjectID)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: screenWidth * 0.7)
                                .modifier(MainFontModifier())
                                .padding()
                            SecureField("", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: screenWidth * 0.7)
                                .modifier(MainFontModifier())
                                .padding()
                        }
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Button {
                            path.append(ScreenNames.home)
                        } label: {
                            Text("Login")
                                .modifier(
                                    NextButtonModifier(
                                        screenWidth: screenWidth,
                                        screenHeight: screenHeight)
                                )
                        }
                    }
                }
                .navigationDestination(for: ScreenNames.self) { screenName in
                    switch screenName {
                    case .home:
                        HomeView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
                    case .preparation:
                        PreparationView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
                    case .question:
                        QuestionView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
                            .navigationBarBackButtonHidden()
                    case .end:
                        EndView(path: $path, screenWidth: $screenWidth, screenHeight: $screenHeight)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
            .onAppear {
                screenWidth = geometry.size.width
                screenHeight = geometry.size.height

                // GlobalのSCREEN_SCALEをここで定義
                // 対応端末
                // --iPad--
                // iPad Pro 12.9 inch(6gen) 2048 * 2732 (1024/1322)
                // iPad Air 10.9 inch(5gen) 1640 * 2360 (820/1136)
                // --iPhone--
                // iPhone 14 Pro Max 1290 * 2796 (430/839)
                // iPhone 14         1170 * 2532 (390/763) ←ここの高さ763を基準とする。SCREEN_SCALE = 1.0
                SCREEN_SCALE = screenHeight / 763
                print("SCREEN SCALE:\(SCREEN_SCALE)")

            }
            .onChange(of: geometry.size) { newSize in
                screenWidth = newSize.width
                screenHeight = newSize.height
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
