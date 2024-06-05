//
//  AllowFullAccessView.swift
//  MoaKey
//
//  Created by Park Seongheon on 6/5/24.
//

import SwiftUI

struct AllowFullAccessView: View {
    var subtitle: AttributedString {
        var attr = AttributedString("\(NSLocalizedString("FULL_KEYBOARD_ACCESS", comment: "Full Keyboard Access"))를 허용해 주세요!")

        if let range = attr.range(of: "\(NSLocalizedString("FULL_KEYBOARD_ACCESS", comment: "Full Keyboard Access"))") {
            attr[range].foregroundColor = .accentColor
        }

        attr.font = .title3

        return attr
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("시작하기 전에...")
                    .font(.title)
                    .fontWeight(.bold)
                Text(subtitle)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            ScrollView {
                imageAndText(text: "\(NSLocalizedString("SETTINGS", comment: "Settings")) 앱에서")
                imageAndText(text: "\(NSLocalizedString("SETTINGS_KEYBOARD", comment: "Keyboard")) > \(NSLocalizedString("SETTINGS_KEYBOARD_KEYBOARDS", comment: "Keyboards"))로 가서\n\(NSLocalizedString("PRODUCT_DISPLAY_NAME", comment: "Product Display Name"))를 추가해 주세요.")
                imageAndText(text: "마지막으로 추가한 \(NSLocalizedString("PRODUCT_DISPLAY_NAME", comment: "Product Display Name"))에서\n\(NSLocalizedString("FULL_KEYBOARD_ACCESS", comment: "Full Keyboard Access"))를 켜주세요!")
            }
            Spacer()
        }
        .padding(24)
    }

    @ViewBuilder
    private func imageAndText(image: Image? = nil, text: String) -> some View {
        HStack(alignment: .center) {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    AllowFullAccessView()
}
