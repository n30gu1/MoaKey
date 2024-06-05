//
//  UIKitLabel.swift
//  MoaKey
//
//  Created by Park Seongheon on 6/5/24.
//

import SwiftUI
import UIKit

struct UIKitLabel: UIViewRepresentable {
    typealias ViewType = UILabel
    fileprivate var configuration = { (_: ViewType) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> ViewType { ViewType() }
    func updateUIView(_ uiView: ViewType, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}
