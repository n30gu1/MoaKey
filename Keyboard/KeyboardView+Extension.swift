//
//  KeyboardView+Extension.swift
//  Keyboard
//
//  Created by Park Seongheon on 7/8/24.
//

import SwiftUI

extension KeyboardView {
    @ViewBuilder
    func hangulView() -> some View {
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
    
    
    func specialCharactersView() -> some View {
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
