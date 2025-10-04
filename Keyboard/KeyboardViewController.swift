//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/4/24.
//

import SwiftUI
import UIKit

class KeyboardViewController: UIInputViewController {
    private var automata: Automata!
    private var keyboardMode: KeyboardMode = .hangul
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        setupKeyboardView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        //        var textColor: UIColor
        //        let proxy = self.textDocumentProxy
        //        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
        //            textColor = UIColor.white
        //        } else {
        //            textColor = UIColor.black
        //        }
        //        self.nextKeyboardButton.setTitleColor(textColor, for: [])
        
        if let textInput {
            if !textInput.hasText {
                self.automata.endComposing()
            }
        }
    }
}

extension KeyboardViewController {
    func setupKeyboardView() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        self.automata = Automata(proxy: proxy)
        
        let hosting = UIHostingController(rootView: KeyboardView(automata: automata) {
            if self.needsInputModeSwitchKey {
                SpecialKeys(
                    target: self,
                    selector: #selector(self.handleInputModeList(from:with:)),
                    title: NSAttributedString(string: "globe", attributes: [:])
                )
//                .cornerRadius(4)
//                .shadow(radius: 0.4, x: 0, y: 1)
            } else {
                SpecialKeys(
                    target: self, title: NSAttributedString(string: "emoji", attributes: [:])
                )
//                .cornerRadius(4)
//                .shadow(radius: 0.4, x: 0, y: 1)
            }
        })
        hosting.view.backgroundColor = .clear
        self.view.addSubview(hosting.view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hosting.view.heightAnchor.constraint(equalToConstant: Calculator.getKeyboardHeight()),
            hosting.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            hosting.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hosting.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
