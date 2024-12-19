//
//  StoriesTabView.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 26.11.2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: StoriesModel?
    let profileStories: [ProfileStoriesModel]
    @Binding var currentStories: ProfileStoriesModel?

    func showNavPoints() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .gray
//        UIPageControl.appearance().preferredIndicatorImage = UIImage(systemName: "circle.fill")
        UIPageControl.appearance().hidesForSinglePage = true
        //        UIPageControl.appearance().setIndicatorImage(UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 5))), forPage: 3)
    }

    
    var body: some View {
        TabView {
            if let stories {
            if let videoURL = stories.videoDownloadUrl {
                StoriesVideoPreview(videoDownloadURL: videoURL, imagePreview: stories.imageDownloadUrl, authorAvatar: stories.authorAvatar, author: stories.author, sinceStr: stories.sinceStr)
            } else {
                StoriesImagePreview(imagePreview: stories.imageDownloadUrl, authorAvatar: stories.authorAvatar, author: stories.author, sinceStr: stories.sinceStr)
            }
        }
            ForEach(profileStories, id: \.self) { profileStory in
                if let videoURL = profileStory.videoDownloadUrl {
                    StoriesVideoPreview(videoDownloadURL: videoURL, imagePreview: profileStory.imageDownloadUrl, authorAvatar: profileStory.avatar, author: profileStory.name, sinceStr: profileStory.sinceStr)
                        .onAppear {
                            currentStories = profileStory
                        }
                } else {
                    StoriesImagePreview(imagePreview: profileStory.imageDownloadUrl, authorAvatar: profileStory.avatar, author: profileStory.name, sinceStr: profileStory.sinceStr)
                        .onAppear {
                            currentStories = profileStory
                        }
                }
            }

        }
                    .frame(maxWidth: .infinity, minHeight: (UIScreen.main.bounds.width - 100)*16/9 + 80)
        .tabViewStyle(.page)
        .onAppear {
            showNavPoints()
        }
    }
}

#Preview {
    StoriesTabView(
        stories: mockStoriesResponse.data.story,
        profileStories: mockProfileStoriesResponse.data.profileStories.items, currentStories: .constant(nil)
    )
}
