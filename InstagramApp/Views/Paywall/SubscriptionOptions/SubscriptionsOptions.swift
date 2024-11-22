//
//  SubscriptionsOptionsView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI
import ApphudSDK

struct SubscriptionsOptions: View {
    var paywallViewModel: PaywallViewModel

    var body: some View {
        if paywallViewModel.products.isEmpty {
            ProgressView()
                .frame(height: UIScreen.main.bounds.width/1.93)
        } else {
            VStack(spacing: 8) {

                ForEach( Array(zip(paywallViewModel.products.indices, paywallViewModel.products)), id: \.0) { index, product in
                    SubscriptionButton(paywallViewModel: paywallViewModel, selectedProductIndex: index, subscription: product)
                }
            }
        }
    }
}

#Preview {
    SubscriptionsOptions(paywallViewModel: PaywallViewModel())
}
