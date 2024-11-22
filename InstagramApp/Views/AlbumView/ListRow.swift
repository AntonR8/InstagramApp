
import SwiftUI
import StoreKit

struct ListRow: View {
    var audioPlayerViewModel: AudioPlayerViewModel
    var albumsViewModel: AlbumsViewModel
    let index: Int
    let track: TrackModel
    let chart: CountryChart

    var body: some View {
        VStack {
            HStack {
                Text((index+1).description)
                    .font(.subheadline)
                Image(systemName: "arrow.\(track.trend ?? "").right")
                    .font(.subheadline)
                    .foregroundStyle(track.trend == "up" ? .green : .red)
                TrackCover(trackCoverURL: track.cover)
                VStack(alignment: .leading) {
                    Text(track.title)
                    Text(track.creator)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {
                    albumsViewModel.buttonAddTrackToFavouritesAction(track: track)
                } label: {
                    Image(systemName: albumsViewModel.checkTrackIsSaved(track: track) ? "bookmark.fill" : "bookmark")
                        .padding(.horizontal, 8)
                        .foregroundStyle(albumsViewModel.checkTrackIsSaved(track: track) ? .red : .secondary)
                }
                PlayButton(audioPlayerViewModel: audioPlayerViewModel, trackIndex: index)

            }
            Divider()
        }
    }
}

#Preview {
    ListRow(audioPlayerViewModel: AudioPlayerViewModel(playlist: [
        TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
        TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")
    ]), albumsViewModel: AlbumsViewModel(), index: 0, track: TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"), chart: CountryChart(id: 2, title: "Трендовые: США", pos: 1, isPremium: false, image: "https://media-backend.finanse.space/storage/setImages/r3PPAWiAaVxMfmzXVYTpOEbWxf3USRzf3g9W8umY.webp", music: [
        TrackModel(title: "In The End - Mellen Gi Remix", creator: "fleuriemusic", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tos-alisg-v-2774/oUeCAfEfBp0MFDFgEQAoz5QDAE4agSAHJI0BEA.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/ee731b9e546a4511baa800e4bc456756"),
        TrackModel(title: "Monkeyshine-JP", creator: "Lt FitzGibbons Men", cover: "http://p77-sg.tiktokcdn.com/aweme/200x200/tiktok-obj/anthem_clip_cover.jpeg.jpeg", trend: "up", url: "https://sf16-ies-music-sg.tiktokcdn.com/obj/tos-alisg-ve-2774/3c2b16b99d77407f8c7cff1d1c477b2b")



    ]))
}
