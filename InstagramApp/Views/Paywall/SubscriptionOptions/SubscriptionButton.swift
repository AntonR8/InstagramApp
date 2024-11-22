//
//  SuscriptionButton.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import ApphudSDK
import StoreKit

struct SubscriptionButton: View {
    var paywallViewModel: PaywallViewModel

    let selectedProductIndex: Int
    let subscription: ApphudProduct


    var parameters: (subscriptionName: String, pricePerYear: String?, bestOffer: Bool, pricePerPeriod: String, period: String)? { paywallViewModel.returnSubscriptionViewParameters(subscription: subscription)}


    var body: some View {
        Button {
            paywallViewModel.updatedSelectedProductIndex(selectedProductIndex)
            print(paywallViewModel.selectedProductIndex.description)
        } label: {
            HStack {
                Image(systemName: selectedProductIndex == paywallViewModel.selectedProductIndex ? "button.programmable" : "circle")
                    .foregroundStyle(selectedProductIndex == paywallViewModel.selectedProductIndex ? .accent : .secondary)
                    .padding(.trailing, 4)
                VStack(alignment: .leading) {
                    Text(parameters?.subscriptionName ?? subscription.productId)
                    if let pricePerYear = parameters?.pricePerYear {
                        Text(pricePerYear)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .foregroundStyle(.black)
                Spacer()
                VStack {
                    if let parameters, parameters.bestOffer {
                        BestOfferBadgeView()
                    }
                    Spacer()
                }
                VStack(alignment: .trailing) {
                    Text(parameters?.pricePerPeriod ?? "⚠️")
                        .font(.headline)
                    Text(parameters?.period ?? "")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .foregroundStyle(.black)
            }

            .padding(8)
            .padding(.horizontal, 8)
            .background(.gray.opacity(0.15))
            .frame(height: 54)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay {
                RoundedRectangle(cornerRadius: 14).stroke(selectedProductIndex == paywallViewModel.selectedProductIndex ? .accent : .clear)
            }
            .padding(1)
        }

    }
}

#Preview {
    SubscriptionsOptions(paywallViewModel: PaywallViewModel())
}


