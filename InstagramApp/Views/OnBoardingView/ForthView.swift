//
//  ForthView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI
import StoreKit

struct ForthView: View {
    @Environment(\.requestReview) var requestReview
    @State var raitingRequested = false

    var body: some View {

        ZStack {
            VStack {
                Image("onboarding4")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer()
                VStack() {
                    Text("Rate us in the AppStore ⭐️")
                        .font(.title)
                        .bold()
                        .padding()
                    Text("Help make the app better for you")
                        .font(.footnote)
                    Spacer()
                    NavigationLink(destination: FifthView(),
                                   label: { OnboardingButtonLabel(title: "Continue") })
                    .disabled(!raitingRequested)
                    .onTapGesture {
                        requestReview()
                        raitingRequested = true
                    }
                    DotsNavigationView(number: 4)
                }

                .padding()
                .background(.white)
                .multilineTextAlignment(.center)
                .clipped()
                .cornerRadius(25)
                .frame(height: 300)
            }


        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ForthView()
    }
}
