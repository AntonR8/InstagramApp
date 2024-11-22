//
//  PrivacyPolicyLinksView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 27.09.2024.
//

import SwiftUI

struct PrivacyPolicyLinks: View {
    var paywallViewModel: PaywallViewModel

    var body: some View {
        HStack {
            Link("Privacy Policy", destination: Constants.FormalLinks.privacyPolicyURL)
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Restore Purchases", action:  {
                    paywallViewModel.restorePurchase()
                })
                .foregroundStyle(.secondary)
                Spacer()
            Link("Terms of Use", destination: Constants.FormalLinks.termsOfUseURL)
                    .foregroundStyle(.secondary)
            }
            .font(.caption)
    }
}

#Preview {
    PrivacyPolicyLinks(paywallViewModel: PaywallViewModel())
}
