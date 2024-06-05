//
//  HowToUseView.swift
//  MoaKey
//
//  Created by Park Seongheon on 6/5/24.
//

import SwiftUI

struct HowToUseView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("시작해 볼까요?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("모아키를 써보신 적이 있나요?")
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    HowToUseView()
}
