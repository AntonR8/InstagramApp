//
//  LinkPasteButton.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 21.11.2024.
//

import SwiftUI

struct PasteButton: View {
    let leftIcon = "doc.on.clipboard"
    let title = "Paste"
    @Binding var link: String

    var body: some View {
        Button(action: {
            link = UIPasteboard.general.string ?? ""
        }) {
            HStack {
                Image(systemName: leftIcon)
                    .offset(x: 6)
                Text(title)
                    .padding(.horizontal, 4)
            }
            .font(.footnote)
            .foregroundStyle(.black)
            .padding(6)
            .background(
                Capsule()
                    .fill(.clear)
                    .stroke(.black, lineWidth: 1)
            )
        }
        .padding(1)
    }
}

#Preview {
    PasteButton(link: .constant(""))
}
