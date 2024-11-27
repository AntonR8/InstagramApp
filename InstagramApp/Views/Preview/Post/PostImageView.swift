//
//  PostImageView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 25.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostImageView: View {
    let imagePreview: String
    let size = UIScreen.main.bounds.width - 32

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.gray.opacity(0.1))
            .frame(width: size, height: size)
            .overlay {
                WebImage(url: URL(string: imagePreview)) { image in
                    image.resizable()
                } placeholder: {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.gray.opacity(0.001))
                }
                .indicator(.activity)
                .scaledToFill()
                .cornerRadius(25)
            }
            .padding(8)
    }
}

#Preview {
    PostImageView(imagePreview: mockPostResponse.data.post.carousel.first?.imageDownloadUrl ?? "")
}
