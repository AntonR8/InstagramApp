//
//  SecondView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct SecondView: View {
    
    var body: some View {
        OnboardingView(
            title: "Create your collections 🗂️",
            description: "High quality & no watermarks",
            number: 2,
            icon: "bookmark",
            buttonTitle: "Continue",
            destination: AnyView(ThirdView())
        )
    }
}

#Preview {
    SecondView()
}
