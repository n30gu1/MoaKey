//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/4/24.
//

import SwiftUI
import UIKit

class KeyboardViewController: UIInputViewController {
    var shouldNextKeyboardButtonHidden: Bool!
    
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
        self.shouldNextKeyboardButtonHidden = !self.needsInputModeSwitchKey
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
        let nextKeyboardButton = NextKeyboardButton(target: self, selector: #selector(handleInputModeList(from:with:)))
        let hosting = UIHostingController(rootView: KeyboardView(automata: automata) {
            nextKeyboardButton
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

struct NextKeyboardButton: UIViewRepresentable {
    weak var target: UIInputViewController!
    let selector: Selector
    
    init(target: UIInputViewController!, selector: Selector) {
        self.target = target
        self.selector = selector
    }
    
    func makeUIView(context: Context) -> UIButton {
        return UIButton(type: .custom)
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        let configuration = {
            var c = UIButton.Configuration.filled()
            c.image = UIImage(systemName: "globe")
            c.baseBackgroundColor = #colorLiteral(red: 0.7298241258, green: 0.7478584647, blue: 0.7744403481, alpha: 1)
            c.baseForegroundColor = .black
            c.background.cornerRadius = CORNER_RADIUS
            return c
        }()
        uiView.configuration = configuration
        uiView.addTarget(target, action: selector, for: .allTouchEvents)
    }
}
