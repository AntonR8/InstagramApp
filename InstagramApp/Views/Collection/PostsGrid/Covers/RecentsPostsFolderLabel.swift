
import SwiftUI

struct RecentsPostsFolderLabel: View {
    var postsViewModel: PostsViewModel

    let folderSize: CGFloat = UIScreen.main.bounds.width/2 - 24
    let frameCornerRadius: CGFloat = 20

    var body: some View {
        RoundedRectangle(cornerRadius: frameCornerRadius)
            .fill(.gray.opacity(0.2))
            .frame(width: folderSize, height: folderSize)
            .overlay {
                LazyVGrid(
                    columns: [GridItem(), GridItem()],
                    spacing: 8,
                    content: {
                        ForEach(0..<4) { number in
                            RecentsPostsFolderLabelElement(
                                folderSize: folderSize,
                                number: number,
                                recentsFolderCount: postsViewModel.returnRecentsFolder().postsArray.count,
                                recentsFourclips: postsViewModel.createRecentFourPosts()
                            )
                        }
                    })
                .padding(12)
            }
            .onAppear {
                postsViewModel.loadPosts()
            }
    }
}

#Preview {
    RecentsPostsFolderLabel(postsViewModel: PostsViewModel())
}
