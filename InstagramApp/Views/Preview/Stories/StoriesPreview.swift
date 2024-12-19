
import SwiftUI
import ApphudSDK

struct StoriesPreview: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var storiesViewModel = StoriesViewModel()
    let stories: (StoriesModel, [ProfileStoriesModel])
    @State var currentStories: ProfileStoriesModel?

    var body: some View {
        @Bindable var navigationViewModel = navigationViewModel
        VStack {
            ScrollView(showsIndicators: false){
                StoriesTabView(stories: stories.0, profileStories: stories.1, currentStories: $currentStories)
                StoriesMenuView(storiesViewModel: storiesViewModel, stories: stories)
                    .padding(.vertical)
            }
            HStack {
                CapsuleButton(leftIcon: "arrow.down", title: "Only this one", backgroundColor: .clear, foregroundColor: .accent, strokeColor: .gray.opacity(0.5)) {
                    if RestrictionsManager.shared.freeSavingsRemain() {
                        if let videoDownloadUrl = currentStories?.videoDownloadUrl {
                            storiesViewModel.downloadAndSaveVideoToGallery(link: videoDownloadUrl)
                        } else if let imageDownloadUrl = currentStories?.imageDownloadUrl {
                            storiesViewModel.downloadAndSaveVideoToGallery(link: imageDownloadUrl)
                        } else {
                            if let imageDownloadUrl = stories.0.imageDownloadUrl {
                                storiesViewModel.downloadAndSaveVideoToGallery(link: imageDownloadUrl)
                            }
                        }
                    } else {
                        navigationViewModel.showPaywall = true
                    }
                }
                CapsuleButton(title: "Save \((stories.1.count).description) media") {
                    if RestrictionsManager.shared.freeSavingsRemain() {
                        for profileStories in stories.1 {
                            if  let videoDownloadUrl = profileStories.videoDownloadUrl,
                                !videoDownloadUrl.isEmpty {
                                storiesViewModel.downloadAndSaveVideoToGallery(link: videoDownloadUrl)
                            } else {
                                Task { await storiesViewModel.saveImageToGallery(imageURL: profileStories.imageDownloadUrl) }
                            }
                        }
                    } else {
                        navigationViewModel.showPaywall = true
                    }
                }
            }
            .padding(.bottom)
        }
        .onAppear{
            storiesViewModel.loadStories()
            storiesViewModel.addStories(to: "Recents", storiesForAdd: stories.0)
        }
        .overlay(alignment: .top) {
            PreviewNotifications(storiesViewModel: storiesViewModel)
        }
        .padding(.horizontal)
        .navigationTitle("Stories")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if !Apphud.hasPremiumAccess() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarProPaywallButton()
                }
            }
        }
        .sheet(isPresented: $storiesViewModel.showSelectStoriesFolders) {
            SelectStoriesFolder(storiesViewModel: storiesViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $navigationViewModel.showRateMeView, content: {
            RateMeView()
        })
        .newStoriesFolderAllert(storiesViewModel: storiesViewModel)
    }
}

#Preview {
    NavigationStack {
        StoriesPreview(stories: (mockStoriesResponse.data.story, mockProfileStoriesResponse.data.profileStories.items))
    }
        .environment(NavigationViewModel())
}
