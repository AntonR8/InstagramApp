//
//  PreView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import StoreKit
import ApphudSDK

struct ClipPreView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var videosViewModel = VideosViewModel()
    var paywallViewModel: PaywallViewModel
    @Bindable var mainViewModel: MainViewModel
    let tiktokLink: String
    let clipLink: String

    var body: some View {
        VStack {
//            if let clipInfo = mainViewModel.clipInfo {
//                VideoPreview(info: clipInfo, clipLink: clipLink)
//                MenuView(videosViewModel: videosViewModel, mainViewModel: mainViewModel, link: clipLink, info: clipInfo)
//                    .padding(.bottom)
//                CapsuleButton(leftIcon: "crown", title: "Save HD", action: {
//                    if mainViewModel.freeSavingsRemain() {
//                        mainViewModel.downloadAndSaveVideoToGallery()
//                    } else {
//                        paywallViewModel.showPaywall = true
//                    }
//                })
//            } else {
//                ProgressView()
//            }
        }
        .onAppear{
            videosViewModel.loadVideos()
        }
        .overlay(alignment: .top) {
            PreviewNotifications(mainViewModel: mainViewModel, videosViewModel: videosViewModel)
        }
        .padding(.horizontal)
        .navigationTitle("Reels")
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
        .sheet(isPresented: $videosViewModel.showSelectVideoFolders) {
            SelectVideoFolder(videosViewModel: videosViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $mainViewModel.showRateMeView, content: {
            RateMeView(mainViewModel: mainViewModel)
        })
        .newVideoFolderAllert(videosViewModel: videosViewModel)
    }
}

#Preview {
    ClipPreView(paywallViewModel: PaywallViewModel(), mainViewModel: MainViewModel(), tiktokLink: "", clipLink: "")
        .environment(NavigationViewModel())
}

