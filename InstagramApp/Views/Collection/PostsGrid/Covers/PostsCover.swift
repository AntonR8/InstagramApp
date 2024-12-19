
import SwiftUI
import SDWebImageSwiftUI

struct PostsCover: View {
    var postsViewModel: PostsViewModel
    let post: PostModel
    let folder: PostFolderModel
    let frameSize = UIScreen.main.bounds.width/2 - 24

    var body: some View {
        NavigationLink {
            PostPreview(post: post)
        } label: {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
                .frame(width: frameSize, height: frameSize)
                .overlay {
                    if let imageDownloadUrl = post.imageDownloadUrl {
                        WebImage(url: URL(string: imageDownloadUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: frameSize, height: frameSize)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray.opacity(0.1))
                                .frame(width: frameSize, height: frameSize)
                        }
                        .indicator(.activity)
                        .clipped()
                        .cornerRadius(16)
                    }
                }
                .overlay(alignment: .topTrailing) {
                    EllipsisButton(
                        background: .black.opacity(0.3),
                        foregroundStyle: .white,
                        button1title: "Add...", button1icon: "bookmark",
                        button1action: {
                            postsViewModel.showSelectPostFolders = true
                            postsViewModel.postsForAdd = post
                        },
                        button2title: "Remove", button2icon: "trash",
                        button2action: {
                            postsViewModel.removePost(from: folder.name, post: post)
                        })
                    .padding(8)
                }
        }
    }
}

#Preview {
    NavigationStack {
        PostsCover(postsViewModel: PostsViewModel(), post: mockPostResponse.data.post, folder: PostFolderModel(
            postsArray: [mockPostResponse.data.post],
            name: "Saved"
        ))
    }
}
