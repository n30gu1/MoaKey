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
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
                ForEach(firstRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
            }
            HStack(spacing: 0) {
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
                ForEach(secondRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
                // TODO: add key repeat when long press
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
            }
            HStack(spacing: 0) {
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
                ForEach(thirdRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
            }
            HStack(spacing: 0) {
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 42)
                ForEach(fourthRow, id: \.self) { key in
                    KeyboardKey(character: key, automata: self.automata)
                }
                // backspace
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                })
                .key()
                .frame(width: 94)
                .padding(.leading, 10)
            }
            
            // MARK: Modifier Keys
            HStack(spacing: 0) {
                //                SpecialKeys(automata: automata, subview: {
                //                    Text("123")
                //                })
                //                    .frame(width: 47)
                nextKeyboard
                SpecialKeys(onTouchUp: {
                    self.automata.space()
                })
                .key()
                SpecialKeys(onTouchUp: {
                })
                .key()
                .frame(width: 100)
                //                SpecialKeys(automata: automata, onTapUp: {
                //                    self.automata.space()
                //                }, subview: {
                //                    Text("스페이스")
                //                })
                //                SpecialKeys(automata: automata, onTapUp: {
                //
                //                }, subview: {
                //                    Text("⏎")
                //                })
                //                    .frame(width: 100)
            }
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
            .padding(4)
    }
}

extension View {
    func key() -> some View {
        modifier(Key())
    }
}
