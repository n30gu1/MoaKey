//
//  KeyboardKey.swift
//  KeyboardExperiment
//
//  Created by Park Seongheon on 6/2/24.
//

import SwiftUI

enum Direction {
    case up, down, left, right, none, upLeft, upRight, downLeft, downRight
}

struct KeyboardKey: View {
    let character: String
    @State private var isPressed = false
    
    @State private var currentDirection: Direction = .none
    
    @State private var directions: [Direction] = []
    
    @State private var composedCharacter = ""
    @State private var currentJungsung: Int? = nil
    
    @ObservedObject var automata: Automata
    
    var body: some View {
        Text(isPressed ? "" : character)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // TODO: Change color to system
            .cornerRadius(CORNER_RADIUS)
            .shadow(radius: 0.4, x: 0, y: 1)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { g in
                        isPressed = true
                        
                        if g.translation.width > 20, g.translation.height > 20 {
                            currentDirection = .downRight
                        } else if g.translation.width > 20, g.translation.height < -20 {
                            currentDirection = .upRight
                        } else if g.translation.width < -20, g.translation.height > 20 {
                            currentDirection = .downLeft
                        } else if g.translation.width < -20, g.translation.height < -20 {
                            currentDirection = .upLeft
                        } else if g.translation.width > 30 {
                            currentDirection = .right
                        } else if g.translation.width < -30 {
                            currentDirection = .left
                        } else if g.translation.height > 30 {
                            currentDirection = .down
                        } else if g.translation.height < -30 {
                            currentDirection = .up
                        } else {
                            currentDirection = .none
                        }
                    }
                    .onEnded { _ in
                        isPressed = false
                        currentDirection = .none
                        
                        automata.input(consonent: character, syllable: currentJungsung)
                        
                        directions = []
                        composedCharacter = character
                        currentJungsung = nil
                    }
            )
            .onChange(of: currentDirection) {
                if directions.isEmpty && $0 == .none {
                    directions = []
                } else {
                    directions.append($0)
                }
                
                let jungCode: Int? = jungsungCodeByDirection()
                
                if let jungCode {
                    if jungCode != 100 {
                        let composedCode = 0xAC00 + (Automata.chosungTable[character]! * 588) + (jungCode * 28)
                        let unicode = UnicodeScalar(composedCode)
                        composedCharacter = "\(unicode!)"
                        currentJungsung = jungsungCodeByDirection()
                    }
                }
            }
            .background {
                if isPressed {
                    pressedView()
                        .offset(y: -36)
                }
            }
            .padding(4)
            .task {
                composedCharacter = character
            }
    }
    
    func jungsungCodeByDirection() -> Int? {
        switch directions {
        case [.up]:
            return 8
        case [.up, .none]:
            return 11
        case [.up, .none, .up]:
            return 12
        case [.up, .upRight]:
            return 9
        case [.up, .upRight, .up], [.up, .upRight, .none]:
            return 10
        case [.right]:
            return 0
        case [.right, .none]:
            return 1
        case [.right, .none, .right]:
            return 2
        case [.right, .none, .right, .none]:
            return 3
        case [.left]:
            return 4
        case [.left, .none]:
            return 5
        case [.left, .none, .left]:
            return 6
        case [.left, .none, .left, .none]:
            return 7
        case [.down]:
            return 13
        case [.down, .none]:
            return 16
        case [.down, .none, .down]:
            return 17
        case [.down, .downLeft]:
            return 14
        case [.down, .downLeft, .down], [.down, .downLeft, .none]:
            return 15
        case [.upRight], [.upLeft]:
            return 20
        case [.downRight], [.downLeft]:
            return 18
        case [.downRight, .none], [.downLeft, .none]:
            return 19
        case []:
            return nil
        default:
            return 100 // ignore
        }
    }
    
    func pressedView() -> some View {
        KeyboardOverlay(character: composedCharacter)
    }
}

// #Preview {
//    KeyboardKey()
// }
