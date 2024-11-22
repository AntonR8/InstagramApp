
import SwiftUI

struct RenameVideoFolderAllert: ViewModifier {
    @Bindable var videosViewModel: VideosViewModel

    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $videosViewModel.showRenameFolderAllert) {
                TextField("Folder name", text: $videosViewModel.newFolderName)
                Button("Cancel",  action: {
                    videosViewModel.showRenameFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    videosViewModel.changeFolderName(from: videosViewModel.oldFolderName, to: videosViewModel.newFolderName)
                    videosViewModel.newFolderName = ""
                    videosViewModel.oldFolderName = ""
                    videosViewModel.showRenameFolderAllert = false
                })
            }
    }
}


extension View {
    func renameVideoFolderAllert(videosViewModel: VideosViewModel) -> some View {
        modifier(RenameVideoFolderAllert(videosViewModel: videosViewModel))
    }
}
