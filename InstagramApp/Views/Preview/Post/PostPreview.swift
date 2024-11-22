//
//  PostPreview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import ApphudSDK

struct PostPreview: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    let count = 4

    var body: some View {
            VStack {
                ScrollView {
                    PostImages()
                    HStack {
                        Avatar()
                        AuthorAndDescription()
                    }
                    .padding(.horizontal)
                }
                Spacer()
                PostMenuButtons(link: "")
                HStack {
                    CapsuleButton(leftIcon: "arrow.down", title: "Only this one") {

                    }
                    CapsuleButton(title: "Save \(count) images") {

                    }
                }
                .padding()
        }
        .onAppear{
//            videosViewModel.loadVideos()
        }
        .overlay(alignment: .top) {
//            PreviewNotifications(mainViewModel: mainViewModel, videosViewModel: videosViewModel)
        }

        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
        if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        navigationViewModel.showPaywall = true
                    } label: {
                        ProButtonView()
                    }
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
        PostPreview()
            .environment(NavigationViewModel())
    }
}
