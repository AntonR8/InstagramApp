
import SwiftUI

struct RecentsProfilesFolderLabel: View {
    var profilesViewModel: ProfilesViewModel

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
                            RecentsProfilesFolderLabelElement(
                                folderSize: folderSize,
                                number: number,
                                recentsFolderCount: profilesViewModel.returnRecentsFolder().profilesArray.count,
                                recentsFourProfiles: profilesViewModel.createRecentFourProfiles()
                            )
                        }
                    })
                .padding(12)
            }
            .onAppear {
                profilesViewModel.loadProfiles()
            }
    }
}

#Preview {
    RecentsProfilesFolderLabel(profilesViewModel: ProfilesViewModel())
}
