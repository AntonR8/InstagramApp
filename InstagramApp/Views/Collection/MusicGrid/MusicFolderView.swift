
import SwiftUI

struct MusicFolderView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var albumsViewModel: AlbumsViewModel
    @State var audioPlayerViewModel: AudioPlayerViewModel
    let folder: MusicFolderModel
    let folderIndex: Int
    var folderTracksCount: Int { folder.tracks.count }
    
    //    func returnNavigationTitle() -> String {
    //
    //    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("\(folderTracksCount) saved music tracks")
                    .font(.footnote)
                    .padding(.horizontal)
                    .navigationTitle(folder.name)
                if !folder.tracks.isEmpty {
                    TrackList(albumsViewModel: albumsViewModel, folder: folder, audioPlayerViewModel: audioPlayerViewModel)
                        .padding()
                } else { NoMusicView() }
                Spacer()
            }
            .sheet(isPresented: $albumsViewModel.showSelectFolders) {
                SelectMusicFolder(albumsViewModel: AlbumsViewModel())
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if folder.name != "Saved" {
                        EllipsisButton(
                            button1title: "Rename", button1icon: "pencil",
                            button1action: {
                                albumsViewModel.renameFolderPressed(folderName: folder.name)
                            },
                            button2title: "Delete", button2icon: "trash",
                            button2action: {
                                albumsViewModel.deleteFolder(folderIndex: folderIndex)
                                dismiss()
                            }
                        )
                        
                        
                    }
                }
            }
            .renameMusicFolderAllert(albumsViewModel: albumsViewModel)
            
            if audioPlayerViewModel.showAudioPlayer {
                VStack {
                    Spacer()
                    AudioPlayer(audioPlayerViewModel: audioPlayerViewModel)
                        .padding(.bottom, 32)
                }
                .ignoresSafeArea()
            }
        }
    }
}







#Preview {
    NavigationStack {
        MusicFolderView(albumsViewModel: AlbumsViewModel(), audioPlayerViewModel: AudioPlayerViewModel(playlist: [
            TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
            TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
        ]), folder: MusicFolderModel(tracks: [
            TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
            TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
        ], name: "jhgjh"), folderIndex: 0)
    }
}
