//
//  ProfilePewview.swift
//  InstagramApp
//
//  Created by Антон Разгуляев on 22.11.2024.
//

import SwiftUI
import ApphudSDK

struct ProfilePreview: View {
    @Environment(NavigationViewModel.self) var navigationViewModel

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Avatar(size: 80)
                        ProfileMetrics(publications: 836, subscribers: 2566, subscriptions: 218)
                    }
                    AuthorAndDescription()
                    ContactsPreview(contacts: ["youtu.be/oKhf382w?", "t.me/cosmosprosto"])
                }
            }
                Spacer()
                ProfileMenuButtons(link: "")
                    CapsuleButton(title: "Save profile avatar") {
                }
                    .padding(.top)
        }
        .onAppear{
//            videosViewModel.loadVideos()
        }
        .overlay(alignment: .top) {
//            PreviewNotifications(mainViewModel: mainViewModel, videosViewModel: videosViewModel)
        }
        .padding()
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
        ProfilePreview()
            .environment(NavigationViewModel())
    }
}
