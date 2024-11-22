//
//  FirstView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 13.09.2024.
//

import SwiftUI

struct FirstView: View {
    
    var body: some View {
        OnboardingView(
            title: "Save Instagram Reels & Stories 🎬",
            description: "Also posts and profiles images",
            number: 1,
            icon: "square.and.arrow.down",
            buttonTitle: "Continue",
            destination: AnyView(SecondView())
        )
    }
}

#Preview {
    NavigationStack {
        FirstView()
    }
}
