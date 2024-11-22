//
//  ThirdView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct ThirdView: View {

    var body: some View {
        OnboardingView(
            title: "Find trending music 🔥",
            description: "Make your Reels viral",
            number: 3,
            icon: "music.note",
            buttonTitle: "Continue",
            destination: AnyView(ForthView())
        )
    }
}

#Preview {
    ThirdView()
}
