//
//  PaywallView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import ApphudSDK

struct PaywallView: View {
    @State var paywallViewModel = PaywallViewModel()
    @State var showCloseButton: Bool = false



    var body: some View {
        ZStack {
            PaywallBackground()
            VStack {
                if showCloseButton {
                    CloseButton()
                        .transition(.opacity)
                }
                Spacer()
                LogoAndAdvantages()
                SubscriptionsOptions(paywallViewModel: paywallViewModel)
                    .padding(.vertical)
                Label("Cancel anytime", systemImage: "clock.arrow.circlepath")
                    .font(.footnote)
                    .padding(.top)
                if !paywallViewModel.disableContinueButton() {
                    CapsuleButton(title: "Continue", rightIcon: "arrow.forward" ,action: {
                        paywallViewModel.makePurchase()
                    })
                    .padding(.vertical)
                }
                PrivacyPolicyLinks(paywallViewModel: paywallViewModel)
                    .padding(.vertical, 8)
            }
            .padding(.horizontal)
            .onAppear {
                Task {
                    sleep(2)
                    showCloseButton = true
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PaywallView(paywallViewModel: PaywallViewModel())
            .environment(NavigationViewModel())
    }
}
