//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/4/24.
//

import RepresentableKit
import SwiftUI
import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet var nextKeyboardButton: UIButton!
    
    private var automata: Automata!
    
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
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
        
        if let textInput {
            if !textInput.hasText {
                self.automata.endComposing()
            }
        }
    }
}

extension KeyboardViewController {
    func setupNextKeyboardButton() -> UIButton {
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        return self.nextKeyboardButton
    }
    
    func setupKeyboardView() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        self.automata = Automata(proxy: proxy)
        self.nextKeyboardButton = self.setupNextKeyboardButton()
        let hosting = UIHostingController(rootView: KeyboardView(automata: automata) {
            UIViewAdaptor {
                self.nextKeyboardButton
            }
        })
        hosting.view.backgroundColor = .clear
        self.view.addSubview(hosting.view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hosting.view.heightAnchor.constraint(equalToConstant: 250),
            hosting.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            hosting.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hosting.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
