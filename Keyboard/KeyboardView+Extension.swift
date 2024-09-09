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
        VStack(spacing: 3) {
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
                // backspace
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                }, title: NSAttributedString(string: "⌫", attributes: [
                    .font: UIFont.systemFont(ofSize: 23)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(4)
                .frame(width: 68)
                .padding(.leading, 10)
            }
            
            // MARK: Modifier Keys
            HStack(spacing: 0) {
                SpecialKeys(onTouchDown: {
                    self.keyboardMode = .specialCharacters
                }, title: NSAttributedString(string: "123", attributes: [
                    .font: UIFont.systemFont(ofSize: 16)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                .frame(width: 49)
                nextKeyboard
                SpecialKeys(onTouchUp: {
                    self.automata.space()
                }, color: .white, title: NSAttributedString(string: "스페이스", attributes: [
                    .font: UIFont.systemFont(ofSize: 16)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                SpecialKeys(onTouchUp: {
                }, title: NSAttributedString(string: "⏎", attributes: [
                    .font: UIFont.systemFont(ofSize: 24)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                .frame(width: 100)
            }
        }
    }
    
    
    func specialCharactersView() -> some View {
        VStack(spacing: 3) {
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
                // backspace
                SpecialKeys(onTouchUp: {
                    self.automata.backspace()
                }, title: NSAttributedString(string: "⌫", attributes: [
                    .font: UIFont.systemFont(ofSize: 23)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(4)
                .frame(width: 68)
                .padding(.leading, 10)
            }
            
            // MARK: Modifier Keys
            HStack(spacing: 0) {
                SpecialKeys(onTouchDown: {
                    self.keyboardMode = .hangul
                }, title: NSAttributedString(string: "한글", attributes: [
                    .font: UIFont.systemFont(ofSize: 16)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                .frame(width: 49)
                nextKeyboard
                SpecialKeys(onTouchUp: {
                    self.automata.space()
                }, color: .white, title: NSAttributedString(string: "스페이스", attributes: [
                    .font: UIFont.systemFont(ofSize: 16)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                SpecialKeys(onTouchUp: {
                }, title: NSAttributedString(string: "⏎", attributes: [
                    .font: UIFont.systemFont(ofSize: 24)
                ]))
                .cornerRadius(CORNER_RADIUS)
                .shadow(radius: 0.4, x: 0, y: 1)
                .padding(2.5)
                .frame(width: 100)
            }
        }
    }
}
