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

    init(automata: Automata, nextKeyboardButton: @escaping () -> NextKeyboardButton) {
        self.automata = automata
        nextKeyboard = nextKeyboardButton()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(firstRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
            }
            HStack(spacing: 0) {
                ForEach(secondRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
            }
            HStack(spacing: 0) {
                ForEach(thirdRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
            }
            HStack(spacing: 0) {
                ForEach(fourthRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
                SpecialKeys(automata: automata, onTapUp: {
                    self.automata.backspace()
                }, label: "⌫")
            }
            HStack(spacing: 0) {
                SpecialKeys(automata: automata, label: "123")
                    .frame(width: 47)
                nextKeyboard
                    .background(Color(red: 172/255, green: 177/255, blue: 185/255))
                    .cornerRadius(CORNER_RADIUS)
                    .shadow(radius: 0.4, x: 0, y: 1)
                    .padding(4)
                    .frame(width: 50)
                SpecialKeys(automata: automata, onTapUp: {
                    self.automata.space()
                }, label: "스페이스")
                SpecialKeys(automata: automata, onTapUp: {
                    
                }, label: "⏎")
                    .frame(width: 100)
            }
        }
    }
}

// #Preview {
//    KeyboardView()
// }
