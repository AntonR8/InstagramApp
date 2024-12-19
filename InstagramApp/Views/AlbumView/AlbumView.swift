
import SwiftUI
import StoreKit

struct AlbumView: View {
    @Environment(NavigationViewModel.self) var navigationViewModel
    @Environment(\.requestReview) var requestReview
    @Environment(\.dismiss) var dismiss
    let chart: CountryChart
    @State var albumsViewModel = AlbumsViewModel()
    @State var audioPlayerViewModel: AudioPlayerViewModel

    init(chart: CountryChart) {
        self.chart = chart
        audioPlayerViewModel = AudioPlayerViewModel(playlist: chart.music)
    }

    var body: some View {
        ZStack {
            ScrollView {
                CoverView(country: chart, albumsViewModel: albumsViewModel)
                VStack {
                    ForEach(Array(zip(chart.music.indices, chart.music)), id: \.0) { index, track in
                        ListRow(audioPlayerViewModel: audioPlayerViewModel, albumsViewModel: albumsViewModel, index: index, track: track, chart: chart)
                            .frame(height: UIScreen.main.bounds.width/8.5)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
            .accentColor(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        albumsViewModel.buttonSavePlaylistAction(chart: chart)
                    } label: {
                        Image(systemName: albumsViewModel.checkPlaylistIsSaved(chart: chart) ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(albumsViewModel.checkPlaylistIsSaved(chart: chart) ? .accent : .white)
                    }
                }
            }
            if audioPlayerViewModel.showAudioPlayer {
                    if let index = audioPlayerViewModel.trackIndex, chart.music.count >= index {
                        VStack {
                            Spacer()
                            AudioPlayer(audioPlayerViewModel: audioPlayerViewModel)
                                .padding(.bottom, 32)
                        }
                        .ignoresSafeArea()
                    }
                }
        }
        .newMusicFolderAllert(albumsViewModel: albumsViewModel)
        .onAppear {
            albumsViewModel.loadMusic()
            albumsViewModel.loadPlaylists()
            navigationViewModel.albumViewIsShowing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if albumsViewModel.numberOfMusicSavings == 2 {
                    requestReview()
                }
            }
        }
        .onDisappear{ navigationViewModel.albumViewIsShowing = false }
        .sheet(isPresented: $albumsViewModel.showSelectFolders) {
            SelectMusicFolder(albumsViewModel: albumsViewModel)
                .presentationDetents([.height(450)])
        }
    }

}

#Preview {
    NavigationStack {
        AlbumView(
            chart:
                CountryChart(
                id: 2,
                title: "Трендовые: США",
                pos: 1,
                isPremium: false,
                image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp",
                music: [
                    TrackModel(
                        title: "In The End - Mellen Gi Remix",
                        creator: "fleuriemusic",
                        cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg",
                        trend: "up",
                        url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"
                    ),
                    TrackModel(
                        title: "Monkeyshine-JP",
                        creator: "Lt FitzGibbons Men",
                        cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg",
                        trend: "up",
                        url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b"
                    )
                ]
            )
        )
        .environment(NavigationViewModel())
    }
}

