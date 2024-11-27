//
//  StoriesTabView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: StoriesModel
    let profileStories: [ProfileStoriesModel]

    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
//        UIPageControl.appearance().preferredIndicatorImage = UIImage(systemName: "circle.fill")
        UIPageControl.appearance().hidesForSinglePage = true
        //        UIPageControl.appearance().setIndicatorImage(UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 5))), forPage: 3)
    }

    
    var body: some View {
        TabView {
            if let videoURL = stories.videoDownloadURL {
                StoriesVideoPreview(videoDownloadURL: videoURL, imagePreview: stories.imagePreview, authorAvatar: stories.authorAvatar, author: stories.author, sinceStr: stories.sinceStr)
            } else {
                StoriesImagePreview(imagePreview: stories.imagePreview, authorAvatar: stories.authorAvatar, author: stories.author, sinceStr: stories.sinceStr)
            }

            ForEach(profileStories, id: \.self) { profileStory in
                if let videoURL = profileStory.videoDownloadUrl {
                    StoriesVideoPreview(videoDownloadURL: videoURL, imagePreview: profileStory.imageDownloadUrl, authorAvatar: profileStory.avatar, author: profileStory.name, sinceStr: profileStory.sinceStr)
                } else {
                    StoriesImagePreview(imagePreview: profileStory.imageDownloadUrl, authorAvatar: profileStory.avatar, author: profileStory.name, sinceStr: profileStory.sinceStr)
                }
            }

        }
        //            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.width * 1.2)
        .tabViewStyle(.page)
        .onAppear {
            showNavPoints()
        }
    }
}

#Preview {
    StoriesTabView(
        stories: mockStoriesResponse.data.stories,
        profileStories: mockProfileStoriesResponse.data.stories.array
    )
}
