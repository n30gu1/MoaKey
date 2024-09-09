//
//  KeyboardView.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/7/24.
//

import SwiftUI

let firstRow = ["ㅃ", "ㅉ", "ㄸ", "ㄲ", "ㅆ"]
let secondRow = ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ"]
let thirdRow = ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ"]
let fourthRow = ["ㅋ", "ㅌ", "ㅊ", "ㅍ"]

struct KeyboardView<NextKeyboardButton: View>: View {
    @ObservedObject var automata: Automata
    @ViewBuilder var nextKeyboard: NextKeyboardButton
    
    @State var keyboardMode: KeyboardMode = .hangul
    
    init(automata: Automata, nextKeyboardButton: @escaping () -> NextKeyboardButton) {
        self.automata = automata
        nextKeyboard = nextKeyboardButton()
    }
    
    var body: some View {
        switch keyboardMode {
        case .hangul:
            hangulView()
                .padding(.horizontal, 0.8)
                .padding(.bottom, 2)
        case .specialCharacters:
            specialCharactersView()
        }
    }
}

// #Preview {
//    KeyboardView()
// }

struct Key: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(CORNER_RADIUS)
            .shadow(radius: 0.4, x: 0, y: 1)
            .padding(3)
    }
}

extension View {
    func key() -> some View {
        modifier(Key())
    }
}
