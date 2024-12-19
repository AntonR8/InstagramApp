
import SwiftUI
import SDWebImageSwiftUI

struct StoriesGridElementLabel: View {
    let folderSize: CGFloat = UIScreen.main.bounds.width/2 - 24
    var folder: StoriesFolderModel

    var body: some View {

        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.2))
            .frame(width: folderSize, height: folderSize)
            .overlay {
                if let imageVideoPreview = folder.storiesArray.last?.imageDownloadUrl {
                    WebImage(url: URL(string: imageVideoPreview)) { image in
                        image.resizable()
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.1))
                            .frame(width: folderSize-24, height: folderSize-24)
                    }

                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: folderSize-24, height: folderSize-24)
                    .cornerRadius(12)
                }
            }
    }
}

#Preview {
    StoriesGridElementLabel(
        folder: StoriesFolderModel(
            storiesArray: [mockStoriesResponse.data.story], profileStoriesArray: [],
            name: "Saved"
        )
    )

}
