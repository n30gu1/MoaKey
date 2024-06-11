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
    let onTapDown: () -> Void
    let onTapUp: () -> Void
    let onLongTapDown: () -> Void
    let onLongTapUp: () -> Void

    let label: String

    init(
        automata: Automata,
        onTapDown: (@escaping () -> Void) = {},
        onTapUp: (@escaping () -> Void) = {},
        onLongTapDown: (@escaping () -> Void) = {},
        onLongTapUp: (@escaping () -> Void) = {},
        label: String
    ) {
        self.automata = automata
        self.onTapDown = onTapDown
        self.onTapUp = onTapUp
        self.onLongTapDown = onLongTapDown
        self.onLongTapUp = onLongTapUp
        self.label = label
    }

    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 172/255, green: 177/255, blue: 185/255)) // TODO: Change color to system
            .cornerRadius(CORNER_RADIUS)
            .shadow(radius: 0.4, x: 0, y: 1)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        isPressed = true
                        onTapDown()
                    }
                    .onEnded { _ in
                        isPressed = false
                        onTapUp()
                    }
            )
            .gesture(
                LongPressGesture(minimumDuration: 1.0)
                    .onChanged { _ in
                        onLongTapDown()
                    }
                    .onEnded { _ in
                        onLongTapUp()
                    }
            )
            .padding(4)
    }
}
