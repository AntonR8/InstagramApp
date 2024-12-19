
import SwiftUI
import ApphudSDK

struct PostPreview: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var postsViewModel = PostsViewModel()
    @State var currentImage: String = ""
    let post: PostModel

    var body: some View {
        @Bindable var navigationViewModel = navigationViewModel
        VStack {
                ScrollView {
                    PostImages(post: post, currentImage: $currentImage)
                    HStack {
                        Avatar(avatarURL: post.authorAvatar)
                        AuthorAndDescription(author: post.author, description: post.description)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                PostMenuButtons(post: post, postsViewModel: postsViewModel)
                HStack {
                    CapsuleButton(leftIcon: "arrow.down", title: "Only this one", backgroundColor: .clear, foregroundColor: .accent, strokeColor: .gray.opacity(0.5)) {
                        postsViewModel.showProgressWhileSavingImage = true
                        Task {
                            await  postsViewModel.saveImageToGallery(imageURL: currentImage)
                        }
                    }
                    CapsuleButton(title: "Save \(post.carousel.count) images") {
                        postsViewModel.showProgressWhileSavingImage = true
                        Task {
                            for postData in post.carousel {
                                if let imageDownloadUrl = postData.imageDownloadUrl {
                                    await  postsViewModel.saveImageToGallery(imageURL: imageDownloadUrl)
                                }
                            }
                        }
                    }
                }
                .padding()
        }

        .onAppear{
            postsViewModel.loadPosts()
            postsViewModel.addPosts(to: "Recents", postsForAdd: post)
        }
        .overlay(alignment: .top) {
            PreviewNotifications(postsViewModel: postsViewModel)
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
        .sheet(isPresented: $postsViewModel.showSelectPostFolders) {
            SelectPostsFolder(postsViewModel: postsViewModel)
                .presentationDetents([.medium])
        }
        .popover(isPresented: $navigationViewModel.showRateMeView, content: {
            RateMeView()
        })
        .newPostFolderAllert(postsViewModel: postsViewModel)
    }
}

#Preview {
    NavigationStack {
        PostPreview(post: mockPostResponse.data.post)
            .environment(NavigationViewModel())
    }
}
