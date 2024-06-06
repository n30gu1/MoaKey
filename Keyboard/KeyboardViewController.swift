//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/4/24.
//

import UIKit

var isVirgin = true
var height: CGFloat = 0.0

class KeyboardViewController: UIInputViewController {
    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var keyboardView: UIView!
    @IBOutlet var firstRowStack: UIStackView!
    @IBOutlet var secondRowStack: UIStackView!
    @IBOutlet var thirdRowStack: UIStackView!
    @IBOutlet var fourthRowStack: UIStackView!
    @IBOutlet var fifthRowStack: UIStackView!
    
    private var automata: Automata!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        self.automata = Automata(proxy: proxy)
        
        setupNextKeyboardButton()
        setupKeyboardLayout()
        setupStacks()
        
        if !isVirgin {
            NSLayoutConstraint.activate([
                self.keyboardView.heightAnchor.constraint(equalToConstant: height)
            ])
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isVirgin {
            let defaultHeight = self.view.frame.height
            
            height = self.view.frame.height
            
            isVirgin = false
            
            NSLayoutConstraint.activate([
                self.keyboardView.heightAnchor.constraint(equalToConstant: height)
            ])
        }
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
    }
}

extension KeyboardViewController {
    func setupNextKeyboardButton() {
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func setupKeyboardLayout() {
        self.keyboardView = UIView()
        self.keyboardView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.keyboardView)
        
        self.firstRowStack = {
            let s = UIStackView()
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.spacing = 0
            s.backgroundColor = .red
            
            return s
        }()
        
        self.secondRowStack = {
            let s = UIStackView()
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.spacing = 0
            s.backgroundColor = .blue
            
            return s
        }()
        
        self.thirdRowStack = {
            let s = UIStackView()
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.spacing = 0
            s.backgroundColor = .green
            
            return s
        }()
        
        self.fourthRowStack = {
            let s = UIStackView()
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.spacing = 0
            s.backgroundColor = .darkGray
            
            return s
        }()
        
        self.fifthRowStack = {
            let s = UIStackView()
            s.axis = .horizontal
            s.alignment = .fill
            s.distribution = .fillEqually
            s.spacing = 0
            
            return s
        }()
        
        self.keyboardView.addSubview(self.firstRowStack)
        self.keyboardView.addSubview(self.secondRowStack)
        self.keyboardView.addSubview(self.thirdRowStack)
        self.keyboardView.addSubview(self.fourthRowStack)
        self.keyboardView.addSubview(self.fifthRowStack)
        
        self.firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        self.secondRowStack.translatesAutoresizingMaskIntoConstraints = false
        self.thirdRowStack.translatesAutoresizingMaskIntoConstraints = false
        self.fourthRowStack.translatesAutoresizingMaskIntoConstraints = false
        self.fifthRowStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.keyboardView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.keyboardView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.keyboardView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.keyboardView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.firstRowStack.topAnchor.constraint(equalTo: self.keyboardView.topAnchor),
            self.firstRowStack.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor),
            self.firstRowStack.trailingAnchor.constraint(equalTo: self.keyboardView.trailingAnchor),
            self.firstRowStack.heightAnchor.constraint(equalTo: self.keyboardView.heightAnchor, multiplier: 0.2),
            
            self.secondRowStack.topAnchor.constraint(equalTo: self.firstRowStack.bottomAnchor),
            self.secondRowStack.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor),
            self.secondRowStack.trailingAnchor.constraint(equalTo: self.keyboardView.trailingAnchor),
            self.secondRowStack.heightAnchor.constraint(equalTo: self.keyboardView.heightAnchor, multiplier: 0.2),
            
            self.thirdRowStack.topAnchor.constraint(equalTo: self.secondRowStack.bottomAnchor),
            self.thirdRowStack.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor),
            self.thirdRowStack.trailingAnchor.constraint(equalTo: self.keyboardView.trailingAnchor),
            self.thirdRowStack.heightAnchor.constraint(equalTo: self.keyboardView.heightAnchor, multiplier: 0.2),
            
            self.fourthRowStack.topAnchor.constraint(equalTo: self.thirdRowStack.bottomAnchor),
            self.fourthRowStack.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor),
            self.fourthRowStack.trailingAnchor.constraint(equalTo: self.keyboardView.trailingAnchor),
            self.fourthRowStack.heightAnchor.constraint(equalTo: self.keyboardView.heightAnchor, multiplier: 0.2),
            
            self.fifthRowStack.topAnchor.constraint(equalTo: self.fourthRowStack.bottomAnchor),
            self.fifthRowStack.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor),
            self.fifthRowStack.trailingAnchor.constraint(equalTo: self.keyboardView.trailingAnchor),
            self.fifthRowStack.heightAnchor.constraint(equalTo: self.keyboardView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func setupStacks() {}
}
