
import SwiftUI

struct NewVideoFolderAllert: ViewModifier {
    @Bindable var videosViewModel: VideosViewModel
    @State var folderName: String = ""

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $videosViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $folderName)
                Button("Cancel",  action: {
                    videosViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    videosViewModel.addFolder(folderName: folderName)
                    folderName  = ""
                    videosViewModel.showSelectVideoFolders = true
                })
            } message: { Text("Enter a name for your folder") }

    }
}


extension View {
    func newVideoFolderAllert(videosViewModel: VideosViewModel) -> some View {
        modifier(NewVideoFolderAllert(videosViewModel: videosViewModel))
    }
}
