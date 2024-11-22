//
//  TitleMainView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 28.10.2024.
//

import SwiftUI

struct TitleMainView: View {
    var body: some View {
        Image(systemName: "arrow.down.to.line")
            .font(.largeTitle)
            .foregroundStyle(.secondary)
            .padding()
        Text("Save Instagram Reels, posts, profiles and stories ")
            .font(.title3)
            .bold()
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)
            .padding(.vertical, 8)
        Text("Enter the link address below")
            .opacity(0.8)
            .font(.footnote)
            .padding(.bottom, 20)
    }
}

#Preview {
    TitleMainView()
}
