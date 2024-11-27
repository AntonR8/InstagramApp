
import SwiftUI

struct NewVideoFolderAllert: ViewModifier {
    @Bindable var reelsViewModel: ReelsViewModel
    @State var folderName: String = ""

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $reelsViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $folderName)
                Button("Cancel",  action: {
                    reelsViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    reelsViewModel.addFolder(folderName: folderName)
                    folderName  = ""
                    reelsViewModel.showSelectVideoFolders = true
                })
            } message: { Text("Enter a name for your folder") }

    }
}


extension View {
    func newVideoFolderAllert(reelsViewModel: ReelsViewModel) -> some View {
        modifier(NewVideoFolderAllert(reelsViewModel: reelsViewModel))
    }
}
