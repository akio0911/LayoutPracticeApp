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

    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack(path: $path) {
                VStack(alignment: .center, spacing: 100) {
                    Text("Simple Math Test App")
                        .font(.title)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 40) {
                            Text("Login ID")
                                .frame(height: 20)
                            Text("Password")
                                .frame(height: 20)
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            TextField("", text: $subjectID)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            SecureField("", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Button {
                            path.append(ScreenNames.home)
                        } label: {
                            Text("Login")
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .clipShape(Capsule())
                        }
                    }
                }
                .navigationDestination(for: ScreenNames.self) { screenName in
                    switch screenName {
                    case .home:
                        HomeView(path: $path)
                    case .preparation:
                        PreparationView(path: $path)
                    case .question:
                        QuestionView(path: $path)
                            .navigationBarBackButtonHidden()
                    case .end:
                        EndView(path: $path)
                            .navigationBarBackButtonHidden()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
