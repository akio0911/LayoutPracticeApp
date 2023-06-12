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
                    Text("Simple Math Test App")
                        .font(.title)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: screenHeight * 0.06) {
                            Text("Login ID")
                                .frame(width: screenWidth * 0.2)
                            Text("Password")
                                .frame(width: screenWidth * 0.2)
                        }
                        VStack(alignment: .trailing, spacing: screenHeight * 0.01) {
                            TextField("", text: $subjectID)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: screenWidth * 0.7)
                                .padding()
                            SecureField("", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: screenWidth * 0.7)
                                .padding()
                        }
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Button {
                            path.append(ScreenNames.home)
                        } label: {
                            Text("Login")
                                .padding()
                                .frame(width: screenWidth * 0.4, height: screenWidth * 0.1)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .clipShape(Capsule())
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
