//
//  AdvantagesView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct LogoAndAdvantages: View {
    var body: some View {
        Text("Unlock all benefits!")
            .font(.largeTitle)
            .bold()
        VStack(alignment: .leading, spacing: 10) {
            Label(
                title: { Text("Download unlimited Reels") },
                icon: { Image(systemName: "checkmark") }
            )
            Label(
                title: { Text("Download unlimited posts") },
                icon: { Image(systemName: "checkmark") }
            )
            Label(
                title: { Text("Unlimited collections") },
                icon: { Image(systemName: "checkmark") }
            )
        }
        .labelStyle(.iconTint(.accentColor))
        .padding(.vertical)
    }
}

#Preview {
    LogoAndAdvantages()
}
