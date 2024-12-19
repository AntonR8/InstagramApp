
import SwiftUI

struct SelectStoriesFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable  var storiesViewModel: StoriesViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    storiesViewModel.showSelectStoriesFolders = false
                })
            }
            .padding()
            SelectStoriesFolderList(selectedFolderIndex: $selectedFolderIndex, storiesViewModel: storiesViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    storiesViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        storiesViewModel.buttonSaveStoriesInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renameStoriesFolderAllert(storiesViewModel: storiesViewModel)
    }
}

#Preview {
    SelectStoriesFolder(storiesViewModel: StoriesViewModel())
}
