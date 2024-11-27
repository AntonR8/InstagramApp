
import SwiftUI

struct RenameVideoFolderAllert: ViewModifier {
    @Bindable var reelsViewModel: ReelsViewModel

    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $reelsViewModel.showRenameFolderAllert) {
                TextField("Folder name", text: $reelsViewModel.newFolderName)
                Button("Cancel",  action: {
                    reelsViewModel.showRenameFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    reelsViewModel.changeFolderName(from: reelsViewModel.oldFolderName, to: reelsViewModel.newFolderName)
                    reelsViewModel.newFolderName = ""
                    reelsViewModel.oldFolderName = ""
                    reelsViewModel.showRenameFolderAllert = false
                })
            }
    }
}


extension View {
    func renameVideoFolderAllert(reelsViewModel: ReelsViewModel) -> some View {
        modifier(RenameVideoFolderAllert(reelsViewModel: reelsViewModel))
    }
}
