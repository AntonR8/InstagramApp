
import SwiftUI

struct RecentsFolderLabel: View {
    var videosViewModel: VideosViewModel

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
                            RecentsFolderLabelElement(
                                folderSize: folderSize,
                                number: number,
                                recentsFolderCount: videosViewModel.returnRecentsFolder().clips.count,
                                recentsFourclips: videosViewModel.createRecentFourClips()
                            )
                        }
                    })
                .padding(12)
            }
            .onAppear {
                videosViewModel.loadVideos()
            }
    }
}

#Preview {
    RecentsFolderLabel(videosViewModel: VideosViewModel())

}
