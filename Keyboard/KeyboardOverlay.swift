//
//  KeyboardOverlay.swift
//  KeyboardExperiment
//
//  Created by Park Seongheon on 6/2/24.
//

import SwiftUI

struct KeyboardOverlay: View {
    let character: String

    var body: some View {
        GeometryReader { geometry in
            let height: CGFloat = geometry.size.height
            let width: CGFloat = geometry.size.width
            
            ZStack(alignment: .bottom) {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 10))
                    path.addQuadCurve(to: CGPoint(x: 10, y: 0), control: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: width + 10, y: 0))
                    path.addQuadCurve(to: CGPoint(x: width + 20, y: 10), control: CGPoint(x: width + 20, y: 0))
                    path.addRect(CGRect(x: 0, y: 10, width: width + 20, height: height - 10))

                    path.move(to: CGPoint(x: 0, y: height))
                    path.addCurve(to: CGPoint(x: 10, y: height + 26), control1: CGPoint(x: 0, y: height + 14), control2: CGPoint(x: 10, y: height + 17))
                    path.addLine(to: CGPoint(x: width + 10, y: height + 26))
                    path.addCurve(to: CGPoint(x: width + 20, y: height), control1: CGPoint(x: width + 10, y: height + 17), control2: CGPoint(x: width + 20, y: height + 14))
                }
                .foregroundStyle(.white)
                .shadow(radius: 4)
                .frame(width: width + 20, height: height + 60)
                .overlay {
                    Text(character)
                        .font(.title)
                        .padding(.bottom, 40)
                }
                .offset(x: -10, y: -26)
            }
        }
    }
}

#Preview {
    KeyboardOverlay(character: "ㅁ")
        .frame(width: 50, height: 40)
}
