//
//  BestOfferBadgeView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct BestOfferBadgeView: View {
    var body: some View {
        Text("SAVE \(Constants.Paywall.bestOfferBadge)%")
            .font(.caption2)
            .padding(4)
            .padding(.horizontal, 2)
            .foregroundStyle(.white)
            .background(
                Capsule()
                    .foregroundStyle(Color.red)
        )
    }
}

#Preview {
    BestOfferBadgeView()
}
