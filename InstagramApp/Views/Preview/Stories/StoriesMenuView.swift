
import SwiftUI

struct StoriesMenuView: View {
    var storiesViewModel: StoriesViewModel
    let stories: (StoriesModel, [ProfileStoriesModel])

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: stories.0.requestedUrl ?? "") {
                    ShareLink(item: url) {
                        MenuElement(icon: "square.and.arrow.up", title: "Share")
                    }
                }

            Button {
                storiesViewModel.storiesForAdd = stories.0
                storiesViewModel.showSelectStoriesFolders = true

            } label: { MenuElement(icon: "bookmark", title: "Add...") }

        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    StoriesMenuView(storiesViewModel: StoriesViewModel(), stories: (mockStoriesResponse.data.story, mockProfileStoriesResponse.data.profileStories.items))
}
