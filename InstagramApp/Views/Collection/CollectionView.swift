
import SwiftUI
import ApphudSDK

struct CollectionView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var pickerSelection: CollectionType = .reels
    @State var reelsViewModel = ReelsViewModel()
    @State var albumsViewModel = AlbumsViewModel()

    var body: some View {
        VStack {
            Picker("Pick", selection: $pickerSelection) {
                ForEach(CollectionType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            .pickerStyle(.palette)
            .padding(.vertical, 8)
            ScrollView {
                switch pickerSelection {
                case .reels: VideoGrid(reelsViewModel: reelsViewModel)
                case .posts: PostsGrid()
                case .profiles: ProfilesGrid()
                case .stories: StoriesGrid()
                case .music: MusicGrid(albumsViewModel: albumsViewModel)
                }
            }
        }
        .padding()
//        .toolbar {
//            if navigationViewModel.tabSelection == 2 {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        if pickerSelection == "Reels" {
//                            videosViewModel.showCreateNewFolderAllert = true
//                        } else {
//                            albumsViewModel.showCreateNewFolderAllert = true
//                        }
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        CollectionView()
            .environment(NavigationViewModel())
    }
}
