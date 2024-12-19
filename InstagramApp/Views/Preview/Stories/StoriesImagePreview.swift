//
//  StoriesImageView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoriesImagePreview: View {
    let imagePreview: String?
    let size = UIScreen.main.bounds.width - 32
    let authorAvatar: String?
    let author: String?
    let sinceStr: String?
    let widthSize = UIScreen.main.bounds.width - 100

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray.opacity(0.1))
            .frame(width: widthSize, height: widthSize*16/9)
            .overlay {
                if let imagePreview {
                    WebImage(url: URL(string: imagePreview)) { image in
                        image.resizable()
                            .frame(width: widthSize, height: widthSize*16/9)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.gray.opacity(0.001))
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .frame(width: widthSize, height: widthSize*16/9)
                    .cornerRadius(25)
                }
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
        imagePreview: mockStoriesResponse.data.story.imageDownloadUrl,
        authorAvatar: mockStoriesResponse.data.story.authorAvatar,
        author: mockStoriesResponse.data.story.author,
        sinceStr: mockStoriesResponse.data.story.sinceStr
    )
}
