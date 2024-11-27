//
//  PreView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 17.10.2024.
//

import SwiftUI
import StoreKit
import ApphudSDK

struct ReelsPreView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var reelsViewModel = ReelsViewModel()
    @Bindable var mainViewModel: MainViewModel
    let reels: ReelsModel

    var body: some View {
        VStack {
            if let reelsData = mainViewModel.reelsData {
                ReelsVideoPreview(reels: reels)
                ReelsMenuView(reelsViewModel: reelsViewModel, mainViewModel: mainViewModel, reels: reels)
                    .padding(.bottom)
                CapsuleButton(leftIcon: "crown", title: "Save HD", action: {
//                    if mainViewModel.freeSavingsRemain() {
//                        mainViewModel.downloadAndSaveVideoToGallery()
//                    } else {
//                        navigationViewModel.showPaywall = true
//                    }
                })
            } else {
                ProgressView()
            }
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
                    Button {
                        navigationViewModel.showPaywall = true
                    } label: {
                        ProButtonView()
                    }
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
        .newVideoFolderAllert(reelsViewModel: reelsViewModel)
    }
}

#Preview {
    ReelsPreView(mainViewModel: MainViewModel(), reels: mockReelsResponse.data.reels)
        .environment(NavigationViewModel())
}

