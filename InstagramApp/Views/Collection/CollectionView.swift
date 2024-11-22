
import SwiftUI
import ApphudSDK

struct CollectionView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var pickerSelection: String = "Reels"
    @State var videosViewModel = VideosViewModel()
    @State var albumsViewModel = AlbumsViewModel()

    var body: some View {
        VStack {
            Picker("Pick", selection: $pickerSelection) {
                Text("Reels").tag("Reels")
                Text("Posts").tag("Posts")
                Text("Profiles").tag("Profiles")
                Text("Stories").tag("Stories")
                Text("Music").tag("Music")
            }
            .pickerStyle(.palette)
            .padding(.vertical, 8)
            ScrollView {
                switch pickerSelection {
                case "Reels": VideoGrid(videosViewModel: videosViewModel)
                case "Posts": PostsGrid()
                case "Profiles": ProfilesGrid()
                case "Stories": StoriesGrid()
                case "Music": MusicGrid(albumsViewModel: albumsViewModel)
                default: VideoGrid(videosViewModel: videosViewModel)
                }
            }
        }
        .padding()
        .toolbar {
            if navigationViewModel.tabSelection == 2 {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if pickerSelection == "Reels" {
                            videosViewModel.showCreateNewFolderAllert = true
                        } else {
                            albumsViewModel.showCreateNewFolderAllert = true
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CollectionView()
            .environment(NavigationViewModel())
    }
}
