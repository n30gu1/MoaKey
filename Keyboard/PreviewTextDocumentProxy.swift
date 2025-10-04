//
//  PreviewTextDocumentProxy.swift
//  Keyboard
//
//  Created by AI Assistant on 2025-08-16.
//

#if DEBUG
import UIKit

/// A minimal stand-in for UITextDocumentProxy suitable for SwiftUI previews.
/// It captures inserted text into an internal buffer so Automata can operate.
final class PreviewTextDocumentProxy: NSObject, UITextDocumentProxy {
    // Storage
    private var buffer: String = ""

    // MARK: - Required properties
    var documentContextBeforeInput: String? { buffer.isEmpty ? nil : buffer }
    var documentContextAfterInput: String? { nil }
    var hasText: Bool { !buffer.isEmpty }

    // MARK: - Input methods
    func insertText(_ text: String) {
        buffer.append(text)
    }

    func deleteBackward() {
        guard !buffer.isEmpty else { return }
        buffer.removeLast()
    }

    // MARK: - Unused protocol requirements with safe defaults
    var selectedText: String? { nil }
    var documentInputMode: UITextInputMode? { nil }
    var documentIdentifier: UUID? { nil }
    var keyboardAppearance: UIKeyboardAppearance { .default }

    func adjustTextPosition(byCharacterOffset offset: Int) {}
}
#endif
