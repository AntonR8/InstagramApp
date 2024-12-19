
import SwiftUI

struct ReelsRecentsFolderLabel: View {
    var reelsViewModel: ReelsViewModel

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
                            ReelsRecentsFolderLabelElement(
                                folderSize: folderSize,
                                number: number,
                                recentsFolderCount: reelsViewModel.returnRecentsFolder().reelsArray.count,
                                recentsFourclips: reelsViewModel.createRecentFourClips()
                            )
                        }
                    })
                .padding(12)
            }
            .onAppear {
                reelsViewModel.loadVideos()
            }
    }
}

#Preview {
    ReelsRecentsFolderLabel(reelsViewModel: ReelsViewModel())
}
