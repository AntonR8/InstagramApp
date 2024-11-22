
import SwiftUI

struct NewMusicFolderAllert: ViewModifier {
    @Bindable var albumsViewModel: AlbumsViewModel
    @State var folderName: String = ""

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $albumsViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $folderName)
                Button("Cancel",  action: {
                    albumsViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    albumsViewModel.addFolder(folderName: folderName)
                    folderName  = ""
                    albumsViewModel.showSelectFolders = true
                })
            } message: { Text("Enter a name for your folder for the new music collection") }

    }
}


extension View {
    func newMusicFolderAllert(albumsViewModel: AlbumsViewModel) -> some View {
        modifier(NewMusicFolderAllert(albumsViewModel: albumsViewModel))
    }
}
