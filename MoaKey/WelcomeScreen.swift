//
//  WelcomeScreen.swift
//  MoaKey
//
//  Created by Park Seongheon on 6/5/24.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var opacity = 0.0
    @State private var buttonOffset = 500.0
    var body: some View {
        ZStack {
            VStack {
                Text("MoaKey")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                Text("환영합니다!")
                    .font(.title2)
            }
            VStack {
                Spacer()
                Button {} label: {
                    Text("시작하기")
                        .foregroundColor(.primary)
                        .colorInvert()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.accent)
                        .cornerRadius(16.0)
                }
                .buttonStyle(.glassProminent)
                .offset(y: buttonOffset)
                .padding(.horizontal)
            }
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.smooth) {
                self.opacity = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.bouncy) {
                    self.buttonOffset = 0.0
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
