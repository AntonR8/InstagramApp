
import SwiftUI

struct SelectMusicFolder: View {
    @State var selectedFolderIndex: Int?
    @Bindable var albumsViewModel: AlbumsViewModel


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Select folder")
                    .font(.title3)
                    .bold()
                Spacer()
                SmallImageButton(leftIcon: "xmark", foregroundStyle: .white, action: {
                    albumsViewModel.showSelectFolders = false
                })
            }
            .padding()
            SelectMusicFolderList(selectedFolderIndex: $selectedFolderIndex, albumsViewModel: albumsViewModel)
            HStack {
                CapsuleButton(leftIcon: "plus", title: "New folder", backgroundColor: .clear, foregroundColor: .accent) {
                    albumsViewModel.showCreateNewFolderAllert = true
                }
                CapsuleButton(leftIcon: "checkmark", title: "Save") {
                    if let selectedFolderIndex {
                        albumsViewModel.buttonSaveTrackInFolderAction(selectedFolderIndex: selectedFolderIndex)
                    }
                }
                .disabled(selectedFolderIndex == nil)
            }
            .padding()
        }
        .renameMusicFolderAllert(albumsViewModel: albumsViewModel)
    }
}

#Preview {
    SelectMusicFolder(albumsViewModel: AlbumsViewModel())
}
