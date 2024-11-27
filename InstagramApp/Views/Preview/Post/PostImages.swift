//
//  PostImages.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI

struct PostImages: View {
    let post: PostModel
    
    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
//        UIPageControl.appearance().preferredIndicatorImage = UIImage(systemName: "circle.fill")
        UIPageControl.appearance().hidesForSinglePage = true
        //        UIPageControl.appearance().setIndicatorImage(UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 5))), forPage: 3)
    }

    var body: some View {
            TabView {
                ForEach(post.carousel, id: \.self) { imagePreview in
                    if let imageURL = imagePreview.imageDownloadUrl {
                        PostImageView(imagePreview: imageURL)
                    }
                    if let videoURL = imagePreview.videoDownloadUrl {
                        PostImageView(imagePreview: videoURL)
                    }
                }
        }
        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.width * 1.2)
        .tabViewStyle(.page)
        .onAppear {
            showNavPoints()
        }

    }
}

#Preview {
    PostImages(post: mockPostResponse.data.post)
}
