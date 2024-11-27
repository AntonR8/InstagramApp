//
//  StoriesImageView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesImagePreview: View {
    let imagePreview: String
    let size = UIScreen.main.bounds.width - 32
    let authorAvatar: String
    let author: String
    let sinceStr: String

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray.opacity(0.1))
            .frame(width: 286, height: 508)
            .overlay {
                WebImage(url: URL(string: imagePreview)) { image in
                    image.resizable()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.gray.opacity(0.001))
                }
                .indicator(.activity)
                .scaledToFit()
                .cornerRadius(25)
            }
            .overlay(alignment: .bottomLeading) {
                StoriesClipInfo(authorAvatar: authorAvatar, author: author, sinceStr: sinceStr)
                    .padding(12)
            }
            .padding()
    }
}

#Preview {
    StoriesImagePreview(
        imagePreview: mockStoriesResponse.data.stories.imagePreview,
        authorAvatar: mockStoriesResponse.data.stories.authorAvatar,
        author: mockStoriesResponse.data.stories.author,
        sinceStr: mockStoriesResponse.data.stories.sinceStr
    )
}
