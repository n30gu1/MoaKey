//
//  SpecialKeys.swift
//  Keyboard
//
//  Created by Park Seongheon on 6/8/24.
//

import SwiftUI

struct SpecialKeys: UIViewRepresentable {
    weak var target: UIInputViewController?
    let selector: Selector?
    
    let onTouchDown: () -> Void
    let onTouchUp: () -> Void
    
    var colorDefault: UIColor = #colorLiteral(red: 0.669994235, green: 0.6949279904, blue: 0.7288325429, alpha: 1)
    var colorOnTouchDown: UIColor = .white
    
    @State var backgroundColor: UIColor = #colorLiteral(red: 0.669994235, green: 0.6949279904, blue: 0.7288325429, alpha: 1)
    
    init(
        target: UIInputViewController? = nil, selector: Selector? = nil,
        onTouchDown: @escaping () -> Void = {},
        onTouchUp: @escaping () -> Void = {}
    ) {
        self.target = target
        self.selector = selector
        self.onTouchDown = onTouchDown
        self.onTouchUp = onTouchUp
    }
    
    func makeUIView(context: Context) -> UIButton {
        let b = UIButton()
        b.layer.cornerRadius = CORNER_RADIUS
        b.backgroundColor = self.backgroundColor
        return b
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        uiView.addTarget(context.coordinator, action: #selector(context.coordinator.onTouchDownSel), for: .touchDown)
        uiView.addTarget(context.coordinator, action: #selector(context.coordinator.onTouchUpSel), for: .touchUpInside)
        if let target, let selector {
            uiView.addTarget(target, action: selector, for: .allTouchEvents)
        }
        
        uiView.backgroundColor = self.backgroundColor
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension SpecialKeys {
    @MainActor
    class Coordinator: NSObject {
        var key: SpecialKeys
        
        init(_ key: SpecialKeys) {
            self.key = key
        }
        
        @objc func onTouchDownSel(_ sender: UIGestureRecognizer) {
            key.backgroundColor = key.colorOnTouchDown
            key.onTouchDown()
        }
        
        @objc func onTouchUpSel(_ sender: UIGestureRecognizer) {
            key.backgroundColor = key.colorDefault
            key.onTouchUp()
        }
    }
}

extension SpecialKeys {
    @MainActor
    func disableColorChange() -> SpecialKeys {
        var key = self
        key.colorOnTouchDown = key.colorDefault
        
        return key
    }
}
