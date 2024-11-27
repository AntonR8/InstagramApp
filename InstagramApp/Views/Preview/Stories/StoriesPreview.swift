//
//  StoriesPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import ApphudSDK

struct StoriesPreview: View {
    @State var reelsViewModel = ReelsViewModel()
    @Bindable var mainViewModel: MainViewModel

    // удалить:
    let stories = mockStoriesResponse.data.stories
    let profileStories = mockProfileStoriesResponse.data.stories.array

    var body: some View {
        VStack {
//            if let storiesData = mainViewModel.storiesData {
            StoriesTabView(stories: stories, profileStories: profileStories)
                StoriesMenuView(reelsViewModel: reelsViewModel, mainViewModel: mainViewModel, stories: stories)
                    .padding(.bottom)
            HStack {
                CapsuleButton(leftIcon: "arrow.down", title: "Only this one", backgroundColor: .clear, foregroundColor: .accent, strokeColor: .gray.opacity(0.5)) {
//                    if mainViewModel.freeSavingsRemain() {
                  //                        mainViewModel.downloadAndSaveVideoToGallery()
                  //                    } else {
                  //                        navigationViewModel.showPaywall = true
                  //                    }
                }
                    CapsuleButton(title: "Save \((profileStories.count+1).description) images") {
//                    if mainViewModel.freeSavingsRemain() {
                  //                        mainViewModel.downloadAndSaveVideoToGallery()
                  //                    } else {
                  //                        navigationViewModel.showPaywall = true
                  //                    }
                }
            }
//            } else {
//                ProgressView()
//            }
        }
        .onAppear{
            reelsViewModel.loadVideos()
        }
        .overlay(alignment: .top) {
            PreviewNotifications(mainViewModel: mainViewModel, reelsViewModel: reelsViewModel)
        }
        .padding(.horizontal)
        .navigationTitle("Reels")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarProPaywallButton()
                }
            }
        }
        .sheet(isPresented: $reelsViewModel.showSelectVideoFolders) {
            SelectVideoFolder(reelsViewModel: reelsViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $mainViewModel.showRateMeView, content: {
            RateMeView(mainViewModel: mainViewModel)
        })
        //        .newVideoFolderAllert(videosViewModel: videosViewModel)
    }
}

#Preview {
    NavigationStack {
        StoriesPreview(mainViewModel: MainViewModel())
    }
        .environment(NavigationViewModel())
}
