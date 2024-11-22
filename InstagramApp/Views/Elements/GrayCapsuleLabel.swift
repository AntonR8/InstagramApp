//
//  SmallImageLink.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 21.10.2024.
//

import SwiftUI

struct GrayCapsuleLabel: View {
        var leftIcon: String?
        var title: String?
        var rightIcon: String?
        var foregroundStyle: Color
        var backGroundStyle: Color = .gray.opacity(0.5)
        var borderColor: Color?
        var font: Font?

        var body: some View {
                HStack {
                    if let leftIcon {
                        Image(systemName: leftIcon)
                    }

                    if let title {
                        Text(title)
                            .font(font ?? .callout)
                            .padding(.horizontal, 8)
                    }

                    if let rightIcon {
                        Image(systemName: rightIcon)
                            .font(.caption)
                    }
                }
                .foregroundStyle(foregroundStyle)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(backGroundStyle)
                        .stroke(borderColor ?? .clear, lineWidth: 1)
                )
                .padding(1)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        GrayCapsuleLabel(title: "Restore", foregroundStyle: .white)
    }
}
