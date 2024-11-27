//
//  PostPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import ApphudSDK

struct PostPreview: View {
    @State var reelsViewModel = ReelsViewModel()
    var mainViewModel: MainViewModel

    // delete:
    let post: PostModel

    var body: some View {
            VStack {
                ScrollView {
                    PostImages(post: post)
                    HStack {
                        Avatar(avatarURL: post.authorAvatar)
                        AuthorAndDescription(author: post.author, description: post.description)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                PostMenuButtons(post: post, mainViewModel: mainViewModel)
                HStack {
                    CapsuleButton(leftIcon: "arrow.down", title: "Only this one", backgroundColor: .clear, foregroundColor: .accent, strokeColor: .gray.opacity(0.5)) {

                    }
                    CapsuleButton(title: "Save \(post.carousel.count) images") {

                    }
                }
                .padding()
        }
        .onAppear{
            reelsViewModel.loadVideos()
        }
        .overlay(alignment: .top) {
            PreviewNotifications(mainViewModel: mainViewModel, reelsViewModel: reelsViewModel)
        }
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarProPaywallButton()
                }
            }
        }
//        .sheet(isPresented: $videosViewModel.showSelectVideoFolders) {
//            SelectVideoFolder(videosViewModel: videosViewModel)
//                .presentationDetents([.medium])
//        }
//        .popover(isPresented: $mainViewModel.showRateMeView, content: {
//            RateMeView(mainViewModel: mainViewModel)
//        })
//        .newVideoFolderAllert(videosViewModel: videosViewModel)
    }
}

#Preview {
    NavigationStack {
        PostPreview(mainViewModel: MainViewModel(), post: mockPostResponse.data.post)
            .environment(NavigationViewModel())
    }
}
