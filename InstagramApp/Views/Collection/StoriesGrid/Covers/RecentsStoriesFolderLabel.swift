
import SwiftUI

struct RecentsStoriesFolderLabel: View {
    var storiesViewModel: StoriesViewModel

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
                            RecentsStoriesFolderLabelElement(
                                folderSize: folderSize,
                                number: number,
                                recentsFolderCount: storiesViewModel.returnRecentsFolder().storiesArray.count,
                                recentsFourStories: storiesViewModel.createRecentFourClips()
                            )
                        }
                    })
                .padding(12)
            }
            .onAppear {
                storiesViewModel.loadStories()
            }
    }
}

#Preview {
    RecentsStoriesFolderLabel(storiesViewModel: StoriesViewModel())
}
