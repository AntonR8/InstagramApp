
import SwiftUI

struct RenameMusicFolderAllert: ViewModifier {
    @Bindable var albumsViewModel: AlbumsViewModel
    
    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $albumsViewModel.showChangeFolderNameAllert) {
                TextField("Folder name", text: $albumsViewModel.newFolderName)
                Button("Cancel",  action: {
                    albumsViewModel.showChangeFolderNameAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    albumsViewModel.renameFolderSaveButtonPressed()
                })
            }
    }
}

struct RenameReelsFolderAllert: ViewModifier {
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
                    reelsViewModel.saveRenamedVideoFolder()
                })
            }
    }
}

struct RenamePostsFolderAllert: ViewModifier {
    @Bindable var postsViewModel: PostsViewModel

    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $postsViewModel.showRenameFolderAllert) {
                TextField("Folder name", text: $postsViewModel.newFolderName)
                Button("Cancel",  action: {
                    postsViewModel.showRenameFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    postsViewModel.saveRenamedPostFolder()
                })
            }
    }
}

struct RenameProfileFolderAllert: ViewModifier {
    @Bindable var profilesViewModel: ProfilesViewModel

    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $profilesViewModel.showRenameFolderAllert) {
                TextField("Folder name", text: $profilesViewModel.newFolderName)
                Button("Cancel",  action: {
                    profilesViewModel.showRenameFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    profilesViewModel.saveRenamedFolder()
                })
            }
    }
}

struct RenameStoriesFolderAllert: ViewModifier {
    @Bindable var storiesViewModel: StoriesViewModel

    func body(content: Content) -> some View {
        content
            .alert("Rename folder", isPresented: $storiesViewModel.showRenameFolderAllert) {
                TextField("Folder name", text: $storiesViewModel.newFolderName)
                Button("Cancel",  action: {
                    storiesViewModel.showRenameFolderAllert = false
                })
                .accentColor(.accent)
                Button("Save", action: {
                    storiesViewModel.saveRenamedVideoFolder()
                })
            }
    }
}

extension View {
    func renameMusicFolderAllert(albumsViewModel: AlbumsViewModel) -> some View {
        modifier(RenameMusicFolderAllert(albumsViewModel: albumsViewModel))
    }

    func renameReelsFolderAllert(reelsViewModel: ReelsViewModel) -> some View {
        modifier(RenameReelsFolderAllert(reelsViewModel: reelsViewModel))
    }

    func renamePostsFolderAllert(postsViewModel: PostsViewModel) -> some View {
        modifier(RenamePostsFolderAllert(postsViewModel: postsViewModel))
    }

    func renameProfileFolderAllert(profilesViewModel: ProfilesViewModel) -> some View {
        modifier(RenameProfileFolderAllert(profilesViewModel: profilesViewModel))
    }

    func renameStoriesFolderAllert(storiesViewModel: StoriesViewModel) -> some View {
        modifier(RenameStoriesFolderAllert(storiesViewModel: storiesViewModel))
    }
}
