//
//  FirstView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct OnboardingView: View {
    let title: String
    let description: String
    let number: Int
    let icon: String
    let buttonTitle: String
    let destination: AnyView

    var body: some View {
        ZStack {
            VStack {
                Image("onboarding\(number.description)")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }.ignoresSafeArea()
            VStack {
                Spacer()
                VStack() {
                    Text(title)
                        .font(.title)
                        .foregroundStyle(.black)
                        .bold()
                        .padding()
                    Text(description)
                        .font(.footnote)
                    Spacer()
                    NavigationLink(destination: destination,
                                   label: { OnboardingButtonLabel(title: buttonTitle) })
                    DotsNavigationView(number: number)
                }
                .padding()
                .background(.white)
                .multilineTextAlignment(.center)
                .clipped()
                .cornerRadius(25)
                .frame(height: 300)
            }


        }
    }
}

#Preview {
    NavigationStack {
        OnboardingView(title: "Save Instagram Reels & Stories 🎬", description: "Also posts and profiles images", number: 1, icon: "square.and.arrow.down", buttonTitle: "Continue", destination: AnyView(SecondView()))
    }
}
