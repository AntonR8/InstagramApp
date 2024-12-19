//
//  MainView.swift
//  TikTokApp
//
//  Created by Антон Разгуляев on 16.10.2024.
//

import SwiftUI
import TipKit
import ApphudSDK

struct MainView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var mainViewModel = MainViewModel()
    @State var link = ""
    @State var showInstruction = false

    var body: some View {
       @Bindable var navigationViewModel = navigationViewModel
        NavigationStack(path: $mainViewModel.path) {
            ZStack {
                VStack {
                    Spacer()
                    TitleMainView()
                    LinkField(link: $link)
                    CapsuleButton(title: "Find", rightIcon: "arrow.forward") {
                        mainViewModel.findButtonPushed(link: link)
                        navigationViewModel.numberOfSearches += 1
                    }
                    .disabled(link.isEmpty)
                    .opacity(link.isEmpty ? 0.5 : 1)
                    ShowInstructionsButton(showInstruction: $showInstruction)
                    Spacer()
                    Spacer()
                }
                .padding()
                if mainViewModel.showDownloading {
                    DownloadingProgressView()
                }
            }
            .sheet(isPresented: $showInstruction) {
                Instruction(showInstruction: $showInstruction)
                    .presentationDetents([.height(480)])
            }
            .popover(isPresented: $navigationViewModel.showRateMeView, content: {
                RateMeView()
            })
            .wrongLinkAllert(mainViewModel: mainViewModel, showInstruction: $showInstruction)
            .navigationDestination(for: ReelsModel.self) { reelsData in
                ReelsPreView(reelsData: reelsData)
            }
            .navigationDestination(for: PostModel.self) { postData in
                PostPreview(post: postData)
            }
            .navigationDestination(for: ProfileModel.self) { profileData in
                ProfilePreview(profile: profileData)
            }
            .navigationDestination(for: StoriesModel.self) { storiesData in
                StoriesPreview(stories: (storiesData, []))
            }
            .navigationDestination(for: ComplexStoriesModel.self) { complexStoriesData in
                StoriesPreview(stories: (complexStoriesData.stories, complexStoriesData.profileStories))
            }
        }
    }
}

#Preview {
    MainView()
        .environment(NavigationViewModel())
}
