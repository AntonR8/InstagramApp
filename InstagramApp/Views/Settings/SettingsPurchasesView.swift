//
//  PurchasesView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 15.10.2024.
//

import SwiftUI
import ApphudSDK

struct SettingsPurchasesView: View {
    @State var paywallViewModel = PaywallViewModel()
    @Environment(NavigationViewModel.self) var navigationViewModel

    var body: some View {
        Section(header: Text("Purchases")) {
            SettingsButton(image: "crown", title: "Upgrade plan", action: { navigationViewModel.showPaywall = true }, description: nil)
            SettingsButton(image: "arrow.counterclockwise", title: "Restore purchases", action: {
                paywallViewModel.restorePurchase()
            }, description: nil)
        }
        .textCase(nil)
    }
}

#Preview {
    NavigationStack {
        SettingsPurchasesView()
            .environment(NavigationViewModel())
    }
}
