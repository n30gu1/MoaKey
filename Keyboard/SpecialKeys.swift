//
//  SpecialKeys.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/8/24.
//

import SwiftUI

struct SpecialKeys: View {
    @State private var isPressed = false
    @ObservedObject var automata: Automata

    let label: String

    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // TODO: Change color to system
            .cornerRadius(6)
            .shadow(radius: 0.4, x: 0, y: 1)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isPressed = true
                    }
                    .onEnded { _ in
                        isPressed = false
                    }
            )
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onChanged { _ in
                    }
                    .onEnded { _ in
                    }
            )
    }
}
