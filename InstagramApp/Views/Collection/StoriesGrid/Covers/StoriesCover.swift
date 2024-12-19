
import SwiftUI
import SDWebImageSwiftUI

struct StoriesCover: View {
    var storiesViewModel: StoriesViewModel
    let stories: StoriesModel
    let folder: StoriesFolderModel

    var body: some View {
        NavigationLink {
            StoriesPreview(stories: (stories, []))
        } label: {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.2))
                .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
                .overlay {
                    if let imageDownloadUrl = stories.imageDownloadUrl {
                        WebImage(url: URL(string: imageDownloadUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray.opacity(0.1))
                                .frame(width: UIScreen.main.bounds.width/2 - 24, height: (UIScreen.main.bounds.width/2 - 24)/9*16)
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
                            storiesViewModel.showSelectStoriesFolders = true
                            storiesViewModel.storiesForAdd = stories
                        },
                        button2title: "Remove", button2icon: "trash",
                        button2action: {
                            storiesViewModel.removeStories(from: folder.name, storiesForRemove: stories)
                        })
                    .padding(8)
                }
        }
    }
}

#Preview {
    NavigationStack {
        StoriesCover(storiesViewModel: StoriesViewModel(), stories: mockStoriesResponse.data.story, folder: StoriesFolderModel(
            storiesArray: [mockStoriesResponse.data.story], profileStoriesArray: [],
            name: "Saved"
        ))
    }
}
