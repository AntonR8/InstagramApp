//
//  LinkFieldOverlay.swift
//  SaveVideo
//
//  Created by Антон Разгуляев on 02.11.2024.
//

import SwiftUI

struct LinkFieldOverlay: View {
    @Binding var link: String

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            if link.isEmpty {
                Text("instagram.com/...")
                    .accentColor(.gray)
                    .foregroundStyle(.gray)
                    .allowsHitTesting(false)
            }
            Spacer()
            if link.isEmpty {
                PasteButton(link: $link)
            } else {
                    XButton {
                        link = ""
                    }
            }

        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ZStack {
        Color.gray
        LinkFieldOverlay(link: .constant(""))
    }
}
