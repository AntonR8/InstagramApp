//
//  Avatar.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct Avatar: View {
    let avatarURL: String?
    var size: CGFloat = 36
    var body: some View {
        Circle()
            .fill(Color.gray.opacity(0.1))
            .frame(width: size, height: size)
            .overlay {
                if let avatarURL {
                    WebImage(url: URL(string: avatarURL)) { image in
                        image.resizable()
                    } placeholder: {
                        Circle()
                            .fill(.gray.opacity(0.001))
                    }
                    .indicator(.activity)
                    .scaledToFill()
                    .clipShape(Circle())
                }
            }
    }
}

#Preview {
    Avatar(avatarURL: mockPostResponse.data.post.authorAvatar)
}
