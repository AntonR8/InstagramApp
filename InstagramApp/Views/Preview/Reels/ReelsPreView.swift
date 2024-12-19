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
    let reelsData: ReelsModel

    var body: some View {
        @Bindable var navigationViewModel = navigationViewModel
        VStack {
            ScrollView(showsIndicators: false) {
                ReelsVideoPreview(reels: reelsData)
                ReelsMenuView(reelsViewModel: reelsViewModel, reels: reelsData)
                    .padding(.bottom)
            }
            CapsuleButton(leftIcon: "crown", title: "Save HD", action: {
                if RestrictionsManager.shared.freeSavingsRemain() {
                    reelsViewModel.downloadAndSaveVideoToGallery(link: reelsData.videoDownloadUrl)
                } else {
                    navigationViewModel.showPaywall = true
                }
            })
            .padding(.bottom)
        }
        .onAppear{
            reelsViewModel.loadVideos()
            reelsViewModel.addReels(to: "Recents", reelsForAdd: reelsData)
        }
        .overlay(alignment: .top) {
            PreviewNotifications(reelsViewModel: reelsViewModel)
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
            SelectReelsFolder(reelsViewModel: reelsViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $navigationViewModel.showRateMeView, content: {
            RateMeView()
        })
        .newReelsFolderAllert(reelsViewModel: reelsViewModel)
    }
}

#Preview {
    NavigationStack {
        ReelsPreView(reelsData: mockReelsResponse.data.reels)
            .environment(NavigationViewModel())
    }
}

