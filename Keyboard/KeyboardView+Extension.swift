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
        GeometryReader { geometry in
            VStack(spacing: 10) {
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(firstRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(secondRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(thirdRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(fourthRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                    // backspace
                    SpecialKeys(onTouchUp: {
                        self.automata.backspace()
                    }, title: NSAttributedString(string: "⌫", attributes: [
                        .font: UIFont.systemFont(ofSize: 23)
                    ]))
                    //                .cornerRadius(CORNER_RADIUS)
                    //                .shadow(radius: 0.4, x: 0, y: 1)
                    //                .padding(4)
                    //                .frame(width: 68)
                    .padding(.leading, 10)
                    .key()
                }
                
                // MARK: Modifier Keys
                HStack(spacing: Calculator.getKeySpacing()) {
                    Group {
                        SpecialKeys(onTouchDown: {
                            self.keyboardMode = .specialCharacters
                        }, title: NSAttributedString(string: "123", attributes: [
                            .font: UIFont.systemFont(ofSize: 16)
                        ]))
//                        .cornerRadius(4)
//                        .shadow(radius: 0.2, x: 0, y: 1)
                        nextKeyboard
                    }
                    .frame(width: geometry.size.width * 0.112)
                    SpecialKeys(onTouchUp: {
                        self.automata.space()
                    }, title: NSAttributedString(string: "스페이스", attributes: [
                        .font: UIFont.systemFont(ofSize: 16)
                    ]))
//                    .cornerRadius(4)
//                    .shadow(radius: 0.2, x: 0, y: 1)
                    SpecialKeys(onTouchUp: {
                    }, title: NSAttributedString(string: "⏎", attributes: [
                        .font: UIFont.systemFont(ofSize: 24)
                    ]))
//                    .cornerRadius(4)
//                    .shadow(radius: 0.2, x: 0, y: 1)
                    .frame(width: geometry.size.width * 0.235)
                }
            }
            .padding(.horizontal, Calculator.getOuterPadding())
            .padding(.top, Calculator.getOuterPadding())
            .padding(.bottom, 2)
        }
    }
    
    
    func specialCharactersView() -> some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(firstRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(secondRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(thirdRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                }
                HStack(spacing: Calculator.getKeySpacing()) {
                    ForEach(fourthRow, id: \.self) { key in
                        KeyboardKey(character: key, automata: self.automata)
                    }
                    // backspace
                    SpecialKeys(onTouchUp: {
                        self.automata.backspace()
                    }, title: NSAttributedString(string: "⌫", attributes: [
                        .font: UIFont.systemFont(ofSize: 23)
                    ]))
                    //                .cornerRadius(CORNER_RADIUS)
                    //                .shadow(radius: 0.4, x: 0, y: 1)
                    //                .padding(4)
                    //                .frame(width: 68)
                    .padding(.leading, 10)
                    .key()
                }
                
                // MARK: Modifier Keys
                HStack(spacing: Calculator.getKeySpacing()) {
                    Group {
                        SpecialKeys(onTouchDown: {
                            self.keyboardMode = .hangul
                        }, title: NSAttributedString(string: "한글", attributes: [
                            .font: UIFont.systemFont(ofSize: 16)
                        ]))
                        .cornerRadius(4)
                        .shadow(radius: 0.2, x: 0, y: 1)
                        nextKeyboard
                    }
                    .frame(width: geometry.size.width * 0.112)
                    SpecialKeys(onTouchUp: {
                        self.automata.space()
                    }, title: NSAttributedString(string: "스페이스", attributes: [
                        .font: UIFont.systemFont(ofSize: 16)
                    ]))
                    .cornerRadius(4)
                    .shadow(radius: 0.2, x: 0, y: 1)
                    SpecialKeys(onTouchUp: {
                    }, title: NSAttributedString(string: "⏎", attributes: [
                        .font: UIFont.systemFont(ofSize: 24)
                    ]))
                    .cornerRadius(4)
                    .shadow(radius: 0.2, x: 0, y: 1)
                    .frame(width: geometry.size.width * 0.235)
                }
            }
            .padding(.horizontal, Calculator.getOuterPadding())
            .padding(.top, Calculator.getOuterPadding())
            .padding(.bottom, 2)
        }
    }
}
