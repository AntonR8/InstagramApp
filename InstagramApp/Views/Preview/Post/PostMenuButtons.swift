
import SwiftUI

struct PostMenuButtons: View {
    let post: PostModel
    var postsViewModel: PostsViewModel

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: post.requestedUrl ?? "") {
                ShareLink(item: url) {
                    MenuElement(icon: "square.and.arrow.up", title: "Share")
                }
            }

            Button {
                    postsViewModel.postsForAdd = post
                    postsViewModel.showSelectPostFolders = true
            } label: { MenuElement(icon: "bookmark", title: "Add to collection...") }

            Button {
                UIPasteboard.general.string = post.description
                postsViewModel.showTextCopied = true
            } label: { MenuElement(icon: "doc.on.doc", title: "Copy post text") }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    PostMenuButtons(post: mockPostResponse.data.post, postsViewModel: PostsViewModel())
}
