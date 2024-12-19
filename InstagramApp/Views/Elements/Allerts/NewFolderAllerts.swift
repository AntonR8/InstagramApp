
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


struct NewReelsFolderAllert: ViewModifier {
    @Bindable var reelsViewModel: ReelsViewModel

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $reelsViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $reelsViewModel.newFolderName)
                Button("Cancel",  action: {
                    reelsViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    reelsViewModel.saveNewFolder()
                })
            } message: { Text("Enter a name for your folder") }
    }
}


struct NewPostFolderAllert: ViewModifier {
    @Bindable var postsViewModel: PostsViewModel

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $postsViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $postsViewModel.newFolderName)
                Button("Cancel",  action: {
                    postsViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    postsViewModel.saveNewFolder()
                })
            } message: { Text("Enter a name for your folder") }

    }
}


struct NewProfileFolderAllert: ViewModifier {
    @Bindable var profilesViewModel: ProfilesViewModel

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $profilesViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $profilesViewModel.newFolderName)
                Button("Cancel",  action: {
                    profilesViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    profilesViewModel.saveNewFolder()
                })
            } message: { Text("Enter a name for your folder") }

    }
}


struct NewStoriesFolderAllert: ViewModifier {
    @Bindable var storiesViewModel: StoriesViewModel

    func body(content: Content) -> some View {
        content
            .alert("New folder", isPresented: $storiesViewModel.showCreateNewFolderAllert) {
                TextField("Folder name", text: $storiesViewModel.newFolderName)
                Button("Cancel",  action: {
                    storiesViewModel.showCreateNewFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    storiesViewModel.saveNewFolder()
                })
            } message: { Text("Enter a name for your folder") }

    }
}

extension View {
    func newMusicFolderAllert(albumsViewModel: AlbumsViewModel) -> some View {
        modifier(NewMusicFolderAllert(albumsViewModel: albumsViewModel))
    }

    func newReelsFolderAllert(reelsViewModel: ReelsViewModel) -> some View {
        modifier(NewReelsFolderAllert(reelsViewModel: reelsViewModel))
    }

    func newPostFolderAllert(postsViewModel: PostsViewModel) -> some View {
        modifier(NewPostFolderAllert(postsViewModel: postsViewModel))
    }

    func newProfileFolderAllert(profilesViewModel: ProfilesViewModel) -> some View {
        modifier(NewProfileFolderAllert(profilesViewModel: profilesViewModel))
    }

    func newStoriesFolderAllert(storiesViewModel: StoriesViewModel) -> some View {
        modifier(NewStoriesFolderAllert(storiesViewModel: storiesViewModel))
    }
}
