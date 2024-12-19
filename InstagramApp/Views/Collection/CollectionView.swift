
import SwiftUI
import ApphudSDK

enum CollectionType: String, CaseIterable {
   case reels, posts, profiles, stories, music
}

struct CollectionView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @State var pickerSelection: CollectionType = .reels
    @State var reelsViewModel = ReelsViewModel()
    @State var postsViewModel = PostsViewModel()
    @State var profilesViewModel = ProfilesViewModel()
    @State var storiesViewModel = StoriesViewModel()
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
                case .reels: ReelsGrid(reelsViewModel: reelsViewModel)
                case .posts: PostsGrid(postsViewModel: postsViewModel)
                case .profiles: ProfilesGrid(profilesViewModel: profilesViewModel)
                case .stories: StoriesGrid(storiesViewModel: storiesViewModel)
                case .music: MusicGrid(albumsViewModel: albumsViewModel)
                }
            }
        }
        .padding()
        .toolbar {
            if navigationViewModel.tabSelection == 3 {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        switch pickerSelection {
                        case .reels: reelsViewModel.showCreateNewFolderAllert = true
                        case .posts: postsViewModel.showCreateNewFolderAllert = true
                        case .profiles: profilesViewModel.showCreateNewFolderAllert = true
                        case .stories: storiesViewModel.showCreateNewFolderAllert = true
                        case .music: albumsViewModel.showCreateNewFolderAllert = true
                        }
                    } label: { Image(systemName: "plus") }
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
